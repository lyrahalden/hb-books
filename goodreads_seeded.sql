--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE books (
    book_id integer NOT NULL,
    title character varying(200) NOT NULL,
    author character varying(200) NOT NULL,
    avg_rating character varying(200) NOT NULL,
    pic_url character varying(200) NOT NULL
);


ALTER TABLE books OWNER TO vagrant;

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_book_id_seq OWNER TO vagrant;

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE books_book_id_seq OWNED BY books.book_id;


--
-- Name: books_genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE books_genres (
    book_genre_id integer NOT NULL,
    book_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE books_genres OWNER TO vagrant;

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE books_genres_book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_genres_book_genre_id_seq OWNER TO vagrant;

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE books_genres_book_genre_id_seq OWNED BY books_genres.book_genre_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE genres OWNER TO vagrant;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO vagrant;

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE ratings (
    rating_id integer NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE ratings OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_rating_id_seq OWNER TO vagrant;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_genres; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users_genres (
    user_genre_id integer NOT NULL,
    user_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE users_genres OWNER TO vagrant;

--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_genres_user_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_genres_user_genre_id_seq OWNER TO vagrant;

--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_genres_user_genre_id_seq OWNED BY users_genres.user_genre_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: book_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq'::regclass);


--
-- Name: book_genre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books_genres ALTER COLUMN book_genre_id SET DEFAULT nextval('books_genres_book_genre_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Name: rating_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: user_genre_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users_genres ALTER COLUMN user_genre_id SET DEFAULT nextval('users_genres_user_genre_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY books (book_id, title, author, avg_rating, pic_url) FROM stdin;
1	Harry Potter and the Deathly Hallows	J.K. Rowling	4.61	https://images.gr-assets.com/books/1474171184l/136251.jpg
2	Saga, Vol. 2	Brian K. Vaughan	4.56	https://images.gr-assets.com/books/1486028954l/17131869.jpg
3	The Complete Maus	Art Spiegelman	4.53	https://images.gr-assets.com/books/1327354180l/15195.jpg
4	Season of Mists	Neil Gaiman	4.54	https://images.gr-assets.com/books/1327937313l/25101.jpg
5	Bound By Blood: Volume 2 (Bound By Blood, #2)	Shane K.P. O'Neill	4.69	https://images.gr-assets.com/books/1354619331l/16233465.jpg
6	Saga, Vol. 3	Brian K. Vaughan	4.56	https://images.gr-assets.com/books/1486028973l/19358975.jpg
7	The Divan	Hafez	4.63	https://images.gr-assets.com/books/1327770153l/46292.jpg
8	The Lamb Of God	Shane K.P. O'Neill	4.54	https://images.gr-assets.com/books/1376912349l/18342958.jpg
9	The Tainted Trust	Stephen Douglass	4.73	https://images.gr-assets.com/books/1407396918l/22882294.jpg
10	Peanuts Treasury	Charles M. Schulz	4.58	https://images.gr-assets.com/books/1387738892l/551206.jpg
11	The Sacred Band	Janet E. Morris	4.6	https://images.gr-assets.com/books/1349080741l/8617107.jpg
12	The Path To Decay (Vlad Dracula, #2)	Shane K.P. O'Neill	4.66	https://images.gr-assets.com/books/1395359809l/21524199.jpg
13	Toda Mafalda	Quino	4.76	https://images.gr-assets.com/books/1412031764l/54741.jpg
14	Cold Days	Jim Butcher	4.51	https://images.gr-assets.com/books/1345145377l/12216302.jpg
15	Holy Bible: New International Version	Anonymous	4.61	https://images.gr-assets.com/books/1382581321l/280111.jpg
16	The Life and Times of Scrooge McDuck	Don Rosa	4.67	https://images.gr-assets.com/books/1388354390l/5309.jpg
17	Crooked Kingdom	Leigh Bardugo	4.62	https://images.gr-assets.com/books/1456172607l/22299763.jpg
18	Bobby's Girl	Bernie Morris	4.83	https://images.gr-assets.com/books/1349000830l/7261515.jpg
19	The Shifter Dimension	J.M. Johnson	4.83	https://images.gr-assets.com/books/1493644340l/35024851.jpg
20	The PreHistory of The Far Side: A 10th Anniversary Exhibit	Gary Larson	4.51	https://images.gr-assets.com/books/1439007503l/233712.jpg
21	Love and Rockets, Vol. 7: The Death of Speedy	Jaime Hernández	4.63	https://images.gr-assets.com/books/1171030576l/82871.jpg
22	The Indispensable Calvin and Hobbes	Bill Watterson	4.73	https://images.gr-assets.com/books/1347311516l/24815.jpg
23	Gemina	Amie Kaufman	4.56	https://images.gr-assets.com/books/1456744693l/29236298.jpg
24	The King's Men	Nora Sakavic	4.66	https://images.gr-assets.com/books/1417587954l/23594461.jpg
25	பொன்னியின் செல்வன் [Ponniyin Selvan]	Kalki	4.7	https://images.gr-assets.com/books/1245863038l/1108124.jpg
26	Homebodies	Charles Addams	4.53	https://images.gr-assets.com/books/1234907500l/250601.jpg
27	Genie-alogy	H.B.  Morris	4.96	https://images.gr-assets.com/books/1429745030l/25410135.jpg
28	Percepliquis	Michael J. Sullivan	4.54	https://images.gr-assets.com/books/1327893977l/12513190.jpg
29	Weirdos from Another Planet!: A Calvin and Hobbes Collection	Bill Watterson	4.7	https://images.gr-assets.com/books/1348896503l/77730.jpg
30	The Beatles Complete Chord Songbook	The Beatles	4.57	https://images.gr-assets.com/books/1382352610l/293898.jpg
31	Eye to Eye: Intimate Encounters with the Animal World	Frans Lanting	4.56	https://images.gr-assets.com/books/1348946876l/6569305.jpg
32	Magic Binds	Ilona Andrews	4.57	https://images.gr-assets.com/books/1454609590l/17333174.jpg
33	My First Travel Angelic Airline Adventures	Anna Othitis	4.63	https://images.gr-assets.com/books/1369825698l/17991046.jpg
34	Special Forces: Soldiers Part I -Director's Cut	Aleksandr Voinov	4.63	https://images.gr-assets.com/books/1270086694l/7861220.jpg
35	Nutuk (Günümüz Türkçesiyle)	Mustafa Kemal Atatürk	4.73	https://images.gr-assets.com/books/1420448647l/783510.jpg
36	Checkmate	Dorothy Dunnett	4.71	https://images.gr-assets.com/books/1369492229l/112074.jpg
37	Arcanum Unbounded: The Cosmere Collection	Brandon Sanderson	4.54	https://images.gr-assets.com/books/1466536615l/28595941.jpg
38	Just Mercy: A Story of Justice and Redemption	Bryan Stevenson	4.59	https://images.gr-assets.com/books/1420795201l/20342617.jpg
39	Fearless: The Heroic Story of One Navy SEAL's Sacrifice in the Hunt for Osama Bin Laden and the Unwavering Devotion of the Woman Who Loved Him	Eric Blehm	4.54	https://images.gr-assets.com/books/1351386173l/12878300.jpg
40	Rejected Princesses: Tales of History's Boldest Heroines, Hellions, and Heretics	Jason Porath	4.5	https://images.gr-assets.com/books/1466691940l/28820006.jpg
41	Tiger's Dream	Colleen Houck	4.5	https://images.gr-assets.com/books/1349843340l/12474623.jpg
42	The Road Home	Ellen Emerson White	4.54	https://images.gr-assets.com/books/1387715992l/247962.jpg
43	Heart of Obsidian	Nalini Singh	4.51	https://images.gr-assets.com/books/1359653471l/15781026.jpg
44	Classical Chinese Poetry: An Anthology	David Hinton	4.54	https://images.gr-assets.com/books/1316129326l/7743784.jpg
45	Tutunamayanlar	Oğuz Atay	4.6	https://images.gr-assets.com/books/1310152220l/758901.jpg
46	Jesus the Christ	James E. Talmage	4.63	https://images.gr-assets.com/books/1202623375l/481749.jpg
47	Transmetropolitan, Vol. 10: One More Time	Warren Ellis	4.52	https://images.gr-assets.com/books/1307354040l/22424.jpg
48	Kingdom of the Wicked	Derek Landy	4.53	https://images.gr-assets.com/books/1355578976l/16881421.jpg
49	The Disorderly Knights	Dorothy Dunnett	4.58	https://images.gr-assets.com/books/1399601597l/351211.jpg
50	Alive Together	Lisel Mueller	4.51	https://images.gr-assets.com/books/1347509186l/567685.jpg
51	Der Derwisch und der Tod	Meša Selimović	4.54	https://images.gr-assets.com/books/1352893006l/1679498.jpg
52	The Red Tree	Shaun Tan	4.54	https://images.gr-assets.com/books/1344739159l/300946.jpg
53	The Ringed Castle	Dorothy Dunnett	4.59	https://images.gr-assets.com/books/1399601686l/351198.jpg
54	The Complete Calvin and Hobbes	Bill Watterson	4.82	https://images.gr-assets.com/books/1473064526l/24812.jpg
55	If This Is a Man / The Truce	Primo Levi	4.54	https://images.gr-assets.com/books/1352245530l/6181.jpg
56	Captive Prince: Volume Two	C.S. Pacat	4.5	https://images.gr-assets.com/books/1356027904l/17158513.jpg
57	Worm	Wildbow	4.67	https://images.gr-assets.com/books/1388586402l/18713259.jpg
58	Oyasumi Punpun	Inio Asano	4.73	https://images.gr-assets.com/books/1389006663l/20451634.jpg
59	Death Bringer	Derek Landy	4.51	https://images.gr-assets.com/books/1461065966l/10221341.jpg
60	The Battlefield Where the Moon Says I Love You	Frank Stanford	4.68	https://images.gr-assets.com/books/1387705292l/91001.jpg
61	Kerri's War	Stephen Douglass	4.69	https://images.gr-assets.com/books/1406728313l/22842304.jpg
62	Skin Game	Jim Butcher	4.56	https://images.gr-assets.com/books/1387236318l/19486421.jpg
63	Dostoevsky: A Writer in His Time	Joseph Frank	4.52	https://images.gr-assets.com/books/1348805670l/4988505.jpg
64	Shahnameh: The Persian Book of Kings	Abolqasem Ferdowsi	4.51	https://images.gr-assets.com/books/1386921438l/157985.jpg
65	Brief Lives	Neil Gaiman	4.55	https://images.gr-assets.com/books/1339922078l/25105.jpg
66	The Constitution of the United States of America	Founding Fathers	4.54	https://images.gr-assets.com/books/1328756752l/89959.jpg
67	The Kindly Ones	Neil Gaiman	4.59	https://images.gr-assets.com/books/1339922887l/71252.jpg
68	Pawn in Frankincense	Dorothy Dunnett	4.62	https://images.gr-assets.com/books/1399601640l/360455.jpg
69	The Gift	Hafez	4.54	https://images.gr-assets.com/books/1386925429l/72910.jpg
70	The Wake	Neil Gaiman	4.53	https://images.gr-assets.com/books/1339922545l/25104.jpg
71	A Court of Wings and Ruin	Sarah J. Maas	4.53	https://images.gr-assets.com/books/1485528243l/23766634.jpg
72	Standing for Something: 10 Neglected Virtues That Will Heal Our Hearts and Homes	Gordon B. Hinckley	4.61	https://images.gr-assets.com/books/1388192142l/596259.jpg
73	Empire of Storms	Sarah J. Maas	4.58	https://images.gr-assets.com/books/1463107108l/28260587.jpg
74	Acheron	Sherrilyn Kenyon	4.59	https://images.gr-assets.com/books/1437687512l/2299110.jpg
75	Changes	Jim Butcher	4.54	https://images.gr-assets.com/books/1304027244l/6585201.jpg
76	Something Under the Bed is Drooling: A Calvin and Hobbes Collection	Bill Watterson	4.7	https://images.gr-assets.com/books/1384735602l/70490.jpg
77	The Days Are Just Packed: A Calvin and Hobbes Collection	Bill Watterson	4.68	https://images.gr-assets.com/books/1418211162l/24818.jpg
78	The Civil War: A Narrative	Shelby Foote	4.54	https://images.gr-assets.com/books/1313254390l/44234.jpg
79	Birth Of The Monster	Shane K.P. O'Neill	4.52	https://images.gr-assets.com/books/1391638971l/20739386.jpg
80	The Nightingale	Kristin Hannah	4.54	https://images.gr-assets.com/books/1451446316l/21853621.jpg
81	The Authoritative Calvin and Hobbes: A Calvin and Hobbes Treasury	Bill Watterson	4.73	https://images.gr-assets.com/books/1391114055l/59715.jpg
82	Against the Flow: The Arts, Postmodern Culture and Education	Peter Abbs	4.52	https://images.gr-assets.com/books/1348765391l/5807074.jpg
83	It's a Magical World: A Calvin and Hobbes Collection	Bill Watterson	4.75	https://images.gr-assets.com/books/1437420710l/24814.jpg
84	Autumn Sonata: Selected Poems	Georg Trakl	4.72	https://images.gr-assets.com/books/1347742590l/297226.jpg
85	Calvin and Hobbes	Bill Watterson	4.61	https://images.gr-assets.com/books/1441227694l/77727.jpg
86	Harry Potter and the Half-Blood Prince	J.K. Rowling	4.54	https://images.gr-assets.com/books/1361039191l/1.jpg
87	Heir of Fire	Sarah J. Maas	4.53	https://images.gr-assets.com/books/1460846511l/20613470.jpg
88	Ahead of All Parting: The Selected Poetry and Prose	Rainer Maria Rilke	4.68	https://images.gr-assets.com/books/1388464214l/49458.jpg
89	Harry Potter and the Goblet of Fire	J.K. Rowling	4.53	https://images.gr-assets.com/books/1361482611l/6.jpg
90	Harry Potter and the Prisoner of Azkaban	J.K. Rowling	4.53	https://images.gr-assets.com/books/1499277281l/5.jpg
91	A Court of Mist and Fury	Sarah J. Maas	4.72	https://images.gr-assets.com/books/1485259138l/17927395.jpg
92	Queen of Shadows	Sarah J. Maas	4.6	https://images.gr-assets.com/books/1441230104l/18006496.jpg
93	The House of Hades	Rick Riordan	4.55	https://images.gr-assets.com/books/1464201430l/12127810.jpg
94	Clockwork Princess	Cassandra Clare	4.59	https://images.gr-assets.com/books/1436788488l/18335634.jpg
95	Collected Fictions	Jorge Luis Borges	4.58	https://images.gr-assets.com/books/1386924676l/17961.jpg
96	Words of Radiance	Brandon Sanderson	4.77	https://images.gr-assets.com/books/1391535251l/17332218.jpg
97	The Way of Kings	Brandon Sanderson	4.64	https://images.gr-assets.com/books/1388184640l/7235533.jpg
98	The Wise Man's Fear	Patrick Rothfuss	4.57	https://images.gr-assets.com/books/1452624392l/1215032.jpg
99	The Name of the Wind	Patrick Rothfuss	4.55	https://images.gr-assets.com/books/1472068073l/186074.jpg
100	A Storm of Swords	George R.R. Martin	4.54	https://images.gr-assets.com/books/1497931121l/62291.jpg
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('books_book_id_seq', 100, true);


--
-- Data for Name: books_genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY books_genres (book_genre_id, book_id, genre_id) FROM stdin;
1	72	31
2	72	9
3	72	33
4	72	88
5	72	31
6	72	89
7	72	101
8	72	102
9	72	90
10	72	88
11	72	103
12	72	32
13	72	98
14	28	1
15	28	1
16	28	43
17	28	3
18	28	44
19	28	1
20	28	45
21	66	65
22	66	9
23	66	12
24	66	98
25	66	79
26	66	47
27	66	99
28	66	100
29	29	4
30	29	6
31	29	22
32	29	3
33	29	4
34	29	5
35	68	19
36	68	23
37	68	3
38	68	19
39	68	68
40	68	73
41	68	44
42	9	3
43	9	21
44	67	4
45	67	5
46	67	4
47	67	6
48	67	1
49	67	3
50	67	8
51	48	1
52	48	2
53	48	3
54	48	44
55	30	46
56	30	47
57	30	9
58	69	20
59	69	90
60	69	12
61	69	31
62	69	9
63	69	98
64	36	19
65	36	23
66	36	19
67	36	3
68	36	68
69	36	73
70	79	14
71	79	19
72	79	23
73	79	3
74	79	1
75	79	29
76	79	53
77	79	1
78	79	29
79	15	31
80	15	32
81	15	9
82	15	12
83	15	31
84	15	33
85	71	1
86	71	15
87	71	2
88	71	25
89	93	1
90	93	2
91	93	1
92	93	81
93	37	1
94	37	3
95	37	74
96	37	1
97	37	43
98	16	4
99	16	6
100	16	4
101	16	5
102	16	3
103	16	8
104	16	6
105	16	34
106	18	15
107	31	9
108	31	48
109	31	49
110	31	50
111	31	48
112	31	51
113	31	52
114	17	1
115	17	2
116	94	1
117	94	2
118	94	15
119	94	1
120	94	29
121	74	15
122	74	17
123	74	1
124	74	29
125	74	15
126	74	1
127	74	29
128	74	53
129	19	7
130	19	6
131	19	35
132	20	22
133	20	4
134	20	6
135	20	3
136	20	4
137	20	5
138	20	4
139	20	36
140	32	1
141	32	27
142	32	1
143	32	1
144	32	29
145	32	1
146	32	30
147	32	15
148	32	29
149	32	53
150	32	3
151	32	54
152	32	55
153	76	4
154	76	6
155	76	22
156	76	3
157	76	4
158	76	5
159	73	1
160	73	2
161	73	15
162	73	1
163	73	30
164	77	4
165	77	6
166	77	22
167	77	3
168	77	4
169	77	5
170	22	4
171	22	6
172	22	22
173	22	4
174	22	5
175	21	4
176	21	6
177	21	4
178	21	5
179	21	3
180	21	4
181	21	37
182	21	8
183	21	6
184	21	34
185	41	1
186	41	2
187	41	15
188	41	1
189	41	81
190	42	19
191	42	23
192	42	2
193	42	3
194	42	15
195	42	13
196	78	65
197	78	104
198	78	105
199	78	9
200	78	99
201	78	100
202	78	13
203	78	100
204	78	106
205	23	7
206	23	2
207	33	44
208	33	56
209	33	57
210	33	58
211	33	57
212	33	59
213	33	60
214	43	15
215	43	17
216	43	1
217	43	29
218	43	15
219	43	1
220	43	1
221	43	27
222	43	29
223	43	54
224	95	3
225	95	74
226	95	85
227	95	12
228	95	1
229	95	113
230	80	19
231	80	23
232	80	3
233	80	19
234	80	13
235	80	10
236	80	13
237	25	19
238	25	23
239	25	12
240	25	3
241	38	9
242	38	75
243	38	76
244	38	77
245	38	78
246	38	70
247	38	79
248	44	20
249	44	68
250	44	82
251	44	66
252	44	83
253	44	84
254	44	85
255	44	66
256	81	4
257	81	6
258	81	22
259	81	4
260	81	5
261	81	3
262	81	22
263	81	107
264	81	57
265	81	6
266	81	34
267	81	8
268	81	22
269	81	108
270	81	4
271	81	109
272	14	1
273	14	1
274	14	27
275	14	3
276	14	28
277	14	1
278	14	29
279	14	1
280	14	30
281	34	15
282	34	61
283	34	13
284	34	62
285	34	63
286	34	64
287	34	15
288	26	22
289	26	4
290	26	36
291	26	4
292	26	6
293	26	16
294	26	4
295	26	5
296	82	58
297	82	9
298	82	98
299	82	48
300	82	110
301	82	68
302	27	7
303	27	7
304	27	42
305	45	66
306	45	67
307	45	68
308	45	69
309	45	3
310	45	86
311	45	87
312	2	4
313	2	5
314	2	4
315	2	6
316	2	1
317	2	7
318	2	3
319	2	8
320	39	72
321	39	9
322	39	13
323	39	62
324	39	13
325	39	32
326	39	65
327	35	65
328	35	66
329	35	67
330	35	9
331	35	68
332	35	69
333	35	12
334	35	70
335	35	13
336	35	71
337	35	72
338	84	20
339	84	111
340	84	112
341	24	38
342	24	39
343	24	2
344	24	40
345	24	41
346	46	31
347	46	33
348	46	88
349	46	9
350	46	31
351	46	89
352	46	90
353	85	4
354	85	6
355	85	22
356	85	4
357	85	5
358	85	3
359	75	1
360	75	27
361	75	1
362	75	3
363	75	28
364	75	1
365	75	29
366	96	1
367	96	3
368	96	1
369	96	43
370	96	1
371	96	45
372	47	4
373	47	6
374	47	4
375	47	5
376	47	7
377	47	3
378	47	7
379	47	91
380	47	6
381	47	34
382	86	1
383	86	2
384	86	3
385	86	1
386	86	30
387	86	57
388	65	4
389	65	5
390	65	4
391	65	6
392	65	1
393	65	3
394	65	8
395	3	9
396	3	10
397	3	11
398	3	4
399	3	6
400	3	8
401	3	12
402	3	4
403	3	5
404	3	13
405	3	10
406	87	1
407	87	2
408	87	1
409	87	30
410	87	15
411	88	20
412	88	111
413	88	112
414	88	12
415	88	85
416	88	3
417	49	19
418	49	23
419	49	19
420	49	3
421	49	68
422	49	73
423	49	44
424	89	1
425	89	2
426	89	3
427	89	57
428	51	3
429	51	12
430	51	19
431	51	23
432	91	1
433	91	15
434	91	2
435	91	25
436	50	20
437	92	1
438	92	2
439	92	15
440	92	1
441	92	30
442	52	57
443	52	92
444	52	4
445	52	5
446	52	57
447	52	3
448	52	48
449	7	20
450	7	12
451	53	19
452	53	23
453	53	19
454	53	3
455	53	68
456	53	73
457	53	68
458	53	93
459	54	4
460	54	6
461	54	22
462	54	4
463	54	5
464	54	3
465	5	15
466	5	14
467	5	16
468	5	15
469	5	17
470	5	1
471	5	18
472	5	19
473	1	1
474	1	2
475	1	3
476	6	4
477	6	5
478	6	4
479	6	6
480	6	1
481	6	7
482	6	3
483	6	8
484	40	9
485	40	65
486	40	80
487	40	72
488	40	19
489	40	22
490	55	9
491	55	65
492	55	72
493	55	10
494	55	11
495	55	12
496	55	13
497	55	75
498	55	76
499	4	4
500	4	5
501	4	4
502	4	6
503	4	1
504	4	3
505	4	14
506	4	8
507	97	1
508	97	3
509	97	1
510	97	43
511	97	1
512	97	45
513	64	20
514	64	12
515	64	65
516	64	68
517	64	97
518	64	1
519	64	81
520	64	85
521	56	1
522	56	15
523	56	61
524	56	15
525	56	38
526	98	1
527	98	3
528	98	1
529	98	43
530	57	1
531	57	3
532	57	7
533	57	6
534	57	35
535	99	1
536	99	3
537	99	1
538	99	43
539	100	1
540	100	3
541	100	1
542	100	43
543	100	114
544	83	4
545	83	6
546	83	22
547	83	3
548	83	4
549	83	5
550	8	14
551	8	19
552	59	1
553	59	2
554	59	1
555	59	30
556	58	4
557	58	94
558	58	4
559	58	6
560	58	4
561	58	5
562	58	95
563	90	1
564	90	2
565	90	3
566	62	1
567	62	1
568	62	27
569	62	3
570	62	1
571	62	29
572	62	1
573	62	30
574	62	28
575	60	20
576	60	85
577	10	4
578	10	6
579	10	22
580	10	3
581	70	4
582	70	5
583	70	4
584	70	6
585	70	1
586	70	3
587	70	8
588	61	21
589	61	15
590	61	28
591	61	96
592	61	3
593	11	1
594	11	19
595	11	23
596	11	23
597	11	24
598	63	72
599	63	9
600	63	65
601	63	68
602	63	93
603	12	14
604	12	15
605	12	15
606	12	17
607	12	25
608	12	16
609	12	1
610	12	18
611	12	19
612	13	4
613	13	6
614	13	22
615	13	4
616	13	5
617	13	4
618	13	26
\.


--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('books_genres_book_genre_id_seq', 618, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY genres (genre_id, name) FROM stdin;
1	Fantasy
2	Young Adult
3	Fiction
4	Sequential Art
5	Graphic Novels
6	Comics
7	Science Fiction
8	Graphic Novels Comics
9	Nonfiction
10	World War II
11	Holocaust
12	Classics
13	War
14	Horror
15	Romance
16	Gothic
17	Paranormal Romance
18	Dark Fantasy
19	Historical
20	Poetry
21	Thriller
22	Humor
23	Historical Fiction
24	Historical Fantasy
25	New Adult
26	Bande Dessinée
27	Urban Fantasy
28	Mystery
29	Paranormal
30	Magic
31	Religion
32	Christian
33	Christianity
34	Comic Book
35	Superheroes
36	Cartoon
37	Comix
38	Glbt
39	Contemporary
40	Sports and Games
41	Sports
42	Time Travel
43	Epic Fantasy
44	Adventure
45	High Fantasy
46	Music
47	Reference
48	Art
49	Photography
50	Animals
51	Environment
52	Nature
53	Vampires
54	Shapeshifters
55	Werewolves
56	Aeroplanes
57	Childrens
58	Education
59	Middle Grade
60	Family
61	M M Romance
62	Military
63	Erotica
64	Bdsm
65	History
66	Asian Literature
67	Turkish Literature
68	Cultural
69	Turkish
70	Politics
71	Biography Memoir
72	Biography
73	Scotland
74	Short Stories
75	Autobiography
76	Memoir
77	Social Movements
78	Social Justice
79	Law
80	Feminism
81	Mythology
82	China
83	Chinese Literature
84	Anthologies
85	Literature
86	Novels
87	Roman
88	Lds
89	Church
90	Spirituality
91	Cyberpunk
92	Picture Books
93	Russia
94	Manga
95	Comics Manga
96	Crime
97	Iran
98	Philosophy
99	North American Hi...
100	American History
101	Inspirational
102	Self Help
103	Lds Non Fiction
104	Military History
105	Civil War
106	American Civil War
107	Comedy
108	Funny
109	Comic Strips
110	Sociology
111	European Literature
112	German Literature
113	Magical Realism
114	Science Fiction Fantasy
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('genres_genre_id_seq', 114, true);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY ratings (rating_id, user_id, book_id, score) FROM stdin;
1	1	10	5
2	1	16	4
3	2	1	5
4	2	17	4
5	2	54	5
6	1	35	1
7	2	34	1
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 7, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, name, email, password) FROM stdin;
1	Balloonicorn	kittens-are-great@aol.com	party-time
2	Lyra Hall	lyrahall14@gmail.com	wicked
\.


--
-- Data for Name: users_genres; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users_genres (user_genre_id, user_id, genre_id) FROM stdin;
1	2	1
2	2	17
\.


--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_genres_user_genre_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


--
-- Name: books_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_pkey PRIMARY KEY (book_genre_id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: users_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users_genres
    ADD CONSTRAINT users_genres_pkey PRIMARY KEY (user_genre_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: books_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: books_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: ratings_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users_genres
    ADD CONSTRAINT users_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: users_genres_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users_genres
    ADD CONSTRAINT users_genres_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

