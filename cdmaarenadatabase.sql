--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produk (
    id_produk character varying(255) NOT NULL,
    tipe character varying(255),
    merk character varying(255),
    waktu_pengumuman character varying(255),
    waktu_rilis character varying(255),
    gambar character varying(255)
);


ALTER TABLE public.produk OWNER TO postgres;

--
-- Name: score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.score (
    id_score integer NOT NULL,
    id_produk character varying(255),
    geekbench5_single integer,
    geekbench5_multi integer,
    dxomark integer,
    displaymate character varying(5),
    battery_endurance_rating character varying(10)
);


ALTER TABLE public.score OWNER TO postgres;

--
-- Name: score_id_score_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.score_id_score_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.score_id_score_seq OWNER TO postgres;

--
-- Name: score_id_score_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.score_id_score_seq OWNED BY public.score.id_score;


--
-- Name: spesifikasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spesifikasi (
    id_spesifikasi integer NOT NULL,
    id_produk character varying(255),
    sistem_operasi character varying(255),
    prosesor character varying(255),
    memori character varying(255),
    kamera_utama character varying(255),
    layar character varying(255),
    baterai character varying(255),
    warna character varying(255)
);


ALTER TABLE public.spesifikasi OWNER TO postgres;

--
-- Name: spesifikasi_id_spesifikasi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spesifikasi_id_spesifikasi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spesifikasi_id_spesifikasi_seq OWNER TO postgres;

--
-- Name: spesifikasi_id_spesifikasi_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spesifikasi_id_spesifikasi_seq OWNED BY public.spesifikasi.id_spesifikasi;


--
-- Name: score id_score; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score ALTER COLUMN id_score SET DEFAULT nextval('public.score_id_score_seq'::regclass);


--
-- Name: spesifikasi id_spesifikasi; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spesifikasi ALTER COLUMN id_spesifikasi SET DEFAULT nextval('public.spesifikasi_id_spesifikasi_seq'::regclass);


--
-- Data for Name: produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk (id_produk, tipe, merk, waktu_pengumuman, waktu_rilis, gambar) FROM stdin;
A2411	iPhone 12 Pro Max	Apple	13 Oktober 2020	13 November 2020	iPhone 12 Pro Max.jpg
V2047	X60 Pro	Vivo	29 Desember 2020	8 Januari 2021	VivoX60Pro.jpg
M2011K2G	Mi 11	Xiaomi	28 Desember 2020	1 Januari 2021	xiaomi_mi_11_midnight_gray_1_1.jpg
XQBC62	Xperia 1 III	Sony	14 April 2021	Segera Hadir	Sony Xperia 1 III.jpg
SM-G998B	Galaxy S21 Ultra	Samsung	14 Januari 2021	28 Januari 2021	S21U.jpg
\.


--
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.score (id_score, id_produk, geekbench5_single, geekbench5_multi, dxomark, displaymate, battery_endurance_rating) FROM stdin;
2	A2411	1584	4250	130	A+	95h
4	V2047	893	3183	110	A+	89h
5	M2011K2G	1133	3701	113	A+	89h
3	XQBC62	1145	3763	125	A+	102h
6	SM-G998B	1110	3584	138	A+	112h
\.


--
-- Data for Name: spesifikasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spesifikasi (id_spesifikasi, id_produk, sistem_operasi, prosesor, memori, kamera_utama, layar, baterai, warna) FROM stdin;
2	A2411	iOS 14	Apple A14 SoC, Apple Quad-core GPU, 5 nm	6/128 GB	12 MP, 1/1.8", 1.7 um, 26 mm, Dual Pixel Autofocus	6.7", 60 Hz, Super Retina XDR OLED, 2778 x 1284, 1200 nits	3687 mAh, 20 W	Graphite, Silver, Gold, Pacific Blue
4	V2047	Android 11, OriginOS	Samsung Exynos 1080 SoC, Mali-G78 MP10 GPU, 5 nm	12/256 GB	48 MP, 1/2", 0.8 um, 26 mm, Phase Detection Autofocus	6.56", 120 Hz, AMOLED, 2376 x 1080, 800 nits	4200 mAh, 33 W	Gray, Aurora
5	M2011K2G	Android 11, MIUI 12.5	Qualcomm Snapdragon 888 SoC, Adreno 660 GPU, 5 nm	8/128 GB	108 MP, 1/1.33", 0.8 um, 26 mm, Phase Detection Autofocus	6.81", 120 Hz, AMOLED, 3200 x 1440, 1500 nits	4600 mAh,  55 W	Horizon Blue, Cloud White, Midnight Gray, Special Edition Blue, Gold, Violet
3	XQBC62	Android 11	Qualcomm Snapdragon 888 SoC, Adreno 660 GPU, 5 nm	12/256 GB	12 MP, 1/1.7", 1.8 um, 24 mm, Dual Pixel Autofocus	6.5", 120 Hz, OLED, 3840 x 1644	4500 mAh, 30 W	Frosted Black, Frosted Gray, Frosted Purple
6	SM-G998B	Android 11, One UI 3.1	Samsung Exynos 2100 SoC, Mali-G78 MP14 GPU, 5 nm	12/256 GB	108 MP, 1/1.33", 0.8 um, 24 mm, Phase Detection Autofocus	6.9", 120 Hz, Dynamic AMOLED 2X, 3200 x 1440, 1500 nits	5000 mAh, 25 W	Phantom Black, Phantom Silver, Phantom Brown
\.


--
-- Name: score_id_score_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.score_id_score_seq', 6, true);


--
-- Name: spesifikasi_id_spesifikasi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spesifikasi_id_spesifikasi_seq', 6, true);


--
-- Name: produk produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk
    ADD CONSTRAINT produk_pkey PRIMARY KEY (id_produk);


--
-- Name: score score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_pkey PRIMARY KEY (id_score);


--
-- Name: spesifikasi spesifikasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spesifikasi
    ADD CONSTRAINT spesifikasi_pkey PRIMARY KEY (id_spesifikasi);


--
-- Name: score score_id_produk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.score
    ADD CONSTRAINT score_id_produk_fkey FOREIGN KEY (id_produk) REFERENCES public.produk(id_produk) ON DELETE CASCADE;


--
-- Name: spesifikasi spesifikasi_id_produk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spesifikasi
    ADD CONSTRAINT spesifikasi_id_produk_fkey FOREIGN KEY (id_produk) REFERENCES public.produk(id_produk) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

