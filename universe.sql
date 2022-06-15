--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200) NOT NULL,
    no_of_planets integer,
    no_of_stars integer,
    galaxy_description text NOT NULL,
    has_life boolean,
    has_black_hole boolean,
    gallows numeric
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
    name character varying(200),
    gallows numeric,
    diameter integer,
    dist_from_earth integer,
    description text,
    random1 boolean NOT NULL,
    random2 boolean NOT NULL
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
    name character varying(200) NOT NULL,
    no_of_moons integer,
    no_of_rings integer,
    distance_from_earth numeric,
    dscription text,
    is_spherical boolean,
    is_dwarf boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(200)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


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
    name character varying(200) NOT NULL,
    no_of_planets integer,
    no_of_moons integer,
    dist_from_earth numeric NOT NULL,
    is_spherical boolean,
    is_dwarf boolean,
    galaxy_id integer
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
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', 2345, 5432, 'it is a galaxy', true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', 2345, 5432, 'it is a galaxy', true, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 232323, 2323, 'it is a galaxy', true, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', 5678, 9876, 'it is a galaxy', true, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 12345, 98766, 'it is a galaxy', true, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', 765468, 98765, 'it is a galaxy', true, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (12, 'moon101', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (13, 'moon111', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (14, 'moon121', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (15, 'moon433', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (16, 'moon15', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (17, 'moon16', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (18, 'moon17', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (19, 'moon18', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (20, 'moon19', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (21, 'moon20', NULL, 3457654, 123456, 'moon', true, true);
INSERT INTO public.moon VALUES (22, 'moon21', NULL, 3457654, 123456, 'moon', true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 34, 0, 234567, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (2, 'planet 2', 2, 0, 34567, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (3, 'planet 3', 0, 0, 34567, 'it is a planet', true, true, NULL);
INSERT INTO public.planet VALUES (4, 'planet 4', 34, 0, 234567, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (5, 'planet 5', 2, 0, 34567, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (6, 'planet 6', 0, 0, 34567, 'it is a planet', true, true, NULL);
INSERT INTO public.planet VALUES (7, 'planet 7', 34, 0, 234567, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (8, 'planet 8', 2, 0, 34567, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (9, 'planet 9', 0, 0, 34567, 'it is a planet', true, true, NULL);
INSERT INTO public.planet VALUES (10, 'planet 10', 0, 0, 456432, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (11, 'planet 11', 0, 0, 3456, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (12, 'planet 12', 0, 0, 87654, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (13, 'planet 13', 0, 3, 5678, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (17, 'planet210', 0, 0, 456432, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (18, 'planet211', 0, 0, 3456, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (19, 'planet 112', 0, 0, 87654, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (20, 'planet 53', 0, 3, 5678, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (21, 'planet 18', 0, 0, 456432, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (22, 'planet 19', 0, 0, 3456, 'it is a planet', false, false, NULL);
INSERT INTO public.planet VALUES (23, 'planet 20', 0, 0, 87654, 'it is a planet', true, false, NULL);
INSERT INTO public.planet VALUES (24, 'planet 21', 0, 3, 5678, 'it is a planet', true, false, NULL);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (2, 1, 1, 'abc');
INSERT INTO public.planet_moon VALUES (3, 2, 2, 'random2');
INSERT INTO public.planet_moon VALUES (4, 3, 3, 'random3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 2345, 65432, 234556, true, true, NULL);
INSERT INTO public.star VALUES (2, 'star 2', 2345, 65432, 234556, true, true, NULL);
INSERT INTO public.star VALUES (3, 'star 3', 3456, 6543, 234534, true, false, NULL);
INSERT INTO public.star VALUES (4, 'star 4', 12345, 4567, 1234567, true, true, NULL);
INSERT INTO public.star VALUES (5, 'star 5', 7654, 765432, 34567, true, false, NULL);
INSERT INTO public.star VALUES (6, 'star 6', 6789, 765432, 1234567, false, false, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moon planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_name_key UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


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
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

