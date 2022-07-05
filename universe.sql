--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET
statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

DROP
DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE
DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER
DATABASE universe OWNER TO freecodecamp;

\connect
universe

SET statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

--
-- Name: galaxy_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.galaxy_type AS ENUM (
    'Elliptical',
    'Spiral',
    'Irregular'
);


ALTER TYPE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: planet_type; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.planet_type AS ENUM (
    'Terrestrial planet',
    'Gas giant',
    'Ice giant'
);


ALTER TYPE public.planet_type OWNER TO freecodecamp;

SET
default_tablespace = '';

SET
default_table_access_method = heap;

--
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet
(
    dwarf_planet_id          integer               NOT NULL,
    name                     character varying(30) NOT NULL,
    description              text,
    age_in_millions_of_years numeric(5, 1)
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy
(
    galaxy_id                integer               NOT NULL,
    name                     character varying(30) NOT NULL,
    galaxy_type public.galaxy_type NOT NULL,
    description              text,
    age_in_millions_of_years numeric(5, 1)
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
    NO MAXVALUE CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon
(
    moon_id                  integer               NOT NULL,
    name                     character varying(30) NOT NULL,
    has_life                 boolean,
    description              text,
    age_in_millions_of_years numeric(5, 1),
    planet_id                integer
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
    NO MAXVALUE CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet
(
    planet_id                integer               NOT NULL,
    name                     character varying(30) NOT NULL,
    has_life                 boolean,
    age_in_millions_of_years numeric(5, 1),
    description              text,
    planet_type public.planet_type NOT NULL,
    number_of_moons          integer,
    star_id                  integer
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
    NO MAXVALUE CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star
(
    star_id                  integer               NOT NULL,
    name                     character varying(30) NOT NULL,
    description              text,
    age_in_millions_of_years numeric(5, 1),
    distance_from_earth      integer,
    galaxy_id                integer
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
    NO MAXVALUE CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet
VALUES (1, 'Ceres', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (2, 'Pluto', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (3, 'Eris', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (4, 'Haumea', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (5, 'Makemake', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (6, 'Gonggong', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (7, 'Quaoar', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (8, 'Orcus', NULL, NULL);
INSERT INTO public.dwarf_planet
VALUES (9, 'Sedna', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy
VALUES (2, 'Pinwheel', 'Spiral', NULL, NULL);
INSERT INTO public.galaxy
VALUES (3, 'Maffei 1', 'Elliptical', NULL, NULL);
INSERT INTO public.galaxy
VALUES (1, 'Milky Way', 'Spiral', NULL, NULL);
INSERT INTO public.galaxy
VALUES (4, 'Sunflower', 'Spiral', NULL, NULL);
INSERT INTO public.galaxy
VALUES (5, 'Andromeda', 'Spiral', NULL, NULL);
INSERT INTO public.galaxy
VALUES (6, 'Malin 1', 'Spiral', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon
VALUES (2, 'Phobos', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (3, 'Deimos', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (4, 'Io', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (5, 'Europa', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (6, 'Ganymede', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (7, 'Callisto', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (8, 'Amalthea', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (9, 'Mimas', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (10, 'Enceladus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (11, 'Tethys', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (12, 'Dione', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (13, 'Rhea', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (14, 'Titan', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (15, 'Iapetus', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (16, 'Ariel', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (17, 'Umbriel', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (18, 'Titania', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (19, 'Oberon', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (20, 'Miranda', NULL, NULL, NULL, NULL);
INSERT INTO public.moon
VALUES (1, 'Moon', NULL, NULL, NULL, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet
VALUES (9, 'Proxima Centauri b', NULL, NULL, NULL, 'Terrestrial planet', NULL, NULL);
INSERT INTO public.planet
VALUES (10, 'Proxima Centauri c', NULL, NULL, NULL, 'Terrestrial planet', NULL, NULL);
INSERT INTO public.planet
VALUES (11, 'Luyten b', NULL, NULL, NULL, 'Terrestrial planet', NULL, NULL);
INSERT INTO public.planet
VALUES (12, 'Ross 128 b', NULL, NULL, NULL, 'Terrestrial planet', NULL, NULL);
INSERT INTO public.planet
VALUES (1, 'Mercury', NULL, NULL, NULL, 'Terrestrial planet', NULL, 1);
INSERT INTO public.planet
VALUES (2, 'Venus', NULL, NULL, NULL, 'Terrestrial planet', NULL, 1);
INSERT INTO public.planet
VALUES (3, 'Earth', NULL, NULL, NULL, 'Terrestrial planet', NULL, 1);
INSERT INTO public.planet
VALUES (4, 'Mars', NULL, NULL, NULL, 'Terrestrial planet', NULL, 1);
INSERT INTO public.planet
VALUES (5, 'Jupiter', NULL, NULL, NULL, 'Gas giant', NULL, 1);
INSERT INTO public.planet
VALUES (6, 'Saturn', NULL, NULL, NULL, 'Gas giant', NULL, 1);
INSERT INTO public.planet
VALUES (7, 'Uranus', NULL, NULL, NULL, 'Ice giant', NULL, 1);
INSERT INTO public.planet
VALUES (8, 'Neptune', NULL, NULL, NULL, 'Ice giant', NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star
VALUES (1, 'Sun', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (2, 'Leo', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (3, 'Taurus', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (4, 'Canis Major', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (5, 'Lyra', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (6, 'Corvus', NULL, NULL, NULL, NULL);
INSERT INTO public.star
VALUES (7, 'Cygnus', NULL, NULL, NULL, NULL);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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

