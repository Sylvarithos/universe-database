--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_type_id character varying(255),
    galaxy_age integer,
    galaxy_population integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_count integer,
    is_active boolean NOT NULL,
    galaxy_type_age integer
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius integer,
    has_atmosphere boolean,
    is_spherical boolean NOT NULL,
    moon_type character varying(255)
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    distance_from_sun integer,
    has_rings boolean NOT NULL,
    has_life boolean,
    planet_type character varying(255),
    planet_mass numeric
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer,
    luminosity integer,
    is_binary boolean NOT NULL,
    star_type character varying(255)
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing our solar system', true, true, 0, NULL, 12, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Largest galaxy in the Local Group', false, true, 2540000, NULL, 12, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', false, true, 3000000, NULL, 20, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous interacting galaxy', false, true, 23000000, NULL, 30, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual disk galaxy with a large central bulge', false, true, 29000000, NULL, 40, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Galaxy with a striking ring shape', false, false, 50000000, NULL, 30, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Galaxies with spiral arms winding out from the center.', 5, true, 1370000000);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Smooth and featureless galaxies with an elliptical shape.', 3, false, 1000000000);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies without a clear shape or structure.', 2, true, 1200000000);
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Galaxies with features of both spiral and elliptical types.', 4, false, 900000000);
INSERT INTO public.galaxy_type VALUES (5, 'Ring', 'Galaxies with a ring-like structure of stars.', 1, true, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, true, 'Natural');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, true, 'Natural');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, true, 'Natural');
INSERT INTO public.moon VALUES (4, 'Europa', 3, 1565, true, true, 'Natural');
INSERT INTO public.moon VALUES (5, 'Io', 3, 1821, true, true, 'Natural');
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 2410, true, true, 'Natural');
INSERT INTO public.moon VALUES (7, 'Titan', 4, 2575, true, true, 'Natural');
INSERT INTO public.moon VALUES (8, 'Rhea', 4, 765, false, true, 'Natural');
INSERT INTO public.moon VALUES (9, 'Iapetus', 4, 735, false, true, 'Natural');
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 252, true, true, 'Natural');
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353, true, true, 'Natural');
INSERT INTO public.moon VALUES (12, 'Charon', 9, 606, true, true, 'Natural');
INSERT INTO public.moon VALUES (13, 'Ganymede', 3, 2631, true, true, 'Natural');
INSERT INTO public.moon VALUES (14, 'Mimas', 4, 198, false, true, 'Natural');
INSERT INTO public.moon VALUES (15, 'Ariel', 8, 578, true, true, 'Natural');
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 235, true, true, 'Natural');
INSERT INTO public.moon VALUES (17, 'Titania', 8, 788, true, true, 'Natural');
INSERT INTO public.moon VALUES (18, 'Oberon', 8, 761, true, true, 'Natural');
INSERT INTO public.moon VALUES (19, 'Triton-2', 8, 700, true, true, 'Natural');
INSERT INTO public.moon VALUES (20, 'aaaa', 8, 700, true, true, 'Natural');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1496, false, true, 'Terrestrial', 5.972);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2279, false, false, 'Terrestrial', 0.641);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 7785, true, false, 'Gas Giant', 1898.0);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 14340, true, false, 'Gas Giant', 568.0);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 1082, false, false, 'Terrestrial', 4.87);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 579, false, false, 'Terrestrial', 0.330);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 4495, true, false, 'Ice Giant', 102.0);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 2871, true, false, 'Ice Giant', 86.8);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, 6000, false, true, 'Super Earth', 4.8);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 3, 2200, false, true, 'Super Earth', 1.3);
INSERT INTO public.planet VALUES (11, 'Proxima b', 4, 750, false, false, 'Earth-like', 1.17);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 5, 1180, false, true, 'Super Earth', 2.8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1, false, 'G-type');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 2, 5790, 2, true, 'G-type');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 3, 3050, 0, false, 'M-type');
INSERT INTO public.star VALUES (4, 'Sirius', 4, 9940, 25, false, 'A-type');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 5, 3500, 100000, false, 'M-type');
INSERT INTO public.star VALUES (6, 'Rigel', 6, 12000, 120000, true, 'B-type');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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

