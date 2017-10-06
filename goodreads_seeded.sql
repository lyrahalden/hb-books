--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.8
-- Dumped by pg_dump version 9.5.8

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
-- Name: books; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE books (
    book_id integer NOT NULL,
    title character varying(200) NOT NULL,
    author character varying(200) NOT NULL,
    avg_rating character varying(200) NOT NULL,
    pic_url character varying(200) NOT NULL
);


ALTER TABLE books OWNER TO "user";

--
-- Name: books_book_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE books_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_book_id_seq OWNER TO "user";

--
-- Name: books_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE books_book_id_seq OWNED BY books.book_id;


--
-- Name: books_genres; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE books_genres (
    book_genre_id integer NOT NULL,
    book_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE books_genres OWNER TO "user";

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE books_genres_book_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_genres_book_genre_id_seq OWNER TO "user";

--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE books_genres_book_genre_id_seq OWNED BY books_genres.book_genre_id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE genres (
    genre_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE genres OWNER TO "user";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE genres_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE genres_genre_id_seq OWNER TO "user";

--
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE genres_genre_id_seq OWNED BY genres.genre_id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE ratings (
    rating_id integer NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    score integer NOT NULL
);


ALTER TABLE ratings OWNER TO "user";

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ratings_rating_id_seq OWNER TO "user";

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE users (
    user_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE users OWNER TO "user";

--
-- Name: users_genres; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE users_genres (
    user_genre_id integer NOT NULL,
    user_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE users_genres OWNER TO "user";

--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE users_genres_user_genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_genres_user_genre_id_seq OWNER TO "user";

--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE users_genres_user_genre_id_seq OWNED BY users_genres.user_genre_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO "user";

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: book_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY books ALTER COLUMN book_id SET DEFAULT nextval('books_book_id_seq'::regclass);


--
-- Name: book_genre_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY books_genres ALTER COLUMN book_genre_id SET DEFAULT nextval('books_genres_book_genre_id_seq'::regclass);


--
-- Name: genre_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY genres ALTER COLUMN genre_id SET DEFAULT nextval('genres_genre_id_seq'::regclass);


--
-- Name: rating_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: user_genre_id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY users_genres ALTER COLUMN user_genre_id SET DEFAULT nextval('users_genres_user_genre_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: user
--

COPY books (book_id, title, author, avg_rating, pic_url) FROM stdin;
1	To Kill a Mockingbird	Harper Lee	4.26	https://images.gr-assets.com/books/1361975680l/2657.jpg
2	The Raven	Edgar Allan Poe	4.28	https://images.gr-assets.com/books/1347398489l/264158.jpg
3	The Pillars of the Earth	Ken Follett	4.29	https://images.gr-assets.com/books/1388193707l/5043.jpg
4	Watchmen	Alan Moore	4.35	https://images.gr-assets.com/books/1442239711l/472331.jpg
5	Winnie-the-Pooh	A.A. Milne	4.34	https://images.gr-assets.com/books/1298440130l/99107.jpg
6	Where the Wild Things Are	Maurice Sendak	4.22	https://images.gr-assets.com/books/1384434560l/19543.jpg
7	The Stand	Stephen King	4.34	https://images.gr-assets.com/books/1213131305l/149267.jpg
8	Matilda	Roald Dahl	4.29	https://images.gr-assets.com/books/1388793265l/39988.jpg
9	I, Claudius	Robert Graves	4.27	https://images.gr-assets.com/books/1388185810l/18765.jpg
10	Labyrinths:  Selected Stories and Other Writings	Jorge Luis Borges	4.46	https://images.gr-assets.com/books/1388286895l/17717.jpg
11	The Brothers K	David James Duncan	4.39	https://images.gr-assets.com/books/1403176622l/19534.jpg
12	Out of Africa - and - Shadows on the Grass	Isak Dinesen	4.25	https://images.gr-assets.com/books/1326384571l/13411425.jpg
13	Hard Times: An Oral History of the Great Depression	Studs Terkel	4.21	https://images.gr-assets.com/books/1328752527l/59651.jpg
14	De Rozentuin	Saadi	4.42	https://images.gr-assets.com/books/1365403604l/9302604.jpg
15	Dumbo: A Little Golden Book	Walt Disney Company	4.29	https://images.gr-assets.com/books/1320426193l/1298205.jpg
16	What We Talk About When We Talk About Love	Raymond Carver	4.22	https://images.gr-assets.com/books/1475474209l/11438.jpg
17	Bone: The Complete Edition	Jeff Smith	4.42	https://images.gr-assets.com/books/1483068004l/92143.jpg
18	Sugar	Bernice L. McFadden	4.27	https://images.gr-assets.com/books/1388182590l/495369.jpg
19	Hamilton: The Revolution	Lin-Manuel Miranda	4.47	https://images.gr-assets.com/books/1451400644l/26200563.jpg
20	The Hero and the Crown	Robin McKinley	4.21	https://images.gr-assets.com/books/1386642407l/77366.jpg
21	Addicted	Zane	4.26	https://images.gr-assets.com/books/1266487564l/169331.jpg
22	The Missing Piece	Shel Silverstein	4.27	https://images.gr-assets.com/books/1388184341l/30122.jpg
23	Free to Choose: A Personal Statement	Milton Friedman	4.22	https://images.gr-assets.com/books/1328875046l/97820.jpg
24	Olivia and the Fairy Princesses	Ian Falconer	4.21	https://images.gr-assets.com/books/1340327711l/13546400.jpg
25	Edenbrooke	Julianne Donaldson	4.34	https://images.gr-assets.com/books/1371398291l/12820360.jpg
26	A Soldier of the Great War	Mark Helprin	4.35	https://images.gr-assets.com/books/1328874912l/87985.jpg
27	Letters to a Young Poet	Rainer Maria Rilke	4.34	https://images.gr-assets.com/books/1346335019l/539477.jpg
28	Positive: A Memoir	Paige Rawl	4.27	https://images.gr-assets.com/books/1392923727l/20306819.jpg
29	The Autobiography of Henry VIII: With Notes by His Fool, Will Somers	Margaret George	4.25	https://images.gr-assets.com/books/1439956289l/10108.jpg
30	The Twelve Dancing Princesses	Marianna Mayer	4.31	https://images.gr-assets.com/books/1387739866l/849287.jpg
31	Oh, wie schön ist Panama	Janosch	4.31	https://images.gr-assets.com/books/1172266750l/157551.jpg
32	Pierre: A Cautionary Tale in Five Chapters and a Prologue	Maurice Sendak	4.29	https://images.gr-assets.com/books/1347744043l/120715.jpg
33	An Autobiography	Agatha Christie	4.27	https://images.gr-assets.com/books/1396228839l/16301.jpg
34	One for the Murphys	Lynda Mullaly Hunt	4.31	https://images.gr-assets.com/books/1320344047l/12926804.jpg
35	The New Jim Crow: Mass Incarceration in the Age of Colorblindness	Michelle Alexander	4.49	https://images.gr-assets.com/books/1328751532l/6792458.jpg
36	Age of Myth	Michael J. Sullivan	4.27	https://images.gr-assets.com/books/1507307691l/26863057.jpg
37	Red Rising	Pierce Brown	4.26	https://images.gr-assets.com/books/1461354651l/15839976.jpg
38	The Truth About Stories: A Native Narrative	Thomas King	4.28	https://images.gr-assets.com/books/1389066350l/196430.jpg
39	The Killer Angels	Michael Shaara	4.3	https://images.gr-assets.com/books/1355371689l/682804.jpg
40	Deathbird Stories	Harlan Ellison	4.2	https://images.gr-assets.com/books/1327887412l/219376.jpg
41	Rat Queens, Vol. 1: Sass & Sorcery	Kurtis J. Wiebe	4.19	https://images.gr-assets.com/books/1489284113l/20299683.jpg
42	I Was So Mad	Mercer Mayer	4.21	https://images.gr-assets.com/books/1388245664l/386421.jpg
43	I Want to Go Home!	Gordon Korman	4.47	https://images.gr-assets.com/books/1266453276l/24051.jpg
44	Stalin: The Court of the Red Tsar	Simon Sebag Montefiore	4.2	https://images.gr-assets.com/books/1320529351l/282108.jpg
45	Slouching Towards Bethlehem	Joan Didion	4.23	https://images.gr-assets.com/books/1327952074l/424.jpg
46	Illuminae	Amie Kaufman	4.31	https://images.gr-assets.com/books/1443433956l/23395680.jpg
47	Winter of Fire	Sherryl Jordan	4.31	https://images.gr-assets.com/books/1476951995l/118755.jpg
48	Trickster's Choice	Tamora Pierce	4.27	https://images.gr-assets.com/books/1320417330l/767580.jpg
49	The Kite Runner	Khaled Hosseini	4.26	https://images.gr-assets.com/books/1484565687l/77203.jpg
50	There Will Come Soft Rains	Ray Bradbury	4.24	https://images.gr-assets.com/books/1349047197l/2260460.jpg
51	The World According to Mister Rogers: Important Things to Remember	Fred Rogers	4.31	https://images.gr-assets.com/books/1442170069l/73123.jpg
52	Moneyball: The Art of Winning an Unfair Game	Michael   Lewis	4.25	https://images.gr-assets.com/books/1388176510l/1301.jpg
53	The Cloud of Unknowing	Anonymous	4.21	https://images.gr-assets.com/books/1390438311l/241902.jpg
54	Imperium	Ryszard Kapuściński	4.33	https://images.gr-assets.com/books/1170533405l/59659.jpg
55	The Black Prism	Brent Weeks	4.24	https://images.gr-assets.com/books/1327921884l/7165300.jpg
56	Simon vs. the Homo Sapiens Agenda	Becky Albertalli	4.26	https://images.gr-assets.com/books/1402915678l/19547856.jpg
57	Bridge of Birds	Barry Hughart	4.3	https://images.gr-assets.com/books/1327940289l/15177.jpg
58	Blood Brothers	Elias Chacour	4.28	https://images.gr-assets.com/books/1386920443l/132119.jpg
59	Copper Sun	Sharon M. Draper	4.3	https://images.gr-assets.com/books/1347621809l/90420.jpg
60	Narwhal: Unicorn of the Sea	Ben Clanton	4.22	https://images.gr-assets.com/books/1469402845l/28503853.jpg
61	Calling Me Home	Julie Kibler	4.21	https://images.gr-assets.com/books/1359803797l/15793184.jpg
62	The Guild	Felicia Day	4.22	https://images.gr-assets.com/books/1289350918l/8693600.jpg
63	Neither Wolf nor Dog: On Forgotten Roads with an Indian Elder	Kent Nerburn	4.33	https://images.gr-assets.com/books/1333199147l/72662.jpg
64	Gods and Kings	Lynn Austin	4.31	https://images.gr-assets.com/books/1428380450l/359994.jpg
65	The Bunny Book	Patricia M. Scarry	4.25	https://images.gr-assets.com/books/1320508746l/890686.jpg
66	The Outcasts	John Flanagan	4.37	https://images.gr-assets.com/books/1327968303l/10551947.jpg
67	Princeps' Fury	Jim Butcher	4.35	https://images.gr-assets.com/books/1315082776l/2903736.jpg
68	Practicing the Power of Now: Essential Teachings, Meditations, and Exercises from the Power of Now	Eckhart Tolle	4.25	https://images.gr-assets.com/books/1388178295l/6709.jpg
69	Dragonsong	Anne McCaffrey	4.24	https://images.gr-assets.com/books/1297622381l/797079.jpg
70	Guards! Guards!	Terry Pratchett	4.32	https://images.gr-assets.com/books/1431127356l/64216.jpg
71	The Futurological Congress: From the Memoirs of Ijon Tichy	Stanisław Lem	4.21	https://images.gr-assets.com/books/1387704942l/733473.jpg
72	Modoc: The True Story of the Greatest Elephant That Ever Lived	Ralph Helfer	4.2	https://images.gr-assets.com/books/1422415870l/23982.jpg
73	The Autobiography of Martin Luther King, Jr.	Martin Luther King Jr.	4.32	https://images.gr-assets.com/books/1386926572l/42547.jpg
74	War and Remembrance	Herman Wouk	4.38	https://images.gr-assets.com/books/1299278808l/10680257.jpg
75	The Last Kingdom	Bernard Cornwell	4.23	https://images.gr-assets.com/books/1407107780l/68527.jpg
76	The Children of Noisy Village	Astrid Lindgren	4.26	https://images.gr-assets.com/books/1388464476l/19311.jpg
77	The Orenda	Joseph Boyden	4.24	https://images.gr-assets.com/books/1363710334l/17661831.jpg
78	The Rent Collector	Camron Wright	4.23	https://images.gr-assets.com/books/1340468685l/13628812.jpg
79	Indian Horse	Richard Wagamese	4.3	https://images.gr-assets.com/books/1327688060l/11994903.jpg
80	Every Thing on It	Shel Silverstein	4.39	https://images.gr-assets.com/books/1331416624l/10659536.jpg
81	Daytripper	Fábio Moon	4.31	https://images.gr-assets.com/books/1327876816l/8477057.jpg
82	The Missing Piece Meets the Big O	Shel Silverstein	4.32	https://images.gr-assets.com/books/1437926898l/30125.jpg
83	The 5000 Year Leap: A Miracle That Changed the World	W. Cleon Skousen	4.26	https://images.gr-assets.com/books/1347564075l/1217881.jpg
84	Shantaram	Gregory David Roberts	4.26	https://images.gr-assets.com/books/1333482282l/33600.jpg
85	Book of Mormon, Doctrine and Covenants, Pearl of Great Price	The Church of Jesus Christ of Latter-day Saints	4.36	https://images.gr-assets.com/books/1396619969l/747061.jpg
86	Last Chance to See	Douglas Adams	4.33	https://images.gr-assets.com/books/1327867839l/8696.jpg
87	Desert Solitaire	Edward Abbey	4.22	https://images.gr-assets.com/books/1399583343l/214614.jpg
88	Between the World and Me	Ta-Nehisi Coates	4.4	https://images.gr-assets.com/books/1451435027l/25489625.jpg
89	The Screwtape Letters	C.S. Lewis	4.21	https://images.gr-assets.com/books/1507310167l/17383917.jpg
90	Pale Blue Dot: A Vision of the Human Future in Space	Carl Sagan	4.32	https://images.gr-assets.com/books/1500191671l/61663.jpg
91	The Count of Monte Cristo	Alexandre Dumas	4.22	https://images.gr-assets.com/books/1309203605l/7126.jpg
92	The Days Are Just Packed: A Calvin and Hobbes Collection	Bill Watterson	4.68	https://images.gr-assets.com/books/1418211162l/24818.jpg
93	The Long Ships	Frans G. Bengtsson	4.28	https://images.gr-assets.com/books/1348457477l/438452.jpg
94	Skip Beat!, Vol. 01	Yoshiki Nakamura	4.26	https://images.gr-assets.com/books/1173395297l/282282.jpg
95	The Complete Fairy Tales	Oscar Wilde	4.33	https://images.gr-assets.com/books/1488665688l/163716.jpg
96	Wild Magic	Tamora Pierce	4.33	https://images.gr-assets.com/books/1166573613l/13836.jpg
97	The Chronicles of Narnia	C.S. Lewis	4.24	https://images.gr-assets.com/books/1449868701l/11127.jpg
98	Barrayar	Lois McMaster Bujold	4.31	https://images.gr-assets.com/books/1397151220l/61905.jpg
99	The Making of the Atomic Bomb	Richard Rhodes	4.32	https://images.gr-assets.com/books/1440621221l/16884.jpg
100	Naoki Urasawa's Monster, Volume 1: Herr Dr. Tenma	Naoki Urasawa	4.39	https://images.gr-assets.com/books/1388376071l/533016.jpg
101	The Fifth Season	N.K. Jemisin	4.3	https://images.gr-assets.com/books/1386803701l/19161852.jpg
102	Kane en Abel	Jeffrey Archer	4.27	https://images.gr-assets.com/books/1316510926l/12674539.jpg
103	There are No Children Here: The Story of Two Boys Growing Up in the Other America	Alex Kotlowitz	4.25	https://images.gr-assets.com/books/1320394274l/41918.jpg
104	Rain of Gold	Victor Villaseñor	4.48	https://images.gr-assets.com/books/1365590972l/820838.jpg
105	All Creatures Great and Small	James Herriot	4.31	https://images.gr-assets.com/books/1385661387l/18929854.jpg
106	Beneath the Surface: Killer Whales, SeaWorld, and the Truth Beyond Blackfish	John Hargrove	4.22	https://images.gr-assets.com/books/1426127539l/23014804.jpg
107	The One and Only Ivan	Katherine Applegate	4.24	https://images.gr-assets.com/books/1424981397l/11594337.jpg
108	Stay	Riley Hart	4.21	https://images.gr-assets.com/books/1398187247l/21976102.jpg
109	The Paper Bag Princess	Robert Munsch	4.32	https://images.gr-assets.com/books/1386912856l/240130.jpg
110	The Warmth of Other Suns: The Epic Story of America's Great Migration	Isabel Wilkerson	4.32	https://images.gr-assets.com/books/1433354252l/8171378.jpg
111	Bear, Otter, and the Kid	T.J. Klune	4.21	https://images.gr-assets.com/books/1347434774l/12156759.jpg
112	Outlander	Diana Gabaldon	4.21	https://images.gr-assets.com/books/1402600310l/10964.jpg
113	xkcd: volume 0	Randall Munroe	4.34	https://images.gr-assets.com/books/1328833276l/6902644.jpg
114	The Return of the Prodigal Son: A Story of Homecoming	Henri J.M. Nouwen	4.38	https://images.gr-assets.com/books/1327010857l/175113.jpg
115	Dreadnought: Britain, Germany and the Coming of the Great War	Robert K. Massie	4.29	https://images.gr-assets.com/books/1337906906l/2434511.jpg
116	Mog the Forgetful Cat	Judith Kerr	4.29	https://images.gr-assets.com/books/1328876460l/1152265.jpg
117	The False Prince	Jennifer A. Nielsen	4.22	https://images.gr-assets.com/books/1333227435l/12432220.jpg
118	Love	Leo Buscaglia	4.25	https://images.gr-assets.com/books/1178821840l/841125.jpg
119	The Mis-Education of the Negro	Carter G. Woodson	4.46	https://images.gr-assets.com/books/1389467391l/242936.jpg
120	Frosty the Snowman (Frosty the Snowman)	Diane Muldrow	4.34	https://images.gr-assets.com/books/1377635241l/437885.jpg
121	Little Bear's Visit	Else Holmelund Minarik	4.27	https://images.gr-assets.com/books/1341430333l/590524.jpg
122	These Is My Words: The Diary of Sarah Agnes Prine, 1881-1901, Arizona Territories	Nancy E. Turner	4.34	https://images.gr-assets.com/books/1388190502l/348225.jpg
123	Return to Love: Reflections on the Principles of a Course in Miracles	Marianne Williamson	4.29	https://images.gr-assets.com/books/1387705139l/1861438.jpg
124	Half the Sky: Turning Oppression into Opportunity for Women Worldwide	Nicholas D. Kristof	4.31	https://images.gr-assets.com/books/1320486170l/6260997.jpg
125	The Road of Lost Innocence: The True Story of a Cambodian Heroine	Somaly Mam	4.21	https://images.gr-assets.com/books/1320554110l/2634030.jpg
126	Twenty Love Poems and a Song of Despair	Pablo Neruda	4.32	https://images.gr-assets.com/books/1447622711l/5932.jpg
127	Billions & Billions: Thoughts on Life and Death at the Brink of the Millennium	Carl Sagan	4.26	https://images.gr-assets.com/books/1366573520l/61665.jpg
128	The Creature from Jekyll Island: A Second Look at the Federal Reserve	G. Edward Griffin	4.27	https://images.gr-assets.com/books/1388202595l/66499.jpg
129	A Little Princess	Frances Hodgson Burnett	4.19	https://images.gr-assets.com/books/1327868556l/3008.jpg
130	Cordelia's Honor	Lois McMaster Bujold	4.37	https://images.gr-assets.com/books/1430411230l/61900.jpg
131	Yu Yu Hakusho, Volume 1: Goodbye, Material World!	Yoshihiro Togashi	4.3	https://images.gr-assets.com/books/1387350767l/432020.jpg
132	Ina May's Guide to Childbirth	Ina May Gaskin	4.41	https://images.gr-assets.com/books/1386924890l/32127.jpg
133	War is a Racket: The Antiwar Classic by America's Most Decorated Soldier	Smedley D. Butler	4.28	https://images.gr-assets.com/books/1388187471l/198259.jpg
134	The Secret Magdalene	Ki Longfellow	4.21	https://images.gr-assets.com/books/1175446011l/514811.jpg
135	Little Pea	Amy Krouse Rosenthal	4.23	https://images.gr-assets.com/books/1348556860l/507402.jpg
136	A Bargain for Frances	Russell Hoban	4.25	https://images.gr-assets.com/books/1347221170l/394683.jpg
137	Ain't I a Woman: Black Women and Feminism	bell hooks	4.36	https://images.gr-assets.com/books/1371539140l/250792.jpg
138	The Color Kittens	Margaret Wise Brown	4.23	https://images.gr-assets.com/books/1420795657l/237346.jpg
139	for colored girls who have considered suicide/when the rainbow is enuf	Ntozake Shange	4.27	https://images.gr-assets.com/books/1386924750l/58098.jpg
140	La Trilogie berlinoise : L'Eté de cristal ; La Pâle figure ; Un requiem allemand	Philip Kerr	4.22	https://images.gr-assets.com/books/1348841349l/7640922.jpg
141	The Boy on the Wooden Box	Leon Leyson	4.34	https://images.gr-assets.com/books/1403392857l/17415480.jpg
142	The Absolute Sandman, Volume One	Neil Gaiman	4.65	https://images.gr-assets.com/books/1312226853l/23753.jpg
143	Harold and the Purple Crayon	Crockett Johnson	4.24	https://images.gr-assets.com/books/1327390957l/98573.jpg
144	Hopscotch	Julio Cortázar	4.25	https://images.gr-assets.com/books/1367728486l/53413.jpg
145	The Blue Castle	L.M. Montgomery	4.23	https://images.gr-assets.com/books/1442108651l/95693.jpg
146	The Lightning Thief	Rick Riordan	4.23	https://images.gr-assets.com/books/1388262641l/6676603.jpg
147	Good Night, Mr. Tom	Michelle Magorian	4.28	https://images.gr-assets.com/books/1282757902l/161099.jpg
148	Yotsuba&!, Vol. 01	Kiyohiko Azuma	4.34	https://images.gr-assets.com/books/1284943754l/511240.jpg
149	Smiley's People	John le Carré	4.24	https://images.gr-assets.com/books/1348407722l/18999.jpg
150	When Christ and His Saints Slept	Sharon Kay Penman	4.27	https://images.gr-assets.com/books/1333577582l/43841.jpg
151	The Complete Poems of Emily Dickinson	Emily Dickinson	4.21	https://images.gr-assets.com/books/1341783054l/1183392.jpg
152	Battle Cry of Freedom	James M. McPherson	4.32	https://images.gr-assets.com/books/1388185755l/35100.jpg
153	A Scandal in Bohemia	Ronald Holt	4.22	https://images.gr-assets.com/books/1189170223l/1848444.jpg
154	The Complete Stories	Flannery O'Connor	4.44	https://images.gr-assets.com/books/1489956381l/284996.jpg
155	James Herriot's Cat Stories	James Herriot	4.3	https://images.gr-assets.com/books/1169178317l/38740.jpg
156	The Long Goodbye	Raymond Chandler	4.22	https://images.gr-assets.com/books/1388225584l/2054.jpg
157	Obsidian	Jennifer L. Armentrout	4.23	https://images.gr-assets.com/books/1328275091l/12578077.jpg
158	Death Note, Vol. 1: Boredom	Tsugumi Ohba	4.42	https://images.gr-assets.com/books/1419952134l/13615.jpg
159	Noughts & Crosses	Malorie Blackman	4.23	https://images.gr-assets.com/books/1443903273l/714902.jpg
160	Our Bodies, Ourselves for the New Century	Boston Women's Health Book Collective	4.34	https://images.gr-assets.com/books/1392953859l/97869.jpg
161	Lamb: The Gospel According to Biff, Christ's Childhood Pal	Christopher Moore	4.26	https://images.gr-assets.com/books/1331419009l/28881.jpg
162	Wonder	R.J. Palacio	4.43	https://images.gr-assets.com/books/1309285027l/11387515.jpg
163	The Brothers Lionheart	Astrid Lindgren	4.35	https://images.gr-assets.com/books/1388269738l/19312.jpg
164	Corduroy	Don Freeman	4.28	https://images.gr-assets.com/books/1347517273l/231850.jpg
165	Another Country	James     Baldwin	4.3	https://images.gr-assets.com/books/1353255131l/38474.jpg
166	Reaper Man	Terry Pratchett	4.27	https://images.gr-assets.com/books/1473122828l/833424.jpg
167	The Martian	Andy Weir	4.39	https://images.gr-assets.com/books/1413706054l/18007564.jpg
168	On Writing: A Memoir of the Craft	Stephen King	4.31	https://images.gr-assets.com/books/1436735207l/10569.jpg
169	Gates of Fire: An Epic Novel of the Battle of Thermopylae	Steven Pressfield	4.4	https://images.gr-assets.com/books/1386924869l/1305.jpg
170	The Invention of Hugo Cabret	Brian Selznick	4.23	https://images.gr-assets.com/books/1422312376l/9673436.jpg
171	A Light in the Attic	Shel Silverstein	4.34	https://images.gr-assets.com/books/1427169918l/30118.jpg
172	Roadside Picnic	Arkady Strugatsky	4.21	https://images.gr-assets.com/books/1173812259l/331256.jpg
173	My Family and Other Animals	Gerald Durrell	4.27	https://images.gr-assets.com/books/1327885239l/48132.jpg
174	Nothing to Envy: Ordinary Lives in North Korea	Barbara Demick	4.43	https://images.gr-assets.com/books/1320449375l/6178648.jpg
175	Stoner	John  Williams	4.28	https://images.gr-assets.com/books/1320600716l/166997.jpg
176	The Lord God Made Them All	James Herriot	4.39	https://images.gr-assets.com/books/1426128187l/23014868.jpg
177	Frankenstein Makes a Sandwich	Adam Rex	4.23	https://images.gr-assets.com/books/1285597645l/18486.jpg
178	Gödel, Escher, Bach: An Eternal Golden Braid	Douglas R. Hofstadter	4.3	https://images.gr-assets.com/books/1428732588l/24113.jpg
179	The Demon-Haunted World: Science as a Candle in the Dark	Carl Sagan	4.27	https://images.gr-assets.com/books/1405201597l/17349.jpg
180	The Blue Sword	Robin McKinley	4.24	https://images.gr-assets.com/books/1286927812l/407813.jpg
181	The Final Empire	Brandon Sanderson	4.43	https://images.gr-assets.com/books/1480717416l/68428.jpg
182	The Snowman	Raymond Briggs	4.28	https://images.gr-assets.com/books/1355497688l/489972.jpg
183	A Monster Calls	Patrick Ness	4.37	https://images.gr-assets.com/books/1485991317l/8621462.jpg
184	A Tale of Love and Darkness	Amos Oz	4.2	https://images.gr-assets.com/books/1429313277l/27574.jpg
185	Thoughts in Solitude	Thomas Merton	4.23	https://images.gr-assets.com/books/1312005708l/173384.jpg
186	Mornings in Jenin	Susan Abulhawa	4.35	https://images.gr-assets.com/books/1312020216l/6692041.jpg
187	Falling Upward: A Spirituality for the Two Halves of Life	Richard Rohr	4.24	https://images.gr-assets.com/books/1334508666l/9963483.jpg
188	The Demon King	Cinda Williams Chima	4.2	https://images.gr-assets.com/books/1379482652l/6342491.jpg
189	The Tale of Tsar Saltan	Alexander Pushkin	4.22	https://images.gr-assets.com/books/1387727745l/111750.jpg
190	Chasing the Scream: The First and Last Days of the War on Drugs	Johann Hari	4.49	https://images.gr-assets.com/books/1416448118l/22245552.jpg
191	The Spider and the Fly	Mary Howitt	4.2	https://images.gr-assets.com/books/1347802291l/601598.jpg
192	Contemplative Prayer	Thomas Merton	4.23	https://images.gr-assets.com/books/1359986111l/351723.jpg
193	The Clown of God	Tomie dePaola	4.21	https://images.gr-assets.com/books/1388500530l/69086.jpg
194	Cinderella	Kinuko Y. Craft	4.28	https://images.gr-assets.com/books/1330364542l/670717.jpg
195	Evicted: Poverty and Profit in the American City	Matthew Desmond	4.47	https://images.gr-assets.com/books/1453060710l/25852784.jpg
196	Zen Flesh, Zen Bones: A Collection of Zen and Pre-Zen Writings	Paul Reps	4.24	https://images.gr-assets.com/books/1364139107l/870160.jpg
197	Holy the Firm	Annie Dillard	4.22	https://images.gr-assets.com/books/1410132219l/7695.jpg
198	Hippos Go Berserk!	Sandra Boynton	4.29	https://images.gr-assets.com/books/1348176620l/815985.jpg
199	Superman: Secret Identity	Kurt Busiek	4.22	https://images.gr-assets.com/books/1388516637l/26088.jpg
200	Wave	Suzy Lee	4.23	https://images.gr-assets.com/books/1348990473l/3171606.jpg
201	Reaching Out: The Three Movements of the Spiritual Life	Henri J.M. Nouwen	4.28	https://images.gr-assets.com/books/1329306723l/247526.jpg
202	The Darkest Minds	Alexandra Bracken	4.25	https://images.gr-assets.com/books/1343178841l/10576365.jpg
203	Traveling Light: Releasing the Burdens You Were Never Intended to Bear	Max Lucado	4.23	https://images.gr-assets.com/books/1408113465l/56636.jpg
204	Jim Button and Luke the Engine Driver	Michael Ende	4.25	https://images.gr-assets.com/books/1340715218l/187583.jpg
205	I Thought It Was Just Me: Women Reclaiming Power and Courage in a Culture of Shame	Brené Brown	4.22	https://images.gr-assets.com/books/1442025925l/279308.jpg
206	Animalia	Graeme Base	4.28	https://images.gr-assets.com/books/1344705263l/682751.jpg
207	The Man Who Planted Trees	Jean Giono	4.23	https://images.gr-assets.com/books/1320556166l/757438.jpg
208	I Am Pilgrim	Terry Hayes	4.23	https://images.gr-assets.com/books/1437370199l/24885648.jpg
209	Bill Peet: An Autobiography	Bill Peet	4.23	https://images.gr-assets.com/books/1349075142l/134097.jpg
210	Tears of the Desert: A Memoir of Survival in Darfur	Halima Bashir	4.21	https://images.gr-assets.com/books/1320412518l/3170677.jpg
211	The Farthest-Away Mountain	Lynne Reid Banks	4.21	https://images.gr-assets.com/books/1388264588l/225092.jpg
212	Ish	Peter H. Reynolds	4.33	https://images.gr-assets.com/books/1320534668l/765654.jpg
213	The Thorn Birds	Colleen McCullough	4.22	https://images.gr-assets.com/books/1391416796l/3412.jpg
214	The Marriage of Heaven and Hell	William Blake	4.25	https://images.gr-assets.com/books/1390215814l/23913.jpg
215	Peaceful Parent, Happy Kids: How to Stop Yelling and Start Connecting	Laura Markham	4.26	https://images.gr-assets.com/books/1355821687l/13542640.jpg
216	Shrill: Notes from a Loud Woman	Lindy West	4.23	https://images.gr-assets.com/books/1460015959l/29340182.jpg
217	Beautiful Joe	Marshall Saunders	4.2	https://images.gr-assets.com/books/1347322626l/519125.jpg
218	Mandy	Julie Andrews Edwards	4.23	https://images.gr-assets.com/books/1389123997l/10332.jpg
219	Americanah	Chimamanda Ngozi Adichie	4.26	https://images.gr-assets.com/books/1356654499l/15796700.jpg
220	Correction	Thomas Bernhard	4.26	https://images.gr-assets.com/books/1331500127l/92573.jpg
221	Orthodoxy	G.K. Chesterton	4.23	https://images.gr-assets.com/books/1348323220l/87665.jpg
222	God's Smuggler	Brother Andrew	4.32	https://images.gr-assets.com/books/1347829238l/824062.jpg
223	The C Programming Language	Brian W. Kernighan	4.4	https://images.gr-assets.com/books/1391032531l/515601.jpg
224	Tales From Outer Suburbia	Shaun Tan	4.33	https://images.gr-assets.com/books/1500220943l/6353446.jpg
225	The Sense and Sensibility Screenplay and Diaries: Bringing Jane Austen's Novel to Film	Emma Thompson	4.38	https://images.gr-assets.com/books/1168969487l/37557.jpg
226	Lady Knight	Tamora Pierce	4.3	https://images.gr-assets.com/books/1215394344l/153800.jpg
227	Calvin and Hobbes	Bill Watterson	4.61	https://images.gr-assets.com/books/1441227694l/77727.jpg
228	Story: Substance, Structure, Style, and the Principles of Screenwriting	Robert McKee	4.23	https://images.gr-assets.com/books/1388176882l/48654.jpg
229	Ouran High School Host Club, Vol. 1	Bisco Hatori	4.36	https://images.gr-assets.com/books/1388328993l/1087204.jpg
230	Oscar Wilde	Richard Ellmann	4.23	https://images.gr-assets.com/books/1403166460l/5294.jpg
231	Tiny Beautiful Things: Advice on Love and Life from Dear Sugar	Cheryl Strayed	4.29	https://images.gr-assets.com/books/1339807006l/13152194.jpg
232	Humans of New York	Brandon Stanton	4.5	https://images.gr-assets.com/books/1384184910l/17287009.jpg
233	The Death and Life of Great American Cities	Jane Jacobs	4.31	https://images.gr-assets.com/books/1320552086l/10864623.jpg
234	Just Another Kid	Torey L. Hayden	4.23	https://images.gr-assets.com/books/1256578289l/76431.jpg
235	Fruits Basket, Vol. 1	Natsuki Takaya	4.23	https://images.gr-assets.com/books/1442161482l/271199.jpg
236	Do They Hear You When You Cry	Fauziya Kassindja	4.23	https://images.gr-assets.com/books/1320459052l/457841.jpg
237	Philosophical Investigations	Ludwig Wittgenstein	4.23	https://images.gr-assets.com/books/1440047548l/12073.jpg
238	The Feynman Lectures on Physics	Richard Feynman	4.59	https://images.gr-assets.com/books/1433168047l/5546.jpg
239	Dangerous Visions	Harlan Ellison	4.2	https://images.gr-assets.com/books/1176167292l/600349.jpg
240	Letters from the Earth: Uncensored Writings	Mark Twain	4.22	https://images.gr-assets.com/books/1410132027l/37813.jpg
241	The Everlasting Man	G.K. Chesterton	4.23	https://images.gr-assets.com/books/1347815537l/112760.jpg
242	Nausicaä of the Valley of the Wind, Vol. 1	Hayao Miyazaki	4.45	https://images.gr-assets.com/books/1371733892l/626339.jpg
243	The Lies of Locke Lamora	Scott Lynch	4.3	https://images.gr-assets.com/books/1386924569l/127455.jpg
244	The Bridge on the Drina	Ivo Andrić	4.32	https://images.gr-assets.com/books/1391505254l/3140.jpg
245	The Warrior's Apprentice	Lois McMaster Bujold	4.29	https://images.gr-assets.com/books/1170597854l/61906.jpg
246	Clockwork Angel	Cassandra Clare	4.33	https://images.gr-assets.com/books/1454962884l/7171637.jpg
247	The Velvet Room	Zilpha Keatley Snyder	4.24	https://images.gr-assets.com/books/1280242648l/81010.jpg
248	The Glass Castle	Jeannette Walls	4.24	https://images.gr-assets.com/books/1400930557l/7445.jpg
249	Everything That Rises Must Converge: Stories	Flannery O'Connor	4.27	https://images.gr-assets.com/books/1412859621l/218659.jpg
250	The Arrival	Shaun Tan	4.33	https://images.gr-assets.com/books/1312827620l/920607.jpg
251	Peter the Great: His Life and World	Robert K. Massie	4.22	https://images.gr-assets.com/books/1171992814l/130363.jpg
252	Saga, Vol. 1	Brian K. Vaughan	4.25	https://images.gr-assets.com/books/1486028947l/15704307.jpg
253	Columbine	Dave Cullen	4.26	https://images.gr-assets.com/books/1442939134l/5632446.jpg
254	Half of a Yellow Sun	Chimamanda Ngozi Adichie	4.28	https://images.gr-assets.com/books/1327934717l/18749.jpg
255	Go the Fuck to Sleep	Adam Mansbach	4.26	https://images.gr-assets.com/books/1342861907l/11192642.jpg
256	Wool Omnibus	Hugh Howey	4.24	https://images.gr-assets.com/books/1349614200l/13453029.jpg
257	The Tibetan Book of Living and Dying	Sogyal Rinpoche	4.21	https://images.gr-assets.com/books/1440341532l/206731.jpg
258	A Man Called Ove	Fredrik Backman	4.35	https://images.gr-assets.com/books/1478185565l/23214019.jpg
259	Fire and Flight	Wendy Pini	4.39	https://images.gr-assets.com/books/1327993734l/98019.jpg
260	The Last Lecture	Randy Pausch	4.25	https://images.gr-assets.com/books/1388075896l/2318271.jpg
261	The Green Mile	Stephen King	4.42	https://images.gr-assets.com/books/1373903563l/11566.jpg
262	The Complete Poems and Plays, 1909-1950	T.S. Eliot	4.33	https://images.gr-assets.com/books/1388198313l/79936.jpg
263	The Lion in Winter	James Goldman	4.22	https://images.gr-assets.com/books/1388462019l/279660.jpg
264	Life and Fate	Vasily Grossman	4.43	https://images.gr-assets.com/books/1320447178l/88432.jpg
265	The Complete Short Stories	Ernest Hemingway	4.28	https://images.gr-assets.com/books/1441700461l/4625.jpg
266	The Hobbit	J.R.R. Tolkien	4.25	https://images.gr-assets.com/books/1372847500l/5907.jpg
267	And the Band Played On: Politics, People, and the AIDS Epidemic	Randy Shilts	4.37	https://images.gr-assets.com/books/1386924077l/28212.jpg
268	Fullmetal Alchemist, Vol. 1	Hiromu Arakawa	4.49	https://images.gr-assets.com/books/1388179331l/870.jpg
269	Batman: The Killing Joke	Alan Moore	4.36	https://images.gr-assets.com/books/1346331835l/96358.jpg
270	Now We Are Six	A.A. Milne	4.37	https://images.gr-assets.com/books/1348199373l/821000.jpg
271	Oh, The Places You'll Go!	Dr. Seuss	4.34	https://images.gr-assets.com/books/1421708635l/191139.jpg
272	Love You Forever	Robert Munsch	4.34	https://images.gr-assets.com/books/1348832754l/310259.jpg
273	The True Story of the 3 Little Pigs	Jon Scieszka	4.29	https://images.gr-assets.com/books/1327884731l/125507.jpg
274	Still Alice	Lisa Genova	4.3	https://images.gr-assets.com/books/1236089972l/2153405.jpg
275	Here be Dragons	Sharon Kay Penman	4.3	https://images.gr-assets.com/books/1448657042l/77449.jpg
276	Akira, Vol. 1	Katsuhiro Otomo	4.36	https://images.gr-assets.com/books/1343804802l/93371.jpg
277	Harry Potter and the Order of the Phoenix	J.K. Rowling	4.46	https://images.gr-assets.com/books/1387141547l/2.jpg
278	If This Is a Man / The Truce	Primo Levi	4.54	https://images.gr-assets.com/books/1352245530l/6181.jpg
279	Full Catastrophe Living: Using the Wisdom of Your Body and Mind to Face Stress, Pain, and Illness	Jon Kabat-Zinn	4.21	https://images.gr-assets.com/books/1441601293l/589455.jpg
280	The Girl Who Played with Fire	Stieg Larsson	4.22	https://images.gr-assets.com/books/1351778881l/5060378.jpg
281	A Prayer for Owen Meany	John Irving	4.22	https://images.gr-assets.com/books/1260470010l/4473.jpg
282	Infinite Jest	David Foster Wallace	4.31	https://images.gr-assets.com/books/1446876799l/6759.jpg
283	Sector 7	David Wiesner	4.21	https://images.gr-assets.com/books/1406949029l/29313.jpg
284	A Path with Heart: A Guide Through the Perils and Promises of Spiritual Life	Jack Kornfield	4.26	https://images.gr-assets.com/books/1347674650l/143675.jpg
285	Hunter x Hunter, Vol. 01	Yoshihiro Togashi	4.43	https://images.gr-assets.com/books/1390785735l/1493253.jpg
286	The Rings of Saturn	W.G. Sebald	4.26	https://images.gr-assets.com/books/1486138112l/434903.jpg
287	The Gashlycrumb Tinies	Edward Gorey	4.22	https://images.gr-assets.com/books/1327933644l/47558.jpg
288	The 13½ Lives of Captain Bluebear	Walter Moers	4.2	https://images.gr-assets.com/books/1388176963l/62032.jpg
289	Surprised by Hope: Rethinking Heaven, the Resurrection, and the Mission of the Church	N.T. Wright	4.31	https://images.gr-assets.com/books/1347624226l/2319645.jpg
290	The Boy Who Was Raised as a Dog: And Other Stories from a Child Psychiatrist's Notebook	Bruce D. Perry	4.49	https://images.gr-assets.com/books/1387708713l/129909.jpg
291	The Unwanted: A Memoir of Childhood	Kien Nguyen	4.26	https://images.gr-assets.com/books/1344271451l/281755.jpg
292	The Magic School Bus Sees Stars: A Book About Stars	Joanna Cole	4.4	https://images.gr-assets.com/books/1360057847l/110963.jpg
293	The Way of the Heart: The Spirituality of the Desert Fathers and Mothers	Henri J.M. Nouwen	4.31	https://images.gr-assets.com/books/1347951626l/210929.jpg
294	The Miraculous Journey of Edward Tulane	Kate DiCamillo	4.34	https://images.gr-assets.com/books/1361121815l/37186.jpg
295	Telling the Truth: The Gospel as Tragedy, Comedy, and Fairy Tale	Frederick Buechner	4.32	https://images.gr-assets.com/books/1388184594l/76808.jpg
296	A Grief Observed	C.S. Lewis	4.26	https://images.gr-assets.com/books/1412529325l/49221.jpg
297	Selected Poems	Pablo Neruda	4.39	https://images.gr-assets.com/books/1327999613l/1547992.jpg
298	Billy And Blaze: A Boy And His Pony	C.W. Anderson	4.22	https://images.gr-assets.com/books/1348455939l/109881.jpg
299	On the Shortness of Life	Seneca	4.24	https://images.gr-assets.com/books/1448623089l/97412.jpg
300	When the Air Hits Your Brain: Tales of Neurosurgery	Frank T. Vertosick Jr.	4.25	https://images.gr-assets.com/books/1223641889l/193749.jpg
301	The Prodigal God: Recovering the Heart of the Christian Faith	Timothy J. Keller	4.39	https://images.gr-assets.com/books/1427212055l/3116205.jpg
302	The Doubtful Guest	Edward Gorey	4.42	https://images.gr-assets.com/books/1302128820l/205981.jpg
303	The Crimson Spell, Volume 1	Ayano Yamane	4.3	https://images.gr-assets.com/books/1347466141l/1433826.jpg
304	Harris and Me	Gary Paulsen	4.19	https://images.gr-assets.com/books/1328876043l/570633.jpg
305	The Magic School Bus Makes a Rainbow: A Book About Color	Joanna Cole	4.37	https://images.gr-assets.com/books/1386923137l/64133.jpg
306	Far from the Tree: Parents, Children, and the Search for Identity	Andrew Solomon	4.27	https://images.gr-assets.com/books/1363008433l/13547504.jpg
307	Hershel and the Hanukkah Goblins	Eric A. Kimmel	4.26	https://images.gr-assets.com/books/1347514507l/496802.jpg
308	Hetalia: Axis Powers, Vol. 1	Hidekaz Himaruya	4.35	https://images.gr-assets.com/books/1388335318l/7942008.jpg
309	City of Lost Souls	Cassandra Clare	4.3	https://images.gr-assets.com/books/1460477703l/8755776.jpg
310	The Digging-est Dog	Al Perkins	4.21	https://images.gr-assets.com/books/1388253700l/1215867.jpg
311	Illuminations: Essays and Reflections	Walter Benjamin	4.3	https://images.gr-assets.com/books/1363201757l/2725.jpg
312	The Far Side Gallery	Gary Larson	4.42	https://images.gr-assets.com/books/1386923919l/77281.jpg
313	A Writer's Diary	Virginia Woolf	4.24	https://images.gr-assets.com/books/1388907338l/14948.jpg
314	The Coincidence of Callie & Kayden	Jessica Sorensen	4.2	https://images.gr-assets.com/books/1353550763l/16113791.jpg
315	The Magic School Bus Blows Its Top: A Book About Volcanoes	Joanna Cole	4.34	https://images.gr-assets.com/books/1360057584l/110970.jpg
316	The Magic School Bus Inside Ralphie: A Book About Germs	Joanna Cole	4.38	https://images.gr-assets.com/books/1412725901l/110966.jpg
317	Working: People Talk About What They Do All Day and How They Feel About What They Do	Studs Terkel	4.21	https://images.gr-assets.com/books/1388210645l/59649.jpg
318	Naruto, Vol. 01: The Tests of the Ninja	Masashi Kishimoto	4.35	https://images.gr-assets.com/books/1435524806l/204042.jpg
319	The Power of One	Bryce Courtenay	4.34	https://images.gr-assets.com/books/1388184360l/122.jpg
320	The Sea of Tranquility	Katja Millay	4.34	https://images.gr-assets.com/books/1465919812l/16151178.jpg
321	Slammed	Colleen Hoover	4.29	https://images.gr-assets.com/books/1328530463l/13372690.jpg
322	Homeland	R.A. Salvatore	4.27	https://images.gr-assets.com/books/1442783088l/317547.jpg
323	Sculpting in Time	Andrei Tarkovsky	4.51	https://images.gr-assets.com/books/1439000250l/28495.jpg
324	Nonviolent Communication: A Language of Life	Marshall B. Rosenberg	4.31	https://images.gr-assets.com/books/1386925124l/71730.jpg
325	The Book of Night Women	Marlon James	4.32	https://images.gr-assets.com/books/1442717381l/4682558.jpg
326	City of Thieves	David Benioff	4.28	https://images.gr-assets.com/books/1392015757l/1971304.jpg
327	A Little Life	Hanya Yanagihara	4.27	https://images.gr-assets.com/books/1446469353l/22822858.jpg
328	The Sneetches and Other Stories	Dr. Seuss	4.31	https://images.gr-assets.com/books/1389388191l/105549.jpg
329	Footnotes in Gaza	Joe Sacco	4.27	https://images.gr-assets.com/books/1327888249l/6796708.jpg
330	Harry Potter and the Deathly Hallows	J.K. Rowling	4.61	https://images.gr-assets.com/books/1474171184l/136251.jpg
331	Miss Rumphius	Barbara Cooney	4.45	https://images.gr-assets.com/books/1281468926l/334818.jpg
332	Good Night, Little Bear	Patricia M. Scarry	4.26	https://images.gr-assets.com/books/1320442186l/310043.jpg
333	Manufacturing Consent: The Political Economy of the Mass Media	Noam Chomsky	4.22	https://images.gr-assets.com/books/1222383663l/12617.jpg
334	Hellsing, Vol. 01	Kohta Hirano	4.28	https://images.gr-assets.com/books/1403205185l/74928.jpg
335	The Complete Persepolis	Marjane Satrapi	4.36	https://images.gr-assets.com/books/1327876995l/991197.jpg
336	Conversation in the Cathedral	Mario Vargas Llosa	4.32	https://images.gr-assets.com/books/1410128964l/53970.jpg
337	Something Under the Bed is Drooling: A Calvin and Hobbes Collection	Bill Watterson	4.7	https://images.gr-assets.com/books/1384735602l/70490.jpg
338	Uzumaki, Vol. 1	Junji Ito	4.29	https://images.gr-assets.com/books/1389137178l/25152.jpg
339	Daughter of the Forest	Juliet Marillier	4.28	https://images.gr-assets.com/books/1476579547l/9917310.jpg
452	I Want My Hat Back	Jon Klassen	4.39	https://images.gr-assets.com/books/1327888784l/11233988.jpg
340	Bloom County Babylon: Five Years of Basic Naughtiness	Berkeley Breathed	4.38	https://images.gr-assets.com/books/1347862743l/111651.jpg
341	Out of My Mind	Sharon M. Draper	4.37	https://images.gr-assets.com/books/1347602096l/6609765.jpg
342	The Portable Dorothy Parker	Dorothy Parker	4.34	https://images.gr-assets.com/books/1386926061l/46231.jpg
343	Lord Peter	Dorothy L. Sayers	4.29	https://images.gr-assets.com/books/1388251441l/782047.jpg
344	The Hat	Jan Brett	4.25	https://images.gr-assets.com/books/1172603741l/196951.jpg
345	The Source	James A. Michener	4.3	https://images.gr-assets.com/books/1382031774l/1062021.jpg
346	The BFG	Roald Dahl	4.22	https://images.gr-assets.com/books/1317793284l/527786.jpg
347	Sobre héroes y tumbas	Ernesto Sabato	4.27	https://images.gr-assets.com/books/1322161433l/1677.jpg
348	The Cyberiad	Stanisław Lem	4.2	https://images.gr-assets.com/books/1166889908l/18194.jpg
349	The Walking Dead, Vol. 01: Days Gone Bye	Robert Kirkman	4.3	https://images.gr-assets.com/books/1389233242l/138398.jpg
350	Long Time Gone	S.E. Jakes	4.19	https://images.gr-assets.com/books/1378452000l/17936957.jpg
351	The Case of Charles Dexter Ward	H.P. Lovecraft	4.2	https://images.gr-assets.com/books/1226709757l/5665964.jpg
352	All Things Bright and Beautiful	James Herriot	4.3	https://images.gr-assets.com/books/1388197805l/38743.jpg
353	The Indispensable Calvin and Hobbes	Bill Watterson	4.73	https://images.gr-assets.com/books/1347311516l/24815.jpg
354	Deep and Dark and Dangerous (A Ghost Story)	Mary Downing Hahn	4.22	https://images.gr-assets.com/books/1348351238l/541341.jpg
355	PLUTO: Naoki Urasawa x Ozamu Tezuka, Band 001	Naoki Urasawa	4.34	https://images.gr-assets.com/books/1187433885l/1725523.jpg
356	Diving Into the Wreck	Adrienne Rich	4.22	https://images.gr-assets.com/books/1340806085l/130810.jpg
357	Demons	Fyodor Dostoyevsky	4.26	https://images.gr-assets.com/books/1386958613l/5695.jpg
358	Turning Pro	Steven Pressfield	4.22	https://images.gr-assets.com/books/1339000038l/14912777.jpg
359	Merry Christmas, Mom and Dad	Mercer Mayer	4.31	https://images.gr-assets.com/books/1320459071l/995907.jpg
360	All My Friends Are Dead	Avery Monsen	4.23	https://images.gr-assets.com/books/1330386466l/8044557.jpg
361	Baby Catcher: Chronicles of a Modern Midwife	Peggy Vincent	4.33	https://images.gr-assets.com/books/1349005193l/128154.jpg
362	Surprised by Oxford	Carolyn Weber	4.21	https://images.gr-assets.com/books/1388184922l/9923943.jpg
363	Pedagogy of the Oppressed	Paulo Freire	4.25	https://images.gr-assets.com/books/1388180018l/72657.jpg
364	On Writing Well: The Classic Guide to Writing Nonfiction	William Zinsser	4.24	https://images.gr-assets.com/books/1388195616l/53343.jpg
365	Lad: A Dog	Albert Payson Terhune	4.24	https://images.gr-assets.com/books/1170818244l/72707.jpg
366	The Emperor of All Maladies: A Biography of Cancer	Siddhartha Mukherjee	4.29	https://images.gr-assets.com/books/1421828651l/9299686.jpg
367	Blue Exorcist, Vol. 1	Kazue Kato	4.36	https://images.gr-assets.com/books/1432642113l/9876989.jpg
368	An American Life	Ronald Reagan	4.25	https://images.gr-assets.com/books/1388970946l/5238.jpg
369	Bittersweet: Thoughts on Change, Grace, and Learning the Hard Way	Shauna Niequist	4.22	https://images.gr-assets.com/books/1355086346l/8872336.jpg
370	Kristin Lavransdatter	Sigrid Undset	4.28	https://images.gr-assets.com/books/1388289230l/6217.jpg
371	The Invention of Wings	Sue Monk Kidd	4.23	https://images.gr-assets.com/books/1386699861l/18079776.jpg
372	When I Get Bigger	Mercer Mayer	4.27	https://images.gr-assets.com/books/1349020409l/953584.jpg
373	Little Princes: One Man's Promise to Bring Home the Lost Children of Nepal	Conor Grennan	4.25	https://images.gr-assets.com/books/1279553857l/8564644.jpg
374	Claudius the God	Robert Graves	4.23	https://images.gr-assets.com/books/1304278835l/11265538.jpg
375	Discipline and Punish: The Birth of the Prison	Michel Foucault	4.21	https://images.gr-assets.com/books/1321136029l/119552.jpg
376	Modern Times: The World from the Twenties to the Nineties	Paul  Johnson	4.26	https://images.gr-assets.com/books/1387735243l/55304.jpg
377	The Right Stuff	Tom Wolfe	4.23	https://images.gr-assets.com/books/1393654700l/586472.jpg
378	The Pianist: The Extraordinary Story of One Man's Survival in Warsaw, 1939–45	Władysław Szpilman	4.24	https://images.gr-assets.com/books/1491050715l/128066.jpg
379	Elon Musk: Inventing the Future	Ashlee Vance	4.25	https://images.gr-assets.com/books/1404411386l/22543496.jpg
380	A Path Appears: Transforming Lives, Creating Opportunity	Nicholas D. Kristof	4.21	https://images.gr-assets.com/books/1405295272l/20342518.jpg
381	There's a Nightmare in My Closet	Mercer Mayer	4.22	https://images.gr-assets.com/books/1348638074l/760205.jpg
382	The Great Escape	Paul Brickhill	4.24	https://images.gr-assets.com/books/1354746709l/107406.jpg
383	Home Cooking: A Writer in the Kitchen	Laurie Colwin	4.21	https://images.gr-assets.com/books/1460333433l/164397.jpg
384	Saatleri Ayarlama Enstitüsü	Ahmet Hamdi Tanpınar	4.42	https://images.gr-assets.com/books/1377766980l/2040424.jpg
385	The Book of Secrets	Bhagwan Shree Rajneesh	4.37	https://images.gr-assets.com/books/1388296300l/96998.jpg
386	The True Believer: Thoughts on the Nature of Mass Movements	Eric Hoffer	4.23	https://images.gr-assets.com/books/1410129044l/15916.jpg
387	Taking Charge of Your Fertility: The Definitive Guide to Natural Birth Control, Pregnancy Achievement, and Reproductive Health	Toni Weschler	4.49	https://images.gr-assets.com/books/1347636919l/129511.jpg
388	Trauma and Recovery: The Aftermath of Violence - From Domestic Abuse to Political Terror	Judith Lewis Herman	4.29	https://images.gr-assets.com/books/1348664543l/542700.jpg
389	The Great Divorce	C.S. Lewis	4.28	https://images.gr-assets.com/books/1166805741l/17267.jpg
390	Aylak Adam	Yusuf Atılgan	4.34	https://images.gr-assets.com/books/1438007336l/1838912.jpg
391	Lovingkindness: The Revolutionary Art of Happiness	Sharon Salzberg	4.23	https://images.gr-assets.com/books/1320555622l/38215.jpg
392	Joy: The Happiness That Comes from Within	Osho	4.26	https://images.gr-assets.com/books/1316130720l/97013.jpg
393	Pastrix: The Cranky, Beautiful Faith of a Sinner & Saint	Nadia Bolz-Weber	4.33	https://images.gr-assets.com/books/1364922240l/17333440.jpg
394	The Dark Tower	Stephen King	4.27	https://images.gr-assets.com/books/1327411820l/12982158.jpg
395	Curious George Flies a Kite	Margret Rey	4.23	https://images.gr-assets.com/books/1388436651l/190670.jpg
396	Because of Mr. Terupt	Rob Buyea	4.34	https://images.gr-assets.com/books/1320456974l/7783920.jpg
397	What Was I Scared Of?	Dr. Seuss	4.2	https://images.gr-assets.com/books/1328004987l/644346.jpg
398	Radical Acceptance: Embracing Your Life With the Heart of a Buddha	Tara Brach	4.25	https://images.gr-assets.com/books/1320402151l/173666.jpg
399	Puslu Kıtalar Atlası	İhsan Oktay Anar	4.5	https://images.gr-assets.com/books/1403263013l/1546936.jpg
400	Love, Freedom, and Aloneness: The Koan of Relationships	Osho	4.24	https://images.gr-assets.com/books/1312038985l/97008.jpg
401	Stephanie's Ponytail	Robert Munsch	4.26	https://images.gr-assets.com/books/1348256170l/285740.jpg
402	Full Tilt	Emma   Scott	4.53	https://images.gr-assets.com/books/1465387166l/30372977.jpg
403	Kriget har inget kvinnligt ansikte	Svetlana Alexievich	4.52	https://images.gr-assets.com/books/1377582131l/18378187.jpg
404	Trust	Ella Frank	4.39	https://images.gr-assets.com/books/1430824733l/25476020.jpg
405	The Nightingale	Kristin Hannah	4.54	https://images.gr-assets.com/books/1418620849l/23849354.jpg
406	Arch of Triumph: A Novel of a Man Without a Country	Erich Maria Remarque	4.4	https://images.gr-assets.com/books/1353844109l/672948.jpg
407	Kürk Mantolu Madonna	Sabahattin Ali	4.49	https://images.gr-assets.com/books/1362477552l/220826.jpg
408	The Trial of Colonel Sweeto and Other Stories	Nicholas Gurewitch	4.37	https://images.gr-assets.com/books/1387728104l/1022983.jpg
409	A Storm of Swords	George R.R. Martin	4.54	https://images.gr-assets.com/books/1497931121l/62291.jpg
410	They Cage the Animals at Night	Jennings Michael Burch	4.3	https://images.gr-assets.com/books/1388702609l/19412.jpg
411	Night Watch	Terry Pratchett	4.47	https://images.gr-assets.com/books/1320518310l/47989.jpg
412	Tutunamayanlar	Oğuz Atay	4.6	https://images.gr-assets.com/books/1310152220l/758901.jpg
413	Financial Peace Revisited	Dave Ramsey	4.31	https://images.gr-assets.com/books/1309201190l/129565.jpg
414	The Way of Kings	Brandon Sanderson	4.64	https://images.gr-assets.com/books/1507307887l/7235533.jpg
415	The Perks of Being a Wallflower	Stephen Chbosky	4.21	https://images.gr-assets.com/books/1167352178l/22628.jpg
416	Savage Inequalities: Children in America's Schools	Jonathan Kozol	4.23	https://images.gr-assets.com/books/1439920769l/25078.jpg
417	Small Steps: The Year I Got Polio	Peg Kehret	4.41	https://images.gr-assets.com/books/1348218290l/226425.jpg
418	The Monster at the End of this Book	Jon Stone	4.45	https://images.gr-assets.com/books/1388193494l/44186.jpg
419	And Then There Were None	Agatha Christie	4.23	https://images.gr-assets.com/books/1391120695l/16299.jpg
420	Rurouni Kenshin, Vol. 1: Meiji Swordsman Romantic Story	Nobuhiro Watsuki	4.33	https://images.gr-assets.com/books/1388273758l/294963.jpg
421	Transmetropolitan, Vol. 1: Back on the Street	Warren Ellis	4.23	https://images.gr-assets.com/books/1320606005l/22416.jpg
422	First They Killed My Father: A Daughter of Cambodia Remembers	Loung Ung	4.3	https://images.gr-assets.com/books/1407105580l/4373.jpg
423	Dark Lover	J.R. Ward	4.21	https://images.gr-assets.com/books/1429676285l/42899.jpg
424	Bird by Bird: Some Instructions on Writing and Life	Anne Lamott	4.23	https://images.gr-assets.com/books/1394996112l/12543.jpg
425	The Complete Saki	Saki	4.38	https://images.gr-assets.com/books/1173796617l/328813.jpg
426	Growth of the Soil	Knut Hamsun	4.24	https://images.gr-assets.com/books/1420733175l/342049.jpg
427	Fried Green Tomatoes at the Whistle Stop Cafe	Fannie Flagg	4.26	https://images.gr-assets.com/books/1165961740l/9375.jpg
428	Shake Hands with the Devil: The Failure of Humanity in Rwanda	Roméo Dallaire	4.24	https://images.gr-assets.com/books/1438841634l/215758.jpg
429	First Test	Tamora Pierce	4.24	https://images.gr-assets.com/books/1320478357l/153784.jpg
430	20th Century Boys, Band 1	Naoki Urasawa	4.36	https://images.gr-assets.com/books/1344498367l/1308213.jpg
431	The Game of Kings	Dorothy Dunnett	4.22	https://images.gr-assets.com/books/1342486295l/112077.jpg
432	D'Aulaires' Book of Greek Myths	Ingri d'Aulaire	4.4	https://images.gr-assets.com/books/1425703433l/79626.jpg
433	Long Walk to Freedom	Nelson Mandela	4.31	https://images.gr-assets.com/books/1327997342l/318431.jpg
434	Hark! A Vagrant	Kate Beaton	4.27	https://images.gr-assets.com/books/1327877328l/10767466.jpg
435	Ronia, the Robber's Daughter	Astrid Lindgren	4.28	https://images.gr-assets.com/books/1451632787l/19314.jpg
436	A Mango-shaped Space	Wendy Mass	4.22	https://images.gr-assets.com/books/1271857364l/8072645.jpg
437	تلك العتمة الباهرة	Tahar ben Jelloun	4.27	https://images.gr-assets.com/books/1406257006l/3127736.jpg
438	Living Loving and Learning	Leo Buscaglia	4.24	https://images.gr-assets.com/books/1388296962l/225546.jpg
439	Musashi	Eiji Yoshikawa	4.43	https://images.gr-assets.com/books/1327942522l/102030.jpg
440	The Looming Tower: Al-Qaeda and the Road to 9/11	Lawrence Wright	4.38	https://images.gr-assets.com/books/1320471617l/110890.jpg
441	Any Human Heart	William  Boyd	4.26	https://images.gr-assets.com/books/1386912980l/77866.jpg
442	All In	Emma   Scott	4.56	https://images.gr-assets.com/books/1471936454l/29483226.jpg
443	Mara, Daughter of the Nile	Eloise Jarvis McGraw	4.22	https://images.gr-assets.com/books/1299405805l/406186.jpg
444	We Should All Be Feminists	Chimamanda Ngozi Adichie	4.47	https://images.gr-assets.com/books/1493136936l/23602569.jpg
445	The Shearing Gun	Renae Kaye	4.25	https://images.gr-assets.com/books/1408579209l/23004152.jpg
446	The Coldest Winter Ever	Sister Souljah	4.47	https://images.gr-assets.com/books/1347600573l/106393.jpg
447	A Christmas Memory	Truman Capote	4.23	https://images.gr-assets.com/books/1320404365l/9919.jpg
448	Once and Always	Judith McNaught	4.21	https://images.gr-assets.com/books/1426108166l/129620.jpg
449	Swan Song	Robert McCammon	4.28	https://images.gr-assets.com/books/1445981000l/11557.jpg
450	Stone Butch Blues	Leslie Feinberg	4.27	https://images.gr-assets.com/books/1328758827l/139569.jpg
451	Understanding Power: The Indispensable Chomsky	Noam Chomsky	4.39	https://images.gr-assets.com/books/1386924655l/194805.jpg
453	Shahnameh: The Persian Book of Kings	Abolqasem Ferdowsi	4.51	https://images.gr-assets.com/books/1386921438l/157985.jpg
454	Devil in the Grove: Thurgood Marshall, the Groveland Boys, and the Dawn of a New America	Gilbert King	4.31	https://images.gr-assets.com/books/1395000163l/13374868.jpg
455	Stories of Your Life and Others	Ted Chiang	4.27	https://images.gr-assets.com/books/1356138316l/223380.jpg
456	Random Family: Love, Drugs, Trouble, and Coming of Age in the Bronx	Adrian Nicole LeBlanc	4.23	https://images.gr-assets.com/books/1442198039l/385255.jpg
457	Mushishi, Vol. 1	Yuki Urushibara	4.28	https://images.gr-assets.com/books/1320491221l/905756.jpg
458	Creativity: Unleashing the Forces Within	Osho	4.19	https://images.gr-assets.com/books/1316129610l/97007.jpg
459	Epitaph of a Small Winner	Machado de Assis	4.23	https://images.gr-assets.com/books/1312005198l/2183511.jpg
460	Redefining Realness: My Path to Womanhood, Identity, Love  So Much More	Janet Mock	4.3	https://images.gr-assets.com/books/1394991969l/18280706.jpg
461	Freedom in Exile: The Autobiography of the Dalai Lama	Dalai Lama XIV	4.24	https://images.gr-assets.com/books/1407706793l/567720.jpg
462	Jesus of Nazareth: From the Baptism in the Jordan to the Transfiguration	Pope Benedict XVI	4.35	https://images.gr-assets.com/books/1442015549l/82405.jpg
463	The Country Bunny and the Little Gold Shoes	DuBose Heyward	4.31	https://images.gr-assets.com/books/1349091500l/532752.jpg
464	Flow Down Like Silver: Hypatia of Alexandria	Ki Longfellow	4.46	https://images.gr-assets.com/books/1348371147l/6801755.jpg
465	A Woman in Berlin: Eight Weeks in the Conquered City: A Diary	Marta Hillers	4.3	https://images.gr-assets.com/books/1388372490l/1216656.jpg
466	The Last Lion: Winston Spencer Churchill: Visions of Glory 1874-1932	William Manchester	4.43	https://images.gr-assets.com/books/1384736532l/19809.jpg
467	Just Go to Bed	Mercer Mayer	4.22	https://images.gr-assets.com/books/1349015862l/921651.jpg
468	The Magic School Bus Gets Baked in a Cake: A Book About Kitchen Chemistry	Joanna Cole	4.34	https://images.gr-assets.com/books/1377812164l/110952.jpg
469	Blood of Elves	Andrzej Sapkowski	4.23	https://images.gr-assets.com/books/1443278828l/6043781.jpg
470	The Disaster Artist: My Life Inside The Room, the Greatest Bad Movie Ever Made	Greg Sestero	4.4	https://images.gr-assets.com/books/1373346749l/17404078.jpg
471	Torn: Rescuing the Gospel from the Gays-vs.-Christians Debate	Justin Lee	4.3	https://images.gr-assets.com/books/1352435963l/15791142.jpg
472	Kitchen Table Wisdom: Stories That Heal	Rachel Naomi Remen	4.32	https://images.gr-assets.com/books/1387721011l/104533.jpg
473	One Piece, Volume 01: Romance Dawn	Eiichirō Oda	4.42	https://images.gr-assets.com/books/1318523719l/1237398.jpg
474	Just Me and My Puppy	Mercer Mayer	4.26	https://images.gr-assets.com/books/1349011798l/571502.jpg
475	Come as You Are: The Surprising New Science that Will Transform Your Sex Life	Emily Nagoski	4.23	https://images.gr-assets.com/books/1421037685l/22609341.jpg
476	A Color of His Own	Leo Lionni	4.25	https://images.gr-assets.com/books/1386924526l/225545.jpg
477	The Thurber Carnival	James Thurber	4.25	https://images.gr-assets.com/books/1347800168l/72996.jpg
478	Fish in a Tree	Lynda Mullaly Hunt	4.28	https://images.gr-assets.com/books/1403181554l/22402972.jpg
479	Oath of Gold	Elizabeth Moon	4.25	https://images.gr-assets.com/books/1389988874l/17316.jpg
480	The Last of the Really Great Whangdoodles	Julie Andrews Edwards	4.25	https://images.gr-assets.com/books/1361475969l/10336.jpg
481	My Soul to Keep	Tananarive Due	4.21	https://images.gr-assets.com/books/1442327468l/41536.jpg
482	Born to Run: A Hidden Tribe, Superathletes, and the Greatest Race the World Has Never Seen	Christopher McDougall	4.27	https://images.gr-assets.com/books/1320531983l/6289283.jpg
483	Autobiography of a Yogi	Paramahansa Yogananda	4.22	https://images.gr-assets.com/books/1347427162l/639864.jpg
484	Freedom: The Courage to Be Yourself	Osho	4.22	https://images.gr-assets.com/books/1316130376l/97015.jpg
485	Warbreaker	Brandon Sanderson	4.22	https://images.gr-assets.com/books/1240256182l/1268479.jpg
486	For the Life of the World: Sacraments and Orthodoxy	Alexander Schmemann	4.38	https://images.gr-assets.com/books/1276195660l/271634.jpg
487	Aristotle and Dante Discover the Secrets of the Universe	Benjamin Alire Sáenz	4.34	https://images.gr-assets.com/books/1328320260l/12000020.jpg
488	A Night in the Lonesome October	Roger Zelazny	4.22	https://images.gr-assets.com/books/1274492048l/62005.jpg
489	Planetary, Volume 1: All Over the World and Other Stories	Warren Ellis	4.21	https://images.gr-assets.com/books/1374683466l/209966.jpg
490	Necessary Lies	Diane Chamberlain	4.22	https://images.gr-assets.com/books/1362226103l/17286747.jpg
491	Wild Seed	Octavia E. Butler	4.22	https://images.gr-assets.com/books/1388462753l/52318.jpg
492	Walking on Water: Reflections on Faith and Art	Madeleine L'Engle	4.33	https://images.gr-assets.com/books/1320404692l/136814.jpg
493	Bread and Jam for Frances	Russell Hoban	4.2	https://images.gr-assets.com/books/1384258893l/911579.jpg
494	Her Smoke Rose Up Forever	James Tiptree Jr.	4.22	https://images.gr-assets.com/books/1395145994l/27059.jpg
495	The Caine Mutiny	Herman Wouk	4.23	https://images.gr-assets.com/books/1410224968l/368772.jpg
496	Why Does He Do That?: Inside the Minds of Angry and Controlling Men	Lundy Bancroft	4.47	https://images.gr-assets.com/books/1479651155l/224552.jpg
497	Falling Up	Shel Silverstein	4.33	https://images.gr-assets.com/books/1327871908l/30120.jpg
498	The Dot	Peter H. Reynolds	4.24	https://images.gr-assets.com/books/1363702319l/825377.jpg
499	Phantom	Susan  Kay	4.34	https://images.gr-assets.com/books/1390117001l/190507.jpg
500	The Star Diaries: Further Reminiscences of Ijon Tichy	Stanisław Lem	4.28	https://images.gr-assets.com/books/1388330167l/889418.jpg
501	We Wish to Inform You That Tomorrow We Will Be Killed with Our Families	Philip Gourevitch	4.29	https://images.gr-assets.com/books/1442723264l/11472.jpg
502	Family	J. California Cooper	4.4	https://images.gr-assets.com/books/1320473618l/89137.jpg
503	Black Butler, Vol. 1	Yana Toboso	4.37	https://images.gr-assets.com/books/1336691148l/6690979.jpg
504	Mere Christianity	C.S. Lewis	4.31	https://images.gr-assets.com/books/1468102872l/11138.jpg
505	Somebody Else's Kids	Torey L. Hayden	4.26	https://images.gr-assets.com/books/1375876983l/106027.jpg
506	I Am a Bunny	Ole Risom	4.32	https://images.gr-assets.com/books/1320430727l/328439.jpg
507	Wild Swans: Three Daughters of China	Jung Chang	4.23	https://images.gr-assets.com/books/1440643710l/1848.jpg
508	Throne of Glass	Sarah J. Maas	4.23	https://images.gr-assets.com/books/1495278054l/7896527.jpg
509	The First and Last Freedom	Jiddu Krishnamurti	4.41	https://images.gr-assets.com/books/1387736444l/17612959.jpg
510	Theft of Swords	Michael J. Sullivan	4.21	https://images.gr-assets.com/books/1307959785l/10790290.jpg
511	The City of Dreaming Books	Walter Moers	4.34	https://images.gr-assets.com/books/1320430394l/62031.jpg
512	Leave It to Psmith	P.G. Wodehouse	4.3	https://images.gr-assets.com/books/1388708408l/16415.jpg
513	A Tree Grows in Brooklyn	Betty  Smith	4.24	https://images.gr-assets.com/books/1327883484l/14891.jpg
514	Survival in Auschwitz	Primo Levi	4.28	https://images.gr-assets.com/books/1414374949l/6174.jpg
515	The Essential Writings of Ralph Waldo Emerson	Ralph Waldo Emerson	4.36	https://images.gr-assets.com/books/1320405541l/716872.jpg
516	Wit	Margaret Edson	4.2	https://images.gr-assets.com/books/1327908183l/171201.jpg
517	The Real Mother Goose	Blanche Fisher Wright	4.33	https://images.gr-assets.com/books/1439507704l/1001896.jpg
518	All-of-a-Kind Family	Sydney Taylor	4.23	https://images.gr-assets.com/books/1389583949l/7926.jpg
519	The Berenstain Bears Go to School	Stan Berenstain	4.28	https://images.gr-assets.com/books/1344369033l/900070.jpg
520	102 Minutes: The Untold Story of the Fight to Survive Inside the Twin Towers	Jim Dwyer	4.23	https://images.gr-assets.com/books/1408991899l/177187.jpg
521	Magician	Raymond E. Feist	4.33	https://images.gr-assets.com/books/1391464462l/43916.jpg
522	Chess Story	Stefan Zweig	4.28	https://images.gr-assets.com/books/1386924796l/59151.jpg
523	Daring Greatly: How the Courage to Be Vulnerable Transforms the Way We Live, Love, Parent, and Lead	Brené Brown	4.24	https://images.gr-assets.com/books/1337110319l/13588356.jpg
524	The Magic School Bus Going Batty: A Book About Bats	Joanna Cole	4.38	https://images.gr-assets.com/books/1379929719l/638981.jpg
525	Slave: My True Story	Mende Nazer	4.29	https://images.gr-assets.com/books/1347901918l/178460.jpg
526	Mystery and Manners: Occasional Prose (FSG Classics)	Flannery O'Connor	4.31	https://images.gr-assets.com/books/1330499787l/75087.jpg
527	Chicken Soup with Rice: A Book of Months	Maurice Sendak	4.26	https://images.gr-assets.com/books/1388259279l/590552.jpg
528	The Crow	J. O'Barr	4.26	https://images.gr-assets.com/books/1348539236l/97486.jpg
529	Set This House in Order	Matt Ruff	4.28	https://images.gr-assets.com/books/1436462577l/71847.jpg
530	Collected Poems of Emily Dickinson (Barnes  Noble Classics Series)	Emily Dickinson	4.21	https://images.gr-assets.com/books/1347937909l/303866.jpg
531	Cautionary Tales for Children	Hilaire Belloc	4.21	https://images.gr-assets.com/books/1388258054l/47561.jpg
532	Just Mercy: A Story of Justice and Redemption	Bryan Stevenson	4.59	https://images.gr-assets.com/books/1420795201l/20342617.jpg
533	ديوان المتنبي	Al-Mutanabbī	4.38	https://images.gr-assets.com/books/1299952133l/6348484.jpg
534	Rebecca	Daphne du Maurier	4.21	https://images.gr-assets.com/books/1386605169l/17899948.jpg
535	Cardcaptor Sakura, Vol. 1	CLAMP	4.3	https://images.gr-assets.com/books/1451030958l/229145.jpg
536	The Fire Next Time	James     Baldwin	4.46	https://images.gr-assets.com/books/1488825618l/464260.jpg
537	Motherless Daughters: The Legacy of Loss	Hope Edelman	4.28	https://images.gr-assets.com/books/1347300808l/132810.jpg
538	A Sand County Almanac and Sketches Here and There	Aldo Leopold	4.24	https://images.gr-assets.com/books/1283195046l/210404.jpg
539	الباب المفتوح	لطيفة الزيات	4.23	https://images.gr-assets.com/books/1363380790l/4676249.jpg
540	Uncle Shelby's ABZ Book	Shel Silverstein	4.37	https://images.gr-assets.com/books/1388256779l/41887.jpg
541	Home for a Bunny	Margaret Wise Brown	4.22	https://images.gr-assets.com/books/1320496378l/616197.jpg
542	قصة الإيمان: بين الفلسفة والعلم والقرآن	نديم الجسر	4.24	https://images.gr-assets.com/books/1256467404l/7044136.jpg
543	"Repent, Harlequin!" Said the Ticktockman	Harlan Ellison	4.22	https://images.gr-assets.com/books/1171217501l/90629.jpg
544	Fit to Be Tied	Mary Calmes	4.34	https://images.gr-assets.com/books/1442640342l/26229909.jpg
545	The Lamb's Supper: The Mass as Heaven on Earth	Scott Hahn	4.37	https://images.gr-assets.com/books/1438209748l/28883.jpg
546	The Player of Games	Iain M. Banks	4.26	https://images.gr-assets.com/books/1386922873l/18630.jpg
547	Animal-Speak: The Spiritual & Magical Powers of Creatures Great & Small	Ted Andrews	4.25	https://images.gr-assets.com/books/1347311507l/67863.jpg
548	Kisses from Katie	Katie J. Davis	4.4	https://images.gr-assets.com/books/1328322534l/12983995.jpg
549	أيها الولد	ابوحامد محمد غزالی	4.29	https://images.gr-assets.com/books/1327080682l/6403921.jpg
550	Tattoos on the Heart: The Power of Boundless Compassion	Gregory Boyle	4.41	https://images.gr-assets.com/books/1347890894l/9877102.jpg
551	The Twelve Chairs	Ilya Ilf	4.42	https://images.gr-assets.com/books/1348256729l/158516.jpg
552	The Adventures of Sherlock Holmes	Arthur Conan Doyle	4.3	https://images.gr-assets.com/books/1164045516l/3590.jpg
553	The Ragamuffin Gospel: Good News for the Bedraggled, Beat-Up, and Burnt Out	Brennan Manning	4.22	https://images.gr-assets.com/books/1266488592l/173526.jpg
554	The PreHistory of The Far Side: A 10th Anniversary Exhibit	Gary Larson	4.51	https://images.gr-assets.com/books/1439007503l/233712.jpg
555	American Assassin	Vince Flynn	4.24	https://images.gr-assets.com/books/1425389574l/7959473.jpg
556	The Storyteller	Jodi Picoult	4.26	https://images.gr-assets.com/books/1356328634l/15753740.jpg
557	Best Friends for Frances	Russell Hoban	4.23	https://images.gr-assets.com/books/1356004455l/110611.jpg
558	Dragon Ball, Vol. 1: The Monkey King	Akira Toriyama	4.42	https://images.gr-assets.com/books/1442541694l/969275.jpg
559	Ender's Shadow	Orson Scott Card	4.3	https://images.gr-assets.com/books/1328016160l/969456.jpg
560	رسالة في الطريق إلى ثقافتنا	محمود محمد شاكر	4.39	https://images.gr-assets.com/books/1251116741l/6750057.jpg
561	The Man Who Never Missed	Steve Perry	4.24	https://images.gr-assets.com/books/1389852306l/20878.jpg
562	What Do People Do All Day?	Richard Scarry	4.24	https://images.gr-assets.com/books/1320394066l/313375.jpg
563	Angels in America, Part One: Millennium Approaches	Tony Kushner	4.27	https://images.gr-assets.com/books/1354209439l/92250.jpg
564	Justice: What's the Right Thing to Do?	Michael J. Sandel	4.25	https://images.gr-assets.com/books/1441517195l/6452731.jpg
565	Safe Area Goražde: The War in Eastern Bosnia, 1992-1995	Joe Sacco	4.28	https://images.gr-assets.com/books/1327878983l/82861.jpg
566	Catechism of the Catholic Church	John Paul II	4.4	https://images.gr-assets.com/books/1320474441l/110795.jpg
567	Awareness: The Key to Living in Balance	Osho	4.32	https://images.gr-assets.com/books/1316130459l/97010.jpg
568	Persepolis: The Story of a Childhood	Marjane Satrapi	4.23	https://images.gr-assets.com/books/1425871473l/9516.jpg
569	The Art of Breathing	T.J. Klune	4.43	https://images.gr-assets.com/books/1400628055l/20624305.jpg
570	Economics in One Lesson: The Shortest & Surest Way to Understand Basic Economics	Henry Hazlitt	4.22	https://images.gr-assets.com/books/1320423284l/3028.jpg
571	Mother Goose	Al Dempster	4.29	https://images.gr-assets.com/books/1320561871l/1734663.jpg
572	Essentials of Classic Italian Cooking	Marcella Hazan	4.26	https://images.gr-assets.com/books/1439124302l/19552.jpg
573	Jayber Crow	Wendell Berry	4.34	https://images.gr-assets.com/books/1433600577l/57460.jpg
574	Squire	Tamora Pierce	4.27	https://images.gr-assets.com/books/1215394320l/153795.jpg
575	The River Why	David James Duncan	4.23	https://images.gr-assets.com/books/1385086992l/23196.jpg
576	A Severe Mercy: A Story of Faith, Tragedy and Triumph	Sheldon Vanauken	4.32	https://images.gr-assets.com/books/1440774555l/56594.jpg
577	القرآن: محاولة لفهم عصري	مصطفى محمود	4.19	https://images.gr-assets.com/books/1387502756l/5988117.jpg
578	Black Skin, White Masks	Frantz Fanon	4.23	https://images.gr-assets.com/books/1386923176l/274392.jpg
579	Hell & High Water	Charlie Cochet	4.22	https://images.gr-assets.com/books/1402315007l/22267616.jpg
580	Page	Tamora Pierce	4.22	https://images.gr-assets.com/books/1215394280l/153785.jpg
581	نهج البلاغة	Ali ibn Abi Talib	4.55	https://images.gr-assets.com/books/1185965182l/1618417.jpg
582	Witness	Whittaker Chambers	4.35	https://images.gr-assets.com/books/1411447524l/950143.jpg
583	Complications: A Surgeon's Notes on an Imperfect Science	Atul Gawande	4.24	https://images.gr-assets.com/books/1441151524l/4477.jpg
584	Curious George Rides a Bike	H.A. Rey	4.24	https://images.gr-assets.com/books/1348292189l/291364.jpg
585	Borderlands/La Frontera: The New Mestiza	Gloria E. Anzaldúa	4.25	https://images.gr-assets.com/books/1354902833l/45882.jpg
586	Shibumi	Trevanian	4.22	https://images.gr-assets.com/books/1381965124l/2183954.jpg
587	Women, Race, and Class	Angela Y. Davis	4.36	https://images.gr-assets.com/books/1359985746l/635635.jpg
588	The Shadow of the Sun	Ryszard Kapuściński	4.37	https://images.gr-assets.com/books/1320560715l/9541.jpg
589	The Captain's Verses	Pablo Neruda	4.26	https://images.gr-assets.com/books/1385236777l/11320.jpg
590	Envisioning Information	Edward R. Tufte	4.23	https://images.gr-assets.com/books/1290403773l/17745.jpg
591	Annie's Song	Catherine Anderson	4.2	https://images.gr-assets.com/books/1325836635l/659600.jpg
592	Little Bear	Else Holmelund Minarik	4.22	https://images.gr-assets.com/books/1318518124l/201146.jpg
593	The Way Things Work	David Macaulay	4.32	https://images.gr-assets.com/books/1328309142l/304889.jpg
594	The Darkest Child	Delores Phillips	4.35	https://images.gr-assets.com/books/1320541010l/331260.jpg
595	الأرض	عبد الرحمن الشرقاوي	4.21	https://images.gr-assets.com/books/1395866279l/6037287.jpg
596	Purple, Green and Yellow	Robert Munsch	4.23	https://images.gr-assets.com/books/1386921021l/201434.jpg
597	Sapiens: A Brief History of Humankind	Yuval Noah Harari	4.42	https://images.gr-assets.com/books/1420585954l/23692271.jpg
598	God in the Dock: Essays on Theology and Ethics	C.S. Lewis	4.27	https://images.gr-assets.com/books/1348905323l/111563.jpg
599	Unshaken: Ruth	Francine Rivers	4.25	https://images.gr-assets.com/books/1406505768l/95610.jpg
600	Some Love, Some Pain, Sometime: Stories	J. California Cooper	4.5	https://images.gr-assets.com/books/1320417921l/778098.jpg
601	Shambhala: The Sacred Path of the Warrior	Chögyam Trungpa	4.23	https://images.gr-assets.com/books/1320539932l/336248.jpg
602	The Discarded Image: An Introduction to Medieval and Renaissance Literature	C.S. Lewis	4.23	https://images.gr-assets.com/books/1348672032l/80005.jpg
603	طبائع الاستبداد ومصارع الاستعباد	عبد الرحمن الكواكبي	4.22	https://images.gr-assets.com/books/1352231987l/2312458.jpg
604	Band of Brothers: E Company, 506th Regiment, 101st Airborne from Normandy to Hitler's Eagle's Nest	Stephen E. Ambrose	4.42	https://images.gr-assets.com/books/1388247701l/42389.jpg
605	In the Realm of Hungry Ghosts: Close Encounters with Addiction	Gabor Maté	4.45	https://images.gr-assets.com/books/1327970900l/617702.jpg
606	Totto-chan: The Little Girl at the Window	Tetsuko Kuroyanagi	4.3	https://images.gr-assets.com/books/1354795941l/328802.jpg
607	Rudolph the Red-Nosed Reindeer	Barbara Shook Hazen	4.3	https://images.gr-assets.com/books/1330095176l/1215290.jpg
608	Hellhound on His Trail: The Stalking of Martin Luther King, Jr. and the International Hunt for His Assassin	Hampton Sides	4.23	https://images.gr-assets.com/books/1320491132l/7624086.jpg
609	A Collection of Essays	George Orwell	4.3	https://images.gr-assets.com/books/1327919948l/9640.jpg
610	Impulse	Ellen Hopkins	4.29	https://images.gr-assets.com/books/1427002059l/270805.jpg
611	Never Split the Difference: Negotiating As If Your Life Depended On It	Chris Voss	4.49	https://images.gr-assets.com/books/1460910517l/26156469.jpg
612	Vagabond, Volume 1	Takehiko Inoue	4.3	https://images.gr-assets.com/books/1173150557l/251912.jpg
613	The Boys in the Boat: Nine Americans and Their Epic Quest for Gold at the 1936 Berlin Olympics	Daniel James Brown	4.33	https://images.gr-assets.com/books/1354683116l/16158542.jpg
614	Médico de Homens e de Almas	Taylor Caldwell	4.28	https://images.gr-assets.com/books/1320100201l/6338105.jpg
615	The War that Saved My Life	Kimberly Brubaker Bradley	4.44	https://images.gr-assets.com/books/1453342842l/20912424.jpg
616	Change Your Thoughts - Change Your Life: Living the Wisdom of the Tao	Wayne W. Dyer	4.24	https://images.gr-assets.com/books/1328770256l/389763.jpg
617	Sleeping Beauty	Mahlon F. Craft	4.31	https://images.gr-assets.com/books/1347495319l/630714.jpg
618	His Last Bow: 8 Stories	Arthur Conan Doyle	4.28	https://images.gr-assets.com/books/1368588782l/754713.jpg
619	Stalingrad: The Fateful Siege, 1942–1943	Antony Beevor	4.29	https://images.gr-assets.com/books/1348217283l/542389.jpg
620	If You Give a Mouse a Cookie	Laura Joffe Numeroff	4.24	https://images.gr-assets.com/books/1276046901l/767680.jpg
621	Power vs. Force	David R. Hawkins	4.22	https://images.gr-assets.com/books/1462222491l/19795.jpg
622	The Glorious Cause	Jeff Shaara	4.25	https://images.gr-assets.com/books/1320436067l/785003.jpg
623	InuYasha: Turning Back Time	Rumiko Takahashi	4.26	https://images.gr-assets.com/books/1288648681l/330744.jpg
624	Daylight Again	S.E. Jakes	4.3	https://images.gr-assets.com/books/1398466878l/20699996.jpg
625	All Systems Red	Martha Wells	4.23	https://images.gr-assets.com/books/1484171189l/32758901.jpg
626	Brief einer Unbekannten	Stefan Zweig	4.25	https://images.gr-assets.com/books/1172512508l/182185.jpg
627	Unveiled: Tamar	Francine Rivers	4.26	https://images.gr-assets.com/books/1388268504l/95607.jpg
628	Unashamed: Rahab	Francine Rivers	4.27	https://images.gr-assets.com/books/1406513239l/95609.jpg
629	Das Boot	Lothar-Günther Buchheim	4.29	https://images.gr-assets.com/books/1324837119l/299596.jpg
630	The Polar Express	Chris Van Allsburg	4.29	https://images.gr-assets.com/books/1356707942l/420282.jpg
631	The Code Book: The Science of Secrecy from Ancient Egypt to Quantum Cryptography	Simon Singh	4.28	https://images.gr-assets.com/books/1335391718l/1045550.jpg
632	The Art of Being Normal	Lisa  Williamson	4.19	https://images.gr-assets.com/books/1413880013l/23058402.jpg
633	The Alchemy of Air: A Jewish Genius, a Doomed Tycoon, and the Scientific Discovery That Fed the World but Fueled the Rise of Hitler	Thomas Hager	4.25	https://images.gr-assets.com/books/1320429919l/3269091.jpg
634	The Americans	Robert Frank	4.26	https://images.gr-assets.com/books/1395688905l/585707.jpg
635	The Star Rover	Jack London	4.25	https://images.gr-assets.com/books/1320515496l/862311.jpg
636	Asking for It: The Alarming Rise of Rape Culture and What We Can Do about It	Kate Harding	4.38	https://images.gr-assets.com/books/1435187901l/17836520.jpg
637	All Who Go Do Not Return: A Memoir	Shulem Deen	4.22	https://images.gr-assets.com/books/1403428890l/22244929.jpg
638	Milk and Honey	Rupi Kaur	4.25	https://images.gr-assets.com/books/1487289196l/26877039.jpg
639	Where the Forest Meets the Sea	Jeannie Baker	4.25	https://images.gr-assets.com/books/1348031926l/1401165.jpg
640	How to Be Sick: A Buddhist-Inspired Guide for the Chronically Ill and Their Caregivers	Toni Bernhard	4.19	https://images.gr-assets.com/books/1388340908l/7902654.jpg
641	Chester	Mélanie Watt	4.22	https://images.gr-assets.com/books/1396840333l/1703186.jpg
642	Failure is Not an Option: Mission Control From Mercury to Apollo 13 and Beyond	Gene Kranz	4.24	https://images.gr-assets.com/books/1442273536l/141499.jpg
643	Robert the Rose Horse	Joan Heilbroner	4.23	https://images.gr-assets.com/books/1320398057l/828391.jpg
644	Undaunted Courage: The Pioneering First Mission to Explore America's Wild Frontier	Stephen E. Ambrose	4.22	https://images.gr-assets.com/books/1408925996l/45546.jpg
645	There Is No Me Without You: One Woman's Odyssey to Rescue Africa's Children	Melissa Fay Greene	4.27	https://images.gr-assets.com/books/1442268407l/119729.jpg
646	Abba's Child: The Cry of the Heart for Intimate Belonging	Brennan Manning	4.33	https://images.gr-assets.com/books/1405881925l/48812.jpg
647	This Earth of Mankind	Pramoedya Ananta Toer	4.37	https://images.gr-assets.com/books/1394996009l/301304.jpg
648	How Europe Underdeveloped Africa	Walter Rodney	4.23	https://images.gr-assets.com/books/1388405716l/40630.jpg
649	Happy City: Transforming Our Lives Through Urban Design	Charles Montgomery	4.32	https://images.gr-assets.com/books/1384736055l/13330588.jpg
650	Katy and the Big Snow	Virginia Lee Burton	4.23	https://images.gr-assets.com/books/1348376975l/764166.jpg
651	Gunnerkrigg Court, Vol. 1: Orientation	Thomas Siddell	4.22	https://images.gr-assets.com/books/1279413625l/2915026.jpg
652	The New Way Things Work	David Macaulay	4.23	https://images.gr-assets.com/books/1394348321l/6864335.jpg
653	When and Where I Enter: The Impact of Black Women on Race and Sex in America	Paula J. Giddings	4.27	https://images.gr-assets.com/books/1407706866l/419272.jpg
654	The Teenage Liberation Handbook: How to Quit School and Get a Real Life and Education	Grace Llewellyn	4.22	https://images.gr-assets.com/books/1179711259l/948012.jpg
655	Anne Frank Remembered: The Story of the Woman Who Helped to Hide the Frank Family	Miep Gies	4.27	https://images.gr-assets.com/books/1437766396l/5509.jpg
656	John, Paul, George & Ben	Lane Smith	4.21	https://images.gr-assets.com/books/1438480195l/41861.jpg
657	Amazing Grace: William Wilberforce and the Heroic Campaign to End Slavery	Eric Metaxas	4.28	https://images.gr-assets.com/books/1347825667l/106610.jpg
658	There Are Cats in This Book	Viviane Schwarz	4.22	https://images.gr-assets.com/books/1422582942l/3133562.jpg
659	The Power of Myth	Joseph Campbell	4.3	https://images.gr-assets.com/books/1327878742l/35519.jpg
660	For Your Own Good: Hidden Cruelty in Child Rearing and the Roots of Violence	Alice  Miller	4.22	https://images.gr-assets.com/books/1348035388l/1707793.jpg
661	How to Be an Adult in Relationships: The Five Keys to Mindful Loving	David Richo	4.24	https://images.gr-assets.com/books/1320407793l/500901.jpg
662	The Fifth Sacred Thing	Starhawk	4.25	https://images.gr-assets.com/books/1388674286l/80689.jpg
663	In Search of Satisfaction	J. California Cooper	4.45	https://images.gr-assets.com/books/1214733673l/1770272.jpg
664	On the Incarnation	Athanasius of Alexandria	4.3	https://images.gr-assets.com/books/1269974899l/673655.jpg
665	The Warded Man	Peter V. Brett	4.27	https://images.gr-assets.com/books/1354571949l/3428935.jpg
666	Mufaro's Beautiful Daughters: An African Tale	John Steptoe	4.32	https://images.gr-assets.com/books/1442969300l/845403.jpg
667	The Beatles Anthology	George Harrison	4.38	https://images.gr-assets.com/books/1397426628l/35542.jpg
668	Pushed: The Painful Truth About Childbirth and Modern Maternity Care	Jennifer Block	4.22	https://images.gr-assets.com/books/1438294064l/607901.jpg
669	Nourishing Traditions: The Cookbook That Challenges Politically Correct Nutrition and the Diet Dictocrats	Sally Fallon Morell	4.22	https://images.gr-assets.com/books/1349063789l/117835.jpg
670	Mother Angelica: The Remarkable Story of a Nun, Her Nerve, and a Network of Miracles	Raymond Arroyo	4.33	https://images.gr-assets.com/books/1388179820l/245325.jpg
671	Teaching to Transgress: Education as the Practice of Freedom	bell hooks	4.32	https://images.gr-assets.com/books/1403166974l/27091.jpg
672	On the Night You Were Born	Nancy Tillman	4.35	https://images.gr-assets.com/books/1386925359l/37377.jpg
673	How Music Got Free: The End of an Industry, the Turn of the Century, and the Patient Zero of Piracy	Stephen Richard Witt	4.21	https://images.gr-assets.com/books/1414348373l/23398715.jpg
674	The Body Keeps the Score: Brain, Mind, and Body in the Healing of Trauma	Bessel A. van der Kolk	4.62	https://images.gr-assets.com/books/1397425897l/18693771.jpg
675	Castle	David Macaulay	4.21	https://images.gr-assets.com/books/1295715078l/847018.jpg
676	The Qur'an / القرآن الكريم	Anonymous	4.34	https://images.gr-assets.com/books/1275263838l/646462.jpg
677	Zen Shorts	Jon J. Muth	4.24	https://images.gr-assets.com/books/1301850228l/140181.jpg
678	The Mad Scientists' Club	Bertrand R. Brinley	4.25	https://images.gr-assets.com/books/1390421623l/222127.jpg
679	Story of a Soul: The Autobiography of St. Therese of Lisieux	Thérèse de Lisieux	4.38	https://images.gr-assets.com/books/1178067537l/754771.jpg
680	NeuroTribes: The Legacy of Autism and the Future of Neurodiversity	Steve Silberman	4.29	https://images.gr-assets.com/books/1421707890l/22514020.jpg
681	Nobody's Boy (Sans Famille)	Hector Malot	4.25	https://images.gr-assets.com/books/1286456723l/1500209.jpg
682	Jesus: A Pilgrimage	James     Martin	4.53	https://images.gr-assets.com/books/1381962940l/18085418.jpg
683	The Mayor of Castro Street: The Life and Times of Harvey Milk	Randy Shilts	4.27	https://images.gr-assets.com/books/1439223118l/235662.jpg
684	Slavery by Another Name: The Re-Enslavement of Black Americans from the Civil War to World War II	Douglas A. Blackmon	4.29	https://images.gr-assets.com/books/1320504147l/2319745.jpg
685	FoxTrot: The Works	Bill Amend	4.26	https://images.gr-assets.com/books/1388181185l/354225.jpg
686	Voices from Chernobyl: The Oral History of a Nuclear Disaster	Svetlana Alexievich	4.42	https://images.gr-assets.com/books/1461090074l/1116094.jpg
687	A Hole is to Dig	Ruth Krauss	4.24	https://images.gr-assets.com/books/1347664265l/118077.jpg
688	The Authoritative Calvin and Hobbes: A Calvin and Hobbes Treasury	Bill Watterson	4.73	https://images.gr-assets.com/books/1418210723l/121793.jpg
689	Fairy Tail, Vol. 1	Hiro Mashima	4.4	https://images.gr-assets.com/books/1389303619l/2454986.jpg
690	The Healing of America: A Global Quest for Better, Cheaper, and Fairer Health Care	T.R. Reid	4.22	https://images.gr-assets.com/books/1442113153l/6402544.jpg
691	The Hiding Place: The Triumphant True Story of Corrie Ten Boom	Corrie ten Boom	4.42	https://images.gr-assets.com/books/1320418824l/561909.jpg
692	Comfortable with Uncertainty: 108 Teachings on Cultivating Fearlessness and Compassion	Pema Chödrön	4.35	https://images.gr-assets.com/books/1320555660l/108829.jpg
693	Alanna: The First Adventure	Tamora Pierce	4.27	https://images.gr-assets.com/books/1388206270l/13831.jpg
694	Roots: The Saga of an American Family	Alex Haley	4.42	https://images.gr-assets.com/books/1329398936l/546018.jpg
695	11/22/63	Stephen King	4.29	https://images.gr-assets.com/books/1327876792l/10644930.jpg
696	The Ones Who Walk Away from Omelas	Ursula K. Le Guin	4.34	https://images.gr-assets.com/books/1389866872l/92625.jpg
697	Stopping by Woods on a Snowy Evening	Robert Frost	4.39	https://images.gr-assets.com/books/1441050662l/12201.jpg
698	Preludes & Nocturnes	Neil Gaiman	4.3	https://images.gr-assets.com/books/1411609637l/23754.jpg
699	The Importance of Being Earnest and Other Plays	Oscar Wilde	4.26	https://images.gr-assets.com/books/1260426623l/92308.jpg
700	Between Shades of Gray	Ruta Sepetys	4.36	https://images.gr-assets.com/books/1327873479l/7824322.jpg
701	When We Were Very Young	A.A. Milne	4.31	https://images.gr-assets.com/books/1348198334l/821003.jpg
702	The Red Tree	Shaun Tan	4.54	https://images.gr-assets.com/books/1344739159l/300946.jpg
703	Howl's Moving Castle	Diana Wynne Jones	4.3	https://images.gr-assets.com/books/1407450489l/6294.jpg
704	The Sunne in Splendour	Sharon Kay Penman	4.4	https://images.gr-assets.com/books/1361649213l/119829.jpg
705	Little Witch	Anna Elizabeth Bennett	4.21	https://images.gr-assets.com/books/1344545409l/1374590.jpg
706	Man's Search for Meaning	Viktor E. Frankl	4.33	https://images.gr-assets.com/books/1467136625l/4069.jpg
707	The Complete Fairy Tales	Hans Christian Andersen	4.28	https://images.gr-assets.com/books/1385233181l/46306.jpg
708	Angle of Repose	Wallace Stegner	4.27	https://images.gr-assets.com/books/1329151576l/292408.jpg
709	The Love Song of J. Alfred Prufrock and Other Poems	T.S. Eliot	4.32	https://images.gr-assets.com/books/1229242079l/118389.jpg
710	The Complete Essays	Michel de Montaigne	4.24	https://images.gr-assets.com/books/1408384184l/30735.jpg
711	Surely You're Joking, Mr. Feynman!: Adventures of a Curious Character	Richard Feynman	4.29	https://images.gr-assets.com/books/1348445281l/5544.jpg
712	Cosmos	Carl Sagan	4.35	https://images.gr-assets.com/books/1388620656l/55030.jpg
713	Where the Sidewalk Ends	Shel Silverstein	4.29	https://images.gr-assets.com/books/1168052448l/30119.jpg
714	Ready Player One	Ernest Cline	4.31	https://images.gr-assets.com/books/1500930947l/9969571.jpg
715	Someone Knows My Name	Lawrence Hill	4.44	https://images.gr-assets.com/books/1348403987l/875441.jpg
716	Schindler's Ark	Thomas Keneally	4.34	https://images.gr-assets.com/books/1173288252l/268302.jpg
717	Alexander and the Terrible, Horrible, No Good, Very Bad Day	Judith Viorst	4.22	https://images.gr-assets.com/books/1405259744l/46677.jpg
718	Shakespeare's Sonnets	William Shakespeare	4.24	https://images.gr-assets.com/books/1431229752l/42038.jpg
719	A Good Man is Hard to Find and Other Stories	Flannery O'Connor	4.24	https://images.gr-assets.com/books/1388251628l/48464.jpg
720	Maus I: A Survivor's Tale: My Father Bleeds History	Art Spiegelman	4.35	https://images.gr-assets.com/books/1327884972l/15196.jpg
721	Night	Elie Wiesel	4.3	https://images.gr-assets.com/books/1473495285l/1617.jpg
722	Memoirs of Hadrian	Marguerite Yourcenar	4.25	https://images.gr-assets.com/books/1416448158l/12172.jpg
723	The Winds of War	Herman Wouk	4.36	https://images.gr-assets.com/books/1442187661l/21484.jpg
724	The Autobiography of Malcolm X	Malcolm X	4.29	https://images.gr-assets.com/books/1434682864l/92057.jpg
725	Short Stories	Anton Chekhov	4.34	https://images.gr-assets.com/books/1388191320l/23790.jpg
726	The Phantom Tollbooth	Norton Juster	4.22	https://images.gr-assets.com/books/1438887022l/378.jpg
727	Cutting for Stone	Abraham Verghese	4.28	https://images.gr-assets.com/books/1327931601l/3591262.jpg
728	The Annotated Alice	Lewis Carroll	4.43	https://images.gr-assets.com/books/1294259919l/10129136.jpg
729	Unbroken: A World War II Story of Survival, Resilience, and Redemption	Laura Hillenbrand	4.39	https://images.gr-assets.com/books/1327861115l/8664353.jpg
730	The Shadow of the Wind	Carlos Ruiz Zafón	4.24	https://images.gr-assets.com/books/1344545047l/1232.jpg
731	Me Before You	Jojo Moyes	4.27	https://images.gr-assets.com/books/1357108762l/15507958.jpg
732	The Day of the Jackal	Frederick Forsyth	4.25	https://images.gr-assets.com/books/1405364996l/540020.jpg
733	The Name of the Wind	Patrick Rothfuss	4.55	https://images.gr-assets.com/books/1472068073l/186074.jpg
734	Madeline	Ludwig Bemelmans	4.22	https://images.gr-assets.com/books/1175060644l/475339.jpg
735	Team of Rivals: The Political Genius of Abraham Lincoln	Doris Kearns Goodwin	4.29	https://images.gr-assets.com/books/1347278868l/2199.jpg
736	Nicholas and Alexandra	Robert K. Massie	4.25	https://images.gr-assets.com/books/1285460338l/2852263.jpg
737	Tao Te Ching	Lao Tzu	4.32	https://images.gr-assets.com/books/1388306422l/57854.jpg
738	The Lorax	Dr. Seuss	4.35	https://images.gr-assets.com/books/1327879938l/7784.jpg
739	The Giving Tree	Shel Silverstein	4.38	https://images.gr-assets.com/books/1174210942l/370493.jpg
740	Different Seasons featuring The Shawshank Redemption	Stephen King	4.34	https://images.gr-assets.com/books/1172260108l/155403.jpg
741	Sonnets to Orpheus	Rainer Maria Rilke	4.35	https://images.gr-assets.com/books/1348931949l/205134.jpg
742	Lonesome Dove	Larry McMurtry	4.47	https://images.gr-assets.com/books/1378573063l/256008.jpg
743	A Fine Balance	Rohinton Mistry	4.34	https://images.gr-assets.com/books/1386925449l/5211.jpg
744	The Very Hungry Caterpillar	Eric Carle	4.29	https://images.gr-assets.com/books/1327878225l/4948.jpg
745	The Velveteen Rabbit	Margery Williams Bianco	4.29	https://images.gr-assets.com/books/1347748913l/144974.jpg
746	Les Fleurs du Mal	Charles Baudelaire	4.26	https://images.gr-assets.com/books/1388667125l/203220.jpg
747	East of Eden	John Steinbeck	4.35	https://images.gr-assets.com/books/1441547516l/4406.jpg
748	A Child's Garden of Verses	Robert Louis Stevenson	4.3	https://images.gr-assets.com/books/1401644174l/20413.jpg
749	How the Grinch Stole Christmas!	Dr. Seuss	4.36	https://images.gr-assets.com/books/1327958149l/113946.jpg
750	Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch	Terry Pratchett	4.25	https://images.gr-assets.com/books/1392528568l/12067.jpg
751	Death on the Installment Plan	Louis-Ferdinand Céline	4.23	https://images.gr-assets.com/books/1327947390l/106096.jpg
752	The Shock Doctrine: The Rise of Disaster Capitalism	Naomi Klein	4.22	https://images.gr-assets.com/books/1442590618l/1237300.jpg
753	Divergent	Veronica Roth	4.24	https://images.gr-assets.com/books/1328559506l/13335037.jpg
754	The Master and Margarita	Mikhail Bulgakov	4.32	https://images.gr-assets.com/books/1327867963l/117833.jpg
755	Green Eggs and Ham	Dr. Seuss	4.29	https://images.gr-assets.com/books/1468680100l/23772.jpg
756	Anne of Green Gables	L.M. Montgomery	4.23	https://images.gr-assets.com/books/1390789015l/8127.jpg
757	A Thousand Splendid Suns	Khaled Hosseini	4.34	https://images.gr-assets.com/books/1345958969l/128029.jpg
758	The Fault in Our Stars	John Green	4.26	https://images.gr-assets.com/books/1360206420l/11870085.jpg
759	The Princess Bride	William Goldman	4.25	https://images.gr-assets.com/books/1327903636l/21787.jpg
760	In Search of Lost Time	Marcel Proust	4.34	https://images.gr-assets.com/books/1352231701l/18796.jpg
761	Goodnight Moon	Margaret Wise Brown	4.27	https://images.gr-assets.com/books/1439223893l/32929.jpg
762	Ender's Game	Orson Scott Card	4.3	https://images.gr-assets.com/books/1408303130l/375802.jpg
763	Ficciones	Jorge Luis Borges	4.47	https://images.gr-assets.com/books/1388197956l/426504.jpg
764	The Godfather	Mario Puzo	4.36	https://images.gr-assets.com/books/1394988109l/22034.jpg
765	Gone with the Wind	Margaret Mitchell	4.28	https://images.gr-assets.com/books/1328025229l/18405.jpg
766	A Game of Thrones	George R.R. Martin	4.45	https://images.gr-assets.com/books/1436732693l/13496.jpg
767	The Little Prince	Antoine de Saint-Exupéry	4.28	https://images.gr-assets.com/books/1367545443l/157993.jpg
768	The Hunger Games	Suzanne Collins	4.34	https://images.gr-assets.com/books/1307886550l/6772333.jpg
769	The Help	Kathryn Stockett	4.45	https://images.gr-assets.com/books/1278457730l/7856358.jpg
770	V for Vendetta	Alan Moore	4.25	https://images.gr-assets.com/books/1343668985l/5805.jpg
771	The Book Thief	Markus Zusak	4.36	https://images.gr-assets.com/books/1390053681l/19063.jpg
772	The Brothers Karamazov	Fyodor Dostoyevsky	4.3	https://images.gr-assets.com/books/1427728126l/4934.jpg
773	Journey to the End of the Night	Louis-Ferdinand Céline	4.25	https://images.gr-assets.com/books/1462934409l/12395.jpg
774	The Book of Disquiet	Fernando Pessoa	4.5	https://images.gr-assets.com/books/1382871857l/45974.jpg
775	Duino Elegies	Rainer Maria Rilke	4.44	https://images.gr-assets.com/books/1388391152l/53111.jpg
776	The Selected Poetry of Rainer Maria Rilke	Rainer Maria Rilke	4.4	https://images.gr-assets.com/books/1343101334l/46201.jpg
777	Harry Potter and the Sorcerer's Stone	J.K. Rowling	4.44	https://images.gr-assets.com/books/1474154022l/3.jpg
778	The Fellowship of the Ring	J.R.R. Tolkien	4.34	https://images.gr-assets.com/books/1298411339l/34.jpg
779	Pride and Prejudice	Jane Austen	4.24	https://images.gr-assets.com/books/1320399351l/1885.jpg
780	The Man Without Qualities	Robert Musil	4.25	https://images.gr-assets.com/books/1327330533l/527756.jpg
781	The Complete Grimm's Fairy Tales	Jacob Grimm	4.31	https://images.gr-assets.com/books/1369540060l/22917.jpg
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('books_book_id_seq', 781, true);


--
-- Data for Name: books_genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY books_genres (book_genre_id, book_id, genre_id) FROM stdin;
1	370	266
2	426	266
3	645	320
4	727	320
5	199	195
6	581	302
7	676	302
8	151	168
9	357	168
10	707	168
11	728	168
12	746	168
13	772	168
14	34	70
15	66	70
16	107	70
17	117	70
18	162	70
19	247	70
20	341	70
21	396	70
22	436	70
23	478	70
24	615	70
25	703	70
26	705	70
27	146	162
28	453	162
29	707	162
30	136	155
31	334	256
32	423	256
33	481	256
34	11	28
35	34	28
36	341	28
37	705	28
38	717	28
39	233	218
40	649	218
41	675	218
42	625	314
43	136	154
44	341	154
45	365	154
46	452	154
47	584	154
48	17	46
49	269	46
50	349	46
51	685	46
52	321	251
53	427	251
54	490	251
55	210	203
56	437	203
57	443	203
58	464	203
59	541	299
60	4	12
61	6	12
62	7	12
63	10	12
64	17	12
65	20	12
66	20	12
67	30	12
68	30	12
69	36	12
70	36	12
71	36	12
72	37	12
73	40	12
74	41	12
75	47	12
76	48	12
77	48	12
78	55	12
79	55	12
80	55	12
81	55	12
82	57	12
83	62	12
84	66	12
85	67	12
86	67	12
87	69	12
88	69	12
89	70	12
90	75	12
91	81	12
92	89	12
93	95	12
94	95	12
95	96	12
96	96	12
97	97	12
98	98	12
99	101	12
100	109	12
101	112	12
102	117	12
103	131	12
104	131	12
105	142	12
106	146	12
107	146	12
108	157	12
109	157	12
110	161	12
111	163	12
112	166	12
113	180	12
114	181	12
115	181	12
116	181	12
117	183	12
118	188	12
119	188	12
120	188	12
121	189	12
122	189	12
123	194	12
124	194	12
125	202	12
126	204	12
127	211	12
128	211	12
129	224	12
130	226	12
131	226	12
132	235	12
133	239	12
134	242	12
135	243	12
136	243	12
137	246	12
138	246	12
139	250	12
140	252	12
141	256	12
142	259	12
143	261	12
144	266	12
145	266	12
146	266	12
147	266	12
148	275	12
149	277	12
150	283	12
151	285	12
152	288	12
153	294	12
154	303	12
155	309	12
156	309	12
157	318	12
158	322	12
159	322	12
160	322	12
161	330	12
162	334	12
163	339	12
164	339	12
165	346	12
166	348	12
167	351	12
168	354	12
169	354	12
170	367	12
171	367	12
172	389	12
173	394	12
174	399	12
175	409	12
176	409	12
177	411	12
178	414	12
179	414	12
180	414	12
181	423	12
182	423	12
183	429	12
184	429	12
185	431	12
186	432	12
187	435	12
188	449	12
189	452	12
190	453	12
191	455	12
192	457	12
193	457	12
194	469	12
195	469	12
196	473	12
197	479	12
198	479	12
199	479	12
200	480	12
201	481	12
202	481	12
203	481	12
204	485	12
205	485	12
206	485	12
207	488	12
208	491	12
209	499	12
210	503	12
211	508	12
212	510	12
213	510	12
214	510	12
215	511	12
216	521	12
217	521	12
218	528	12
219	529	12
220	535	12
221	543	12
222	558	12
223	559	12
224	574	12
225	579	12
226	580	12
227	617	12
228	617	12
229	623	12
230	635	12
231	662	12
232	665	12
233	665	12
234	665	12
235	665	12
236	689	12
237	689	12
238	693	12
239	693	12
240	695	12
241	696	12
242	698	12
243	703	12
244	705	12
245	707	12
246	707	12
247	714	12
248	726	12
249	728	12
250	730	12
251	733	12
252	733	12
253	750	12
254	750	12
255	753	12
256	754	12
257	762	12
258	763	12
259	768	12
260	777	12
261	778	12
262	781	12
263	781	12
264	100	126
265	140	126
266	140	126
267	149	126
268	153	126
269	153	126
270	156	126
271	156	126
272	156	126
273	158	126
274	247	126
275	280	126
276	280	126
277	343	126
278	343	126
279	350	126
280	351	126
281	354	126
282	355	126
283	419	126
284	419	126
285	430	126
286	488	126
287	529	126
288	534	126
289	552	126
290	552	126
291	579	126
292	586	126
293	608	126
294	618	126
295	678	126
296	732	126
297	732	126
298	764	126
299	258	232
300	622	313
301	86	116
302	87	116
303	106	116
304	173	116
305	207	116
306	538	116
307	575	116
308	669	324
309	254	229
310	27	62
311	168	62
312	228	62
313	237	62
314	313	62
315	358	62
316	364	62
317	424	62
318	492	62
319	526	62
320	611	62
321	659	62
322	351	261
323	122	138
324	394	138
325	591	138
326	742	138
327	126	142
328	297	142
329	347	142
330	763	142
331	246	226
332	136	157
333	178	181
334	631	181
335	102	128
336	139	128
337	262	128
338	263	128
339	516	128
340	699	128
341	758	128
342	457	287
343	612	287
344	645	319
345	276	237
346	439	237
347	606	237
348	100	127
349	102	127
350	149	127
351	208	127
352	208	127
353	261	127
354	280	127
355	280	127
356	343	127
357	419	127
358	555	127
359	586	127
360	732	127
361	740	127
362	764	127
363	597	308
364	263	233
365	516	233
366	12	31
367	18	31
368	21	31
369	26	31
370	38	31
371	43	31
372	44	31
373	54	31
374	57	31
375	59	31
376	73	31
377	77	31
378	79	31
379	84	31
380	110	31
381	119	31
382	125	31
383	139	31
384	140	31
385	144	31
386	145	31
387	165	31
388	172	31
389	173	31
390	174	31
391	184	31
392	189	31
393	207	31
394	210	31
395	219	31
396	236	31
397	251	31
398	254	31
399	258	31
400	264	31
401	291	31
402	319	31
403	323	31
404	325	31
405	326	31
406	336	31
407	357	31
408	373	31
409	384	31
410	390	31
411	399	31
412	403	31
413	407	31
414	412	31
415	422	31
416	428	31
417	431	31
418	433	31
419	439	31
420	446	31
421	452	31
422	453	31
423	459	31
424	465	31
425	481	31
426	501	31
427	502	31
428	507	31
429	507	31
430	509	31
431	525	31
432	536	31
433	551	31
434	572	31
435	586	31
436	588	31
437	594	31
438	600	31
439	606	31
440	619	31
441	619	31
442	639	31
443	645	31
444	648	31
445	653	31
446	663	31
447	666	31
448	666	31
449	681	31
450	684	31
451	686	31
452	710	31
453	715	31
454	722	31
455	725	31
456	727	31
457	736	31
458	737	31
459	737	31
460	743	31
461	746	31
462	751	31
463	754	31
464	760	31
465	767	31
466	772	31
467	773	31
468	774	31
469	775	31
470	321	252
471	427	252
472	490	252
473	35	71
474	88	71
475	110	71
476	119	71
477	137	71
478	139	71
479	416	71
480	536	71
481	578	71
482	587	71
483	594	71
484	648	71
485	653	71
486	684	71
487	132	151
488	160	151
489	267	151
490	279	151
491	290	151
492	300	151
493	366	151
494	366	151
495	387	151
496	388	151
497	472	151
498	472	151
499	482	151
500	583	151
501	605	151
502	605	151
503	640	151
504	668	151
505	669	151
506	669	151
507	674	151
508	674	151
509	690	151
510	690	151
511	690	151
512	727	151
513	35	73
514	88	73
515	119	73
516	124	73
517	137	73
518	195	73
519	363	73
520	380	73
521	416	73
522	532	73
523	536	73
524	636	73
525	648	73
526	671	73
527	684	73
528	194	192
529	705	327
530	321	250
531	402	250
532	239	225
533	343	225
534	340	257
535	685	257
536	154	173
537	249	173
538	427	173
539	719	173
540	189	191
541	264	191
542	357	191
543	551	191
544	725	191
545	754	191
546	772	191
547	234	222
548	314	222
549	320	222
550	496	222
551	547	300
552	662	300
553	1	1
554	2	1
555	5	1
556	6	1
557	9	1
558	10	1
559	12	1
560	14	1
561	16	1
562	27	1
563	45	1
564	50	1
565	53	1
566	76	1
567	89	1
568	91	1
569	93	1
570	95	1
571	97	1
572	105	1
573	119	1
574	120	1
575	126	1
576	129	1
577	136	1
578	144	1
579	145	1
580	147	1
581	151	1
582	151	1
583	153	1
584	154	1
585	156	1
586	163	1
587	165	1
588	172	1
589	173	1
590	175	1
591	176	1
592	189	1
593	204	1
594	207	1
595	213	1
596	214	1
597	217	1
598	225	1
599	240	1
600	241	1
601	249	1
602	262	1
603	263	1
604	264	1
605	265	1
606	266	1
607	270	1
608	278	1
609	281	1
610	282	1
611	297	1
612	299	1
613	313	1
614	319	1
615	336	1
616	342	1
617	343	1
618	346	1
619	347	1
620	351	1
621	352	1
622	365	1
623	370	1
624	374	1
625	384	1
626	406	1
627	407	1
628	419	1
629	425	1
630	426	1
631	427	1
632	432	1
633	435	1
634	439	1
635	447	1
636	453	1
637	459	1
638	477	1
639	495	1
640	499	1
641	504	1
642	512	1
643	513	1
644	514	1
645	515	1
646	517	1
647	518	1
648	530	1
649	531	1
650	533	1
651	534	1
652	536	1
653	538	1
654	551	1
655	552	1
656	563	1
657	584	1
658	589	1
659	607	1
660	609	1
661	614	1
662	618	1
663	626	1
664	635	1
665	655	1
666	659	1
667	664	1
668	676	1
669	681	1
670	691	1
671	694	1
672	696	1
673	697	1
674	699	1
675	701	1
676	703	1
677	705	1
678	706	1
679	707	1
680	708	1
681	709	1
682	710	1
683	713	1
684	716	1
685	717	1
686	718	1
687	719	1
688	721	1
689	722	1
690	724	1
691	725	1
692	726	1
693	728	1
694	734	1
695	737	1
696	738	1
697	739	1
698	741	1
699	742	1
700	745	1
701	747	1
702	748	1
703	749	1
704	751	1
705	754	1
706	755	1
707	756	1
708	760	1
709	761	1
710	763	1
711	764	1
712	765	1
713	773	1
714	774	1
715	775	1
716	776	1
717	778	1
718	779	1
719	780	1
720	781	1
721	69	106
722	98	106
723	266	106
724	394	106
725	409	106
726	411	106
727	559	106
728	759	106
729	766	106
730	778	106
731	647	321
732	213	205
733	394	205
734	16	42
735	18	42
736	151	42
737	154	42
738	165	42
739	175	42
740	249	42
741	427	42
742	719	42
743	157	175
744	76	109
745	12	36
746	33	36
747	33	36
748	44	36
749	52	36
750	58	36
751	63	36
752	72	36
753	73	36
754	73	36
755	105	36
756	125	36
757	141	36
758	168	36
759	173	36
760	173	36
761	176	36
762	184	36
763	209	36
764	209	36
765	210	36
766	222	36
767	230	36
768	234	36
769	236	36
770	248	36
771	251	36
772	260	36
773	278	36
774	278	36
775	291	36
776	313	36
777	317	36
778	335	36
779	352	36
780	362	36
781	368	36
782	368	36
783	373	36
784	377	36
785	378	36
786	379	36
787	410	36
788	417	36
789	417	36
790	422	36
791	433	36
792	454	36
793	456	36
794	461	36
795	461	36
796	466	36
797	470	36
798	483	36
799	505	36
800	507	36
801	514	36
802	525	36
803	525	36
804	536	36
805	548	36
806	568	36
807	576	36
808	582	36
809	582	36
810	608	36
811	613	36
812	633	36
813	637	36
814	642	36
815	644	36
816	645	36
817	656	36
818	657	36
819	667	36
820	670	36
821	679	36
822	683	36
823	691	36
824	711	36
825	711	36
826	721	36
827	724	36
828	724	36
829	729	36
830	735	36
831	736	36
832	300	242
833	36	75
834	55	75
835	181	75
836	243	75
837	266	75
838	322	75
839	409	75
840	414	75
841	479	75
842	485	75
843	510	75
844	521	75
845	665	75
846	733	75
847	5	13
848	6	13
849	6	13
850	8	13
851	15	13
852	15	13
853	22	13
854	22	13
855	24	13
856	24	13
857	30	13
858	30	13
859	31	13
860	32	13
861	32	13
862	34	13
863	42	13
864	42	13
865	43	13
866	60	13
867	60	13
868	65	13
869	65	13
870	66	13
871	66	13
872	76	13
873	80	13
874	82	13
875	82	13
876	95	13
877	97	13
878	107	13
879	107	13
880	109	13
881	109	13
882	116	13
883	116	13
884	117	13
885	120	13
886	120	13
887	121	13
888	121	13
889	129	13
890	135	13
891	135	13
892	136	13
893	136	13
894	136	13
895	136	13
896	136	13
897	136	13
898	138	13
899	138	13
900	143	13
901	143	13
902	147	13
903	162	13
904	163	13
905	164	13
906	164	13
907	170	13
908	171	13
909	177	13
910	177	13
911	182	13
912	182	13
913	189	13
914	191	13
915	191	13
916	193	13
917	193	13
918	194	13
919	194	13
920	198	13
921	198	13
922	200	13
923	200	13
924	204	13
925	206	13
926	206	13
927	209	13
928	209	13
929	211	13
930	212	13
931	212	13
932	217	13
933	218	13
934	224	13
935	247	13
936	247	13
937	250	13
938	255	13
939	255	13
940	266	13
941	270	13
942	271	13
943	271	13
944	272	13
945	272	13
946	273	13
947	273	13
948	277	13
949	283	13
950	283	13
951	287	13
952	292	13
953	292	13
954	294	13
955	298	13
956	298	13
957	302	13
958	304	13
959	305	13
960	305	13
961	307	13
962	307	13
963	310	13
964	310	13
965	315	13
966	315	13
967	316	13
968	316	13
969	328	13
970	328	13
971	331	13
972	331	13
973	332	13
974	332	13
975	341	13
976	341	13
977	341	13
978	344	13
979	344	13
980	346	13
981	359	13
982	359	13
983	360	13
984	360	13
985	365	13
986	365	13
987	372	13
988	372	13
989	381	13
990	381	13
991	395	13
992	395	13
993	396	13
994	396	13
995	397	13
996	397	13
997	401	13
998	401	13
999	417	13
1000	418	13
1001	418	13
1002	432	13
1003	435	13
1004	436	13
1005	452	13
1006	452	13
1007	452	13
1008	452	13
1009	463	13
1010	463	13
1011	467	13
1012	467	13
1013	468	13
1014	468	13
1015	474	13
1016	474	13
1017	476	13
1018	476	13
1019	478	13
1020	478	13
1021	480	13
1022	493	13
1023	493	13
1024	497	13
1025	498	13
1026	498	13
1027	506	13
1028	506	13
1029	517	13
1030	517	13
1031	518	13
1032	519	13
1033	519	13
1034	524	13
1035	527	13
1036	527	13
1037	531	13
1038	531	13
1039	540	13
1040	541	13
1041	541	13
1042	557	13
1043	557	13
1044	562	13
1045	562	13
1046	571	13
1047	571	13
1048	584	13
1049	584	13
1050	584	13
1051	592	13
1052	592	13
1053	593	13
1054	596	13
1055	596	13
1056	606	13
1057	607	13
1058	607	13
1059	615	13
1060	615	13
1061	617	13
1062	617	13
1063	620	13
1064	620	13
1065	630	13
1066	630	13
1067	639	13
1068	639	13
1069	641	13
1070	641	13
1071	643	13
1072	643	13
1073	650	13
1074	650	13
1075	656	13
1076	656	13
1077	658	13
1078	658	13
1079	658	13
1080	666	13
1081	666	13
1082	672	13
1083	672	13
1084	675	13
1085	675	13
1086	677	13
1087	677	13
1088	678	13
1089	681	13
1090	687	13
1091	687	13
1092	697	13
1093	697	13
1094	701	13
1095	702	13
1096	702	13
1097	703	13
1098	705	13
1099	705	13
1100	705	13
1101	707	13
1102	713	13
1103	717	13
1104	717	13
1105	726	13
1106	728	13
1107	734	13
1108	734	13
1109	738	13
1110	738	13
1111	739	13
1112	739	13
1113	744	13
1114	744	13
1115	745	13
1116	745	13
1117	748	13
1118	748	13
1119	749	13
1120	755	13
1121	755	13
1122	756	13
1123	761	13
1124	767	13
1125	781	13
1126	31	67
1127	54	67
1128	71	67
1129	76	67
1130	126	67
1131	150	67
1132	204	67
1133	207	67
1134	220	67
1135	278	67
1136	286	67
1137	288	67
1138	297	67
1139	343	67
1140	347	67
1141	370	67
1142	406	67
1143	426	67
1144	441	67
1145	500	67
1146	511	67
1147	522	67
1148	626	67
1149	704	67
1150	707	67
1151	710	67
1152	722	67
1153	728	67
1154	741	67
1155	746	67
1156	751	67
1157	760	67
1158	763	67
1159	774	67
1160	775	67
1161	776	67
1162	780	67
1163	439	279
1164	586	279
1165	606	279
1166	322	253
1167	2	7
1168	3	7
1169	4	7
1170	5	7
1171	6	7
1172	7	7
1173	9	7
1174	10	7
1175	11	7
1176	16	7
1177	17	7
1178	18	7
1179	20	7
1180	21	7
1181	22	7
1182	25	7
1183	26	7
1184	29	7
1185	31	7
1186	32	7
1187	34	7
1188	36	7
1189	37	7
1190	39	7
1191	40	7
1192	41	7
1193	42	7
1194	43	7
1195	46	7
1196	47	7
1197	48	7
1198	49	7
1199	50	7
1200	55	7
1201	56	7
1202	57	7
1203	59	7
1204	61	7
1205	62	7
1206	64	7
1207	65	7
1208	66	7
1209	67	7
1210	69	7
1211	70	7
1212	71	7
1213	74	7
1214	75	7
1215	76	7
1216	77	7
1217	78	7
1218	79	7
1219	81	7
1220	82	7
1221	84	7
1222	89	7
1223	91	7
1224	92	7
1225	93	7
1226	95	7
1227	96	7
1228	97	7
1229	98	7
1230	101	7
1231	102	7
1232	104	7
1233	107	7
1234	112	7
1235	117	7
1236	120	7
1237	122	7
1238	129	7
1239	130	7
1240	134	7
1241	136	7
1242	139	7
1243	140	7
1244	142	7
1245	143	7
1246	144	7
1247	145	7
1248	146	7
1249	147	7
1250	148	7
1251	149	7
1252	150	7
1253	151	7
1254	154	7
1255	156	7
1256	158	7
1257	159	7
1258	161	7
1259	162	7
1260	163	7
1261	165	7
1262	166	7
1263	169	7
1264	170	7
1265	171	7
1266	172	7
1267	180	7
1268	181	7
1269	183	7
1270	186	7
1271	189	7
1272	193	7
1273	207	7
1274	208	7
1275	211	7
1276	213	7
1277	214	7
1278	217	7
1279	218	7
1280	219	7
1281	220	7
1282	224	7
1283	226	7
1284	227	7
1285	239	7
1286	240	7
1287	243	7
1288	245	7
1289	249	7
1290	252	7
1291	255	7
1292	258	7
1293	259	7
1294	261	7
1295	262	7
1296	263	7
1297	264	7
1298	265	7
1299	268	7
1300	269	7
1301	270	7
1302	271	7
1303	274	7
1304	275	7
1305	277	7
1306	280	7
1307	281	7
1308	282	7
1309	286	7
1310	287	7
1311	288	7
1312	294	7
1313	302	7
1314	304	7
1315	307	7
1316	310	7
1317	312	7
1318	319	7
1319	320	7
1320	321	7
1321	322	7
1322	325	7
1323	326	7
1324	327	7
1325	328	7
1326	330	7
1327	331	7
1328	332	7
1329	336	7
1330	337	7
1331	338	7
1332	339	7
1333	340	7
1334	341	7
1335	342	7
1336	345	7
1337	347	7
1338	349	7
1339	351	7
1340	357	7
1341	360	7
1342	365	7
1343	370	7
1344	371	7
1345	372	7
1346	374	7
1347	381	7
1348	384	7
1349	389	7
1350	390	7
1351	394	7
1352	395	7
1353	396	7
1354	399	7
1355	405	7
1356	406	7
1357	407	7
1358	408	7
1359	409	7
1360	412	7
1361	414	7
1362	415	7
1363	418	7
1364	419	7
1365	420	7
1366	421	7
1367	425	7
1368	426	7
1369	427	7
1370	429	7
1371	431	7
1372	432	7
1373	435	7
1374	436	7
1375	437	7
1376	439	7
1377	441	7
1378	443	7
1379	446	7
1380	447	7
1381	448	7
1382	449	7
1383	450	7
1384	452	7
1385	455	7
1386	457	7
1387	459	7
1388	464	7
1389	469	7
1390	474	7
1391	477	7
1392	478	7
1393	479	7
1394	480	7
1395	481	7
1396	485	7
1397	488	7
1398	489	7
1399	490	7
1400	491	7
1401	494	7
1402	495	7
1403	499	7
1404	500	7
1405	502	7
1406	510	7
1407	511	7
1408	512	7
1409	513	7
1410	516	7
1411	517	7
1412	518	7
1413	521	7
1414	522	7
1415	528	7
1416	529	7
1417	530	7
1418	531	7
1419	534	7
1420	539	7
1421	540	7
1422	543	7
1423	546	7
1424	551	7
1425	552	7
1426	554	7
1427	555	7
1428	556	7
1429	559	7
1430	561	7
1431	563	7
1432	573	7
1433	574	7
1434	575	7
1435	580	7
1436	584	7
1437	586	7
1438	589	7
1439	592	7
1440	594	7
1441	599	7
1442	600	7
1443	610	7
1444	614	7
1445	615	7
1446	618	7
1447	622	7
1448	625	7
1449	626	7
1450	627	7
1451	628	7
1452	629	7
1453	635	7
1454	639	7
1455	643	7
1456	647	7
1457	651	7
1458	662	7
1459	663	7
1460	665	7
1461	678	7
1462	681	7
1463	685	7
1464	687	7
1465	688	7
1466	693	7
1467	694	7
1468	695	7
1469	696	7
1470	698	7
1471	699	7
1472	701	7
1473	702	7
1474	703	7
1475	704	7
1476	705	7
1477	707	7
1478	708	7
1479	709	7
1480	713	7
1481	714	7
1482	715	7
1483	717	7
1484	719	7
1485	722	7
1486	723	7
1487	725	7
1488	726	7
1489	727	7
1490	728	7
1491	730	7
1492	731	7
1493	732	7
1494	733	7
1495	739	7
1496	740	7
1497	742	7
1498	743	7
1499	745	7
1500	747	7
1501	749	7
1502	750	7
1503	753	7
1504	754	7
1505	755	7
1506	756	7
1507	757	7
1508	758	7
1509	760	7
1510	762	7
1511	763	7
1512	764	7
1513	765	7
1514	768	7
1515	769	7
1516	770	7
1517	771	7
1518	773	7
1519	774	7
1520	775	7
1521	776	7
1522	777	7
1523	778	7
1524	780	7
1525	781	7
1526	633	315
1527	157	174
1528	246	174
1529	303	174
1530	309	174
1531	334	174
1532	354	174
1533	354	174
1534	423	174
1535	423	174
1536	481	174
1537	481	174
1538	579	174
1539	579	174
1540	705	174
1541	223	210
1542	13	38
1543	110	38
1544	119	38
1545	128	38
1546	376	38
1547	454	38
1548	520	38
1549	608	38
1550	644	38
1551	684	38
1552	735	38
1553	17	44
1554	20	44
1555	66	44
1556	84	44
1557	87	44
1558	91	44
1559	93	44
1560	98	44
1561	117	44
1562	167	44
1563	180	44
1564	243	44
1565	266	44
1566	285	44
1567	365	44
1568	394	44
1569	431	44
1570	473	44
1571	482	44
1572	510	44
1573	558	44
1574	644	44
1575	693	44
1576	778	44
1577	78	110
1578	122	110
1579	258	110
1580	274	110
1581	371	110
1582	727	110
1583	649	322
1584	185	188
1585	221	188
1586	462	188
1587	545	188
1588	566	188
1589	670	188
1590	679	188
1591	682	188
1592	99	125
1593	127	125
1594	238	125
1595	711	125
1596	712	125
1597	141	160
1598	278	160
1599	378	160
1600	514	160
1601	556	160
1602	716	160
1603	721	160
1604	446	282
1605	6	14
1606	15	14
1607	22	14
1608	24	14
1609	30	14
1610	32	14
1611	42	14
1612	60	14
1613	65	14
1614	82	14
1615	109	14
1616	116	14
1617	120	14
1618	121	14
1619	135	14
1620	136	14
1621	138	14
1622	143	14
1623	164	14
1624	177	14
1625	182	14
1626	191	14
1627	193	14
1628	194	14
1629	198	14
1630	200	14
1631	206	14
1632	209	14
1633	212	14
1634	224	14
1635	250	14
1636	255	14
1637	271	14
1638	272	14
1639	273	14
1640	283	14
1641	287	14
1642	292	14
1643	298	14
1644	302	14
1645	305	14
1646	307	14
1647	310	14
1648	315	14
1649	316	14
1650	328	14
1651	331	14
1652	332	14
1653	344	14
1654	359	14
1655	360	14
1656	372	14
1657	381	14
1658	395	14
1659	397	14
1660	401	14
1661	418	14
1662	452	14
1663	463	14
1664	467	14
1665	468	14
1666	474	14
1667	476	14
1668	493	14
1669	498	14
1670	506	14
1671	517	14
1672	519	14
1673	527	14
1674	531	14
1675	541	14
1676	557	14
1677	562	14
1678	571	14
1679	584	14
1680	592	14
1681	596	14
1682	607	14
1683	617	14
1684	620	14
1685	630	14
1686	639	14
1687	641	14
1688	643	14
1689	650	14
1690	656	14
1691	658	14
1692	666	14
1693	672	14
1694	675	14
1695	677	14
1696	687	14
1697	697	14
1698	702	14
1699	717	14
1700	734	14
1701	738	14
1702	739	14
1703	744	14
1704	745	14
1705	748	14
1706	755	14
1707	4	11
1708	41	11
1709	60	11
1710	62	11
1711	81	11
1712	92	11
1713	94	11
1714	100	11
1715	113	11
1716	131	11
1717	142	11
1718	148	11
1719	158	11
1720	170	11
1721	199	11
1722	224	11
1723	227	11
1724	229	11
1725	235	11
1726	242	11
1727	250	11
1728	252	11
1729	259	11
1730	268	11
1731	269	11
1732	285	11
1733	287	11
1734	302	11
1735	308	11
1736	312	11
1737	318	11
1738	329	11
1739	334	11
1740	335	11
1741	337	11
1742	338	11
1743	340	11
1744	349	11
1745	353	11
1746	355	11
1747	360	11
1748	367	11
1749	408	11
1750	420	11
1751	421	11
1752	430	11
1753	434	11
1754	457	11
1755	473	11
1756	489	11
1757	503	11
1758	528	11
1759	535	11
1760	554	11
1761	558	11
1762	565	11
1763	568	11
1764	612	11
1765	623	11
1766	651	11
1767	685	11
1768	688	11
1769	689	11
1770	698	11
1771	702	11
1772	720	11
1773	770	11
1774	53	89
1775	53	89
1776	53	89
1777	85	89
1778	85	89
1779	89	89
1780	89	89
1781	89	89
1782	114	89
1783	114	89
1784	114	89
1785	134	89
1786	161	89
1787	179	89
1788	179	89
1789	185	89
1790	185	89
1791	185	89
1792	185	89
1793	187	89
1794	187	89
1795	187	89
1796	192	89
1797	192	89
1798	192	89
1799	196	89
1800	197	89
1801	201	89
1802	201	89
1803	201	89
1804	203	89
1805	203	89
1806	203	89
1807	214	89
1808	221	89
1809	221	89
1810	221	89
1811	222	89
1812	222	89
1813	240	89
1814	241	89
1815	241	89
1816	241	89
1817	257	89
1818	257	89
1819	284	89
1820	284	89
1821	289	89
1822	289	89
1823	289	89
1824	289	89
1825	293	89
1826	293	89
1827	293	89
1828	295	89
1829	295	89
1830	295	89
1831	295	89
1832	296	89
1833	296	89
1834	296	89
1835	301	89
1836	301	89
1837	301	89
1838	345	89
1839	362	89
1840	362	89
1841	362	89
1842	369	89
1843	369	89
1844	389	89
1845	389	89
1846	391	89
1847	393	89
1848	393	89
1849	398	89
1850	461	89
1851	461	89
1852	462	89
1853	462	89
1854	462	89
1855	471	89
1856	471	89
1857	471	89
1858	483	89
1859	484	89
1860	486	89
1861	486	89
1862	486	89
1863	492	89
1864	492	89
1865	504	89
1866	504	89
1867	504	89
1868	509	89
1869	509	89
1870	542	89
1871	545	89
1872	545	89
1873	545	89
1874	547	89
1875	548	89
1876	548	89
1877	553	89
1878	553	89
1879	553	89
1880	566	89
1881	566	89
1882	576	89
1883	576	89
1884	577	89
1885	581	89
1886	581	89
1887	598	89
1888	598	89
1889	598	89
1890	598	89
1891	601	89
1892	601	89
1893	614	89
1894	637	89
1895	640	89
1896	646	89
1897	646	89
1898	657	89
1899	661	89
1900	662	89
1901	664	89
1902	664	89
1903	664	89
1904	670	89
1905	676	89
1906	676	89
1907	679	89
1908	682	89
1909	682	89
1910	692	89
1911	692	89
1912	737	89
1913	775	89
1914	108	132
1915	111	132
1916	303	132
1917	350	132
1918	404	132
1919	445	132
1920	544	132
1921	569	132
1922	579	132
1923	624	132
1924	98	121
1925	130	121
1926	245	121
1927	546	121
1928	85	113
1929	37	77
1930	47	77
1931	50	77
1932	101	77
1933	159	77
1934	202	77
1935	256	77
1936	449	77
1937	543	77
1938	662	77
1939	714	77
1940	753	77
1941	768	77
1942	770	77
1943	94	119
1944	94	119
1945	100	119
1946	131	119
1947	131	119
1948	229	119
1949	235	119
1950	242	119
1951	268	119
1952	285	119
1953	303	119
1954	303	119
1955	308	119
1956	318	119
1957	334	119
1958	338	119
1959	355	119
1960	367	119
1961	420	119
1962	430	119
1963	457	119
1964	457	119
1965	473	119
1966	503	119
1967	535	119
1968	558	119
1969	558	119
1970	612	119
1971	612	119
1972	623	119
1973	689	119
1974	602	309
1975	651	323
1976	29	65
1977	128	145
1978	413	145
1979	152	171
1980	7	15
1981	37	15
1982	37	15
1983	40	15
1984	46	15
1985	47	15
1986	50	15
1987	50	15
1988	69	15
1989	71	15
1990	98	15
1991	98	15
1992	101	15
1993	101	15
1994	112	15
1995	130	15
1996	130	15
1997	157	15
1998	157	15
1999	159	15
2000	167	15
2001	172	15
2002	202	15
2003	239	15
2004	242	15
2005	245	15
2006	245	15
2007	246	15
2008	252	15
2009	256	15
2010	256	15
2011	268	15
2012	276	15
2013	348	15
2014	355	15
2015	394	15
2016	411	15
2017	421	15
2018	421	15
2019	430	15
2020	449	15
2021	449	15
2022	449	15
2023	455	15
2024	481	15
2025	488	15
2026	489	15
2027	491	15
2028	494	15
2029	500	15
2030	543	15
2031	543	15
2032	546	15
2033	546	15
2034	558	15
2035	559	15
2036	561	15
2037	625	15
2038	635	15
2039	651	15
2040	662	15
2041	662	15
2042	695	15
2043	695	15
2044	696	15
2045	714	15
2046	714	15
2047	753	15
2048	753	15
2049	762	15
2050	766	15
2051	768	15
2052	768	15
2053	770	15
2054	36	76
2055	55	76
2056	67	76
2057	181	76
2058	188	76
2059	266	76
2060	322	76
2061	414	76
2062	469	76
2063	479	76
2064	485	76
2065	510	76
2066	665	76
2067	303	245
2068	144	161
2069	336	161
2070	150	166
2071	275	166
2072	602	166
2073	704	166
2074	322	254
2075	7	17
2076	50	17
2077	256	17
2078	349	17
2079	449	17
2080	662	17
2081	412	272
2082	160	177
2083	223	177
2084	238	177
2085	387	177
2086	547	177
2087	572	177
2088	590	177
2089	593	177
2090	728	177
2091	737	177
2092	522	297
2093	775	297
2094	17	43
2095	41	43
2096	62	43
2097	81	43
2098	259	43
2099	269	43
2100	276	43
2101	349	43
2102	408	43
2103	421	43
2104	489	43
2105	698	43
2106	39	81
2107	152	81
2108	735	81
2109	225	214
2110	228	214
2111	323	214
2112	470	214
2113	54	96
2114	588	96
2115	8	18
2116	17	18
2117	20	18
2118	34	18
2119	37	18
2120	43	18
2121	46	18
2122	47	18
2123	47	18
2124	48	18
2125	56	18
2126	59	18
2127	66	18
2128	66	18
2129	66	18
2130	69	18
2131	94	18
2132	96	18
2133	97	18
2134	107	18
2135	117	18
2136	129	18
2137	145	18
2138	146	18
2139	147	18
2140	157	18
2141	159	18
2142	162	18
2143	170	18
2144	180	18
2145	183	18
2146	188	18
2147	202	18
2148	211	18
2149	218	18
2150	224	18
2151	226	18
2152	226	18
2153	229	18
2154	235	18
2155	246	18
2156	247	18
2157	250	18
2158	266	18
2159	268	18
2160	277	18
2161	288	18
2162	304	18
2163	309	18
2164	314	18
2165	318	18
2166	320	18
2167	321	18
2168	330	18
2169	339	18
2170	341	18
2171	354	18
2172	365	18
2173	367	18
2174	396	18
2175	415	18
2176	415	18
2177	429	18
2178	436	18
2179	443	18
2180	446	18
2181	478	18
2182	487	18
2183	487	18
2184	497	18
2185	508	18
2186	513	18
2187	558	18
2188	559	18
2189	574	18
2190	574	18
2191	580	18
2192	580	18
2193	584	18
2194	610	18
2195	615	18
2196	632	18
2197	651	18
2198	678	18
2199	693	18
2200	700	18
2201	703	18
2202	703	18
2203	705	18
2204	707	18
2205	714	18
2206	717	18
2207	726	18
2208	728	18
2209	753	18
2210	756	18
2211	758	18
2212	758	18
2213	758	18
2214	759	18
2215	762	18
2216	767	18
2217	768	18
2218	771	18
2219	777	18
2220	128	144
2221	26	59
2222	26	59
2223	39	59
2224	74	59
2225	74	59
2226	98	59
2227	99	59
2228	115	59
2229	115	59
2230	115	59
2231	133	59
2232	133	59
2233	141	59
2234	147	59
2235	147	59
2236	152	59
2237	169	59
2238	169	59
2239	210	59
2240	254	59
2241	264	59
2242	278	59
2243	278	59
2244	326	59
2245	326	59
2246	350	59
2247	378	59
2248	382	59
2249	382	59
2250	403	59
2251	403	59
2252	405	59
2253	405	59
2254	406	59
2255	428	59
2256	440	59
2257	440	59
2258	465	59
2259	465	59
2260	495	59
2261	495	59
2262	501	59
2263	520	59
2264	565	59
2265	604	59
2266	604	59
2267	604	59
2268	615	59
2269	619	59
2270	619	59
2271	619	59
2272	622	59
2273	622	59
2274	624	59
2275	629	59
2276	629	59
2277	655	59
2278	700	59
2279	700	59
2280	716	59
2281	723	59
2282	729	59
2283	729	59
2284	39	80
2285	115	80
2286	152	80
2287	152	80
2288	604	80
2289	619	80
2290	622	80
2291	735	80
2292	66	103
2293	487	103
2294	758	103
2295	49	86
2296	56	86
2297	108	86
2298	111	86
2299	162	86
2300	219	86
2301	258	86
2302	274	86
2303	281	86
2304	314	86
2305	320	86
2306	327	86
2307	341	86
2308	350	86
2309	402	86
2310	404	86
2311	415	86
2312	436	86
2313	442	86
2314	445	86
2315	529	86
2316	544	86
2317	556	86
2318	569	86
2319	624	86
2320	632	86
2321	757	86
2322	758	86
2323	223	209
2324	214	206
2325	11	29
2326	219	29
2327	327	29
2328	773	29
2329	452	284
2330	658	284
2331	118	135
2332	533	135
2333	758	135
2334	686	325
2335	13	40
2336	23	40
2337	35	40
2338	44	40
2339	54	40
2340	73	40
2341	83	40
2342	119	40
2343	128	40
2344	128	40
2345	133	40
2346	174	40
2347	190	40
2348	195	40
2349	267	40
2350	333	40
2351	363	40
2352	368	40
2353	368	40
2354	375	40
2355	376	40
2356	386	40
2357	416	40
2358	428	40
2359	433	40
2360	440	40
2361	451	40
2362	466	40
2363	501	40
2364	532	40
2365	536	40
2366	564	40
2367	570	40
2368	578	40
2369	582	40
2370	587	40
2371	588	40
2372	603	40
2373	609	40
2374	636	40
2375	648	40
2376	683	40
2377	684	40
2378	690	40
2379	735	40
2380	752	40
2381	44	83
2382	54	83
2383	172	83
2384	189	83
2385	251	83
2386	264	83
2387	323	83
2388	326	83
2389	357	83
2390	403	83
2391	551	83
2392	619	83
2393	686	83
2394	725	83
2395	736	83
2396	754	83
2397	772	83
2398	11	27
2399	282	27
2400	774	27
2401	51	88
2402	68	88
2403	68	88
2404	118	88
2405	123	88
2406	123	88
2407	205	88
2408	215	88
2409	231	88
2410	279	88
2411	299	88
2412	324	88
2413	358	88
2414	391	88
2415	392	88
2416	398	88
2417	400	88
2418	413	88
2419	438	88
2420	458	88
2421	472	88
2422	475	88
2423	484	88
2424	484	88
2425	496	88
2426	509	88
2427	509	88
2428	523	88
2429	523	88
2430	537	88
2431	567	88
2432	611	88
2433	616	88
2434	616	88
2435	621	88
2436	640	88
2437	660	88
2438	661	88
2439	674	88
2440	692	88
2441	737	88
2442	131	148
2443	367	148
2444	457	148
2445	90	118
2446	377	118
2447	642	118
2448	298	240
2449	643	240
2450	475	289
2451	611	311
2452	2	8
2453	10	8
2454	16	8
2455	40	8
2456	45	8
2457	50	8
2458	95	8
2459	154	8
2460	155	8
2461	224	8
2462	239	8
2463	240	8
2464	249	8
2465	265	8
2466	342	8
2467	425	8
2468	447	8
2469	455	8
2470	477	8
2471	494	8
2472	500	8
2473	543	8
2474	552	8
2475	600	8
2476	618	8
2477	626	8
2478	663	8
2479	696	8
2480	719	8
2481	725	8
2482	740	8
2483	763	8
2484	636	317
2485	653	317
2486	21	52
2487	25	52
2488	25	52
2489	56	52
2490	61	52
2491	94	52
2492	98	52
2493	108	52
2494	108	52
2495	111	52
2496	111	52
2497	112	52
2498	112	52
2499	122	52
2500	126	52
2501	130	52
2502	145	52
2503	157	52
2504	157	52
2505	159	52
2506	180	52
2507	213	52
2508	213	52
2509	229	52
2510	235	52
2511	246	52
2512	303	52
2513	303	52
2514	309	52
2515	314	52
2516	320	52
2517	321	52
2518	321	52
2519	339	52
2520	350	52
2521	350	52
2522	402	52
2523	402	52
2524	404	52
2525	404	52
2526	423	52
2527	423	52
2528	442	52
2529	443	52
2530	445	52
2531	445	52
2532	448	52
2533	448	52
2534	499	52
2535	508	52
2536	534	52
2537	544	52
2538	544	52
2539	569	52
2540	569	52
2541	579	52
2542	579	52
2543	591	52
2544	591	52
2545	623	52
2546	624	52
2547	624	52
2548	626	52
2549	731	52
2550	758	52
2551	765	52
2552	779	52
2553	9	20
2554	10	20
2555	11	20
2556	14	20
2557	14	20
2558	16	20
2559	16	20
2560	119	20
2561	144	20
2562	151	20
2563	151	20
2564	151	20
2565	154	20
2566	165	20
2567	175	20
2568	175	20
2569	189	20
2570	214	20
2571	240	20
2572	244	20
2573	249	20
2574	254	20
2575	262	20
2576	264	20
2577	265	20
2578	266	20
2579	281	20
2580	282	20
2581	286	20
2582	307	20
2583	336	20
2584	356	20
2585	357	20
2586	357	20
2587	357	20
2588	374	20
2589	425	20
2590	426	20
2591	441	20
2592	453	20
2593	459	20
2594	515	20
2595	522	20
2596	522	20
2597	526	20
2598	533	20
2599	539	20
2600	551	20
2601	573	20
2602	575	20
2603	581	20
2604	589	20
2605	602	20
2606	637	20
2607	647	20
2608	707	20
2609	707	20
2610	708	20
2611	709	20
2612	718	20
2613	719	20
2614	725	20
2615	725	20
2616	728	20
2617	728	20
2618	741	20
2619	746	20
2620	746	20
2621	747	20
2622	751	20
2623	754	20
2624	754	20
2625	760	20
2626	763	20
2627	772	20
2628	772	20
2629	772	20
2630	774	20
2631	775	20
2632	775	20
2633	776	20
2634	779	20
2635	780	20
2636	47	84
2637	66	84
2638	226	84
2639	574	84
2640	580	84
2641	703	84
2642	636	316
2643	116	134
2644	138	134
2645	155	134
2646	641	134
2647	658	134
2648	324	255
2649	400	255
2650	438	255
2651	496	255
2652	661	255
2653	149	164
2654	555	164
2655	586	164
2656	732	164
2657	57	98
2658	507	98
2659	737	98
2660	384	271
2661	390	271
2662	399	271
2663	407	271
2664	412	271
2665	707	330
2666	10	21
2667	104	21
2668	754	21
2669	763	21
2670	44	82
2671	251	82
2672	619	82
2673	736	82
2674	136	156
2675	690	326
2676	34	69
2677	162	69
2678	258	69
2679	304	69
2680	341	69
2681	396	69
2682	415	69
2683	436	69
2684	478	69
2685	487	69
2686	717	69
2687	758	69
2688	11	25
2689	52	25
2690	482	25
2691	613	25
2692	774	335
2693	10	22
2694	23	22
2695	27	22
2696	51	22
2697	68	22
2698	83	22
2699	90	22
2700	118	22
2701	123	22
2702	127	22
2703	178	22
2704	179	22
2705	179	22
2706	185	22
2707	196	22
2708	197	22
2709	207	22
2710	214	22
2711	237	22
2712	241	22
2713	257	22
2714	260	22
2715	284	22
2716	299	22
2717	311	22
2718	311	22
2719	323	22
2720	333	22
2721	357	22
2722	363	22
2723	363	22
2724	375	22
2725	375	22
2726	385	22
2727	386	22
2728	391	22
2729	392	22
2730	400	22
2731	438	22
2732	451	22
2733	458	22
2734	472	22
2735	483	22
2736	484	22
2737	504	22
2738	509	22
2739	515	22
2740	538	22
2741	542	22
2742	564	22
2743	567	22
2744	575	22
2745	578	22
2746	578	22
2747	581	22
2748	585	22
2749	597	22
2750	601	22
2751	609	22
2752	616	22
2753	621	22
2754	648	22
2755	676	22
2756	692	22
2757	706	22
2758	710	22
2759	737	22
2760	737	22
2761	760	22
2762	767	22
2763	772	22
2764	774	22
2765	775	22
2766	780	22
2767	509	295
2768	208	200
2769	280	200
2770	343	200
2771	584	303
2772	1	3
2773	3	3
2774	9	3
2775	11	3
2776	18	3
2777	25	3
2778	26	3
2779	29	3
2780	39	3
2781	49	3
2782	57	3
2783	59	3
2784	61	3
2785	64	3
2786	66	3
2787	74	3
2788	75	3
2789	77	3
2790	78	3
2791	79	3
2792	91	3
2793	93	3
2794	102	3
2795	104	3
2796	112	3
2797	122	3
2798	134	3
2799	140	3
2800	147	3
2801	150	3
2802	153	3
2803	161	3
2804	169	3
2805	170	3
2806	186	3
2807	213	3
2808	247	3
2809	254	3
2810	263	3
2811	264	3
2812	275	3
2813	304	3
2814	308	3
2815	319	3
2816	325	3
2817	326	3
2818	339	3
2819	345	3
2820	365	3
2821	370	3
2822	371	3
2823	405	3
2824	406	3
2825	420	3
2826	427	3
2827	431	3
2828	439	3
2829	441	3
2830	443	3
2831	448	3
2832	464	3
2833	490	3
2834	495	3
2835	499	3
2836	502	3
2837	513	3
2838	518	3
2839	534	3
2840	556	3
2841	573	3
2842	591	3
2843	594	3
2844	599	3
2845	614	3
2846	615	3
2847	622	3
2848	627	3
2849	628	3
2850	629	3
2851	647	3
2852	694	3
2853	695	3
2854	700	3
2855	704	3
2856	708	3
2857	715	3
2858	722	3
2859	723	3
2860	727	3
2861	730	3
2862	732	3
2863	742	3
2864	743	3
2865	747	3
2866	756	3
2867	757	3
2868	764	3
2869	765	3
2870	769	3
2871	771	3
2872	779	3
2873	128	143
2874	128	143
2875	413	143
2876	570	143
2877	64	100
2878	89	100
2879	389	100
2880	599	100
2881	627	100
2882	628	100
2883	60	99
2884	72	99
2885	86	99
2886	105	99
2887	106	99
2888	107	99
2889	116	99
2890	116	99
2891	136	99
2892	138	99
2893	155	99
2894	155	99
2895	173	99
2896	176	99
2897	206	99
2898	217	99
2899	217	99
2900	298	99
2901	298	99
2902	352	99
2903	365	99
2904	365	99
2905	452	99
2906	476	99
2907	524	99
2908	541	99
2909	541	99
2910	547	99
2911	584	99
2912	641	99
2913	641	99
2914	643	99
2915	658	99
2916	658	99
2917	21	51
2918	404	51
2919	639	318
2920	131	149
2921	558	149
2922	267	234
2923	300	234
2924	366	234
2925	472	234
2926	690	234
2927	727	234
2928	481	290
2929	750	290
2930	383	269
2931	669	269
2932	11	23
2933	11	23
2934	52	23
2935	52	23
2936	482	23
2937	482	23
2938	613	23
2939	511	296
2940	730	296
2941	707	329
2942	84	111
2943	509	111
2944	54	94
2945	84	94
2946	86	94
2947	87	94
2948	173	94
2949	286	94
2950	373	94
2951	588	94
2952	705	328
2953	622	312
2954	622	312
2955	124	139
2956	137	139
2957	139	139
2958	160	139
2959	205	139
2960	216	139
2961	219	139
2962	356	139
2963	388	139
2964	403	139
2965	444	139
2966	450	139
2967	460	139
2968	475	139
2969	494	139
2970	496	139
2971	585	139
2972	587	139
2973	636	139
2974	636	139
2975	638	139
2976	653	139
2977	653	139
2978	662	139
2979	671	139
2980	2	6
2981	7	6
2982	40	6
2983	100	6
2984	158	6
2985	183	6
2986	261	6
2987	287	6
2988	334	6
2989	338	6
2990	349	6
2991	351	6
2992	351	6
2993	354	6
2994	394	6
2995	449	6
2996	481	6
2997	488	6
2998	499	6
2999	528	6
3000	698	6
3001	740	6
3002	363	263
3003	416	263
3004	671	263
3005	12	35
3006	28	35
3007	45	35
3008	58	35
3009	63	35
3010	72	35
3011	87	35
3012	88	35
3013	105	35
3014	106	35
3015	125	35
3016	141	35
3017	155	35
3018	168	35
3019	173	35
3020	176	35
3021	184	35
3022	197	35
3023	209	35
3024	210	35
3025	216	35
3026	225	35
3027	231	35
3028	234	35
3029	236	35
3030	248	35
3031	278	35
3032	291	35
3033	296	35
3034	300	35
3035	313	35
3036	335	35
3037	352	35
3038	361	35
3039	362	35
3040	369	35
3041	373	35
3042	378	35
3043	383	35
3044	393	35
3045	410	35
3046	417	35
3047	422	35
3048	424	35
3049	433	35
3050	456	35
3051	460	35
3052	465	35
3053	470	35
3054	471	35
3055	472	35
3056	505	35
3057	514	35
3058	525	35
3059	532	35
3060	536	35
3061	568	35
3062	576	35
3063	582	35
3064	583	35
3065	588	35
3066	637	35
3067	642	35
3068	645	35
3069	655	35
3070	691	35
3071	706	35
3072	711	35
3073	720	35
3074	721	35
3075	724	35
3076	774	333
3077	20	50
3078	69	50
3079	266	50
3080	276	236
3081	384	236
3082	390	236
3083	399	236
3084	407	236
3085	412	236
3086	439	236
3087	606	236
3088	647	236
3089	2	9
3090	499	9
3091	534	9
3092	719	9
3093	269	235
3094	119	136
3095	53	90
3096	68	90
3097	114	90
3098	118	90
3099	123	90
3100	185	90
3101	187	90
3102	192	90
3103	196	90
3104	197	90
3105	201	90
3106	221	90
3107	257	90
3108	279	90
3109	284	90
3110	293	90
3111	362	90
3112	369	90
3113	385	90
3114	391	90
3115	392	90
3116	393	90
3117	398	90
3118	400	90
3119	458	90
3120	472	90
3121	483	90
3122	484	90
3123	509	90
3124	545	90
3125	547	90
3126	553	90
3127	567	90
3128	581	90
3129	601	90
3130	616	90
3131	621	90
3132	640	90
3133	646	90
3134	659	90
3135	661	90
3136	662	90
3137	670	90
3138	679	90
3139	682	90
3140	692	90
3141	737	90
3142	775	90
3143	38	79
3144	45	79
3145	197	79
3146	216	79
3147	231	79
3148	299	79
3149	311	79
3150	342	79
3151	383	79
3152	444	79
3153	477	79
3154	515	79
3155	526	79
3156	536	79
3157	598	79
3158	609	79
3159	710	79
3160	173	179
3161	459	288
3162	254	228
3163	440	280
3164	520	280
3165	233	219
3166	233	219
3167	649	219
3168	649	219
3169	649	219
3170	11	30
3171	21	30
3172	78	30
3173	258	30
3174	404	30
3175	499	30
3176	98	122
3177	66	102
3178	555	102
3179	558	102
3180	17	45
3181	41	45
3182	60	45
3183	62	45
3184	81	45
3185	92	45
3186	94	45
3187	100	45
3188	113	45
3189	131	45
3190	142	45
3191	148	45
3192	199	45
3193	199	45
3194	227	45
3195	229	45
3196	235	45
3197	242	45
3198	250	45
3199	252	45
3200	259	45
3201	269	45
3202	269	45
3203	276	45
3204	285	45
3205	287	45
3206	302	45
3207	308	45
3208	312	45
3209	318	45
3210	329	45
3211	334	45
3212	335	45
3213	337	45
3214	338	45
3215	340	45
3216	349	45
3217	349	45
3218	353	45
3219	355	45
3220	367	45
3221	408	45
3222	420	45
3223	421	45
3224	430	45
3225	434	45
3226	457	45
3227	473	45
3228	489	45
3229	503	45
3230	528	45
3231	535	45
3232	554	45
3233	558	45
3234	565	45
3235	568	45
3236	612	45
3237	623	45
3238	651	45
3239	685	45
3240	685	45
3241	688	45
3242	689	45
3243	698	45
3244	720	45
3245	770	45
3246	341	259
3247	210	204
3248	230	215
3249	362	215
3250	466	215
3251	4	10
3252	41	10
3253	41	10
3254	60	10
3255	60	10
3256	62	10
3257	62	10
3258	81	10
3259	81	10
3260	92	10
3261	92	10
3262	94	10
3263	94	10
3264	94	10
3265	100	10
3266	100	10
3267	100	10
3268	113	10
3269	113	10
3270	131	10
3271	131	10
3272	131	10
3273	142	10
3274	142	10
3275	148	10
3276	148	10
3277	158	10
3278	170	10
3279	199	10
3280	199	10
3281	224	10
3282	227	10
3283	227	10
3284	229	10
3285	229	10
3286	229	10
3287	235	10
3288	235	10
3289	235	10
3290	242	10
3291	242	10
3292	242	10
3293	250	10
3294	250	10
3295	252	10
3296	252	10
3297	259	10
3298	259	10
3299	268	10
3300	268	10
3301	269	10
3302	269	10
3303	276	10
3304	285	10
3305	285	10
3306	285	10
3307	287	10
3308	287	10
3309	302	10
3310	302	10
3311	303	10
3312	308	10
3313	308	10
3314	308	10
3315	312	10
3316	312	10
3317	318	10
3318	318	10
3319	318	10
3320	329	10
3321	329	10
3322	334	10
3323	334	10
3324	334	10
3325	335	10
3326	335	10
3327	337	10
3328	337	10
3329	338	10
3330	338	10
3331	338	10
3332	340	10
3333	340	10
3334	340	10
3335	340	10
3336	349	10
3337	349	10
3338	353	10
3339	353	10
3340	355	10
3341	355	10
3342	355	10
3343	360	10
3344	367	10
3345	367	10
3346	367	10
3347	408	10
3348	408	10
3349	420	10
3350	420	10
3351	420	10
3352	421	10
3353	421	10
3354	430	10
3355	430	10
3356	430	10
3357	434	10
3358	434	10
3359	457	10
3360	457	10
3361	457	10
3362	473	10
3363	473	10
3364	473	10
3365	489	10
3366	489	10
3367	503	10
3368	503	10
3369	503	10
3370	528	10
3371	528	10
3372	535	10
3373	535	10
3374	535	10
3375	554	10
3376	554	10
3377	554	10
3378	558	10
3379	558	10
3380	558	10
3381	565	10
3382	565	10
3383	568	10
3384	568	10
3385	612	10
3386	612	10
3387	612	10
3388	623	10
3389	623	10
3390	623	10
3391	651	10
3392	651	10
3393	651	10
3394	685	10
3395	685	10
3396	685	10
3397	688	10
3398	688	10
3399	689	10
3400	689	10
3401	689	10
3402	698	10
3403	698	10
3404	702	10
3405	720	10
3406	720	10
3407	770	10
3408	770	10
3409	311	247
3410	363	247
3411	375	247
3412	578	247
3413	585	247
3414	648	247
3415	232	217
3416	456	217
3417	579	301
3418	21	53
3419	64	53
3420	213	53
3421	258	53
3422	591	53
3423	769	53
3424	124	140
3425	137	140
3426	151	140
3427	160	140
3428	356	140
3429	444	140
3430	636	140
3431	7	16
3432	50	16
3433	256	16
3434	349	16
3435	449	16
3436	449	16
3437	662	16
3438	54	95
3439	71	95
3440	500	95
3441	86	114
3442	90	114
3443	90	114
3444	99	114
3445	99	114
3446	106	114
3447	113	114
3448	127	114
3449	127	114
3450	127	114
3451	160	114
3452	178	114
3453	178	114
3454	179	114
3455	190	114
3456	223	114
3457	223	114
3458	238	114
3459	238	114
3460	267	114
3461	292	114
3462	300	114
3463	305	114
3464	306	114
3465	315	114
3466	316	114
3467	366	114
3468	377	114
3469	379	114
3470	379	114
3471	468	114
3472	475	114
3473	524	114
3474	538	114
3475	583	114
3476	590	114
3477	593	114
3478	621	114
3479	631	114
3480	631	114
3481	633	114
3482	633	114
3483	642	114
3484	652	114
3485	673	114
3486	680	114
3487	690	114
3488	711	114
3489	711	114
3490	712	114
3491	712	114
3492	712	114
3493	223	212
3494	379	212
3495	673	212
3496	11	26
3497	165	26
3498	175	26
3499	258	26
3500	282	26
3501	336	26
3502	384	26
3503	390	26
3504	394	26
3505	399	26
3506	407	26
3507	412	26
3508	437	26
3509	459	26
3510	539	26
3511	573	26
3512	575	26
3513	595	26
3514	728	26
3515	751	26
3516	774	26
3517	415	273
3518	487	273
3519	758	273
3520	254	230
3521	12	32
3522	210	32
3523	219	32
3524	236	32
3525	254	32
3526	319	32
3527	428	32
3528	433	32
3529	501	32
3530	525	32
3531	588	32
3532	645	32
3533	648	32
3534	666	32
3535	727	32
3536	68	105
3537	123	105
3538	484	105
3539	509	105
3540	523	105
3541	616	105
3542	774	334
3543	1	2
3544	3	2
3545	3	2
3546	9	2
3547	9	2
3548	11	2
3549	18	2
3550	18	2
3551	25	2
3552	25	2
3553	25	2
3554	26	2
3555	26	2
3556	29	2
3557	29	2
3558	39	2
3559	39	2
3560	49	2
3561	57	2
3562	57	2
3563	59	2
3564	59	2
3565	61	2
3566	61	2
3567	64	2
3568	66	2
3569	74	2
3570	74	2
3571	75	2
3572	75	2
3573	77	2
3574	77	2
3575	78	2
3576	79	2
3577	91	2
3578	93	2
3579	93	2
3580	102	2
3581	104	2
3582	112	2
3583	112	2
3584	122	2
3585	122	2
3586	134	2
3587	134	2
3588	140	2
3589	145	2
3590	147	2
3591	147	2
3592	150	2
3593	150	2
3594	150	2
3595	153	2
3596	161	2
3597	169	2
3598	169	2
3599	170	2
3600	186	2
3601	213	2
3602	244	2
3603	247	2
3604	254	2
3605	254	2
3606	263	2
3607	263	2
3608	264	2
3609	275	2
3610	275	2
3611	275	2
3612	304	2
3613	308	2
3614	319	2
3615	325	2
3616	325	2
3617	326	2
3618	326	2
3619	339	2
3620	345	2
3621	345	2
3622	365	2
3623	370	2
3624	370	2
3625	371	2
3626	374	2
3627	405	2
3628	405	2
3629	406	2
3630	420	2
3631	420	2
3632	427	2
3633	431	2
3634	431	2
3635	439	2
3636	439	2
3637	441	2
3638	443	2
3639	443	2
3640	448	2
3641	448	2
3642	448	2
3643	464	2
3644	464	2
3645	465	2
3646	490	2
3647	490	2
3648	495	2
3649	499	2
3650	499	2
3651	502	2
3652	513	2
3653	518	2
3654	534	2
3655	556	2
3656	573	2
3657	591	2
3658	591	2
3659	594	2
3660	594	2
3661	599	2
3662	599	2
3663	602	2
3664	612	2
3665	613	2
3666	614	2
3667	614	2
3668	615	2
3669	615	2
3670	619	2
3671	622	2
3672	622	2
3673	627	2
3674	627	2
3675	628	2
3676	628	2
3677	629	2
3678	633	2
3679	647	2
3680	648	2
3681	655	2
3682	694	2
3683	694	2
3684	695	2
3685	700	2
3686	700	2
3687	704	2
3688	704	2
3689	704	2
3690	708	2
3691	715	2
3692	715	2
3693	722	2
3694	722	2
3695	723	2
3696	727	2
3697	730	2
3698	732	2
3699	736	2
3700	742	2
3701	742	2
3702	743	2
3703	747	2
3704	756	2
3705	757	2
3706	764	2
3707	765	2
3708	765	2
3709	769	2
3710	769	2
3711	771	2
3712	779	2
3713	779	2
3714	120	137
3715	177	137
3716	182	137
3717	193	137
3718	307	137
3719	359	137
3720	359	137
3721	447	137
3722	488	137
3723	607	137
3724	630	137
3725	705	137
3726	443	281
3727	464	281
3728	232	216
3729	634	216
3730	98	124
3731	115	124
3732	115	124
3733	133	124
3734	152	124
3735	169	124
3736	350	124
3737	604	124
3738	604	124
3739	619	124
3740	619	124
3741	622	124
3742	624	124
3743	723	124
3744	22	54
3745	27	54
3746	82	54
3747	126	54
3748	139	54
3749	151	54
3750	171	54
3751	177	54
3752	189	54
3753	191	54
3754	196	54
3755	214	54
3756	262	54
3757	270	54
3758	287	54
3759	297	54
3760	302	54
3761	342	54
3762	356	54
3763	453	54
3764	497	54
3765	515	54
3766	517	54
3767	527	54
3768	530	54
3769	531	54
3770	533	54
3771	540	54
3772	581	54
3773	585	54
3774	589	54
3775	610	54
3776	638	54
3777	697	54
3778	701	54
3779	709	54
3780	713	54
3781	718	54
3782	741	54
3783	746	54
3784	748	54
3785	774	54
3786	775	54
3787	776	54
3788	376	267
3789	209	202
3790	212	202
3791	214	202
3792	232	202
3793	232	202
3794	287	202
3795	302	202
3796	311	202
3797	323	202
3798	492	202
3799	498	202
3800	531	202
3801	590	202
3802	634	202
3803	634	202
3804	675	202
3805	702	202
3806	177	180
3807	488	180
3808	705	180
3809	38	78
3810	43	78
3811	77	78
3812	79	78
3813	145	78
3814	452	78
3815	715	78
3816	743	78
3817	178	182
3818	667	182
3819	673	182
3820	56	97
3821	165	97
3822	165	97
3823	267	97
3824	356	97
3825	356	97
3826	427	97
3827	450	97
3828	450	97
3829	460	97
3830	460	97
3831	471	97
3832	563	97
3833	563	97
3834	585	97
3835	632	97
3836	662	97
3837	683	97
3838	683	97
3839	64	101
3840	599	101
3841	627	101
3842	628	101
3843	300	241
3844	366	241
3845	472	241
3846	583	241
3847	690	241
3848	86	115
3849	87	115
3850	87	115
3851	106	115
3852	173	115
3853	207	115
3854	207	115
3855	538	115
3856	538	115
3857	575	115
3858	140	159
3859	465	159
3860	619	159
3861	775	159
3862	421	274
3863	223	211
3864	53	92
3865	85	92
3866	89	92
3867	114	92
3868	185	92
3869	185	92
3870	192	92
3871	201	92
3872	203	92
3873	221	92
3874	221	92
3875	222	92
3876	241	92
3877	289	92
3878	293	92
3879	295	92
3880	296	92
3881	301	92
3882	362	92
3883	369	92
3884	462	92
3885	462	92
3886	471	92
3887	486	92
3888	504	92
3889	545	92
3890	545	92
3891	548	92
3892	553	92
3893	566	92
3894	576	92
3895	598	92
3896	646	92
3897	657	92
3898	664	92
3899	670	92
3900	679	92
3901	682	92
3902	196	193
3903	257	193
3904	284	193
3905	391	193
3906	398	193
3907	461	193
3908	484	193
3909	601	193
3910	640	193
3911	661	193
3912	692	193
3913	217	207
3914	365	207
3915	278	238
3916	428	276
3917	501	276
3918	437	278
3919	317	249
3920	233	220
3921	649	220
3922	491	293
3923	662	293
3924	157	176
3925	423	176
3926	179	184
3927	147	163
3928	233	221
3929	649	221
3930	103	129
3931	119	129
3932	234	129
3933	363	129
3934	416	129
3935	505	129
3936	606	129
3937	654	129
3938	671	129
3939	125	141
3940	174	141
3941	291	141
3942	373	141
3943	422	141
3944	507	141
3945	737	141
3946	90	117
3947	127	117
3948	712	117
3949	179	183
3950	482	291
3951	223	208
3952	223	208
3953	223	208
3954	223	208
3955	307	246
3956	637	246
3957	199	194
3958	199	194
3959	269	194
3960	25	58
3961	448	58
3962	199	196
3963	199	196
3964	103	130
3965	416	130
3966	690	130
3967	18	48
3968	349	260
3969	70	107
3970	148	107
3971	161	107
3972	255	107
3973	312	107
3974	340	107
3975	470	107
3976	512	107
3977	584	304
3978	135	153
3979	383	153
3980	572	153
3981	669	153
3982	595	307
3983	26	60
3984	572	60
3985	225	213
3986	228	213
3987	323	213
3988	470	213
3989	112	133
3990	411	133
3991	695	133
3992	290	239
3993	388	239
3994	605	239
3995	674	239
3996	94	120
3997	128	147
3998	26	61
3999	115	61
4000	428	275
4001	501	275
4002	645	275
4003	727	275
4004	48	85
4005	55	85
4006	96	85
4007	188	85
4008	226	85
4009	266	85
4010	429	85
4011	508	85
4012	665	85
4013	689	85
4014	693	85
4015	777	85
4016	450	283
4017	636	283
4018	636	283
4019	653	283
4020	23	55
4021	128	55
4022	128	55
4023	413	55
4024	451	55
4025	570	55
4026	570	55
4027	648	55
4028	673	55
4029	690	55
4030	752	55
4031	51	87
4032	64	87
4033	203	87
4034	260	87
4035	380	87
4036	438	87
4037	472	87
4038	548	87
4039	74	108
4040	141	108
4041	141	108
4042	147	108
4043	278	108
4044	278	108
4045	326	108
4046	378	108
4047	382	108
4048	403	108
4049	405	108
4050	465	108
4051	495	108
4052	514	108
4053	556	108
4054	604	108
4055	615	108
4056	619	108
4057	629	108
4058	655	108
4059	700	108
4060	716	108
4061	721	108
4062	729	108
4063	150	167
4064	343	167
4065	441	167
4066	704	167
4067	728	167
4068	53	91
4069	89	91
4070	114	91
4071	185	91
4072	187	91
4073	192	91
4074	201	91
4075	221	91
4076	241	91
4077	289	91
4078	293	91
4079	295	91
4080	296	91
4081	301	91
4082	389	91
4083	462	91
4084	471	91
4085	486	91
4086	504	91
4087	545	91
4088	566	91
4089	598	91
4090	664	91
4091	182	185
4092	193	185
4093	359	185
4094	447	185
4095	607	185
4096	630	185
4097	300	243
4098	537	298
4099	758	298
4100	737	332
4101	132	150
4102	215	150
4103	290	150
4104	306	150
4105	324	150
4106	361	150
4107	387	150
4108	523	150
4109	645	150
4110	654	150
4111	660	150
4112	668	150
4113	151	170
4114	27	63
4115	38	63
4116	45	63
4117	54	63
4118	168	63
4119	197	63
4120	216	63
4121	228	63
4122	231	63
4123	299	63
4124	311	63
4125	313	63
4126	342	63
4127	358	63
4128	364	63
4129	383	63
4130	424	63
4131	444	63
4132	477	63
4133	492	63
4134	511	63
4135	515	63
4136	526	63
4137	526	63
4138	536	63
4139	588	63
4140	598	63
4141	609	63
4142	659	63
4143	710	63
4144	730	63
4145	140	158
4146	156	158
4147	253	158
4148	280	158
4149	343	158
4150	419	158
4151	552	158
4152	608	158
4153	608	158
4154	732	158
4155	764	158
4156	14	41
4157	203	197
4158	362	197
4159	165	178
4160	356	178
4161	450	178
4162	460	178
4163	563	178
4164	585	178
4165	662	178
4166	683	178
4167	238	224
4168	12	33
4169	13	33
4170	19	33
4171	23	33
4172	27	33
4173	28	33
4174	33	33
4175	35	33
4176	38	33
4177	44	33
4178	45	33
4179	51	33
4180	52	33
4181	53	33
4182	54	33
4183	58	33
4184	63	33
4185	68	33
4186	72	33
4187	73	33
4188	83	33
4189	85	33
4190	86	33
4191	87	33
4192	88	33
4193	90	33
4194	99	33
4195	103	33
4196	105	33
4197	106	33
4198	110	33
4199	114	33
4200	115	33
4201	118	33
4202	119	33
4203	123	33
4204	124	33
4205	125	33
4206	127	33
4207	128	33
4208	132	33
4209	133	33
4210	137	33
4211	141	33
4212	152	33
4213	155	33
4214	160	33
4215	168	33
4216	173	33
4217	174	33
4218	176	33
4219	178	33
4220	179	33
4221	184	33
4222	185	33
4223	187	33
4224	190	33
4225	192	33
4226	195	33
4227	196	33
4228	197	33
4229	201	33
4230	205	33
4231	209	33
4232	210	33
4233	215	33
4234	216	33
4235	222	33
4236	223	33
4237	225	33
4238	228	33
4239	230	33
4240	231	33
4241	232	33
4242	233	33
4243	234	33
4244	236	33
4245	237	33
4246	238	33
4247	241	33
4248	248	33
4249	251	33
4250	253	33
4251	257	33
4252	260	33
4253	267	33
4254	278	33
4255	279	33
4256	284	33
4257	289	33
4258	290	33
4259	291	33
4260	293	33
4261	295	33
4262	296	33
4263	299	33
4264	300	33
4265	301	33
4266	306	33
4267	311	33
4268	313	33
4269	317	33
4270	323	33
4271	324	33
4272	329	33
4273	333	33
4274	335	33
4275	352	33
4276	358	33
4277	361	33
4278	362	33
4279	363	33
4280	364	33
4281	366	33
4282	368	33
4283	369	33
4284	373	33
4285	375	33
4286	376	33
4287	377	33
4288	378	33
4289	379	33
4290	380	33
4291	382	33
4292	383	33
4293	385	33
4294	386	33
4295	387	33
4296	388	33
4297	391	33
4298	392	33
4299	393	33
4300	398	33
4301	400	33
4302	403	33
4303	410	33
4304	413	33
4305	416	33
4306	417	33
4307	422	33
4308	424	33
4309	428	33
4310	433	33
4311	438	33
4312	440	33
4313	444	33
4314	451	33
4315	454	33
4316	456	33
4317	458	33
4318	460	33
4319	461	33
4320	462	33
4321	465	33
4322	466	33
4323	470	33
4324	471	33
4325	472	33
4326	475	33
4327	482	33
4328	483	33
4329	484	33
4330	492	33
4331	496	33
4332	501	33
4333	504	33
4334	505	33
4335	507	33
4336	509	33
4337	514	33
4338	515	33
4339	520	33
4340	523	33
4341	525	33
4342	526	33
4343	532	33
4344	536	33
4345	537	33
4346	538	33
4347	545	33
4348	547	33
4349	548	33
4350	550	33
4351	553	33
4352	564	33
4353	565	33
4354	566	33
4355	567	33
4356	568	33
4357	570	33
4358	572	33
4359	576	33
4360	578	33
4361	581	33
4362	582	33
4363	583	33
4364	585	33
4365	587	33
4366	588	33
4367	590	33
4368	593	33
4369	597	33
4370	598	33
4371	601	33
4372	602	33
4373	603	33
4374	604	33
4375	605	33
4376	606	33
4377	608	33
4378	609	33
4379	611	33
4380	613	33
4381	616	33
4382	619	33
4383	621	33
4384	631	33
4385	633	33
4386	634	33
4387	636	33
4388	637	33
4389	638	33
4390	640	33
4391	642	33
4392	644	33
4393	645	33
4394	646	33
4395	648	33
4396	649	33
4397	652	33
4398	653	33
4399	654	33
4400	655	33
4401	657	33
4402	659	33
4403	660	33
4404	661	33
4405	664	33
4406	667	33
4407	668	33
4408	669	33
4409	670	33
4410	671	33
4411	673	33
4412	674	33
4413	675	33
4414	676	33
4415	679	33
4416	680	33
4417	682	33
4418	683	33
4419	684	33
4420	686	33
4421	690	33
4422	691	33
4423	692	33
4424	706	33
4425	710	33
4426	711	33
4427	712	33
4428	716	33
4429	720	33
4430	721	33
4431	724	33
4432	729	33
4433	735	33
4434	736	33
4435	737	33
4436	752	33
4437	18	47
4438	21	47
4439	59	47
4440	73	47
4441	110	47
4442	119	47
4443	139	47
4444	165	47
4445	325	47
4446	446	47
4447	481	47
4448	502	47
4449	536	47
4450	594	47
4451	600	47
4452	653	47
4453	663	47
4454	684	47
4455	184	186
4456	85	112
4457	340	258
4458	554	258
4459	453	285
4460	368	265
4461	1	4
4462	2	4
4463	147	4
4464	147	4
4465	151	4
4466	151	4
4467	341	4
4468	363	4
4469	410	4
4470	416	4
4471	516	4
4472	584	4
4473	709	4
4474	717	4
4475	365	264
4476	584	264
4477	717	264
4478	354	262
4479	149	165
4480	555	165
4481	586	165
4482	732	165
4483	253	227
4484	608	227
4485	185	187
4486	187	187
4487	203	187
4488	222	187
4489	289	187
4490	295	187
4491	301	187
4492	362	187
4493	369	187
4494	393	187
4495	471	187
4496	492	187
4497	545	187
4498	548	187
4499	553	187
4500	576	187
4501	598	187
4502	646	187
4503	682	187
4504	68	104
4505	118	104
4506	190	104
4507	205	104
4508	215	104
4509	234	104
4510	253	104
4511	274	104
4512	279	104
4513	290	104
4514	306	104
4515	324	104
4516	386	104
4517	388	104
4518	398	104
4519	438	104
4520	458	104
4521	472	104
4522	475	104
4523	496	104
4524	505	104
4525	509	104
4526	523	104
4527	529	104
4528	537	104
4529	605	104
4530	621	104
4531	660	104
4532	661	104
4533	674	104
4534	680	104
4535	706	104
4536	237	223
4537	13	39
4538	110	39
4539	119	39
4540	128	39
4541	152	39
4542	376	39
4543	454	39
4544	520	39
4545	608	39
4546	644	39
4547	684	39
4548	735	39
4549	431	277
4550	151	169
4551	454	286
4552	532	286
4553	564	286
4554	103	131
4555	416	131
4556	35	74
4557	103	74
4558	195	74
4559	233	74
4560	234	74
4561	306	74
4562	314	74
4563	317	74
4564	320	74
4565	333	74
4566	363	74
4567	375	74
4568	386	74
4569	416	74
4570	456	74
4571	496	74
4572	578	74
4573	636	74
4574	648	74
4575	659	74
4576	752	74
4577	53	93
4578	64	93
4579	89	93
4580	114	93
4581	185	93
4582	187	93
4583	192	93
4584	201	93
4585	203	93
4586	221	93
4587	222	93
4588	241	93
4589	289	93
4590	293	93
4591	295	93
4592	296	93
4593	301	93
4594	362	93
4595	362	93
4596	369	93
4597	393	93
4598	462	93
4599	471	93
4600	486	93
4601	492	93
4602	504	93
4603	548	93
4604	553	93
4605	566	93
4606	576	93
4607	598	93
4608	599	93
4609	627	93
4610	628	93
4611	646	93
4612	657	93
4613	664	93
4614	691	93
4615	29	64
4616	1	5
4617	2	5
4618	147	5
4619	151	5
4620	341	5
4621	410	5
4622	416	5
4623	516	5
4624	584	5
4625	709	5
4626	717	5
4627	185	189
4628	484	292
4629	499	294
4630	207	198
4631	681	198
4632	710	198
4633	722	198
4634	746	198
4635	751	198
4636	760	198
4637	767	198
4638	773	198
4639	35	72
4640	88	72
4641	119	72
4642	124	72
4643	137	72
4644	195	72
4645	363	72
4646	380	72
4647	416	72
4648	532	72
4649	536	72
4650	636	72
4651	648	72
4652	671	72
4653	684	72
4654	185	190
4655	207	199
4656	710	199
4657	722	199
4658	746	199
4659	751	199
4660	760	199
4661	303	244
4662	590	305
4663	649	305
4664	135	152
4665	383	152
4666	383	152
4667	383	152
4668	572	152
4669	572	152
4670	669	152
4671	669	152
4672	669	152
4673	595	306
4674	383	268
4675	572	268
4676	669	268
4677	12	34
4678	28	34
4679	33	34
4680	45	34
4681	58	34
4682	63	34
4683	72	34
4684	73	34
4685	87	34
4686	88	34
4687	105	34
4688	106	34
4689	125	34
4690	141	34
4691	155	34
4692	168	34
4693	173	34
4694	173	34
4695	176	34
4696	184	34
4697	197	34
4698	209	34
4699	209	34
4700	210	34
4701	216	34
4702	225	34
4703	231	34
4704	234	34
4705	236	34
4706	248	34
4707	278	34
4708	278	34
4709	291	34
4710	296	34
4711	300	34
4712	313	34
4713	335	34
4714	352	34
4715	361	34
4716	362	34
4717	368	34
4718	369	34
4719	373	34
4720	378	34
4721	383	34
4722	393	34
4723	410	34
4724	417	34
4725	417	34
4726	422	34
4727	424	34
4728	433	34
4729	456	34
4730	460	34
4731	461	34
4732	465	34
4733	470	34
4734	471	34
4735	472	34
4736	505	34
4737	514	34
4738	525	34
4739	525	34
4740	532	34
4741	536	34
4742	568	34
4743	576	34
4744	582	34
4745	582	34
4746	583	34
4747	588	34
4748	637	34
4749	642	34
4750	645	34
4751	655	34
4752	691	34
4753	706	34
4754	711	34
4755	711	34
4756	720	34
4757	721	34
4758	724	34
4759	724	34
4760	255	231
4761	312	231
4762	360	231
4763	452	231
4764	153	172
4765	156	172
4766	343	172
4767	30	66
4768	95	66
4769	189	66
4770	194	66
4771	194	66
4772	211	66
4773	339	66
4774	617	66
4775	707	66
4776	781	66
4777	19	49
4778	139	49
4779	262	49
4780	263	49
4781	263	49
4782	516	49
4783	516	49
4784	563	49
4785	699	49
4786	25	57
4787	112	57
4788	213	57
4789	448	57
4790	591	57
4791	31	68
4792	204	68
4793	220	68
4794	286	68
4795	288	68
4796	406	68
4797	511	68
4798	522	68
4799	626	68
4800	741	68
4801	775	68
4802	776	68
4803	780	68
4804	128	146
4805	413	146
4806	11	24
4807	52	24
4808	13	37
4809	19	37
4810	35	37
4811	44	37
4812	44	37
4813	45	37
4814	54	37
4815	58	37
4816	63	37
4817	73	37
4818	83	37
4819	99	37
4820	103	37
4821	110	37
4822	115	37
4823	119	37
4824	128	37
4825	133	37
4826	137	37
4827	141	37
4828	152	37
4829	174	37
4830	190	37
4831	195	37
4832	210	37
4833	222	37
4834	230	37
4835	233	37
4836	251	37
4837	251	37
4838	253	37
4839	267	37
4840	278	37
4841	291	37
4842	317	37
4843	329	37
4844	333	37
4845	363	37
4846	366	37
4847	368	37
4848	375	37
4849	376	37
4850	376	37
4851	377	37
4852	378	37
4853	382	37
4854	386	37
4855	403	37
4856	416	37
4857	422	37
4858	428	37
4859	433	37
4860	434	37
4861	440	37
4862	451	37
4863	453	37
4864	454	37
4865	461	37
4866	466	37
4867	501	37
4868	507	37
4869	514	37
4870	520	37
4871	536	37
4872	565	37
4873	578	37
4874	581	37
4875	582	37
4876	587	37
4877	588	37
4878	597	37
4879	602	37
4880	604	37
4881	608	37
4882	613	37
4883	619	37
4884	619	37
4885	631	37
4886	633	37
4887	642	37
4888	644	37
4889	648	37
4890	653	37
4891	655	37
4892	656	37
4893	657	37
4894	659	37
4895	667	37
4896	673	37
4897	675	37
4898	680	37
4899	683	37
4900	684	37
4901	686	37
4902	691	37
4903	706	37
4904	712	37
4905	716	37
4906	720	37
4907	721	37
4908	724	37
4909	729	37
4910	735	37
4911	736	37
4912	736	37
4913	752	37
4914	719	331
4915	8	19
4916	24	19
4917	57	19
4918	60	19
4919	62	19
4920	70	19
4921	70	19
4922	80	19
4923	86	19
4924	92	19
4925	113	19
4926	136	19
4927	148	19
4928	148	19
4929	161	19
4930	161	19
4931	166	19
4932	173	19
4933	177	19
4934	216	19
4935	227	19
4936	240	19
4937	255	19
4938	255	19
4939	255	19
4940	258	19
4941	287	19
4942	288	19
4943	302	19
4944	304	19
4945	308	19
4946	312	19
4947	312	19
4948	312	19
4949	337	19
4950	340	19
4951	340	19
4952	342	19
4953	348	19
4954	353	19
4955	360	19
4956	360	19
4957	408	19
4958	411	19
4959	425	19
4960	434	19
4961	452	19
4962	452	19
4963	470	19
4964	470	19
4965	477	19
4966	488	19
4967	497	19
4968	500	19
4969	511	19
4970	512	19
4971	512	19
4972	531	19
4973	540	19
4974	551	19
4975	554	19
4976	558	19
4977	641	19
4978	656	19
4979	685	19
4980	688	19
4981	717	19
4982	750	19
4983	314	248
4984	320	248
4985	402	248
4986	442	248
4987	208	201
4988	280	201
4989	732	201
4990	98	123
4991	167	123
4992	258	123
4993	394	123
4994	487	123
4995	550	123
4996	636	123
4997	723	123
4998	731	123
4999	384	270
5000	390	270
5001	399	270
5002	407	270
5003	412	270
5004	602	310
5005	23	56
5006	52	56
5007	128	56
5008	358	56
5009	364	56
5010	379	56
5011	413	56
5012	570	56
5013	590	56
5014	611	56
5015	673	56
5016	690	56
\.


--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('books_genres_book_genre_id_seq', 5016, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY genres (genre_id, name) FROM stdin;
1	Classics
2	Historical
3	Historical Fiction
4	Academic
5	School
6	Horror
7	Fiction
8	Short Stories
9	Gothic
10	Sequential Art
11	Graphic Novels
12	Fantasy
13	Childrens
14	Picture Books
15	Science Fiction
16	Apocalyptic
17	Post Apocalyptic
18	Young Adult
19	Humor
20	Literature
21	Magical Realism
22	Philosophy
23	Sports
24	Baseball
25	Sports and Games
26	Novels
27	Abandoned
28	Family
29	Literary Fiction
30	Adult Fiction
31	Cultural
32	Africa
33	Nonfiction
34	Autobiography
35	Memoir
36	Biography
37	History
38	North American Hi...
39	American History
40	Politics
41	13th Century
42	American
43	Graphic Novels Comics
44	Adventure
45	Comics
46	Comic Book
47	African American
48	African American Literature
49	Plays
50	Dragons
51	Erotica
52	Romance
53	Adult
54	Poetry
55	Economics
56	Business
57	Historical Romance
58	Regency
59	War
60	Italy
61	World War I
62	Language
63	Writing
64	English History
65	Tudor Period
66	Fairy Tales
67	European Literature
68	German Literature
69	Realistic Fiction
70	Middle Grade
71	Race
72	Social Movements
73	Social Justice
74	Sociology
75	Epic Fantasy
76	High Fantasy
77	Dystopia
78	Canada
79	Essays
80	Military History
81	Civil War
82	Russian History
83	Russia
84	Young Adult Fantasy
85	Magic
86	Contemporary
87	Inspirational
88	Self Help
89	Religion
90	Spirituality
91	Theology
92	Christianity
93	Christian
94	Travel
95	Polish Literature
96	Journalism
97	Glbt
98	China
99	Animals
100	Christian Fiction
101	Biblical Fiction
102	Action
103	Teen
104	Psychology
105	Personal Development
106	Science Fiction Fantasy
107	Comedy
108	World War II
109	Swedish Literature
110	Book Club
111	India
112	Lds
113	Church
114	Science
115	Environment
116	Nature
117	Astronomy
118	Space
119	Manga
120	Shojo
121	Space Opera
122	Hugo Awards
123	Audiobook
124	Military
125	Physics
126	Mystery
127	Thriller
128	Drama
129	Education
130	Social Issues
131	Poverty
132	M M Romance
133	Time Travel
134	Cats
135	Love
136	Black Literature
137	Holiday
138	Westerns
139	Feminism
140	Womens
141	Asia
142	Spanish Literature
143	Finance
144	Banking
145	Currency
146	Money
147	Political Science
148	Supernatural
149	Shonen
150	Parenting
151	Health
152	Food and Drink
153	Food
154	Juvenile
155	1st Grade
156	Young Readers
157	2nd Grade
158	Crime
159	Germany
160	Holocaust
161	Latin American
162	Mythology
163	Read For School
164	Spy Thriller
165	Espionage
166	Medieval
167	British Literature
168	19th Century
169	Classic Literature
170	College
171	American Civil War
172	Detective
173	Southern
174	Paranormal
175	Aliens
176	Paranormal Romance
177	Reference
178	Queer
179	Greece
180	Halloween
181	Mathematics
182	Music
183	Skepticism
184	Atheism
185	Christmas
186	Israel
187	Faith
188	Catholic
189	Occult
190	Mysticism
191	Russian Literature
192	Cinderella
193	Buddhism
194	Dc Comics
195	Superman
196	Superheroes
197	Christian Non Fiction
198	France
199	French Literature
200	Mystery Thriller
201	Suspense
202	Art
203	Northern Africa
204	Sudan
205	Epic
206	18th Century
207	Dogs
208	Computer Science
209	Programming
210	Technical
211	Computers
212	Technology
213	Culture
214	Film
215	Biography Memoir
216	Photography
217	New York
218	Architecture
219	Cities
220	Urban Planning
221	Geography
222	Abuse
223	Humanities
224	Textbooks
225	Anthologies
226	Steampunk
227	True Crime
228	Western Africa
229	Nigeria
230	African Literature
231	Funny
232	Sweden
233	Theatre
234	Medicine
235	Batman
236	Asian Literature
237	Japanese Literature
238	Italian Literature
239	Mental Health
240	Horses
241	Medical
242	Biology
243	Neuroscience
244	Yaoi
245	Demons
246	Jewish
247	Theory
248	New Adult
249	Labor
250	Contemporary Romance
251	Womens Fiction
252	Chick Lit
253	Dungeons and Dragons
254	Forgotten Realms
255	Relationships
256	Vampires
257	Comic Strips
258	Cartoon
259	Disability
260	Zombies
261	Lovecraftian
262	Ghosts
263	Teaching
264	Kids
265	Presidents
266	Scandinavian Literature
267	World History
268	Cookbooks
269	Cooking
270	Turkish Literature
271	Turkish
272	Roman
273	Coming Of Age
274	Cyberpunk
275	Eastern Africa
276	Rwanda
277	Scotland
278	Morocco
279	Japan
280	Terrorism
281	Egypt
282	Urban
283	Gender
284	Storytime
285	Iran
286	Law
287	Seinen
288	Brazil
289	Sexuality
290	Urban Fantasy
291	Fitness
292	Zen
293	Speculative Fiction
294	Retellings
295	Esoterica
296	Books About Books
297	20th Century
298	Death
299	Rabbits
300	Paganism
301	Shapeshifters
302	Islam
303	Transport
304	Bicycles
305	Design
306	Media Tie In
307	Movies
308	Anthropology
309	Criticism
310	Literary Criticism
311	Communication
312	American Revolution
313	American Revolutionary War
314	Novella
315	Chemistry
316	Gender Studies
317	Womens Studies
318	Australia
319	Adoption
320	Ethiopia
321	Indonesian Literature
322	Urbanism
323	Webcomic
324	Nutrition
325	Nobel Prize
326	Health Care
327	Witches
328	Chapter Books
329	Folklore
330	Danish
331	Southern Gothic
332	Eastern Philosophy
333	Portugal
334	Portuguese Literature
335	Unfinished
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('genres_genre_id_seq', 335, true);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: user
--

COPY ratings (rating_id, user_id, book_id, score) FROM stdin;
1	1	10	5
2	1	16	4
3	2	1	5
4	2	17	4
5	2	54	5
6	1	35	1
7	2	34	1
8	2	69	5
9	2	688	5
10	2	455	5
11	2	252	5
12	2	756	5
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 12, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users (user_id, name, email, password) FROM stdin;
1	Balloonicorn	kittens-are-great@aol.com	party-time
2	Lyra Hall	lyrahall14@gmail.com	wicked
\.


--
-- Data for Name: users_genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users_genres (user_genre_id, user_id, genre_id) FROM stdin;
2	2	10
3	2	12
4	2	18
5	2	28
6	2	30
7	2	8
10	2	3
11	2	15
12	2	21
13	2	2
14	2	34
\.


--
-- Name: users_genres_user_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('users_genres_user_genre_id_seq', 14, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


--
-- Name: books_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_pkey PRIMARY KEY (book_genre_id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- Name: genres_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: users_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY users_genres
    ADD CONSTRAINT users_genres_pkey PRIMARY KEY (user_genre_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: books_genres_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: books_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY books_genres
    ADD CONSTRAINT books_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: ratings_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(book_id);


--
-- Name: ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY users_genres
    ADD CONSTRAINT users_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES genres(genre_id);


--
-- Name: users_genres_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
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

