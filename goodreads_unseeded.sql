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
    avg_rating integer NOT NULL,
    pic_url character varying(200) NOT NULL,
    summary character varying(1500) NOT NULL
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
    book_id integer,
    genre_id integer
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
    user_id integer,
    book_id integer,
    score integer NOT NULL,
    text character varying(10000)
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

COPY books (book_id, title, author, avg_rating, pic_url, summary) FROM stdin;
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('books_book_id_seq', 1, false);


--
-- Data for Name: books_genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY books_genres (book_genre_id, book_id, genre_id) FROM stdin;
\.


--
-- Name: books_genres_book_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('books_genres_book_genre_id_seq', 1, false);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY genres (genre_id, name) FROM stdin;
\.


--
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('genres_genre_id_seq', 335, true);


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: user
--

COPY ratings (rating_id, user_id, book_id, score, text) FROM stdin;
\.


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('ratings_rating_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users (user_id, name, email, password) FROM stdin;
\.


--
-- Data for Name: users_genres; Type: TABLE DATA; Schema: public; Owner: user
--

COPY users_genres (user_genre_id, user_id, genre_id) FROM stdin;
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

