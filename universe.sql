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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km numeric NOT NULL,
    is_potentially_hazardous boolean NOT NULL,
    orbital_period_days numeric NOT NULL,
    description text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    has_supermassive_blackhole boolean NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer,
    radius_km integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period_days numeric NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer,
    planet_type character varying(50) NOT NULL,
    distance_from_star numeric NOT NULL,
    has_life boolean NOT NULL,
    radius_km integer NOT NULL,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_supernova boolean NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, false, 1680.0, 'Largest asteroid in asteroid belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, 1325.0, 'Second largest asteroid in asteroid belt');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, true, 1685.0, 'Third largest asteroid in asteroid belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Nearest large galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 'Small spiral galaxy', false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 29000000, 'Bright core galaxy', true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000, 'Famous spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Spiral', 12000000, 'Bright galaxy in Ursa Major', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, 27.3, 'Earth''s moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 0.3, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 1.3, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821, false, 1.8, 'Jupiter moon');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560, false, 3.5, 'Jupiter moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634, false, 7.1, 'Jupiter moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410, false, 16.7, 'Jupiter moon');
INSERT INTO public.moon VALUES (8, 'Proxima b I', 4, 1500, false, 1.0, 'Moon of Proxima b');
INSERT INTO public.moon VALUES (9, 'Sirius b I', 5, 2000, false, 2.0, 'Moon of Sirius b Planet');
INSERT INTO public.moon VALUES (10, 'Sirius b II', 5, 1800, false, 3.0, 'Moon of Sirius b Planet');
INSERT INTO public.moon VALUES (11, 'Rigel I a', 6, 3000, false, 10.0, 'Moon of Rigel I');
INSERT INTO public.moon VALUES (12, 'Rigel I b', 6, 2900, false, 12.0, 'Moon of Rigel I');
INSERT INTO public.moon VALUES (13, 'Rigel II a', 7, 1500, false, 4.0, 'Moon of Rigel II');
INSERT INTO public.moon VALUES (14, 'Rigel II b', 7, 1400, false, 5.0, 'Moon of Rigel II');
INSERT INTO public.moon VALUES (15, 'Betelgeuse I a', 8, 1600, false, 6.0, 'Moon of Betelgeuse I');
INSERT INTO public.moon VALUES (16, 'Betelgeuse I b', 8, 1500, false, 7.0, 'Moon of Betelgeuse I');
INSERT INTO public.moon VALUES (17, 'Betelgeuse II a', 9, 2000, false, 8.0, 'Moon of Betelgeuse II');
INSERT INTO public.moon VALUES (18, 'Betelgeuse II b', 9, 2100, false, 9.0, 'Moon of Betelgeuse II');
INSERT INTO public.moon VALUES (19, 'Vega I a', 10, 1700, false, 3.0, 'Moon of Vega I');
INSERT INTO public.moon VALUES (20, 'Vega II a', 11, 2000, false, 5.0, 'Moon of Vega II');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 149600000, true, 6371, 'Our planet');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 227900000, false, 3389, 'Red planet');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 778500000, false, 69911, 'Largest planet in solar system');
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 'Terrestrial', 48500, false, 7160, 'Exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (5, 'Sirius b Planet', 3, 'Gas Giant', 2000000, false, 71492, 'Exoplanet orbiting Sirius');
INSERT INTO public.planet VALUES (6, 'Rigel I', 4, 'Gas Giant', 500000000, false, 69900, 'Planet orbiting Rigel');
INSERT INTO public.planet VALUES (7, 'Rigel II', 4, 'Terrestrial', 800000000, false, 6370, 'Second planet of Rigel');
INSERT INTO public.planet VALUES (8, 'Betelgeuse I', 5, 'Terrestrial', 1000000000, false, 6350, 'First planet of Betelgeuse');
INSERT INTO public.planet VALUES (9, 'Betelgeuse II', 5, 'Gas Giant', 1500000000, false, 70000, 'Second planet of Betelgeuse');
INSERT INTO public.planet VALUES (10, 'Vega I', 6, 'Terrestrial', 50000000, false, 6400, 'First planet of Vega');
INSERT INTO public.planet VALUES (11, 'Vega II', 6, 'Gas Giant', 100000000, false, 71000, 'Second planet of Vega');
INSERT INTO public.planet VALUES (12, 'Vega III', 6, 'Gas Giant', 150000000, false, 69999, 'Third planet of Vega');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000000000000000000000000000, 4600, false, 'Our star');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 244600000000000000000000000000, 4500, false, 'Closest star to Sun');
INSERT INTO public.star VALUES (3, 'Sirius', 1, 4018000000000000000000000000000, 242, false, 'Brightest star in night sky');
INSERT INTO public.star VALUES (4, 'Rigel', 2, 35000000000000000000000000000000, 8, false, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 12000000000000000000000000000000, 10, false, 'Red supergiant');
INSERT INTO public.star VALUES (6, 'Vega', 3, 4080000000000000000000000000000, 455, false, 'Main sequence star');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

