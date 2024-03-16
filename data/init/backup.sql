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
-- Name: songs; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    name character varying(255),
    channel_id character varying(26),
    channel_name character varying(255)
);


ALTER TABLE public.songs OWNER TO airflow;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.songs_id_seq OWNER TO airflow;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.songs (id, name, channel_id, channel_name) FROM stdin;
1	Better Luck Next Time	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
2	Reflection Eternal	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
3	Electric Blue - Deepness	UCzbs0b0PdSn2sBzLeiZU5EQ	NElNSHlT
4	wreck	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
5	Boy Bawang	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
6	勤王の志士へ告ぐ	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
7	unrest	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
8	Gone Are The Days	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
9	Euphoric	UCJz7oJAi7slItVk-XP5mNPA	H ZETTRIO - Topic
10	Jesse Bru - IWD	UCrlNi8Z5TXfWJf4psK76KWw	Délicieuse Musique
11	Maintaining Scan for UFO's	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
12	Soulful	UCxXn2yb4qJbG0bKmr3wa4JA	L'Indécis - Topic
13	alegría	UCqlmvUV0P4eBcMB-zxkAgNg	Arceâs - Topic
14	Conoid Tone	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
15	dessert	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
16	A Sparkling Day	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
17	LJones - Cruising Blue	UCnnSnBQVodHYvW9uiCD7Mag	babypa 熱帯ブルー
18	Rain Skater	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
19	Ljones - Nakanaide	UCRY9wrckuYWVSUophKtfSrA	Oublie Musique
20	Intense - Natural Progression	UCNVXCK1Z9QW0pXuavuNPx0g	matee88
21	Haruomi Hosono - Coincidental Music (1985) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
22	sotsugyou-karaoke-	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
23	Reflection	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
24	54 Cymru Beats	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
25	Spiritual State	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
26	Only You	UC898jEM5eSJuz5gUA1_W1-g	VOID - Electronic Music
27	Btoum-Roumada	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
28	alegría	UCqlmvUV0P4eBcMB-zxkAgNg	Arceâs - Topic
29	Spike Spiegel	UCw02oGFeqYXl14LcyKhOTYw	Saib - Topic
30	Swear (Live at Chuo Kaikan Hall, Tokyo, Feb. 1982)	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
31	Self Reflect	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
32	Gone Are The Days	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
33	Thirteen	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
34	東海道メガロポリス	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
35	Gone Are The Days	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
36	Norio Maeda ''meets'' Tin Pan Alley - Soul Samba Holiday in  Brazil (1977) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
37	Any Moment (We'll Be One)	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
38	Span Of A Dream	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
39	Maintaining Scan for UFO's	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
40	You & Explosion Band  / FULL COURSE / Southern Dream	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
41	The Gathering	UCH6d5DoeSvQoRSI01Ty_esg	NIKK BLVKK - Topic
42	Flat_Coke.wav	UC0G9HyzYOgt2LQwhFc_ZjNQ	EZweb
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.songs_id_seq', 42, true);


--
-- PostgreSQL database dump complete
--

