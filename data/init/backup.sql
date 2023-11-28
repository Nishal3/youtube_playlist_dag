--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-1.pgdg120+1)
-- Dumped by pg_dump version 13.13 (Debian 13.13-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: song_names; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.song_names (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.song_names OWNER TO airflow;

--
-- Name: song_names_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.song_names_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.song_names_id_seq OWNER TO airflow;

--
-- Name: song_names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.song_names_id_seq OWNED BY public.song_names.id;


--
-- Name: song_names id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.song_names ALTER COLUMN id SET DEFAULT nextval('public.song_names_id_seq'::regclass);


--
-- Data for Name: song_names; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.song_names (id, name) FROM stdin;
1	Pinkgreen
2	Flying
3	sequence_02
4	花天月地
5	Shrimp Dance
6	In The Twilight
7	Babylonia Wind
8	Ljones - Introductions
9	Ketamine Entity (Axiom Mix)
10	Ljones - Soul Below
11	Nujabes - Kujaku (Samurai Champloo OST) . Track 04
\.


--
-- Name: song_names_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.song_names_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

