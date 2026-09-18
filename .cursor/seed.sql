--
-- PostgreSQL database dump
--

\restrict yIuyYCn41vZj1bzE3ZEJx8csUniiIBtWk87dhhBuE33X1DudN3SIoEsLKKD3rWs

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    image_url character varying(255) NOT NULL
);


--
-- Name: invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invoices (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    customer_id uuid NOT NULL,
    amount integer NOT NULL,
    status character varying(255) NOT NULL,
    date date NOT NULL
);


--
-- Name: revenue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revenue (
    month character varying(4) NOT NULL,
    revenue integer NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customers VALUES ('d6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 'Evil Rabbit', 'evil@rabbit.com', '/customers/evil-rabbit.png');
INSERT INTO public.customers VALUES ('cc27c14a-0acf-4f4a-a6c9-d45682c144b9', 'Amy Burns', 'amy@burns.com', '/customers/amy-burns.png');
INSERT INTO public.customers VALUES ('3958dc9e-712f-4377-85e9-fec4b6a6442a', 'Delba de Oliveira', 'delba@oliveira.com', '/customers/delba-de-oliveira.png');
INSERT INTO public.customers VALUES ('3958dc9e-742f-4377-85e9-fec4b6a6442a', 'Lee Robinson', 'lee@robinson.com', '/customers/lee-robinson.png');
INSERT INTO public.customers VALUES ('76d65c26-f784-44a2-ac19-586678f7c2f2', 'Michael Novotny', 'michael@novotny.com', '/customers/michael-novotny.png');
INSERT INTO public.customers VALUES ('13d07535-c59e-4157-a011-f8d2ef4e0cbb', 'Balazs Orban', 'balazs@orban.com', '/customers/balazs-orban.png');


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.invoices VALUES ('dbe23c62-d290-4942-9597-b8f7316b333d', '3958dc9e-712f-4377-85e9-fec4b6a6442a', 20348, 'pending', '2022-11-14');
INSERT INTO public.invoices VALUES ('c006e406-48a0-47a4-a4f4-958a10851c49', '13d07535-c59e-4157-a011-f8d2ef4e0cbb', 34577, 'pending', '2023-08-05');
INSERT INTO public.invoices VALUES ('76dda555-7f7d-40ff-a51d-126f0513abe8', '3958dc9e-742f-4377-85e9-fec4b6a6442a', 54246, 'pending', '2023-07-16');
INSERT INTO public.invoices VALUES ('8e386141-6da9-407e-ba7a-3343925a0e1f', 'd6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 666, 'pending', '2023-06-27');
INSERT INTO public.invoices VALUES ('9a3d9f09-f709-40f1-9235-7e6ccbe16ecd', 'd6e15727-9fe1-4961-8c5b-ea44a9bd81aa', 15795, 'pending', '2022-12-06');
INSERT INTO public.invoices VALUES ('65a12384-7bd4-425e-b803-4b214994647f', '76d65c26-f784-44a2-ac19-586678f7c2f2', 44800, 'paid', '2023-09-10');
INSERT INTO public.invoices VALUES ('d49809a7-2035-480b-b7b9-1420e076262f', 'cc27c14a-0acf-4f4a-a6c9-d45682c144b9', 3040, 'paid', '2022-10-29');
INSERT INTO public.invoices VALUES ('c3052619-3429-4913-84b2-c8747a2e5b5f', '76d65c26-f784-44a2-ac19-586678f7c2f2', 32545, 'paid', '2023-06-09');
INSERT INTO public.invoices VALUES ('3b939c12-3559-4cb6-9490-3a6d80eff486', '13d07535-c59e-4157-a011-f8d2ef4e0cbb', 8546, 'paid', '2023-06-07');
INSERT INTO public.invoices VALUES ('637eacde-fdb9-40d3-931a-94e8bf48092d', '13d07535-c59e-4157-a011-f8d2ef4e0cbb', 8945, 'paid', '2023-06-03');
INSERT INTO public.invoices VALUES ('81048bd9-db08-4f81-996e-8acf15fa2849', '3958dc9e-712f-4377-85e9-fec4b6a6442a', 500, 'paid', '2023-08-19');
INSERT INTO public.invoices VALUES ('23025a16-019d-4557-90bd-d6ecc9d747db', 'cc27c14a-0acf-4f4a-a6c9-d45682c144b9', 1250, 'paid', '2023-06-17');
INSERT INTO public.invoices VALUES ('35c57e1d-5acd-4715-bfcb-8bfffcf09e3a', '3958dc9e-742f-4377-85e9-fec4b6a6442a', 1000, 'paid', '2022-06-05');


--
-- Data for Name: revenue; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.revenue VALUES ('Jan', 2000);
INSERT INTO public.revenue VALUES ('Aug', 3700);
INSERT INTO public.revenue VALUES ('Jul', 3500);
INSERT INTO public.revenue VALUES ('Sep', 2500);
INSERT INTO public.revenue VALUES ('Dec', 4800);
INSERT INTO public.revenue VALUES ('Oct', 2800);
INSERT INTO public.revenue VALUES ('Nov', 3000);
INSERT INTO public.revenue VALUES ('Apr', 2500);
INSERT INTO public.revenue VALUES ('Mar', 2200);
INSERT INTO public.revenue VALUES ('Feb', 1800);
INSERT INTO public.revenue VALUES ('May', 2300);
INSERT INTO public.revenue VALUES ('Jun', 3200);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES ('410544b2-4001-4271-9855-fec4b6a6442a', 'User', 'user@nextmail.com', '$2b$10$5U0vbuQZNyksFNlOetSRuuAheoK1pG1MEAZWCS/PRW6VqqIso.ZYq');


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: revenue revenue_month_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revenue
    ADD CONSTRAINT revenue_month_key UNIQUE (month);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict yIuyYCn41vZj1bzE3ZEJx8csUniiIBtWk87dhhBuE33X1DudN3SIoEsLKKD3rWs

