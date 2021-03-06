PGDMP         .                 y            vp_dashboard_db    13.1    13.1 o    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18978    vp_dashboard_db    DATABASE     s   CREATE DATABASE vp_dashboard_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE vp_dashboard_db;
                postgres    false            �           0    0    DATABASE vp_dashboard_db    ACL     1   GRANT ALL ON DATABASE vp_dashboard_db TO melwan;
                   postgres    false    3214            �            1259    20604    kpi_admin_data    TABLE     �   CREATE TABLE public.kpi_admin_data (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    kpi_id bigint NOT NULL
);
 "   DROP TABLE public.kpi_admin_data;
       public         heap    melwan    false            �            1259    20615    kpi_admin_data_audit    TABLE     �   CREATE TABLE public.kpi_admin_data_audit (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    audit_id bigint NOT NULL
);
 (   DROP TABLE public.kpi_admin_data_audit;
       public         heap    melwan    false            �            1259    20613    kpi_admin_data_audit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_admin_data_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.kpi_admin_data_audit_id_seq;
       public          melwan    false    203            �           0    0    kpi_admin_data_audit_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.kpi_admin_data_audit_id_seq OWNED BY public.kpi_admin_data_audit.id;
          public          melwan    false    202            �            1259    20626    kpi_admin_data_history    TABLE     �   CREATE TABLE public.kpi_admin_data_history (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    kpi_id bigint NOT NULL
);
 *   DROP TABLE public.kpi_admin_data_history;
       public         heap    melwan    false            �            1259    20624    kpi_admin_data_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_admin_data_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.kpi_admin_data_history_id_seq;
       public          melwan    false    205            �           0    0    kpi_admin_data_history_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.kpi_admin_data_history_id_seq OWNED BY public.kpi_admin_data_history.id;
          public          melwan    false    204            �            1259    20602    kpi_admin_data_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.kpi_admin_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.kpi_admin_data_id_seq;
       public          melwan    false    201            �           0    0    kpi_admin_data_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.kpi_admin_data_id_seq OWNED BY public.kpi_admin_data.id;
          public          melwan    false    200            �            1259    20637    kpi_basic_info    TABLE     �  CREATE TABLE public.kpi_basic_info (
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
 "   DROP TABLE public.kpi_basic_info;
       public         heap    melwan    false            �            1259    20649    kpi_basic_info_audit    TABLE     �   CREATE TABLE public.kpi_basic_info_audit (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    created_by character varying(255) NOT NULL,
    kpi_id bigint NOT NULL,
    operation character varying(255) NOT NULL
);
 (   DROP TABLE public.kpi_basic_info_audit;
       public         heap    melwan    false            �            1259    20647    kpi_basic_info_audit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_basic_info_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.kpi_basic_info_audit_id_seq;
       public          melwan    false    209            �           0    0    kpi_basic_info_audit_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.kpi_basic_info_audit_id_seq OWNED BY public.kpi_basic_info_audit.id;
          public          melwan    false    208            �            1259    20721    kpi_basic_info_history    TABLE     �  CREATE TABLE public.kpi_basic_info_history (
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
 *   DROP TABLE public.kpi_basic_info_history;
       public            melwan    false            �            1259    20635    kpi_basic_info_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.kpi_basic_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.kpi_basic_info_id_seq;
       public          melwan    false    207            �           0    0    kpi_basic_info_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.kpi_basic_info_id_seq OWNED BY public.kpi_basic_info.id;
          public          melwan    false    206            �            1259    20668    kpi_detailed_data    TABLE     �   CREATE TABLE public.kpi_detailed_data (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    kpi_id bigint NOT NULL
);
 %   DROP TABLE public.kpi_detailed_data;
       public         heap    melwan    false            �            1259    20676    kpi_detailed_data_audit    TABLE     �   CREATE TABLE public.kpi_detailed_data_audit (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    audit_id bigint NOT NULL
);
 +   DROP TABLE public.kpi_detailed_data_audit;
       public         heap    melwan    false            �            1259    20674    kpi_detailed_data_audit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_detailed_data_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.kpi_detailed_data_audit_id_seq;
       public          melwan    false    213            �           0    0    kpi_detailed_data_audit_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.kpi_detailed_data_audit_id_seq OWNED BY public.kpi_detailed_data_audit.id;
          public          melwan    false    212            �            1259    20684    kpi_detailed_data_history    TABLE     �   CREATE TABLE public.kpi_detailed_data_history (
    id bigint NOT NULL,
    threshold real NOT NULL,
    title character varying(255) NOT NULL,
    value real NOT NULL,
    kpi_id bigint NOT NULL
);
 -   DROP TABLE public.kpi_detailed_data_history;
       public         heap    melwan    false            �            1259    20682     kpi_detailed_data_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_detailed_data_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.kpi_detailed_data_history_id_seq;
       public          melwan    false    215            �           0    0     kpi_detailed_data_history_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.kpi_detailed_data_history_id_seq OWNED BY public.kpi_detailed_data_history.id;
          public          melwan    false    214            �            1259    20666    kpi_detailed_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kpi_detailed_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.kpi_detailed_data_id_seq;
       public          melwan    false    211            �           0    0    kpi_detailed_data_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.kpi_detailed_data_id_seq OWNED BY public.kpi_detailed_data.id;
          public          melwan    false    210            �            1259    20730    partition_dlvry_bau_rsrc_util    TABLE     ^  CREATE TABLE public.partition_dlvry_bau_rsrc_util (
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
 1   DROP TABLE public.partition_dlvry_bau_rsrc_util;
       public         heap    melwan    false    216            �            1259    20724    partition_dlvry_ttm_prfrm    TABLE     R  CREATE TABLE public.partition_dlvry_ttm_prfrm (
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
 -   DROP TABLE public.partition_dlvry_ttm_prfrm;
       public         heap    melwan    false    216            �            1259    20820    partition_finc_bep    TABLE     =  CREATE TABLE public.partition_finc_bep (
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
 &   DROP TABLE public.partition_finc_bep;
       public         heap    melwan    false    216            �            1259    20826    partition_finc_cep    TABLE     =  CREATE TABLE public.partition_finc_cep (
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
 &   DROP TABLE public.partition_finc_cep;
       public         heap    melwan    false    216            �            1259    20838    partition_finc_dmnd_sply    TABLE     O  CREATE TABLE public.partition_finc_dmnd_sply (
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
 ,   DROP TABLE public.partition_finc_dmnd_sply;
       public         heap    melwan    false    216            �            1259    20850    partition_finc_mnth_mlstn_trkr    TABLE     a  CREATE TABLE public.partition_finc_mnth_mlstn_trkr (
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
 2   DROP TABLE public.partition_finc_mnth_mlstn_trkr;
       public         heap    melwan    false    216            �            1259    20808    partition_finc_spnd_sts    TABLE     L  CREATE TABLE public.partition_finc_spnd_sts (
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
 +   DROP TABLE public.partition_finc_spnd_sts;
       public         heap    melwan    false    216            �            1259    20844    partition_finc_strg_them_prgrs    TABLE     a  CREATE TABLE public.partition_finc_strg_them_prgrs (
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
 2   DROP TABLE public.partition_finc_strg_them_prgrs;
       public         heap    melwan    false    216            �            1259    20814    partition_finc_tndr_bug    TABLE     L  CREATE TABLE public.partition_finc_tndr_bug (
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
 +   DROP TABLE public.partition_finc_tndr_bug;
       public         heap    melwan    false    216            �            1259    20832    partition_finc_tp_vndr    TABLE     I  CREATE TABLE public.partition_finc_tp_vndr (
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
 *   DROP TABLE public.partition_finc_tp_vndr;
       public         heap    melwan    false    216            �            1259    20784    partition_prfrm_inf_cmplnc    TABLE     U  CREATE TABLE public.partition_prfrm_inf_cmplnc (
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
 .   DROP TABLE public.partition_prfrm_inf_cmplnc;
       public         heap    melwan    false    216            �            1259    20802    partition_prfrm_prj_qlty_scr    TABLE     [  CREATE TABLE public.partition_prfrm_prj_qlty_scr (
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
 0   DROP TABLE public.partition_prfrm_prj_qlty_scr;
       public         heap    melwan    false    216            �            1259    20796    partition_prfrm_rqml    TABLE     C  CREATE TABLE public.partition_prfrm_rqml (
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
 (   DROP TABLE public.partition_prfrm_rqml;
       public         heap    melwan    false    216            �            1259    20790 #   partition_prfrm_rsrc_opmz_n_hir_sts    TABLE     p  CREATE TABLE public.partition_prfrm_rsrc_opmz_n_hir_sts (
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
 7   DROP TABLE public.partition_prfrm_rsrc_opmz_n_hir_sts;
       public         heap    melwan    false    216            �            1259    20778    partition_prfrm_scrcrd    TABLE     I  CREATE TABLE public.partition_prfrm_scrcrd (
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
 *   DROP TABLE public.partition_prfrm_scrcrd;
       public         heap    melwan    false    216            �            1259    20760    partition_srvc_cstmr_stsfc    TABLE     U  CREATE TABLE public.partition_srvc_cstmr_stsfc (
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
 .   DROP TABLE public.partition_srvc_cstmr_stsfc;
       public         heap    melwan    false    216            �            1259    20766    partition_srvc_dqhi    TABLE     @  CREATE TABLE public.partition_srvc_dqhi (
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
 '   DROP TABLE public.partition_srvc_dqhi;
       public         heap    melwan    false    216            �            1259    20736    partition_srvc_high_b2bc_kpis    TABLE     ^  CREATE TABLE public.partition_srvc_high_b2bc_kpis (
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
 1   DROP TABLE public.partition_srvc_high_b2bc_kpis;
       public         heap    melwan    false    216            �            1259    20754    partition_srvc_it_busns_trx    TABLE     X  CREATE TABLE public.partition_srvc_it_busns_trx (
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
 /   DROP TABLE public.partition_srvc_it_busns_trx;
       public         heap    melwan    false    216            �            1259    20772    partition_srvc_ovrl_fix_vlbrty    TABLE     a  CREATE TABLE public.partition_srvc_ovrl_fix_vlbrty (
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
 2   DROP TABLE public.partition_srvc_ovrl_fix_vlbrty;
       public         heap    melwan    false    216            �            1259    20748    partition_srvc_rduc_mttr_incdnt    TABLE     d  CREATE TABLE public.partition_srvc_rduc_mttr_incdnt (
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
 3   DROP TABLE public.partition_srvc_rduc_mttr_incdnt;
       public         heap    melwan    false    216            �            1259    20742    partition_srvc_vlbrty_clos    TABLE     U  CREATE TABLE public.partition_srvc_vlbrty_clos (
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
 .   DROP TABLE public.partition_srvc_vlbrty_clos;
       public         heap    melwan    false    216            �           2604    20607    kpi_admin_data id    DEFAULT     v   ALTER TABLE ONLY public.kpi_admin_data ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_id_seq'::regclass);
 @   ALTER TABLE public.kpi_admin_data ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    200    201    201            �           2604    20618    kpi_admin_data_audit id    DEFAULT     �   ALTER TABLE ONLY public.kpi_admin_data_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_audit_id_seq'::regclass);
 F   ALTER TABLE public.kpi_admin_data_audit ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    203    202    203            �           2604    20629    kpi_admin_data_history id    DEFAULT     �   ALTER TABLE ONLY public.kpi_admin_data_history ALTER COLUMN id SET DEFAULT nextval('public.kpi_admin_data_history_id_seq'::regclass);
 H   ALTER TABLE public.kpi_admin_data_history ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    204    205    205            �           2604    20640    kpi_basic_info id    DEFAULT     v   ALTER TABLE ONLY public.kpi_basic_info ALTER COLUMN id SET DEFAULT nextval('public.kpi_basic_info_id_seq'::regclass);
 @   ALTER TABLE public.kpi_basic_info ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    206    207    207            �           2604    20652    kpi_basic_info_audit id    DEFAULT     �   ALTER TABLE ONLY public.kpi_basic_info_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_basic_info_audit_id_seq'::regclass);
 F   ALTER TABLE public.kpi_basic_info_audit ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    209    208    209            �           2604    20671    kpi_detailed_data id    DEFAULT     |   ALTER TABLE ONLY public.kpi_detailed_data ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_id_seq'::regclass);
 C   ALTER TABLE public.kpi_detailed_data ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    211    210    211            �           2604    20679    kpi_detailed_data_audit id    DEFAULT     �   ALTER TABLE ONLY public.kpi_detailed_data_audit ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_audit_id_seq'::regclass);
 I   ALTER TABLE public.kpi_detailed_data_audit ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    212    213    213            �           2604    20687    kpi_detailed_data_history id    DEFAULT     �   ALTER TABLE ONLY public.kpi_detailed_data_history ALTER COLUMN id SET DEFAULT nextval('public.kpi_detailed_data_history_id_seq'::regclass);
 K   ALTER TABLE public.kpi_detailed_data_history ALTER COLUMN id DROP DEFAULT;
       public          melwan    false    214    215    215            d          0    20604    kpi_admin_data 
   TABLE DATA           B   COPY public.kpi_admin_data (id, title, value, kpi_id) FROM stdin;
    public          melwan    false    201   �       f          0    20615    kpi_admin_data_audit 
   TABLE DATA           J   COPY public.kpi_admin_data_audit (id, title, value, audit_id) FROM stdin;
    public          melwan    false    203   	�       h          0    20626    kpi_admin_data_history 
   TABLE DATA           J   COPY public.kpi_admin_data_history (id, title, value, kpi_id) FROM stdin;
    public          melwan    false    205   &�       j          0    20637    kpi_basic_info 
   TABLE DATA           �   COPY public.kpi_basic_info (id, caption, created_at, created_by, keep_audit, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    207   C�       l          0    20649    kpi_basic_info_audit 
   TABLE DATA           ]   COPY public.kpi_basic_info_audit (id, created_at, created_by, kpi_id, operation) FROM stdin;
    public          melwan    false    209   ��       n          0    20668    kpi_detailed_data 
   TABLE DATA           P   COPY public.kpi_detailed_data (id, threshold, title, value, kpi_id) FROM stdin;
    public          melwan    false    211   !�       p          0    20676    kpi_detailed_data_audit 
   TABLE DATA           X   COPY public.kpi_detailed_data_audit (id, threshold, title, value, audit_id) FROM stdin;
    public          melwan    false    213   ]�       r          0    20684    kpi_detailed_data_history 
   TABLE DATA           X   COPY public.kpi_detailed_data_history (id, threshold, title, value, kpi_id) FROM stdin;
    public          melwan    false    215   ��       t          0    20730    partition_dlvry_bau_rsrc_util 
   TABLE DATA           �   COPY public.partition_dlvry_bau_rsrc_util (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    218   ��       s          0    20724    partition_dlvry_ttm_prfrm 
   TABLE DATA           �   COPY public.partition_dlvry_ttm_prfrm (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    217   �       �          0    20820    partition_finc_bep 
   TABLE DATA           �   COPY public.partition_finc_bep (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    233   ��       �          0    20826    partition_finc_cep 
   TABLE DATA           �   COPY public.partition_finc_cep (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    234   ��       �          0    20838    partition_finc_dmnd_sply 
   TABLE DATA           �   COPY public.partition_finc_dmnd_sply (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    236   ¶       �          0    20850    partition_finc_mnth_mlstn_trkr 
   TABLE DATA           �   COPY public.partition_finc_mnth_mlstn_trkr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    238   ߶       �          0    20808    partition_finc_spnd_sts 
   TABLE DATA           �   COPY public.partition_finc_spnd_sts (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    231   ��       �          0    20844    partition_finc_strg_them_prgrs 
   TABLE DATA           �   COPY public.partition_finc_strg_them_prgrs (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    237   �       �          0    20814    partition_finc_tndr_bug 
   TABLE DATA           �   COPY public.partition_finc_tndr_bug (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    232   6�       �          0    20832    partition_finc_tp_vndr 
   TABLE DATA           �   COPY public.partition_finc_tp_vndr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    235   S�       }          0    20784    partition_prfrm_inf_cmplnc 
   TABLE DATA           �   COPY public.partition_prfrm_inf_cmplnc (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    227   p�       �          0    20802    partition_prfrm_prj_qlty_scr 
   TABLE DATA           �   COPY public.partition_prfrm_prj_qlty_scr (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    230   ��                 0    20796    partition_prfrm_rqml 
   TABLE DATA           �   COPY public.partition_prfrm_rqml (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    229   ��       ~          0    20790 #   partition_prfrm_rsrc_opmz_n_hir_sts 
   TABLE DATA           �   COPY public.partition_prfrm_rsrc_opmz_n_hir_sts (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    228   Ƿ       |          0    20778    partition_prfrm_scrcrd 
   TABLE DATA           �   COPY public.partition_prfrm_scrcrd (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    226   �       y          0    20760    partition_srvc_cstmr_stsfc 
   TABLE DATA           �   COPY public.partition_srvc_cstmr_stsfc (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    223   �       z          0    20766    partition_srvc_dqhi 
   TABLE DATA           �   COPY public.partition_srvc_dqhi (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    224   �       u          0    20736    partition_srvc_high_b2bc_kpis 
   TABLE DATA           �   COPY public.partition_srvc_high_b2bc_kpis (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    219   ;�       x          0    20754    partition_srvc_it_busns_trx 
   TABLE DATA           �   COPY public.partition_srvc_it_busns_trx (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    222   X�       {          0    20772    partition_srvc_ovrl_fix_vlbrty 
   TABLE DATA           �   COPY public.partition_srvc_ovrl_fix_vlbrty (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    225   u�       w          0    20748    partition_srvc_rduc_mttr_incdnt 
   TABLE DATA           �   COPY public.partition_srvc_rduc_mttr_incdnt (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    221   ��       v          0    20742    partition_srvc_vlbrty_clos 
   TABLE DATA           �   COPY public.partition_srvc_vlbrty_clos (id, caption, created_at, created_by, overall_threshold, overall_value, publish_date, title, updated_at, updated_by) FROM stdin;
    public          melwan    false    220   ��       �           0    0    kpi_admin_data_audit_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.kpi_admin_data_audit_id_seq', 1, false);
          public          melwan    false    202            �           0    0    kpi_admin_data_history_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.kpi_admin_data_history_id_seq', 1, false);
          public          melwan    false    204            �           0    0    kpi_admin_data_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.kpi_admin_data_id_seq', 1, false);
          public          melwan    false    200            �           0    0    kpi_basic_info_audit_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.kpi_basic_info_audit_id_seq', 14, true);
          public          melwan    false    208            �           0    0    kpi_basic_info_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.kpi_basic_info_id_seq', 4, true);
          public          melwan    false    206            �           0    0    kpi_detailed_data_audit_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.kpi_detailed_data_audit_id_seq', 19, true);
          public          melwan    false    212            �           0    0     kpi_detailed_data_history_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.kpi_detailed_data_history_id_seq', 40, true);
          public          melwan    false    214            �           0    0    kpi_detailed_data_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.kpi_detailed_data_id_seq', 20, true);
          public          melwan    false    210            �           2606    20623 .   kpi_admin_data_audit kpi_admin_data_audit_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.kpi_admin_data_audit
    ADD CONSTRAINT kpi_admin_data_audit_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.kpi_admin_data_audit DROP CONSTRAINT kpi_admin_data_audit_pkey;
       public            melwan    false    203            �           2606    20634 2   kpi_admin_data_history kpi_admin_data_history_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.kpi_admin_data_history
    ADD CONSTRAINT kpi_admin_data_history_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.kpi_admin_data_history DROP CONSTRAINT kpi_admin_data_history_pkey;
       public            melwan    false    205            �           2606    20612 "   kpi_admin_data kpi_admin_data_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kpi_admin_data
    ADD CONSTRAINT kpi_admin_data_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.kpi_admin_data DROP CONSTRAINT kpi_admin_data_pkey;
       public            melwan    false    201            �           2606    20657 .   kpi_basic_info_audit kpi_basic_info_audit_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.kpi_basic_info_audit
    ADD CONSTRAINT kpi_basic_info_audit_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.kpi_basic_info_audit DROP CONSTRAINT kpi_basic_info_audit_pkey;
       public            melwan    false    209            �           2606    20646 "   kpi_basic_info kpi_basic_info_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.kpi_basic_info
    ADD CONSTRAINT kpi_basic_info_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.kpi_basic_info DROP CONSTRAINT kpi_basic_info_pkey;
       public            melwan    false    207            �           2606    20681 4   kpi_detailed_data_audit kpi_detailed_data_audit_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.kpi_detailed_data_audit
    ADD CONSTRAINT kpi_detailed_data_audit_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.kpi_detailed_data_audit DROP CONSTRAINT kpi_detailed_data_audit_pkey;
       public            melwan    false    213            �           2606    20689 8   kpi_detailed_data_history kpi_detailed_data_history_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.kpi_detailed_data_history
    ADD CONSTRAINT kpi_detailed_data_history_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.kpi_detailed_data_history DROP CONSTRAINT kpi_detailed_data_history_pkey;
       public            melwan    false    215            �           2606    20673 (   kpi_detailed_data kpi_detailed_data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.kpi_detailed_data
    ADD CONSTRAINT kpi_detailed_data_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.kpi_detailed_data DROP CONSTRAINT kpi_detailed_data_pkey;
       public            melwan    false    211            �           1259    20690    title_index    INDEX     G   CREATE INDEX title_index ON public.kpi_basic_info USING btree (title);
    DROP INDEX public.title_index;
       public            melwan    false    207            �           2606    20691 *   kpi_admin_data fk5h480dwg2ssdjblvj3jjemb9v    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_admin_data
    ADD CONSTRAINT fk5h480dwg2ssdjblvj3jjemb9v FOREIGN KEY (kpi_id) REFERENCES public.kpi_basic_info(id);
 T   ALTER TABLE ONLY public.kpi_admin_data DROP CONSTRAINT fk5h480dwg2ssdjblvj3jjemb9v;
       public          melwan    false    201    207    3027            �           2606    20696 0   kpi_admin_data_audit fk8hh9bjyv2kwi0uc76klhbye0h    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_admin_data_audit
    ADD CONSTRAINT fk8hh9bjyv2kwi0uc76klhbye0h FOREIGN KEY (audit_id) REFERENCES public.kpi_basic_info_audit(id);
 Z   ALTER TABLE ONLY public.kpi_admin_data_audit DROP CONSTRAINT fk8hh9bjyv2kwi0uc76klhbye0h;
       public          melwan    false    209    3030    203            �           2606    20706 -   kpi_detailed_data fk8klqrs1d5f5rtf5pt8wvkqion    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_detailed_data
    ADD CONSTRAINT fk8klqrs1d5f5rtf5pt8wvkqion FOREIGN KEY (kpi_id) REFERENCES public.kpi_basic_info(id);
 W   ALTER TABLE ONLY public.kpi_detailed_data DROP CONSTRAINT fk8klqrs1d5f5rtf5pt8wvkqion;
       public          melwan    false    211    207    3027            �           2606    20711 3   kpi_detailed_data_audit fkmvu3gkgv1ihiog2k00uyggjh9    FK CONSTRAINT     �   ALTER TABLE ONLY public.kpi_detailed_data_audit
    ADD CONSTRAINT fkmvu3gkgv1ihiog2k00uyggjh9 FOREIGN KEY (audit_id) REFERENCES public.kpi_basic_info_audit(id);
 ]   ALTER TABLE ONLY public.kpi_detailed_data_audit DROP CONSTRAINT fkmvu3gkgv1ihiog2k00uyggjh9;
       public          melwan    false    213    209    3030            d      x������ � �      f      x������ � �      h      x������ � �      j   c   x�3�tI��,K-�T	�UH-J�/�M�KN�4202�50�54T0��26�21ճ�0�L�)O��,�46�41���L�)+��/)ɍ/(J+�ů�+F��� ص�      l   [   x�eʻ�  К�� �G����lH�3�(���Y��!Oh=Y�	�2��.�h���fĬ��W�aJP�S��v��k��.���_� ����      n   ,   x�3��4�t
�uv
�44�3�4�22����D-�b1z\\\ ��      p   C   x�34�4�t
�uv
�44�3\��paW��X��Zc.Cs�@A,jM�-1Ԛp��qqq V@�      r   :   x�36�4�t
�uv
�44�3�4�26����D-@b�XUZ`Qi�M����=... ���      t      x������ � �      s   a   x�3�tI��,K-�T	�UH-J�/�M�KN�4202�50�54T0��26�21ճ�4�L�)O��4 �?Δ�������������\�,� ��b���� a�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      }      x������ � �      �      x������ � �            x������ � �      ~      x������ � �      |      x������ � �      y      x������ � �      z      x������ � �      u      x������ � �      x      x������ � �      {      x������ � �      w      x������ � �      v      x������ � �     