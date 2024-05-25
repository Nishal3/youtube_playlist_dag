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
1	Conoid Tone	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
2	Babylonia Wind	UCS9mNlDLndpg73ejX5QNRpw	Kiyoshi Sugimoto - Topic
3	Gas Drawls	UCooTDYkIERWBwDC1JKyoElQ	MF DOOM - Topic
4	ROUTE246	UCM9H498y7FjqaWfmKCM_pbg	Yuji Ohno - Topic
5	Orange	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
6	Oceanlude	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
7	Maintaining Scan for UFO's	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
8	Summer Gypsy	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
9	QKThr	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
10	おかし	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
11	Hawkmoth	UCS-j8enQVMxOZLvI9PdBUbg	Plaid
12	You & Explosion Band  / FULL COURSE / Southern Dream	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
13	M+T=E	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
14	Grey Sweater	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
15	Lonely for the Road (Unedited Version)	UCM9H498y7FjqaWfmKCM_pbg	Yuji Ohno - Topic
16	No Answer	UCQ2_kTDMFlrRy8vCQWQHRvA	Tennyson - Topic
17	Meltphace 6	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
18	おむかえ	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
19	vista	UCqlmvUV0P4eBcMB-zxkAgNg	Arceâs - Topic
20	Pacific	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
21	Bossa Blunts	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
22	You & Explosion Band / FULL COURSE / Metallic Moon	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
23	Re-echo	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
24	Meadow	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
25	Want	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
26	Sky Diver	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
27	Golden Boy	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
28	Flowing Violet	UC4zL6AlLAQYFPAuv5WK68eg	Blazo - Topic
29	わすれもの	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
30	Ljones - Jazz Technician	UCc-gd9fvcUB83oevw4DYspw	Emporium Three
31	Nujabes - Luv(sic) feat.Shing02 [Official Audio]	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
32	You & Explosion Band / FULL COURSE / Lollipop Train	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
33	Ketamine Entity (Axiom Mix)	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
34	Rapp Snitch Knishes	UCooTDYkIERWBwDC1JKyoElQ	MF DOOM - Topic
35	さようなら	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
36	Spiritual State	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
37	Ikaw	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
38	Breeze	UCM1gnW6JHclkP_3rMDRDOrw	Sergey Muzarks - Topic
39	Little Poem	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
40	sonrisa	UCqlmvUV0P4eBcMB-zxkAgNg	Arceâs - Topic
41	You & Explosion Band / FULL COURSE / Manhattan Life	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
42	Battlecry	UC4CYcezyK5GBeIjM6Jc4gFw	Anime OST
43	Beleza Pula	UCh2rvH6MGKYC-UHjTA1-eIQ	Masayoshi Takanaka - Topic
44	Gone Are The Days	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
45	Summer Boy	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
46	Infinity	UCM1gnW6JHclkP_3rMDRDOrw	Sergey Muzarks - Topic
47	Better Luck Next Time	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
48	Blue Asia - Hotel Ibah (2000) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
49	You & Explosion Band / FULL COURSE /  As You Like It	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
50	Nujabes - The Space Between Two World	UCIk6zRJ2kFDQI5IJabjUO_w	dogsoap
51	A Port Town Illumination YAKEI	UCM9H498y7FjqaWfmKCM_pbg	Yuji Ohno - Topic
52	Color of Autumn	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
53	Fruit Platter	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
54	Origin Unknown - Valley Of The Shadows ᴴᴰ	UCjY8quWhrdAXuiP-8iTKQ7w	4nheru
55	Intense - Natural Progression	UCNVXCK1Z9QW0pXuavuNPx0g	matee88
56	Deep Space Network meets Higher Intelligence Agency (1996) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
57	You & Explosion Band / FULL COURSE / Michy's Walk	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
58	Nujabes - Kujaku (Samurai Champloo OST) . Track 04	UClFlC1aKHyHNT5fxfMIXbOA	DIVAZ
59	Dream Hill	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
60	Dawn on the Side	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
61	Appleseed	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
62	DJ Crystl - Meditation - CRYS012	UC6T6BCG9j2e_2G1RqtRskIA	hardcorejunglismtv
63	Feather	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
64	C.R.E.A.M.	UCdQKMtGgbbahJWE3rkPaGoA	Wu-Tang Clan - Topic
65	Bit 4	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
66	Norio Maeda ''meets'' Tin Pan Alley - Soul Samba Holiday in  Brazil (1977) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
67	You & Explosion Band / FULL COURSE / Rainbow Dinner	UC_dfnWtPRoHG5bY0SyY-h1w	mko3301
68	Samurai Champloo - Mystline	UCHRGXNGH8yoL7OPRsYpCL8A	chakabantou
69	Haruomi Hosono - S-F-X	UCYMQ2Tf9TsUiwMqjuM1Ytuw	࡛
70	Counting Stars	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
71	Yes	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
72	Picnic	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
73	sotsugyou-karaoke-	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
74	Peace	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
75	Hypersleep (97 Revamp)	UCi6ohvl7BzTPaCy_6UFmzlw	Voyager - Topic
76	Stevia - Fruits Of The Room (1997) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
77	Elapse	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
78	Fat Jon , Nujabes - 1st Samurai	UCLGHCb3MjfCMRswZLJxaBwA	Powni
79	Boy Bawang	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
80	Cafe	UCxdWWf901ZobFU2ZX4ERaLg	June K. Lee
81	Jazz Cartel - Blue Haze	UCkWmPgKjsiPk5FreDj9aAUQ	Ari Arnarsson
82	Rainyway Back Home	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
83	Pastel Sea	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
84	Horizon	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
85	Afx237 v.7	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
86	Haruomi Hosono - Coincidental Music (1985) FULL ALBUM	UC-jln7H9BVxgX1zZvDcDatg	Kuma's campfire
87	Hubble	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
88	Nujabes / Fat Jon - Ole	UCwuNE3EgYnwEOGC8bO91GNw	TheCosmiCInterlude
89	Quiet Place	UCNOACWKwYX0NnEiWhqbTVEg	Mahdi Chishty - Topic
90	Far Fowls	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
91	Rain Skater	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
92	Sea of Cloud	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
93	OH	UCj_N3cY01lMhGHJlUfrl3gw	Plaid - Topic
94	Smile Again	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
95	Electric Blue - Deepness	UCzbs0b0PdSn2sBzLeiZU5EQ	NElNSHlT
96	Fleagle	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
97	Fat Jon, Nujabes - 624 Part 2	UCLGHCb3MjfCMRswZLJxaBwA	Powni
98	Another Reflection	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
99	Fellows	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
100	Self Reflect	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
101	Zephyr's Flutter	UCH6d5DoeSvQoRSI01Ty_esg	NIKK BLVKK - Topic
102	Lornaderek	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
103	Only You	UC898jEM5eSJuz5gUA1_W1-g	VOID - Electronic Music
104	Swear (Live at Chuo Kaikan Hall, Tokyo, Feb. 1982)	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
105	Thirteen	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
106	Nujabes - Genome (Samurai Champloo OST) . Track 09	UClFlC1aKHyHNT5fxfMIXbOA	DIVAZ
107	Nujabes   Aruarian dance	UClIomPI_-bc4H8fmR3l8sdA	Lil Brown
108	Prayer	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
109	On Call	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
110	The Gathering	UCH6d5DoeSvQoRSI01Ty_esg	NIKK BLVKK - Topic
111	Prep Gwarlek 3b	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
112	A Sparkling Day	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
113	Skank	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
114	Nujabes / Fat Jon - No way back	UCwuNE3EgYnwEOGC8bO91GNw	TheCosmiCInterlude
115	Intense - Positive Notions	UCdNcuTHuGnEYktVJ9JjUHkg	isgoanrain
116	November Mood	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
117	Island	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
118	Covid-Flo	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
119	Counting	UCfZGCfvNELLPbRptzsZ4t6w	Yasumu - Topic
120	Takipsilim	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
121	Span Of A Dream	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
122	Tortoise	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
123	Nujabes/Fat Jon - Funkin (Samurai Champloo OST)	UCo9zhc60A9KUkcmDZ78zDGg	Z  A  K  K  A  T  E  N  ざっかてん
124	Down	UCQtUE-wrHVrsNjNKu3x0NxA	Reprazent - Topic
125	Sky is Tumbling	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
126	Dice	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
127	Nujabes - Nightshift (Samurai Champloo OST) . Track 02	UClFlC1aKHyHNT5fxfMIXbOA	DIVAZ
128	Domino Line	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
129	Ting	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
130	alegría	UCqlmvUV0P4eBcMB-zxkAgNg	Arceâs - Topic
131	Nujabes / Fat Jon - Stay	UCwuNE3EgYnwEOGC8bO91GNw	TheCosmiCInterlude
132	Monstera	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
133	Fuze - Anything Goes	UCzbs0b0PdSn2sBzLeiZU5EQ	NElNSHlT
134	Sky Is Falling	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
135	The Final View	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
136	Led Curve Again	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
137	Nanou2	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
138	GALACTIC FUNK	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
139	Pinkgreen	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
140	Samurai Champloo - chambers [Depature OST]	UCLGHCb3MjfCMRswZLJxaBwA	Powni
141	Fly	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
142	Soul Beat Runna	UCW8TDhuUEgDvYE0GACG1-yA	Boymerang - Topic
143	70s Japanese Jazz Mix (Modal Jazz, Soul Jazz, Jazz Funk, Rare Groove...)	UCwsGfP7Y3D84a_zcwKg_2Vw	Magical Mystery Mix
144	Blessing It (remix)	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
145	odennomae	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
146	Sunnyside Feelin'	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
147	Taz	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
148	Fat Jon, Nujabes - Ask	UCLGHCb3MjfCMRswZLJxaBwA	Powni
149	Awenda	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
150	Circles (7'' Edit)	UC8QJIFNfUWfU_s3zIQu0_Dw	Adam F - Topic
151	Ap hex Tw in - Druk qs (Full Album)	UCcJVfp-gu-fEhr5Ch4sEc_Q	Next View
152	MITAMA	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
153	Jynweythek Ylow	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
154	四季ノ唄	UCOi-UdY8K_1-x9ohwERcw8g	MINMI - Topic
155	Seasons	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
156	Any Moment (We'll Be One)	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
157	on	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
158	Yoshino Spliff	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
159	Shifty - Jazz Ass	UC5YHOItWXGNKG6EDFMf6jpA	TurntableTastemaker
160	joy	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
161	Trick or	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
162	Vordhosbn	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
163	Fat Jon , Nujabes - 624 Part 1	UCLGHCb3MjfCMRswZLJxaBwA	Powni
164	Endless Vision	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
165	more elbow	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
166	Fat Jon , Nujabes - How you feel	UCLGHCb3MjfCMRswZLJxaBwA	Powni
167	Rose Water	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
168	Jesse Bru - IWD	UCrlNi8Z5TXfWJf4psK76KWw	Délicieuse Musique
169	sequence_02	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
170	花天月地	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
171	Kladfvgbung Mischk	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
172	Blue Asia - Abyssinean Dub (Japan)	UCnMh3bdFDE-icbzG3Tx1R8w	müzik kumbarası
173	dessert	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
174	Goodbye Waves	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
175	Brasilian Skies	UCh2rvH6MGKYC-UHjTA1-eIQ	Masayoshi Takanaka - Topic
176	Day by Day	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
177	Damn it	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
178	Omgyjya-Switch7	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
179	Ziggomatic 17	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
180	Beskhu3epnm	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
181	Take Me	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
182	wreck	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
183	Ljones - Introductions	UCRY9wrckuYWVSUophKtfSrA	Oublie Musique
184	Star Wars Samba	UCh2rvH6MGKYC-UHjTA1-eIQ	Masayoshi Takanaka - Topic
185	Asian Dancer	UCZUpjt5qp-UEwIeKl38ZMyg	fox capture plan - Topic
186	natsuno Utage	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
187	Strotha Tynhe	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
188	Tsuchie - Breeezin'	UCLGHCb3MjfCMRswZLJxaBwA	Powni
189	Asayake	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
190	rho	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
191	Ljones - ArtOfficial Strawberries	UCRY9wrckuYWVSUophKtfSrA	Oublie Musique
192	Funky Holo Holo Bird	UCh2rvH6MGKYC-UHjTA1-eIQ	Masayoshi Takanaka - Topic
193	Heart of Cosmos	UCu3vibktIMlgIkkluCiRhFw	PRIMITIVE ART ORCHESTRA - Topic
194	Flat_Coke.wav	UC0G9HyzYOgt2LQwhFc_ZjNQ	EZweb
195	Gwely Mernans	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
196	Midnight Rendezvous	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
197	pass	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
198	Father	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
199	LJones - Cruising Blue	UCnnSnBQVodHYvW9uiCD7Mag	babypa 熱帯ブルー
200	Spades	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
201	Ego	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
202	Ljones - Mango Kimono	UCRY9wrckuYWVSUophKtfSrA	Oublie Musique
203	勤王の志士へ告ぐ	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
204	Raid	UCvYD4mt2SEikFlX0iJmTKvw	Madvillain - Topic
205	Kumomi	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
206	Bbydhyonchord	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
207	Samurai Champloo - Here and there	UCLGHCb3MjfCMRswZLJxaBwA	Powni
208	F.I.L.O.	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
209	Time Limit	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
210	vice versa	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
211	LJones - Feelings, Mutual	UCbCoUV9aGY1AyyOegcuTOKw	Music For Your Soul
212	double flat	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
213	Lady Brown	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
214	Born Slippy	UCZUpjt5qp-UEwIeKl38ZMyg	fox capture plan - Topic
215	Flying	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
216	Cock/ver10	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
217	Tears Of The Star	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
218	code	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
219	Smoke	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
220	LJones - Autumn Groove	UCbCoUV9aGY1AyyOegcuTOKw	Music For Your Soul
221	300ml (milk)	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
222	Nujabes-World Without Words	UCnZEM06Ex1JpR1vxxJBw1yg	JantyFi
223	Waltz for Life Will Born	UCJc0E-5k3E7aKCCbsN1eDQg	uyama hiroto - Topic
224	Avril 14th	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
225	Breeze	UCzbk32zHUl83sSMHjN1nNTg	Jiro Inagaki - Topic
226	after bonus	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
227	Ladybug	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
228	Ljones - Soul Below	UCbCoUV9aGY1AyyOegcuTOKw	Music For Your Soul
229	triple flat	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
230	Reflection Eternal	UCO5XcuQe_fLJVI3sZ0LmGCA	Nujabes
231	Spike Spiegel	UCw02oGFeqYXl14LcyKhOTYw	Saib - Topic
232	Mt Saint Michel + Saint Michaels Mount	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
233	Indigo Jam Unit - Adrenaline	UCpYLI1tDW0NEcIIqk1DtB2Q	Mòe
234	objective contents	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
235	Green Tea	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
236	LJones - July	UCHJCZ2QUD-WAJTGikMs9B4Q	DLoaw
237	299ml (gu-nu)	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
238	JumpUP!	UCj6Zepl6SvYZCW8PvgUHzGg	PE'Z - Topic
239	Tokyo Reggie	UCh2rvH6MGKYC-UHjTA1-eIQ	Masayoshi Takanaka - Topic
240	Gwarek2	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
241	Shrimp Dance	UC3_4xTdoyha6Qy7AGk0v0rg	Hiroshi Suzuki - Topic
242	bioscope	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
243	Bright	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
244	Taking Control	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
245	LJones - Always Find You	UCbCoUV9aGY1AyyOegcuTOKw	Music For Your Soul
246	schw schw	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
247	Dance'em All	UCRRZCWL7d4NfGMgA5ehTbMQ	TRI4TH - Topic
248	Mandarin	UCq7xsE-XvIjlzfxcQRi9SMg	Nicholas Cheung - Topic
249	Orban Eq Trx 4	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
250	In The Twilight	UCjbIpDwFHq2QYh4FsWmhgCg	SOIL&"PIMP"SESSIONS - Topic
251	unrest	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
252	Pinecones	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
253	Ljones - Nakanaide	UCRY9wrckuYWVSUophKtfSrA	Oublie Musique
254	にじぞう	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
255	Euphoric	UCJz7oJAi7slItVk-XP5mNPA	H ZETTRIO - Topic
256	Windspeaks	UCJc0E-5k3E7aKCCbsN1eDQg	uyama hiroto - Topic
257	Aussois	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
258	Qualia	UCu3vibktIMlgIkkluCiRhFw	PRIMITIVE ART ORCHESTRA - Topic
259	Delta	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
260	Vertical	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
261	Ljones - To the Groove	UCbCoUV9aGY1AyyOegcuTOKw	Music For Your Soul
262	Assault On Precinct Zero	UCj_N3cY01lMhGHJlUfrl3gw	Plaid - Topic
263	LTJ Bukem Horizons (Vinyl)	UC12PaRR8SX_5Pnkn0_4hpVA	mb7891
264	Sunflowers	UCw02oGFeqYXl14LcyKhOTYw	Saib - Topic
265	Hy A Scullyas Lyf Adhagrow	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
266	東海道メガロポリス	UCKaMgVjh3lcsORr-OC9Dxdg	SANOVA - Topic
267	Speedlearn (Empathy Mix)	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
268	Waterboye	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
269	Nas - It Ain't Hard To Tell (Ljones remix)	UChna7uHanzUiifMJGSIgkPA	IAmPeteRockFan
270	あるテーマ	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
271	RŮDE - Breeze	UC3rcrZxH9VW73L2gZtHlU2g	RŮDE
272	Imaginary Folklore	UCl19_P9Md57VyB50SRvWp5A	Clammbon - Topic
273	Kesson Daslef	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
274	Sweet Tears	UCVOf22gPWLXrOGg-Loalrqg	artoftube
275	RŮDE - Paradise	UC3rcrZxH9VW73L2gZtHlU2g	RŮDE
276	いとぐち	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
277	Reflection	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
278	Influx	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
279	Intruder Detector	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
280	Fresh Green	UC4zL6AlLAQYFPAuv5WK68eg	Blazo - Topic
281	54 Cymru Beats	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
282	Ruglen Holon	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
283	きえたこい	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
284	Sailing Alone	UCVc0F74TcYIT_g7n0_G_tmQ	CASIOPEA - Topic
285	Gentle Wave	UCM_qbhXjj2RJHmjWTw88AsQ	Various Artists - Topic
286	Spectral	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
287	Javelin	UCirTdBGw2PN7loFn2OgyTLQ	Ljones - Topic
288	Space Intercerptors	UCNKS_v4VhRuh4equJKoSGew	Higher Intelligence Agency - Topic
289	まちぶせ	UCC0p0O2MehP53JKPoXc3wdQ	Rei Harakami - Topic
290	Soulful	UCxXn2yb4qJbG0bKmr3wa4JA	L'Indécis - Topic
291	Petiatil Cx Htdui	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
292	Other Side of Phase	UCxQQET-tQsC4cwzLow9ZsuQ	Nujabes - Topic
293	Btoum-Roumada	UCWmnkYUzoOiOztmPBhIlZjg	Aphex Twin - Topic
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.songs_id_seq', 293, true);


--
-- PostgreSQL database dump complete
--

