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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    seller_id uuid NOT NULL,
    category_id uuid NOT NULL
);


ALTER TABLE listing OWNER TO postgres;

--
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE photo (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    listing_id uuid,
    image_url text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE photo OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "user" (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    username text NOT NULL,
    image_url text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    bio text
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
bfb2cf85-ad20-4cde-99b1-c5b825504ed2	Gans Air SM 3x3 (Global Version)	4.41000000000000014	https://thegioirubik.com/wp-content/uploads/2017/09/Gan-SM-Std1-510x510.jpg	The GAN 356 Air SM has arrived! This highly-anticipated successor to the GAN 356 Air UM features an all-new design that has been optimized for magnetization, with specialized slots for holding the magnets, a new and improved elasticity system (GES V2), and a unique honeycomb design on the pieces. The Air SM feels very fast and quiet right out of the box. Each Air SM comes with a full set of 7 GES V2 spring components, GAN full bright stickers, a GAN CFOP tutorial pamphlet, plastic adjusting tool, and a GAN 356 Air SM VIP card.\n\nThe current 3x3 WR Average of 5.97 seconds was set by Feliks Zemdegs using this cube.	L	2019-11-27 03:38:47	2019-11-27 03:38:47	094aef29-fb37-4034-8d23-2d07094d0df6	5c4a51d4-b590-434b-96ca-742c3ba248e7
a3f9cb59-213b-460d-95be-e371fedbe878	SA PROFILE DYE SUB KEYCAP SET PBT RETRO BEIGE FOR GH60 XD64 XD84 XD96 87 104	49.0499999999999972	https://ae01.alicdn.com/kf/HTB10RNReWSs3KVjSZPiq6AsiVXaW.jpg	SA Profile Retro Beige Dye-Subbed Keycaps.\n\nPls pay attentions: Only including keycaps, not including other things.\n \nSpce:\nProfile：SA(1-1-2-3-4-3)\nPBT Thickness:About 1.4mm(Thick PBT)\nColorway: Beige\\Grey\\Cyan\nTech: Dye-Subbed\n	L	2019-11-29 16:31:05.042	2019-11-28 16:31:05.042209	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
6d5f2c31-a530-47b9-9a80-8ef857c3e156	Vintage Apple Extended Keyboard M0115 Mechanical ALPS Orange Switches Box+cable	341.120000000000005	https://i.ebayimg.com/images/g/X4QAAOSwz2Bdvh1l/s-l1600.jpg	Vintage Apple Extended Keyboard M0115 Mechanical ALPS Orange Switches.Box + cable.\n\nGreat vintage condition.\n\nPlease see pictures.\n\nPictures are part of the description.\n\nVintage item. Sold as is.\n\nI have no way of testing it. So, it’s not tested.	L	2019-11-29 04:32:52	2019-11-27 04:32:52	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
d3f6e2ca-068f-4949-b777-6d9bd98461c5	QIYI WUQUE 4X4\n	30.0599999999999987	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/qiyiwuqueb1_300x300.jpg?v=1541017044	The QiYi MoFangGe WuQue 4x4 is the latest 4x4 to hit the market. At 62mm across and only 124 grams for the stickered version, the WuQue is noticeably lighter than other mainstream 4x4s of the same size. It features a variety of design improvements that are aimed at making the WuQue one of the top 4x4s on the market, and a pre-release version was already used to set a new Asian record.\n\n	L	2019-11-29 00:02:20	2019-11-29 00:02:22	094aef29-fb37-4034-8d23-2d07094d0df6	5c4a51d4-b590-434b-96ca-742c3ba248e7
9782f533-91df-4d2e-8c46-d28c2393957a	XD84 XIUDI 75% CUSTOM KEYBOARD PCB	43.5799999999999983	https://cdn.shopify.com/s/files/1/2711/4238/products/HTB1w2GWSXXXXXXDXpXXq6xXFXXXR_grande.jpg?v=1515505942	XD84 PCB\n\nPls pay attention: XD84 PCB only, not including other things:)\n\nWhen you try to falsh PCB at TKG(xd.tkg.io), pls choose Kimera, then choose XD84 at the config, pls TRY NOT TO choose XD84 PRO(PRO is not the same PCB with this edition)\n\nTIM截图20191120104545\n\nSpec\n\n1\\up tp 87 keys\n2\\Using Kimera Core\n2\\Compatible with KLE custom key\n3\\Supports TKG-TOOLS offline brush machine and TKG online brush machine\n4\\Standard ICSP interface\n5\\REVB and REVQE compatible expansion port\n6\\Underglow RGB PCB (supports LED installations for further customization)	L	2019-11-28 16:25:43.18983	2019-11-28 16:25:43.18983	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
ec206db6-c2b0-4301-b9ed-3a2250c782a8	DSA PROFILE DYE SUB KEYCAP SET PBT PLASTIC RETRO BEIGE FOR MECHANICAL KEYBOARD BEIGE GREY CYAN GH60 XD64 XD84 XD96 87 104	49.0499999999999972	https://ae01.alicdn.com/kf/HTB1ob39acfrK1Rjy1Xdq6yemFXaQ.jpg	DSA Profile Retro Beige Dye-Subbed Keycaps.\n\nPls pay attentions: Only including keycaps, not including other things.\n \nSpce:\nProfile：DSA\nPBT Thickness:About 1.4mm(Thick PBT)\nColorway: Beige\\Grey\\Cyan\nTech: Dye-Subbed	L	2019-11-28 16:17:58.535	2019-11-28 16:17:58.535	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
95be1d96-80a4-4ffc-a9c3-aab3b143eefb	KPREPUBLIC 139 JAPANESE ROOT JAPAN BLACK FONT LANGUAGE CHERRY PROFILE DYE SUB KEYCAP PBT FOR GH60 XD60 XD84 COSPAD TADA68 87 104	20.8999999999999986	https://ae01.alicdn.com/kf/HTB1DTfJE1OSBuNjy0Fdq6zDnVXad.jpg	139 PBT Keycaps(A product by KPrepublic)\n \nCompatible with Cherry MX switches and related clones, these keycaps are made of super-durable PBT plastic. They’re designed in Cherry profile for kinds of keyboards(such as XD64\\GH60\\RS96\\Tada68.......), and they’re finished with dye-sublimated legends. Total comes with max 139 keycaps (Base+Mod+Pro+Num+Space)\n \nSpecs\n \nPBT plastic\nThick PBT\nShading Light Keycaps\nDye sublimation legends\nColor: Familar with DSA Grinate or XDA Milestone, so the Alpha kit color is light white grey:)\nCompatible with MX switches (and clones)\nCherry profile\n3U/6U/625U/7U are Convex Spacebar\nlayout is as following pic\nBlack/Blue/Red/Purple Esc+Enter Tech: Dip Dye+Engraving\n \nIncluded\nMax 139 Keys(Base+Mod+Pro+Num+Space)\n \n\nJapanese (日本語 Nihongo, [ɲihoŋɡo] or [ɲihoŋŋo]) is an East Asian language spoken by about 128 million people, primarily in Japan, where it is the national language. It is a member of the Japonic (or Japanese-Ryukyuan) language family, and its relation to other languages, such as Korean, is debated. Japanese has been grouped with language families such as Ainu, Austroasiatic, and the now-discredited Altaic, but none of these proposals has gained widespread acceptance.\n \nLittle is known of the language's prehistory, or when it first appeared in Japan. Chinese documents from the 3rd century recorded a few Japanese words, but substantial texts did not appear until the 8th century. During the Heian period (794–1185), Chinese had considerable influence on the vocabulary and phonology of Old Japanese. Late Middle Japanese (1185–1600) included changes in features that brought it closer to the modern language, and the first appearance of European loanwords. The standard dialect moved from the Kansai region to the Edo (modern Tokyo) region in the Early Modern Japanese period (early 17th century–mid-19th century). Following the end in 1853 of Japan's self-imposed isolation, the flow of loanwords from European languages increased significantly. English loanwords, in particular, have become frequent, and Japanese words from English roots have proliferated.\n \nJapanese is an agglutinative, mora-timed language with simple phonotactics, a pure vowel system, phonemic vowel and consonant length, and a lexically significant pitch-accent. Word order is normally subject–object–verb with particles marking the grammatical function of words, and sentence structure is topic–comment. Sentence-final particles are used to add emotional or emphatic impact, or make questions. Nouns have no grammatical number or gender, and there are no articles. Verbs are conjugated, primarily for tense and voice, but not person. Japanese equivalents of adjectives are also conjugated. Japanese has a complex system of honorifics with verb forms and vocabulary to indicate the relative status of the speaker, the listener, and persons mentioned.\n \nJapanese has no genetic relationship with Chinese, but it makes extensive use of Chinese characters, or kanji (漢字), in its writing system, and a large portion of its vocabulary is borrowed from Chinese. Along with kanji, the Japanese writing system primarily uses two syllabic (or moraic) scripts, hiragana (ひらがな or 平仮名) and katakana (カタカナ or 片仮名). Latin script is used in a limited fashion, such as for imported acronyms, and the numeral system uses mostly Arabic numerals alongside traditional Chinese numerals.	L	2019-11-28 16:11:11.420616	2019-11-28 16:11:11.420616	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
7e5fbd89-df44-4f3d-a0d6-c415babaf03d	VALK 5x5 M	54.6499999999999986	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/3PzBzQbLCOsCv_1024x1024@2x.jpg?v=1561580823	The Valk 5 M is a fast, smooth 5x5 from QiYi, famous for setting the current 5x5 single and average world records. The first magnetic 5x5 by QiYi, this puzzle features medium/strong magnets, primary internals, and fantastic corner cutting. We expect this to be one of the top choices for top 5x5 solvers. If you're serious about this event, the Valk 5 M is a must.	L	2019-11-28 23:29:30	2019-11-28 23:29:32	a0d9ea69-159e-449e-b702-da6055300982	5c4a51d4-b590-434b-96ca-742c3ba248e7
ea2d2b4b-12a3-4e34-a650-cce80cf83c08	GAN 249 2x2 V2 M	24.5899999999999999	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2mb11_e66d8fbb-3ce0-4957-af13-fca968a63356_1024x1024@2x.jpg?v=1541016559	The GAN 249 V2 M the magnetized version of the GAN 249 V2. It features a honeycomb design on the corner contact points and an overall smooth feel. The Stickerless version features a bright stickerless color scheme, primary plastic internals, while the black plastic version features the GAN Full Bright color scheme and black plastic internals. It is packaged inside a special GAN box with a plastic tensioning tool and GAN CFOP pamphlet.	L	2019-11-29 23:33:11	2019-11-28 23:33:13	a0d9ea69-159e-449e-b702-da6055300982	5c4a51d4-b590-434b-96ca-742c3ba248e7
885d9904-15d0-4600-b2af-5a7c8c2c16ea	Rubik Cube Mirror Surface Speed Twist Cube Toys Brain Game Gift #5 - intl	5.80999999999999961	https://laz-img-sg.alicdn.com/p/4/3-x-3-rubik-cube-mirror-surface-speed-twist-cube-toys-brain-gamegift-5-intl-5459-61797613-bbde7a222a7d381c3628e051c0ce2c5c-catalog.jpg_340x340q80.jpg	Description:\n\nModern people face a variety of emotional states such as stress, frustration, tension and distraction. Now you only need to move a finger, to give yourself an effective psychological suggestion and adjust mood quickly, decompression magic cube, you deserve it.\n\n\nFeatures:\n\nGood quality smooth rotation and nice touch feeling.\nAmazing corner cutting, higher stability, great fault-tolerant performance.\nReally wonderful item to release your body and moods, make you focus on your work.\nSpecifically design for people who can't keep their fingers still.\nKeep yourself entertained anywhere! Perfect toy for those who need to keep their hands busy.\n\nSpecifications:\n\nCondition: 100% New Brand\n\nMaterial: ABS\n\nColor: #1, #2, #3, #4, #5, #6 (Optional)\n\nLevel: 3 Layers\n\nType: 3 x 3 x 3\n\nShape: Cubic Shaped\n\nSticker: Mirror Stickers\n\nSize (L x W x H): Approx. 5.7 x 5.7 x 5.7cm / 2.2 x 2.2 x 2.2inch\n\nPackage Weight: Approx. 100g\n\n\n\n\nPackage Included:\n\n1 x Anti-stress Cube	L	2019-11-28 16:38:24.741299	2019-11-28 16:38:24.741299	094aef29-fb37-4034-8d23-2d07094d0df6	5c4a51d4-b590-434b-96ca-742c3ba248e7
6f216f5e-2194-442d-823f-d28a86506d7f	Speed Dragon Professional Rdy Rubik Cube Smooth Puzzle 3x3 -black	4.99000000000000021	https://laz-img-sg.alicdn.com/p/4/stock-yj-speed-dragon-professional-rdy-rubik-cube-smooth-puzzle-3x3-black-6829-35763401-4e73dae6273e0f17aa884e2ff3da46be-catalog.jpg_340x340q80.jpg	Item name: puzzle\nMaterial: ABS\nSize: 5.65*5.65*5.65cm\nSuitable for: general\nFeature:\nOne of the best puzzle cube\nIt's good fine motor control and enduring patience forone person.\nExtremely fast with good cornering\nSmooth turning and cornering for speed cubing\nAmazing puzzle\n\n\n\n	L	2019-11-28 16:40:45.216318	2019-11-28 16:40:45.216318	094aef29-fb37-4034-8d23-2d07094d0df6	5c4a51d4-b590-434b-96ca-742c3ba248e7
21897f06-6a71-4354-94db-eb68adb74af5	PBT DOUBLESHOT KEYCAPS CHERRY PROFILE CARBON COLORWAY BEIGE ORANGE GREY FOR XD60 XD64 TADA68 96 XD84 XD68 1800 87 TKL 104 ANSI	30.0599999999999987	https://ae01.alicdn.com/kf/HTB1z3LyX5zxK1Rjy1zkq6yHrVXa0.jpg	PBT doubleshot keycaps-Carbon Colorway\n\nAs everyone knows, opening double shot mould is a very difficult thing for factories, and if we talk about PBT doubleshot  keycaps? You may say"are you nuts?" it seems that only Taihao(Taiwan) can make it all over the world. But it's history now. The first PBT Cherry profile double-shot keycaps, no doubt, rubbing his hands.\n \nThese PBT double-shot keycaps are made in CHN. It covers nearly all layouts, such as 104 ANSI,87 TKL, PokerII, Cherry 3494 or 3000\\18xx\\60%\\80%\\100%.\n \nSpec\nCherry profile\nDoubleshot 1.3 mm PBT plastic\nSupported layouts: 100%\\TKL\\60%\\US ANSI\\96\\75%\\40%\nMade in China\n \nPls, pay attention: Keycaps only, not including other things. All in one=104+Modifier+Spacebar:)\n	L	2019-11-28 16:22:54.335893	2019-11-28 16:22:54.335893	cad85b39-3854-449c-ad2b-50d34627ae64	1e77d6d4-ed7e-4575-8b87-aef45f7ef704
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY photo (id, listing_id, image_url, created_at) FROM stdin;
56c2781c-7485-4a31-8568-dfcfcd8b743f	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/b5cAAOSwEhldvh1o/s-l1600.jpg	2019-11-28 02:13:41
f4f13063-a74c-4944-bc89-77407852c095	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/VHQAAOSwnI9dvh1y/s-l1600.jpg	2019-11-28 02:13:41
56172e85-e365-44da-9820-a61243de127b	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb13_df8c607d-da71-4d3f-9500-5402a643afe8_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:30
20bf8651-a856-4247-854b-015fc576fe2f	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/dQAAAOSwbv9dvh1u/s-l1600.jpg	2019-11-28 02:13:39
24f19f32-682d-4e00-b5d7-5839904e0ba6	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre8_1c2f7611-4294-4b8f-a6f7-5b6f1b75c63d_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:29
02072ccc-8f5c-4144-ac54-df95bf03eece	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/k0kAAOSw5K5dvh2D/s-l1600.jpg	2019-11-28 02:13:45
90812cfa-3708-4345-bbbd-d083e1d4d372	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/S-IAAOSwoSldvh19/s-l1600.jpg	2019-11-28 02:13:44
8bac92ae-92e3-4a8a-ab49-ee706956586c	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/lK8AAOSwP3JdxNRw/s-l1600.jpg	2019-11-28 02:13:40
b88f2182-be38-49ca-99ce-3eaf9a0f146c	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/DUEAAOSwlkhdvh12/s-l1600.jpg	2019-11-28 02:13:43
b0a6e162-0e8b-4faa-a479-8ead364fc872	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre3_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:35
0c0cfcf8-7e38-4ea7-87ec-4ec51c619eb5	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb31_b0466fee-3e70-43a0-b620-a56f7a94b0c8_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:25
3b2a881b-761b-4993-bf67-7397e6352bcb	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/O78AAOSwwppdvh16/s-l1600.jpg	2019-11-28 02:13:43
1c2a880b-b58c-4bc5-9383-56011dfba408	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb12_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:31
7659bc17-4b0f-4258-bba9-5064340d6e2d	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmb2_2bb28e81-ce67-4872-bb0d-c1a39f0d8381_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:30
cc12517b-c263-41d3-83cb-3bbda9c3bc62	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/0TgAAOSw-~tdvh1-/s-l1600.jpg	2019-11-28 02:13:46
fe87472b-ab69-4b60-8f89-6ce308613967	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre6_e10876a6-b743-41f7-87c4-c9933c38077b_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:36
d1bef1b0-de0b-4fe2-8dc4-75a43d02259e	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre4_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:36
00e4c79c-2239-4bae-afcd-dd143484b0f4	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre1_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:33
1f665904-0d77-4d2a-8fd0-b39abc8b8e0f	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/X4QAAOSwz2Bdvh1l/s-l1600.jpg	2019-11-28 02:13:39
2b07ff2b-62a2-4904-a890-8b8d9e101976	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/C2UAAOSwhY1dvh2B/s-l1600.jpg	2019-11-28 02:13:45
5b9d9b61-38b5-4682-9a85-1925d47a5daf	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airsmpre2_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:32
71865687-6d17-4967-9904-9b71c957c33e	6d5f2c31-a530-47b9-9a80-8ef857c3e156	https://i.ebayimg.com/images/g/GDoAAOSw1Txdvh11/s-l1600.jpg	2019-11-28 02:13:42
fb301606-86af-4cc8-a8fb-66fdaffbb6b4	bfb2cf85-ad20-4cde-99b1-c5b825504ed2	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan356airspre7_98bfb3b8-c5bb-405e-9cf1-387b14a00cf2_1024x1024@2x.jpg?v=1540917923	2019-11-28 02:13:28
1fef31e4-4433-4838-88b0-28f60dd52a0f	7e5fbd89-df44-4f3d-a0d6-c415babaf03d	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/3PzBzQbLCOsCv_1024x1024@2x.jpg?v=1561580823	2019-11-28 23:30:23
b7f9d5e3-9f7e-48a8-83f3-3d6f68e9acf2	7e5fbd89-df44-4f3d-a0d6-c415babaf03d	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/B5gH08eqYHU1N_1024x1024@2x.jpg?v=1561580823	2019-11-28 23:30:41
8debb45c-665b-4832-b6f7-0d101ca41af9	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2mb11_e66d8fbb-3ce0-4957-af13-fca968a63356_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:58:41
3ce9999c-8153-456b-aa46-348f4427d037	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2b1_f486d9db-cc40-4dfe-b001-ca9253217c2d_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:59:01
6bef00ef-8b20-4242-9ab3-0e09db12e1b9	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2pre5_f27af8c7-314f-4343-b182-aa99f3b5d17d_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:59:14
baf853e2-a4cf-4f20-8a6e-be7325fd41bc	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2pre2_1aeac6c3-de95-4fbd-ac77-9802a1890095_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:59:27
cb17a835-32e5-446f-ab6c-00b22e345f0c	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2pre3_d516a953-11ba-4707-9999-016419ae95f7_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:59:40
b9ad53d7-d438-4fba-ae69-d2e1297068ef	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2pre4_1024x1024@2x.jpg?v=1541016559	2019-11-28 23:59:52
2a5322f8-42bd-44b7-853c-2d253fd3bf23	ea2d2b4b-12a3-4e34-a650-cce80cf83c08	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/gan249v2pre5_f27af8c7-314f-4343-b182-aa99f3b5d17d_1024x1024@2x.jpg?v=1541016559	2019-11-29 00:00:09
a4e680f6-8494-46d1-b19a-36810ab672c4	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre7_720x.jpg?v=1541017044	2019-11-29 00:08:31
c5ed74a2-15eb-4910-ab9f-cb91ad9bd474	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre1_720x.jpg?v=1541017044	2019-11-29 00:08:30
46b607d4-123f-40fd-bf7a-e8581cc122ca	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre10_720x.jpg?v=1541017044	2019-11-29 00:08:29
31e6a0f8-9d77-4e40-b96d-c022ed43e6f2	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/qiyiwuqueb2_720x.jpg?v=1541017044	2019-11-29 00:08:29
03d8afc2-c685-48f9-9a3d-037a43813c6a	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre11_720x.jpg?v=1541017044	2019-11-29 00:08:28
76a6e59c-2479-43bf-8ac9-5c5c207aaeae	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre3_720x.jpg?v=1541017044	2019-11-29 00:08:32
71f70f0b-ba10-483a-bdf3-a6845d637ab6	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/qiyiwuqueb1_300x300.jpg?v=1541017044	2019-11-29 00:08:27
e82c0128-ff65-4ba1-b159-c045f6412a9e	d3f6e2ca-068f-4949-b777-6d9bd98461c5	https://cdn.shopify.com/s/files/1/0035/5205/1273/products/wuquepre5_720x.jpg?v=1541017044	2019-11-29 00:08:31
de42098f-9f44-4b44-96dc-e2ea4dccd798	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB17fEkEY1YBuNjSszhq6AUsFXaj.jpg	2019-11-28 16:14:31.494388
cb2b05b0-c8f5-4bbb-900c-783040fd2305	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB15wyBwLiSBuNkSnhJq6zDcpXaI.jpg	2019-11-28 16:14:31.494388
325939b1-4b2d-48ed-9f1a-4cf417eb7e4d	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1IV22E1SSBuNjy0Flq6zBpVXau.jpg	2019-11-28 16:14:31.494388
d93b40ed-eb7b-4a19-9dfb-1611621b3450	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1l2nnwRyWBuNkSmFPq6xguVXaP.jpg	2019-11-28 16:14:31.494388
dd2fe49d-e517-4bd6-93af-5332d55eb410	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB13an4E.R1BeNjy0Fmq6z0wVXai.jpg	2019-11-28 16:14:31.494388
804a43c9-74cb-4c7e-8e86-3333a3f272e6	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1PbuDFnJYBeNjy1zeq6yhzVXaJ.jpg	2019-11-28 16:14:31.494388
5d5f18e9-e33b-4f5d-8259-44e59b868d12	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1SDObwOCYBuNkSnaVq6AMsVXaw.jpg	2019-11-28 16:14:31.494388
684f21ab-6b75-4ff9-a1c6-410de55b104f	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1r1zjwTXYBeNkHFrdq6AiuVXaN.jpg	2019-11-28 16:14:31.494388
d343e0b6-2e9c-4ecb-841c-5351c3cfba57	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1AyQwE_lYBeNjSszcq6zwhFXaD.jpg	2019-11-28 16:14:31.494388
9b4ca35d-579c-439a-97af-294fae316210	95be1d96-80a4-4ffc-a9c3-aab3b143eefb	https://ae01.alicdn.com/kf/HTB1LvEkEY1YBuNjSszhq6AUsFXa7.jpg	2019-11-28 16:14:31.494388
dd3c6ffd-cb46-4f45-b1da-b21f8111fba8	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1ob39acfrK1Rjy1Xdq6yemFXaQ.jpg	2019-11-28 16:19:13.689269
576cd997-4e28-4e23-8eac-8f6a2b7b2756	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1A3s1aifrK1RjSspbq6A4pFXaq.jpg	2019-11-28 16:19:13.689269
da60936e-0709-49f3-9b88-a600077d2b49	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1iZk9ajzuK1RjSsppq6xz0XXaM.jpg	2019-11-28 16:19:13.689269
b852ccec-6839-4e20-ba36-d70d53d9b8b7	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1pp.9ah2rK1RkSnhJq6ykdpXai.jpg	2019-11-28 16:19:13.689269
df3d48b2-89ff-4949-a53f-cb9846a6db19	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1CdM4afvsK1RjSspdq6AZepXak.jpg	2019-11-28 16:19:13.689269
7faae91e-b7f0-4922-bff9-ced822cb09ed	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1rfM6aiDxK1Rjy1zcq6yGeXXaJ.jpg	2019-11-28 16:19:13.689269
3185c334-1f83-406d-929f-59a7fddd1168	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1n6o6aiLxK1Rjy0Ffq6zYdVXao.jpg	2019-11-28 16:19:13.689269
02463c90-e481-4074-be42-d3b26b7e64d4	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1rBg5ainrK1RjSsziq6xptpXaA.jpg	2019-11-28 16:19:13.689269
fe64e01c-514f-4be6-8e8b-349b5163c9eb	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB106k9afvsK1Rjy0Fiq6zwtXXaP.jpg	2019-11-28 16:19:13.689269
5b01ca41-f1ef-4fce-96fb-b946cbaaebcf	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB16MteavjsK1Rjy1Xaq6zispXas.jpg	2019-11-28 16:19:13.689269
b97c8b3f-16e3-431d-aab0-65e630eaa3ec	ec206db6-c2b0-4301-b9ed-3a2250c782a8	https://ae01.alicdn.com/kf/HTB1JbA8ajDuK1RjSszdq6xGLpXa7.jpg	2019-11-28 16:19:13.689269
41211996-359b-49f6-ac2e-9f9693ebaba7	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1z3LyX5zxK1Rjy1zkq6yHrVXa0.jpg	2019-11-28 16:23:09.629382
46fa553a-b2d1-4386-b978-1fc371cb8900	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1YT_AX5zxK1RjSspjq6AS.pXae.jpg	2019-11-28 16:23:09.629382
fb5fd0d1-6da7-4447-902a-1988e3b7d35b	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1uQJ9a2fsK1RjSszbq6AqBXXaj.jpg	2019-11-28 16:23:09.629382
eb029827-749d-45cd-bc8f-159b687c23cf	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1EYTwX5frK1RjSspbq6A4pFXaP.jpg	2019-11-28 16:23:09.629382
77c01440-61ed-4129-8149-2923ed21f4ce	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1iOrBX5jrK1RjSsplq6xHmVXar.jpg	2019-11-28 16:23:09.629382
022a6d8b-6230-4dec-af70-e22badfa1d33	21897f06-6a71-4354-94db-eb68adb74af5	https://ae01.alicdn.com/kf/HTB1vMLyX5zxK1Rjy1zkq6yHrVXaj.jpg	2019-11-28 16:23:09.629382
4c368687-228e-465a-bf78-b9659629477c	9782f533-91df-4d2e-8c46-d28c2393957a	https://cdn.shopify.com/s/files/1/2711/4238/files/HTB1VLKSSXXXXXcWXpXXq6xXFXXXd.jpg?v=1515505842	2019-11-28 16:28:08.600824
de0b223f-76f6-4f61-8b38-a2abd9a30955	9782f533-91df-4d2e-8c46-d28c2393957a	https://cdn.shopify.com/s/files/1/2711/4238/files/HTB1LVGQSXXXXXXGXFXXq6xXFXXXG.jpg?v=1515505783	2019-11-28 16:28:08.600824
e33c841a-58b7-436b-8e78-fd478be1ddc1	9782f533-91df-4d2e-8c46-d28c2393957a	https://cdn.shopify.com/s/files/1/2711/4238/files/HTB1ewutSXXXXXcSXVXXq6xXFXXXT.jpg?v=1515505810	2019-11-28 16:28:08.600824
e500a69f-6743-45f1-98c9-724eb8a12fc5	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB10RNReWSs3KVjSZPiq6AsiVXaW.jpg	2019-11-28 16:31:44.746578
3d3b68c1-4740-4180-863e-ccab9293ebd0	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1SfRLe.uF3KVjSZK9q6zVtXXaX.jpg	2019-11-28 16:31:44.746578
bac3963c-fce8-4880-a2c1-f29e884b4fb5	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1qg0Me8aE3KVjSZLeq6xsSFXaB.jpg	2019-11-28 16:31:44.746578
0cb94698-3ff3-4c1c-b3ad-8a4c5a45cd51	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1GaXJe.GF3KVjSZFmq6zqPXXah.jpg	2019-11-28 16:31:44.746578
a13c2ad5-ac7f-4f52-8e63-4916e510e409	a3f9cb59-213b-460d-95be-e371fedbe878	https://cdn2.shopify.com/s/files/1/2711/4238/products/TIM_20190716093600.png?v=1563241158	2019-11-28 16:31:44.746578
2690793e-4967-4057-bb52-35cb4347148c	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1i94Je79E3KVjSZFGq6A19XXay.jpg	2019-11-28 16:31:44.746578
b2abe1b0-6a8e-4417-a261-fac999a9ea89	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1jQBIe4iH3KVjSZPfq6xBiVXav.jpg	2019-11-28 16:31:44.746578
caf79d8f-c80c-4386-9caa-ac2bfe1e1802	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB14otJe21H3KVjSZFHq6zKppXaT.jpg	2019-11-28 16:31:44.746578
a00ca1f9-5cb4-40ee-adc8-cfe3e17675f4	a3f9cb59-213b-460d-95be-e371fedbe878	https://ae01.alicdn.com/kf/HTB1SptMe7WE3KVjSZSyq6xocXXaf.jpg	2019-11-28 16:31:44.746578
368ec18b-f1ec-4a5c-9fb1-9dd0491fa22e	885d9904-15d0-4600-b2af-5a7c8c2c16ea	https://sg-live.slatic.net/v2/resize/products/108711872-1abaa5f8c9f8dc3189dbe4f0934f6777.jpg	2019-11-28 16:39:40.284113
8220b91b-dd4c-40c6-9187-c506481b4da7	885d9904-15d0-4600-b2af-5a7c8c2c16ea	https://sg-live.slatic.net/v2/resize/products/108711872-fa46b398f07a4146f95363f960a35b4c.jpg	2019-11-28 16:39:40.284113
b7944e1c-475f-4423-90c9-7a17c3dd7511	885d9904-15d0-4600-b2af-5a7c8c2c16ea	https://sg-live.slatic.net/v2/resize/products/108711872-7605eac1a449e191ff7a2037142a0b28.jpg	2019-11-28 16:39:40.284113
af9c9f8e-048b-474a-9406-8f28827583a4	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/e82e1fe64cefb6703ab52250fe544ea8.jpg	2019-11-28 16:41:50.591594
85388e78-8b04-4f09-bc9a-ca70b612e00f	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/846c5c8c942b2dff57bf138e591738c5.jpg	2019-11-28 16:41:50.591594
1ab7c34c-b07b-4131-bc80-44b01e33c52e	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/ac5c06db34c375e8887d11da873bdd65.jpg	2019-11-28 16:41:50.591594
4e227e45-d72c-4e88-8d2e-549028bf2a36	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/baa35c8d607128e080fbb166693b46e3.jpg	2019-11-28 16:41:50.591594
272c1411-54e6-4824-b990-cdfceea6f54b	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/fa7064ac815b4de49b19f004ec81d4cf.jpg	2019-11-28 16:41:50.591594
88aec5cb-d8a1-4b1d-b723-ea9440c0fa6b	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/2975a19362147d55b8cabcdafe1279a3.jpg	2019-11-28 16:41:50.591594
23f23b6c-ccd0-4f87-902b-500ba3ba7920	885d9904-15d0-4600-b2af-5a7c8c2c16ea	https://sg-live.slatic.net/v2/resize/products/108711872-7453d1a5aac55b9691b3f865f55542e8.jpg	2019-11-28 16:39:40.284113
62396dce-cd0e-425a-908d-dd717714244f	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/3d771842e89e4684551504f69c40c717.jpg	2019-11-28 16:41:50.591594
fd15bd5b-ccf6-4105-b120-252768a95e14	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/1b815a3992db346fb71afa848a33102b.jpg	2019-11-28 16:41:50.591594
8b6fa208-521d-444b-aabc-244e28fed3a7	6f216f5e-2194-442d-823f-d28a86506d7f	https://sg-live-01.slatic.net/original/8ca36e152a71234654174b8ed4efd90c.jpg	2019-11-28 16:41:50.591594
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, username, image_url, created_at, updated_at, bio) FROM stdin;
cad85b39-3854-449c-ad2b-50d34627ae64	phattv	https://imgur.com/EnuN560.jpg	2019-11-27 03:35:35	2019-11-27 03:35:35	Mechanical Keyboards seller
094aef29-fb37-4034-8d23-2d07094d0df6	N0ch1ll	https://imgur.com/tpj0oto.jpg	2019-11-28 23:23:42	2019-11-28 23:23:43	Rubik's Cubes seller
a0d9ea69-159e-449e-b702-da6055300982	noOne	https://www.puslisi.com/image/puslisi/image/data/all_product_images/product-223/SHS.jpg	2019-11-28 19:42:02.565048	2019-11-28 19:42:02.565048	I love Rubik's Cubes
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
-- Name: photo photos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
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

CREATE UNIQUE INDEX photos_id_uindex ON photo USING btree (id);


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
-- Name: photo photos_listing_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photos_listing_id_fk FOREIGN KEY (listing_id) REFERENCES listing(id);


--
-- PostgreSQL database dump complete
--

