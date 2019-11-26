--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE category (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name text NOT NULL,
    parent_id text,
    image_url text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE category OWNER TO postgres;

--
-- Name: listing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE listing (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    title text NOT NULL,
    price double precision NOT NULL,
    image_url text,
    description text NOT NULL,
    status text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    seller_id uuid NOT NULL,
    category_id uuid NOT NULL
);


ALTER TABLE listing OWNER TO postgres;

--
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE photos (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    listing_id uuid,
    image_url text NOT NULL
);


ALTER TABLE photos OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    username text NOT NULL,
    image_url text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (id, name, parent_id, image_url, created_at, updated_at) FROM stdin;
d4bcfaa9-3405-4dae-a1b5-ec3bb6f80ec2	Toys	\N	\N	2019-11-27 03:27:48	2019-11-27 03:27:48
612885d8-3dbd-4e43-99f4-bb74b62a53b6	Puzzle	d4bcfaa9-3405-4dae-a1b5-ec3bb6f80ec2	\N	2019-11-27 03:29:39	2019-11-27 03:29:39
5c4a51d4-b590-434b-96ca-742c3ba248e7	Rubik's Cube	612885d8-3dbd-4e43-99f4-bb74b62a53b6	https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Rubiks_cube_solved.jpg/330px-Rubiks_cube_solved.jpg	2019-11-27 03:30:08	2019-11-27 03:30:08
a089a980-1071-4d7f-9258-f31f48104f67	Eletronics	\N	\N	2019-11-27 03:31:23	2019-11-27 03:31:23
46667b57-1b0c-4cfa-82e5-5f59ad3091d1	Computer Accessories	a089a980-1071-4d7f-9258-f31f48104f67	\N	2019-11-27 03:32:38	2019-11-27 03:32:38
1e77d6d4-ed7e-4575-8b87-aef45f7ef704	Keyboards	46667b57-1b0c-4cfa-82e5-5f59ad3091d1	https://deskthority.net/wiki/images/thumb/1/1a/Apple_M0115_top.jpg/375px-Apple_M0115_top.jpg	2019-11-27 03:33:06	2019-11-27 03:33:06
\.


--
-- Data for Name: listing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY listing (id, title, price, image_url, description, status, created_at, updated_at, seller_id, category_id) FROM stdin;
bfb2cf85-ad20-4cde-99b1-c5b825504ed2	Gans Air SM 3x3 (Global Version)	4.41000000000000014	https://thegioirubik.com/wp-content/uploads/2017/09/Gan-SM-Std1-510x510.jpg	The GAN 356 Air SM has arrived! This highly-anticipated successor to the GAN 356 Air UM features an all-new design that has been optimized for magnetization, with specialized slots for holding the magnets, a new and improved elasticity system (GES V2), and a unique honeycomb design on the pieces. The Air SM feels very fast and quiet right out of the box. Each Air SM comes with a full set of 7 GES V2 spring components, GAN full bright stickers, a GAN CFOP tutorial pamphlet, plastic adjusting tool, and a GAN 356 Air SM VIP card.\n\nThe current 3x3 WR Average of 5.97 seconds was set by Feliks Zemdegs using this cube.	L	2019-11-27 03:38:47	2019-11-27 03:38:47	cad85b39-3854-449c-ad2b-50d34627ae64	5c4a51d4-b590-434b-96ca-742c3ba248e7
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photos (id, listing_id, image_url) FROM stdin;
0c0cfcf8-7e38-4ea7-87ec-4ec51c619eb5	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb31_b0466fee-3e70-43a0-b620-a56f7a94b0c8_1024x1024@2x.jpg?v=1540917923
fb301606-86af-4cc8-a8fb-66fdaffbb6b4	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre7_98bfb3b8-c5bb-405e-9cf1-387b14a00cf2_1024x1024@2x.jpg?v=1540917923
24f19f32-682d-4e00-b5d7-5839904e0ba6	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre8_1c2f7611-4294-4b8f-a6f7-5b6f1b75c63d_1024x1024@2x.jpg?v=1540917923
7659bc17-4b0f-4258-bba9-5064340d6e2d	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb2_2bb28e81-ce67-4872-bb0d-c1a39f0d8381_1024x1024@2x.jpg?v=1540917923
56172e85-e365-44da-9820-a61243de127b	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb13_df8c607d-da71-4d3f-9500-5402a643afe8_1024x1024@2x.jpg?v=1540917923
1c2a880b-b58c-4bc5-9383-56011dfba408	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb12_1024x1024@2x.jpg?v=1540917923
00e4c79c-2239-4bae-afcd-dd143484b0f4	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre1_1024x1024@2x.jpg?v=1540917923
5b9d9b61-38b5-4682-9a85-1925d47a5daf	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre2_1024x1024@2x.jpg?v=1540917923
b0a6e162-0e8b-4faa-a479-8ead364fc872	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre3_1024x1024@2x.jpg?v=1540917923
d1bef1b0-de0b-4fe2-8dc4-75a43d02259e	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre4_1024x1024@2x.jpg?v=1540917923
fe87472b-ab69-4b60-8f89-6ce308613967	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre6_e10876a6-b743-41f7-87c4-c9933c38077b_1024x1024@2x.jpg?v=1540917923
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, image_url, created_at, updated_at) FROM stdin;
cad85b39-3854-449c-ad2b-50d34627ae64	phattv	https://en.gravatar.com/userimage/69796590/f8d2c7dbef4c9b8dae2c84ccd14336f0.jpeg	2019-11-27 03:35:35	2019-11-27 03:35:35
\.


--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: listing listing_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY listing
    ADD CONSTRAINT listing_pk PRIMARY KEY (id);


--
-- Name: photos photos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pk PRIMARY KEY (id);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: category_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_name_index ON category USING btree (name);


--
-- Name: listing_title_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX listing_title_index ON listing USING btree (title);


--
-- Name: photos_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX photos_id_uindex ON photos USING btree (id);


--
-- Name: user_username_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_username_uindex ON "user" USING btree (username);


--
-- Name: listing listing_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY listing
    ADD CONSTRAINT listing_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: listing listing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY listing
    ADD CONSTRAINT listing_user_id_fkey FOREIGN KEY (seller_id) REFERENCES "user"(id);


--
-- Name: photos photos_listing_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_listing_id_fk FOREIGN KEY (listing_id) REFERENCES listing(id);


--
-- PostgreSQL database dump complete
--

