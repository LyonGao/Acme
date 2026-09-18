#!/usr/bin/env bash
# Idempotent repository bootstrap for the Acme (Next.js Learn) dashboard.
# Installs the JS deps and prepares a local PostgreSQL instance (with SSL, which
# the app requires via `ssl: 'require'`) that is seeded with the course data.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

PG_MAJOR=16
PG_DB=acme
PG_USER=acme
PG_PASSWORD=acme
POSTGRES_URL="postgresql://${PG_USER}:${PG_PASSWORD}@127.0.0.1:5432/${PG_DB}"

echo "==> Ensuring PostgreSQL ${PG_MAJOR} is installed"
if ! command -v pg_ctlcluster >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  sudo apt-get update -qq
  sudo apt-get install -y --no-install-recommends postgresql postgresql-contrib openssl
fi

echo "==> Ensuring a self-signed SSL cert exists for PostgreSQL"
# The app connects with sslmode=require, so the server must speak TLS.
if ! sudo test -f /etc/ssl/private/ssl-cert-snakeoil.key; then
  sudo make-ssl-cert generate-default-snakeoil
fi
sudo chown root:ssl-cert /etc/ssl/private/ssl-cert-snakeoil.key || true
sudo chmod 640 /etc/ssl/private/ssl-cert-snakeoil.key || true
sudo usermod -aG ssl-cert postgres || true

echo "==> Starting the PostgreSQL cluster (needed to prepare the database)"
sudo pg_ctlcluster "$PG_MAJOR" main start 2>/dev/null || true
# Wait until the server accepts connections.
for _ in $(seq 1 30); do
  if sudo -u postgres pg_isready -q; then break; fi
  sleep 1
done

echo "==> Ensuring role and database exist"
sudo -u postgres psql -v ON_ERROR_STOP=1 <<SQL
DO \$\$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname='${PG_USER}') THEN
    CREATE ROLE ${PG_USER} LOGIN PASSWORD '${PG_PASSWORD}';
  END IF;
END \$\$;
SQL
if ! sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='${PG_DB}'" | grep -q 1; then
  sudo -u postgres createdb -O "$PG_USER" "$PG_DB"
fi

echo "==> Seeding the database (only if empty)"
# Pre-create the extension so the app's /seed route cannot hit its concurrent
# "CREATE EXTENSION" race, and load the course data if not already present.
PGPASSWORD="$PG_PASSWORD" psql "${POSTGRES_URL}?sslmode=require" -v ON_ERROR_STOP=1 \
  -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
HAS_DATA=$(PGPASSWORD="$PG_PASSWORD" psql "${POSTGRES_URL}?sslmode=require" -tAc \
  "SELECT 1 FROM information_schema.tables WHERE table_name='customers'" 2>/dev/null || true)
if [ "$HAS_DATA" != "1" ]; then
  PGPASSWORD="$PG_PASSWORD" psql "${POSTGRES_URL}?sslmode=require" -v ON_ERROR_STOP=1 \
    -f "$REPO_DIR/.cursor/seed.sql"
fi

echo "==> Writing .env.local (if missing)"
if [ ! -f "$REPO_DIR/.env.local" ]; then
  printf 'POSTGRES_URL=%s\n' "$POSTGRES_URL" > "$REPO_DIR/.env.local"
fi

echo "==> Installing JS dependencies"
# Pin pnpm via corepack. The base image ships multiple Node/pnpm versions and
# pnpm >=12 hard-fails on ignored build scripts (e.g. msw) while ignoring the
# package.json `onlyBuiltDependencies` allowlist; pinning 10.x keeps installs
# deterministic and still builds the native deps (bcrypt, sharp).
export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
corepack pnpm@10.17.1 install --frozen-lockfile

# Ensure the native module used by the app's /seed route is present. bcrypt
# ships a prebuilt binary fetched by node-pre-gyp; make sure it is in place.
if ! node -e 'require("bcrypt")' >/dev/null 2>&1; then
  echo "==> Building native dependencies (bcrypt)"
  corepack pnpm@10.17.1 rebuild bcrypt
fi

echo "==> Install complete"
