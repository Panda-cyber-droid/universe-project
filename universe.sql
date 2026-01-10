--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxies (
    id integer NOT NULL,
    name character varying(50),
    galaxy_type character varying(50),
    distance_from_earth bigint
);


ALTER TABLE public.galaxies OWNER TO freecodecamp;

--
-- Name: galaxies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_id_seq OWNED BY public.galaxies.id;


--
-- Name: planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets (
    id integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_type character varying(50)
);


ALTER TABLE public.planets OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_id_seq OWNER TO freecodecamp;

--
-- Name: planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_id_seq OWNED BY public.planets.id;


--
-- Name: galaxies id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies ALTER COLUMN id SET DEFAULT nextval('public.galaxies_id_seq'::regclass);


--
-- Name: planets id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets ALTER COLUMN id SET DEFAULT nextval('public.planets_id_seq'::regclass);


--
-- Data for Name: galaxies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxies VALUES (1, 'Milky Way', 'Spiral', 0);
INSERT INTO public.galaxies VALUES (2, 'Andromeda', 'Spiral', 2537000);


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets VALUES (1, 'Earth', 'Our home planet', true, true, 4500, 'Terrestrial');
INSERT INTO public.planets VALUES (2, 'Mars', 'Red planet', false, true, 4600, 'Terrestrial');
INSERT INTO public.planets VALUES (3, 'Jupiter', 'Gas giant', false, true, 4500, 'Gas Giant');


--
-- Name: galaxies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_id_seq', 2, true);


--
-- Name: planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_id_seq', 3, true);


--
-- Name: galaxies galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxies
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (id);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

