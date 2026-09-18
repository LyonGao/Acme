#!/usr/bin/env bash
# Per-boot startup: bring the PostgreSQL cluster back up. The data directory
# (with the seeded course data) is preserved by the environment snapshot, so
# this only needs to (re)start the daemon and wait for readiness.
set -euo pipefail

PG_MAJOR=16

# The snakeoil key must stay readable by the postgres group after a fresh boot.
sudo chown root:ssl-cert /etc/ssl/private/ssl-cert-snakeoil.key 2>/dev/null || true
sudo chmod 640 /etc/ssl/private/ssl-cert-snakeoil.key 2>/dev/null || true

echo "==> Starting PostgreSQL ${PG_MAJOR}"
# pg_ctlcluster returns non-zero if already running; that is fine (idempotent).
sudo pg_ctlcluster "$PG_MAJOR" main start 2>/dev/null || true

for _ in $(seq 1 30); do
  if sudo -u postgres pg_isready -q; then
    echo "==> PostgreSQL is ready"
    exit 0
  fi
  sleep 1
done

echo "==> PostgreSQL did not become ready in time" >&2
exit 1
