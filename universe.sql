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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30),
    description text NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric(10,10),
    is_spherical boolean,
    has_life boolean,
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_galaxy_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric(10,10),
    is_spherical boolean,
    has_life boolean,
    galaxy_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_km numeric(10,10),
    has_life boolean,
    is_spherical boolean,
    moon_id integer NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_km numeric(10,10),
    is_spherical boolean,
    has_life boolean,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_gplanet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_gplanet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_gplanet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_gplanet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_gplanet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric(10,10),
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_galaxy_id_seq'::regclass);


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_gplanet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Ceres', 'The largest asteroid in the asteroid belt.', 4600, 0.0025000000, true, false, 1);
INSERT INTO public.asteroid VALUES ('Vesta', 'A large, cratered asteroid with a unique surface.', 4500, 0.0018000000, false, false, 2);
INSERT INTO public.asteroid VALUES ('Pallas', 'An asteroid with a heavily cratered surface.', 4300, 0.0030000000, false, false, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky way', 'Milky way is also a galaxy.', 3000, 0.2600000000, false, true, 2);
INSERT INTO public.galaxy VALUES ('Whirlpool', 'Whirlpoo l is  a galaxy too.', 400, 0.0100000000, false, false, 3);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Andromeda is a galaxy.', 10000, 0.3100000000, false, false, 1);
INSERT INTO public.galaxy VALUES ('Holovania', 'Holovania is a galaxy.', 10000, 0.9900000000, true, true, 4);
INSERT INTO public.galaxy VALUES ('Oleksii way', 'Oleksii way is also a galaxy.', 3000, 0.8800000000, true, true, 5);
INSERT INTO public.galaxy VALUES ('Whirlalex', 'Whirlalex is a galaxy too.', 400, 0.0100000000, true, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Lunaris', 'A cratered moon with deep valleys.', 4500, 0.0020000000, false, true, 1, 1);
INSERT INTO public.moon VALUES ('Selene', 'A silvery moon with icy peaks.', 3200, 0.0015000000, false, true, 2, 1);
INSERT INTO public.moon VALUES ('Titania', 'A dense moon with a thick atmosphere.', 2100, 0.0800000000, false, true, 3, 1);
INSERT INTO public.moon VALUES ('Oberon', 'A moon with towering ice ridges.', 2800, 0.0900000000, false, true, 4, 1);
INSERT INTO public.moon VALUES ('Europa', 'A frozen moon with a subsurface ocean.', 1200, 0.0010000000, false, true, 5, 1);
INSERT INTO public.moon VALUES ('Ganymede', 'The largest moon in the system.', 3600, 0.0010000000, false, true, 6, 1);
INSERT INTO public.moon VALUES ('Io', 'A volcanic moon with sulfuric plains.', 4000, 0.0010000000, false, true, 7, 1);
INSERT INTO public.moon VALUES ('Callisto', 'A heavily cratered, ancient moon.', 4500, 0.0010000000, false, true, 8, 1);
INSERT INTO public.moon VALUES ('Phobos', 'A small, irregularly shaped moon.', 4600, 0.0021000000, false, false, 9, 1);
INSERT INTO public.moon VALUES ('Deimos', 'A tiny, smooth moon orbiting close.', 4600, 0.0022000000, false, false, 10, 1);
INSERT INTO public.moon VALUES ('Charon', 'A large moon with deep canyons.', 2000, 0.0030000000, false, true, 11, 1);
INSERT INTO public.moon VALUES ('Miranda', 'A fractured moon with unique cliffs.', 3000, 0.0450000000, false, true, 12, 1);
INSERT INTO public.moon VALUES ('Rhea', 'An icy moon with wispy surface streaks.', 2500, 0.0310000000, false, true, 13, 1);
INSERT INTO public.moon VALUES ('Tethys', 'A moon with a large impact basin.', 2900, 0.0320000000, false, true, 14, 1);
INSERT INTO public.moon VALUES ('Dione', 'A heavily cratered moon with icy plains.', 3400, 0.0280000000, false, true, 15, 1);
INSERT INTO public.moon VALUES ('Enceladus', 'A moon with active ice geysers.', 1000, 0.0210000000, false, true, 16, 1);
INSERT INTO public.moon VALUES ('Hyperion', 'A tumbling, irregularly shaped moon.', 4000, 0.0170000000, false, false, 17, 1);
INSERT INTO public.moon VALUES ('Iapetus', 'A two-toned moon with large ridges.', 4100, 0.0390000000, false, true, 18, 1);
INSERT INTO public.moon VALUES ('Mimas', 'A moon with a giant crater.', 3900, 0.0100000000, false, true, 19, 1);
INSERT INTO public.moon VALUES ('Triton', 'A retrograde moon with nitrogen geysers.', 2300, 0.0020000000, false, true, 20, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Zebulon V', 'A gas giant with colorful storms.', 4200, 0.7200000000, true, false, 1, 1);
INSERT INTO public.planet VALUES ('Rexus Prime', 'A rocky planet covered in deserts.', 2700, 0.8700000000, true, false, 2, 1);
INSERT INTO public.planet VALUES ('Icarus', 'A molten planet with extreme heat.', 5100, 0.0450000000, true, false, 3, 1);
INSERT INTO public.planet VALUES ('Nova Terra', 'A water-rich world with vast oceans.', 3200, 0.9100000000, true, false, 4, 1);
INSERT INTO public.planet VALUES ('Gliese 581d', 'A potentially habitable exoplanet.', 700, 0.2000000000, true, false, 5, 1);
INSERT INTO public.planet VALUES ('Chronos', 'An icy planet with a thin atmosphere.', 1600, 0.5200000000, true, false, 6, 1);
INSERT INTO public.planet VALUES ('Aether', 'A mysterious planet with dense clouds.', 3000, 0.8900000000, true, false, 7, 1);
INSERT INTO public.planet VALUES ('Thalassa', 'A planet entirely covered in water.', 450, 0.1200000000, true, false, 8, 1);
INSERT INTO public.planet VALUES ('Xanthe', 'A planet with bright yellow sands.', 2000, 0.4000000000, true, false, 9, 1);
INSERT INTO public.planet VALUES ('Vortex', 'A stormy planet with high-speed winds.', 3500, 0.6200000000, true, false, 10, 1);
INSERT INTO public.planet VALUES ('Zion', 'A barren planet with massive canyons.', 2700, 0.7800000000, true, false, 11, 1);
INSERT INTO public.planet VALUES ('Ymir', 'An ice-covered dwarf planet.', 1200, 0.0032000000, true, false, 12, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'Sun is a star.', 4603, 0.0151000000, true, false, 1, 1);
INSERT INTO public.star VALUES ('Orion', 'Orion is also a star.', 1344, 0.1344000000, true, false, 2, 1);
INSERT INTO public.star VALUES ('yds', 'Yellow Drawn Star is a star too.', 100, 0.0001000000, false, true, 3, 1);
INSERT INTO public.star VALUES ('ods', 'Orange Drawn Star is a star.', 4603, 0.0151000000, true, false, 4, 1);
INSERT INTO public.star VALUES ('Oreon', 'Oreon is also an orea.', 1344, 0.1344000000, true, false, 5, 1);
INSERT INTO public.star VALUES ('Fedya', 'Fedya is a cat.', 100, 0.0001000000, false, true, 6, 1);


--
-- Name: asteroid_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_galaxy_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_gplanet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_gplanet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid uniquetest; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT uniquetest UNIQUE (asteroid_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

