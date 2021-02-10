--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-02-09 18:04:22

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
-- TOC entry 201 (class 1259 OID 20604)
-- Name: kpi_admin_data; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_admin_data (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    kpi_id bigint NOT NULL
);


ALTER TABLE public.kpi_admin_data OWNER TO melwan;

--
-- TOC entry 203 (class 1259 OID 20615)
-- Name: kpi_admin_data_audit; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_admin_data_audit (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    audit_id bigint NOT NULL
);


ALTER TABLE public.kpi_admin_data_audit OWNER TO melwan;

--
-- TOC entry 202 (class 1259 OID 20613)
-- Name: kpi_admin_data_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_admin_data_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_admin_data_audit_id_seq OWNER TO melwan;

--
-- TOC entry 3214 (class 0 OID 0)
-- Dependencies: 202
-- Name: kpi_admin_data_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_admin_data_audit_id_seq OWNED BY public.kpi_admin_data_audit.id;


--
-- TOC entry 205 (class 1259 OID 20626)
-- Name: kpi_admin_data_history; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_admin_data_history (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    kpi_id bigint NOT NULL
);


ALTER TABLE public.kpi_admin_data_history OWNER TO melwan;

--
-- TOC entry 204 (class 1259 OID 20624)
-- Name: kpi_admin_data_history_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_admin_data_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_admin_data_history_id_seq OWNER TO melwan;

--
-- TOC entry 3215 (class 0 OID 0)
-- Dependencies: 204
-- Name: kpi_admin_data_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_admin_data_history_id_seq OWNED BY public.kpi_admin_data_history.id;


--
-- TOC entry 200 (class 1259 OID 20602)
-- Name: kpi_admin_data_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_admin_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_admin_data_id_seq OWNER TO melwan;

--
-- TOC entry 3216 (class 0 OID 0)
-- Dependencies: 200
-- Name: kpi_admin_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_admin_data_id_seq OWNED BY public.kpi_admin_data.id;


--
-- TOC entry 207 (class 1259 OID 20637)
-- Name: kpi_basic_info; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_basic_info (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    keep_audit boolean DEFAULT true,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);


ALTER TABLE public.kpi_basic_info OWNER TO melwan;

--
-- TOC entry 209 (class 1259 OID 20649)
-- Name: kpi_basic_info_audit; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_basic_info_audit (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    kpi_id bigint NOT NULL,
    operation character varying(255) NOT NULL
);


ALTER TABLE public.kpi_basic_info_audit OWNER TO melwan;

--
-- TOC entry 208 (class 1259 OID 20647)
-- Name: kpi_basic_info_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_basic_info_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_basic_info_audit_id_seq OWNER TO melwan;

--
-- TOC entry 3217 (class 0 OID 0)
-- Dependencies: 208
-- Name: kpi_basic_info_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_basic_info_audit_id_seq OWNED BY public.kpi_basic_info_audit.id;


--
-- TOC entry 216 (class 1259 OID 20721)
-- Name: kpi_basic_info_history; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_basic_info_history (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
)
PARTITION BY LIST (title);


ALTER TABLE public.kpi_basic_info_history OWNER TO melwan;

--
-- TOC entry 206 (class 1259 OID 20635)
-- Name: kpi_basic_info_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_basic_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_basic_info_id_seq OWNER TO melwan;

--
-- TOC entry 3218 (class 0 OID 0)
-- Dependencies: 206
-- Name: kpi_basic_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_basic_info_id_seq OWNED BY public.kpi_basic_info.id;


--
-- TOC entry 211 (class 1259 OID 20668)
-- Name: kpi_detailed_data; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_detailed_data (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    kpi_id bigint NOT NULL
);


ALTER TABLE public.kpi_detailed_data OWNER TO melwan;

--
-- TOC entry 213 (class 1259 OID 20676)
-- Name: kpi_detailed_data_audit; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_detailed_data_audit (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    audit_id bigint NOT NULL
);


ALTER TABLE public.kpi_detailed_data_audit OWNER TO melwan;

--
-- TOC entry 212 (class 1259 OID 20674)
-- Name: kpi_detailed_data_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_detailed_data_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_detailed_data_audit_id_seq OWNER TO melwan;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 212
-- Name: kpi_detailed_data_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_detailed_data_audit_id_seq OWNED BY public.kpi_detailed_data_audit.id;


--
-- TOC entry 215 (class 1259 OID 20684)
-- Name: kpi_detailed_data_history; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.kpi_detailed_data_history (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    kpi_id bigint NOT NULL
);


ALTER TABLE public.kpi_detailed_data_history OWNER TO melwan;

--
-- TOC entry 214 (class 1259 OID 20682)
-- Name: kpi_detailed_data_history_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_detailed_data_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_detailed_data_history_id_seq OWNER TO melwan;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 214
-- Name: kpi_detailed_data_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_detailed_data_history_id_seq OWNED BY public.kpi_detailed_data_history.id;


--
-- TOC entry 210 (class 1259 OID 20666)
-- Name: kpi_detailed_data_id_seq; Type: SEQUENCE; Schema: public; Owner: melwan
--

CREATE SEQUENCE public.kpi_detailed_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kpi_detailed_data_id_seq OWNER TO melwan;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 210
-- Name: kpi_detailed_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melwan
--

ALTER SEQUENCE public.kpi_detailed_data_id_seq OWNED BY public.kpi_detailed_data.id;


--
-- TOC entry 218 (class 1259 OID 20730)
-- Name: partition_dlvry_bau_rsrc_util; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_dlvry_bau_rsrc_util (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_dlvry_bau_rsrc_util FOR VALUES IN ('dlvry_bau_rsrc_util');


ALTER TABLE public.partition_dlvry_bau_rsrc_util OWNER TO melwan;

--
-- TOC entry 217 (class 1259 OID 20724)
-- Name: partition_dlvry_ttm_prfrm; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_dlvry_ttm_prfrm (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_dlvry_ttm_prfrm FOR VALUES IN ('dlvry_ttm_prfrm');


ALTER TABLE public.partition_dlvry_ttm_prfrm OWNER TO melwan;

--
-- TOC entry 233 (class 1259 OID 20820)
-- Name: partition_finc_bep; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_bep (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_bep FOR VALUES IN ('finc_bep');


ALTER TABLE public.partition_finc_bep OWNER TO melwan;

--
-- TOC entry 234 (class 1259 OID 20826)
-- Name: partition_finc_cep; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_cep (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_cep FOR VALUES IN ('finc_cep');


ALTER TABLE public.partition_finc_cep OWNER TO melwan;

--
-- TOC entry 236 (class 1259 OID 20838)
-- Name: partition_finc_dmnd_sply; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_dmnd_sply (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_dmnd_sply FOR VALUES IN ('finc_dmnd_sply');


ALTER TABLE public.partition_finc_dmnd_sply OWNER TO melwan;

--
-- TOC entry 238 (class 1259 OID 20850)
-- Name: partition_finc_mnth_mlstn_trkr; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_mnth_mlstn_trkr (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_mnth_mlstn_trkr FOR VALUES IN ('finc_mnth_mlstn_trkr');


ALTER TABLE public.partition_finc_mnth_mlstn_trkr OWNER TO melwan;

--
-- TOC entry 231 (class 1259 OID 20808)
-- Name: partition_finc_spnd_sts; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_spnd_sts (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_spnd_sts FOR VALUES IN ('finc_spnd_sts');


ALTER TABLE public.partition_finc_spnd_sts OWNER TO melwan;

--
-- TOC entry 237 (class 1259 OID 20844)
-- Name: partition_finc_strg_them_prgrs; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_strg_them_prgrs (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_strg_them_prgrs FOR VALUES IN ('finc_strg_them_prgrs');


ALTER TABLE public.partition_finc_strg_them_prgrs OWNER TO melwan;

--
-- TOC entry 232 (class 1259 OID 20814)
-- Name: partition_finc_tndr_bug; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_tndr_bug (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_tndr_bug FOR VALUES IN ('finc_tndr_bug');


ALTER TABLE public.partition_finc_tndr_bug OWNER TO melwan;

--
-- TOC entry 235 (class 1259 OID 20832)
-- Name: partition_finc_tp_vndr; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_finc_tp_vndr (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_finc_tp_vndr FOR VALUES IN ('finc_tp_vndr');


ALTER TABLE public.partition_finc_tp_vndr OWNER TO melwan;

--
-- TOC entry 227 (class 1259 OID 20784)
-- Name: partition_prfrm_inf_cmplnc; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_prfrm_inf_cmplnc (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_prfrm_inf_cmplnc FOR VALUES IN ('prfrm_inf_cmplnc');


ALTER TABLE public.partition_prfrm_inf_cmplnc OWNER TO melwan;

--
-- TOC entry 230 (class 1259 OID 20802)
-- Name: partition_prfrm_prj_qlty_scr; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_prfrm_prj_qlty_scr (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_prfrm_prj_qlty_scr FOR VALUES IN ('prfrm_prj_qlty_scr');


ALTER TABLE public.partition_prfrm_prj_qlty_scr OWNER TO melwan;

--
-- TOC entry 229 (class 1259 OID 20796)
-- Name: partition_prfrm_rqml; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_prfrm_rqml (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_prfrm_rqml FOR VALUES IN ('prfrm_rqml');


ALTER TABLE public.partition_prfrm_rqml OWNER TO melwan;

--
-- TOC entry 228 (class 1259 OID 20790)
-- Name: partition_prfrm_rsrc_opmz_n_hir_sts; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_prfrm_rsrc_opmz_n_hir_sts (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_prfrm_rsrc_opmz_n_hir_sts FOR VALUES IN ('prfrm_rsrc_opmz_n_hir_sts');


ALTER TABLE public.partition_prfrm_rsrc_opmz_n_hir_sts OWNER TO melwan;

--
-- TOC entry 226 (class 1259 OID 20778)
-- Name: partition_prfrm_scrcrd; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_prfrm_scrcrd (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_prfrm_scrcrd FOR VALUES IN ('prfrm_scrcrd');


ALTER TABLE public.partition_prfrm_scrcrd OWNER TO melwan;

--
-- TOC entry 223 (class 1259 OID 20760)
-- Name: partition_srvc_cstmr_stsfc; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_cstmr_stsfc (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_cstmr_stsfc FOR VALUES IN ('srvc_cstmr_stsfc');


ALTER TABLE public.partition_srvc_cstmr_stsfc OWNER TO melwan;

--
-- TOC entry 224 (class 1259 OID 20766)
-- Name: partition_srvc_dqhi; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_dqhi (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_dqhi FOR VALUES IN ('srvc_dqhi');


ALTER TABLE public.partition_srvc_dqhi OWNER TO melwan;

--
-- TOC entry 219 (class 1259 OID 20736)
-- Name: partition_srvc_high_b2bc_kpis; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_high_b2bc_kpis (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_high_b2bc_kpis FOR VALUES IN ('srvc_high_b2bc_kpis');


ALTER TABLE public.partition_srvc_high_b2bc_kpis OWNER TO melwan;

--
-- TOC entry 222 (class 1259 OID 20754)
-- Name: partition_srvc_it_busns_trx; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_it_busns_trx (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_it_busns_trx FOR VALUES IN ('srvc_it_busns_trx');


ALTER TABLE public.partition_srvc_it_busns_trx OWNER TO melwan;

--
-- TOC entry 225 (class 1259 OID 20772)
-- Name: partition_srvc_ovrl_fix_vlbrty; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_ovrl_fix_vlbrty (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_ovrl_fix_vlbrty FOR VALUES IN ('srvc_ovrl_fix_vlbrty');


ALTER TABLE public.partition_srvc_ovrl_fix_vlbrty OWNER TO melwan;

--
-- TOC entry 221 (class 1259 OID 20748)
-- Name: partition_srvc_rduc_mttr_incdnt; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_rduc_mttr_incdnt (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_rduc_mttr_incdnt FOR VALUES IN ('srvc_rduc_mttr_incdnt');


ALTER TABLE public.partition_srvc_rduc_mttr_incdnt OWNER TO melwan;

--
-- TOC entry 220 (class 1259 OID 20742)
-- Name: partition_srvc_vlbrty_clos; Type: TABLE; Schema: public; Owner: melwan
--

CREATE TABLE public.partition_srvc_vlbrty_clos (
    id bigint NOT NULL,
    caption character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    overall_threshold real NOT NULL,
    overall_value real NOT NULL,
    publish_date timestamp without time zone,
    title character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    updated_by character varying(255)
);
ALTER TABLE ONLY public.kpi_basic_info_history ATTACH PARTITION public.partition_srvc_vlbrty_clos FOR VALUES IN ('srvc_vlbrty_clos');


ALTER TABLE public.partition_srvc_vlbrty_clos OWNER TO melwan;

--
-- TOC entry 3011 (class 2604 OID 20607)
-- Name: kpi_admin_data id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_id_seq'::regclass);


--
-- TOC entry 3012 (class 2604 OID 20618)
-- Name: kpi_admin_data_audit id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_audit_id_seq'::regclass);


--
-- TOC entry 3013 (class 2604 OID 20629)
-- Name: kpi_admin_data_history id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data_history ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_history_id_seq'::regclass);


--
-- TOC entry 3014 (class 2604 OID 20640)
-- Name: kpi_basic_info id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_basic_info ALTER COLUMN id SET DEFAULT nextval('public.kpi_basic_info_id_seq'::regclass);


--
-- TOC entry 3016 (class 2604 OID 20652)
-- Name: kpi_basic_info_audit id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_basic_info_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_basic_info_audit_id_seq'::regclass);


--
-- TOC entry 3017 (class 2604 OID 20671)
-- Name: kpi_detailed_data id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_id_seq'::regclass);


--
-- TOC entry 3018 (class 2604 OID 20679)
-- Name: kpi_detailed_data_audit id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_audit_id_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 20687)
-- Name: kpi_detailed_data_history id; Type: DEFAULT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data_history ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_history_id_seq'::regclass);


--
-- TOC entry 3172 (class 0 OID 20604)
-- Dependencies: 201
-- Data for Name: kpi_admin_data; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_admin_data (id, title, value, kpi_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 20615)
-- Dependencies: 203
-- Data for Name: kpi_admin_data_audit; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_admin_data_audit (id, title, value, audit_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 20626)
-- Dependencies: 205
-- Data for Name: kpi_admin_data_history; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_admin_data_history (id, title, value, kpi_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 20637)
-- Dependencies: 207
-- Data for Name: kpi_basic_info; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_basic_info (id, caption, created_at, created_by, keep_audit, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 20649)
-- Dependencies: 209
-- Data for Name: kpi_basic_info_audit; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_basic_info_audit (id, created_at, created_by, kpi_id, operation) FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 20668)
-- Dependencies: 211
-- Data for Name: kpi_detailed_data; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_detailed_data (id, threshold, title, value, kpi_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 20676)
-- Dependencies: 213
-- Data for Name: kpi_detailed_data_audit; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_detailed_data_audit (id, threshold, title, value, audit_id) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 20684)
-- Dependencies: 215
-- Data for Name: kpi_detailed_data_history; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.kpi_detailed_data_history (id, threshold, title, value, kpi_id) FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 20730)
-- Dependencies: 218
-- Data for Name: partition_dlvry_bau_rsrc_util; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_dlvry_bau_rsrc_util (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 20724)
-- Dependencies: 217
-- Data for Name: partition_dlvry_ttm_prfrm; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_dlvry_ttm_prfrm (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 20820)
-- Dependencies: 233
-- Data for Name: partition_finc_bep; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_bep (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 20826)
-- Dependencies: 234
-- Data for Name: partition_finc_cep; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_cep (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 20838)
-- Dependencies: 236
-- Data for Name: partition_finc_dmnd_sply; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_dmnd_sply (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 20850)
-- Dependencies: 238
-- Data for Name: partition_finc_mnth_mlstn_trkr; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_mnth_mlstn_trkr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 20808)
-- Dependencies: 231
-- Data for Name: partition_finc_spnd_sts; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_spnd_sts (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 20844)
-- Dependencies: 237
-- Data for Name: partition_finc_strg_them_prgrs; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_strg_them_prgrs (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 20814)
-- Dependencies: 232
-- Data for Name: partition_finc_tndr_bug; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_tndr_bug (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 20832)
-- Dependencies: 235
-- Data for Name: partition_finc_tp_vndr; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_finc_tp_vndr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 20784)
-- Dependencies: 227
-- Data for Name: partition_prfrm_inf_cmplnc; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_prfrm_inf_cmplnc (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 20802)
-- Dependencies: 230
-- Data for Name: partition_prfrm_prj_qlty_scr; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_prfrm_prj_qlty_scr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 20796)
-- Dependencies: 229
-- Data for Name: partition_prfrm_rqml; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_prfrm_rqml (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 20790)
-- Dependencies: 228
-- Data for Name: partition_prfrm_rsrc_opmz_n_hir_sts; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_prfrm_rsrc_opmz_n_hir_sts (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 20778)
-- Dependencies: 226
-- Data for Name: partition_prfrm_scrcrd; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_prfrm_scrcrd (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 20760)
-- Dependencies: 223
-- Data for Name: partition_srvc_cstmr_stsfc; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_cstmr_stsfc (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 20766)
-- Dependencies: 224
-- Data for Name: partition_srvc_dqhi; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_dqhi (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 20736)
-- Dependencies: 219
-- Data for Name: partition_srvc_high_b2bc_kpis; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_high_b2bc_kpis (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 20754)
-- Dependencies: 222
-- Data for Name: partition_srvc_it_busns_trx; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_it_busns_trx (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 20772)
-- Dependencies: 225
-- Data for Name: partition_srvc_ovrl_fix_vlbrty; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_ovrl_fix_vlbrty (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 20748)
-- Dependencies: 221
-- Data for Name: partition_srvc_rduc_mttr_incdnt; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_rduc_mttr_incdnt (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 20742)
-- Dependencies: 220
-- Data for Name: partition_srvc_vlbrty_clos; Type: TABLE DATA; Schema: public; Owner: melwan
--

COPY public.partition_srvc_vlbrty_clos (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 202
-- Name: kpi_admin_data_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_admin_data_audit_id_seq', 1, false);


--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 204
-- Name: kpi_admin_data_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_admin_data_history_id_seq', 1, false);


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 200
-- Name: kpi_admin_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_admin_data_id_seq', 1, false);


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 208
-- Name: kpi_basic_info_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_basic_info_audit_id_seq', 1, false);


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 206
-- Name: kpi_basic_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_basic_info_id_seq', 1, false);


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 212
-- Name: kpi_detailed_data_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_detailed_data_audit_id_seq', 1, false);


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 214
-- Name: kpi_detailed_data_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_detailed_data_history_id_seq', 1, false);


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 210
-- Name: kpi_detailed_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melwan
--

SELECT pg_catalog.setval('public.kpi_detailed_data_id_seq', 1, false);


--
-- TOC entry 3023 (class 2606 OID 20623)
-- Name: kpi_admin_data_audit kpi_admin_data_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data_audit
    ADD CONSTRAINT kpi_admin_data_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 20634)
-- Name: kpi_admin_data_history kpi_admin_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data_history
    ADD CONSTRAINT kpi_admin_data_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 20612)
-- Name: kpi_admin_data kpi_admin_data_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data
    ADD CONSTRAINT kpi_admin_data_pkey PRIMARY KEY (id);


--
-- TOC entry 3030 (class 2606 OID 20657)
-- Name: kpi_basic_info_audit kpi_basic_info_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_basic_info_audit
    ADD CONSTRAINT kpi_basic_info_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 20646)
-- Name: kpi_basic_info kpi_basic_info_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_basic_info
    ADD CONSTRAINT kpi_basic_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 20681)
-- Name: kpi_detailed_data_audit kpi_detailed_data_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data_audit
    ADD CONSTRAINT kpi_detailed_data_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3036 (class 2606 OID 20689)
-- Name: kpi_detailed_data_history kpi_detailed_data_history_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data_history
    ADD CONSTRAINT kpi_detailed_data_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 20673)
-- Name: kpi_detailed_data kpi_detailed_data_pkey; Type: CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data
    ADD CONSTRAINT kpi_detailed_data_pkey PRIMARY KEY (id);


--
-- TOC entry 3028 (class 1259 OID 20690)
-- Name: title_index; Type: INDEX; Schema: public; Owner: melwan
--

CREATE INDEX title_index ON public.kpi_basic_info USING btree (title);


--
-- TOC entry 3037 (class 2606 OID 20691)
-- Name: kpi_admin_data fk5h480dwg2ssdjblvj3jjemb9v; Type: FK CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data
    ADD CONSTRAINT fk5h480dwg2ssdjblvj3jjemb9v FOREIGN KEY (kpi_id) REFERENCES public.kpi_basic_info(id);


--
-- TOC entry 3038 (class 2606 OID 20696)
-- Name: kpi_admin_data_audit fk8hh9bjyv2kwi0uc76klhbye0h; Type: FK CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_admin_data_audit
    ADD CONSTRAINT fk8hh9bjyv2kwi0uc76klhbye0h FOREIGN KEY (audit_id) REFERENCES public.kpi_basic_info_audit(id);


--
-- TOC entry 3039 (class 2606 OID 20706)
-- Name: kpi_detailed_data fk8klqrs1d5f5rtf5pt8wvkqion; Type: FK CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data
    ADD CONSTRAINT fk8klqrs1d5f5rtf5pt8wvkqion FOREIGN KEY (kpi_id) REFERENCES public.kpi_basic_info(id);


--
-- TOC entry 3040 (class 2606 OID 20711)
-- Name: kpi_detailed_data_audit fkmvu3gkgv1ihiog2k00uyggjh9; Type: FK CONSTRAINT; Schema: public; Owner: melwan
--

ALTER TABLE ONLY public.kpi_detailed_data_audit
    ADD CONSTRAINT fkmvu3gkgv1ihiog2k00uyggjh9 FOREIGN KEY (audit_id) REFERENCES public.kpi_basic_info_audit(id);


-- Completed on 2021-02-09 18:04:22

--
-- PostgreSQL database dump complete
--

