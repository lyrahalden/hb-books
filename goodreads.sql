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
    title character varying(200),
    author character varying(200),
    rating character varying(200),
    pic_url character varying(200)
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
    name character varying(100)
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
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: user
--

COPY books (book_id, title, author, rating, pic_url) FROM stdin;
\.


--
-- Name: books_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('books_book_id_seq', 100, true);


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

SELECT pg_catalog.setval('genres_genre_id_seq', 1, false);


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

