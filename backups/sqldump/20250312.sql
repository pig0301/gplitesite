--
-- PostgreSQL database dump
--

-- Dumped from database version 10.17
-- Dumped by pg_dump version 14.1

-- Started on 2025-03-12 01:24:29

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

--
-- TOC entry 6 (class 2615 OID 25928)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2498 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 25929)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 25932)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2499 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 198 (class 1259 OID 25934)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 25937)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2500 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 200 (class 1259 OID 25939)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 25942)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2501 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 202 (class 1259 OID 25944)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 25950)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 25953)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2502 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 205 (class 1259 OID 25955)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2503 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 206 (class 1259 OID 25957)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 25960)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2504 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 208 (class 1259 OID 25962)
-- Name: coding_spider_emall_api; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coding_spider_emall_api (
    id integer NOT NULL,
    app_key character varying(10) NOT NULL,
    app_secret character varying(50) NOT NULL,
    auth_code character varying(100) NOT NULL,
    msg_type character varying(30) NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 25965)
-- Name: coding_spider_product_storage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coding_spider_product_storage (
    id integer NOT NULL,
    event_dt date NOT NULL,
    product_id character varying(45) NOT NULL,
    product_name character varying(45) NOT NULL,
    price double precision NOT NULL,
    storage_cnt integer NOT NULL,
    create_dttm timestamp with time zone NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 25968)
-- Name: coding_spider_product_storage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.coding_spider_product_storage ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coding_spider_product_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 25970)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- TOC entry 212 (class 1259 OID 25977)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2505 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 213 (class 1259 OID 25979)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 25982)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2506 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 215 (class 1259 OID 25984)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25990)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2507 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 217 (class 1259 OID 25992)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 25998)
-- Name: game_cg_mp700_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.game_cg_mp700_detail (
    id integer NOT NULL,
    round integer NOT NULL,
    step integer NOT NULL,
    start_dttm timestamp with time zone NOT NULL,
    end_dttm timestamp with time zone,
    produce_id integer NOT NULL,
    client_errors integer NOT NULL,
    informed_messages integer NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 26001)
-- Name: game_cg_mp700_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.game_cg_mp700_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2508 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_cg_mp700_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.game_cg_mp700_detail_id_seq OWNED BY public.game_cg_mp700_detail.id;


--
-- TOC entry 220 (class 1259 OID 26003)
-- Name: game_cg_mp700_prepare; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.game_cg_mp700_prepare (
    id integer NOT NULL,
    warehouse character varying(45) NOT NULL,
    account character varying(45) NOT NULL,
    is_ready character varying(1) NOT NULL,
    last_ready_dttm timestamp with time zone NOT NULL,
    last_used_dttm timestamp with time zone NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 26006)
-- Name: game_cg_mp700_produce; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.game_cg_mp700_produce (
    id integer NOT NULL,
    warehouse character varying(45) NOT NULL,
    main_chef character varying(45) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26009)
-- Name: game_cg_mp700_produce_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.game_cg_mp700_produce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2509 (class 0 OID 0)
-- Dependencies: 222
-- Name: game_cg_mp700_produce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.game_cg_mp700_produce_id_seq OWNED BY public.game_cg_mp700_produce.id;


--
-- TOC entry 223 (class 1259 OID 26011)
-- Name: game_cg_mp700_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.game_cg_mp700_status (
    id integer NOT NULL,
    finish_rounds integer NOT NULL,
    last_reconnect_dttm timestamp with time zone NOT NULL,
    last_reset_dttm timestamp with time zone NOT NULL,
    last_reboot_dttm timestamp with time zone NOT NULL,
    is_continue integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 26014)
-- Name: home_dingding_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.home_dingding_message (
    id integer NOT NULL,
    app_key character varying(30) NOT NULL,
    app_secret character varying(100) NOT NULL,
    agent_id bigint NOT NULL,
    to_user character varying(500) NOT NULL,
    msg_type character varying(30) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 26020)
-- Name: home_message_level; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.home_message_level (
    id integer NOT NULL,
    msg_info character varying(100) NOT NULL,
    wechat_msg_id integer,
    dingding_msg_id integer,
    emall_api_id integer
);


--
-- TOC entry 226 (class 1259 OID 26023)
-- Name: home_wechat_message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.home_wechat_message (
    id integer NOT NULL,
    corp_id character varying(30) NOT NULL,
    corp_secret character varying(100) NOT NULL,
    agent_id integer NOT NULL,
    to_user character varying(100) NOT NULL,
    msg_type character varying(30) NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 26026)
-- Name: snooker_campaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_campaign (
    id integer NOT NULL,
    event_dt date NOT NULL,
    gym_id integer NOT NULL,
    cue_id integer NOT NULL,
    opponent_id integer NOT NULL,
    let_points integer NOT NULL,
    is_finished character varying(1) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 26029)
-- Name: snooker_campaign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_campaign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2510 (class 0 OID 0)
-- Dependencies: 228
-- Name: snooker_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_campaign_id_seq OWNED BY public.snooker_campaign.id;


--
-- TOC entry 229 (class 1259 OID 26031)
-- Name: snooker_cue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_cue (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    material character varying(45) NOT NULL,
    owner_id integer NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 26034)
-- Name: snooker_cue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_cue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2511 (class 0 OID 0)
-- Dependencies: 230
-- Name: snooker_cue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_cue_id_seq OWNED BY public.snooker_cue.id;


--
-- TOC entry 231 (class 1259 OID 26036)
-- Name: snooker_frame; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_frame (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    opponent_id integer NOT NULL,
    cue_id integer NOT NULL,
    let_points integer NOT NULL,
    get_points integer NOT NULL,
    oppo_points integer NOT NULL,
    is_win character varying(1) NOT NULL,
    max_break integer,
    memo character varying(200)
);


--
-- TOC entry 232 (class 1259 OID 26039)
-- Name: snooker_frame_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_frame_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2512 (class 0 OID 0)
-- Dependencies: 232
-- Name: snooker_frame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_frame_id_seq OWNED BY public.snooker_frame.id;


--
-- TOC entry 233 (class 1259 OID 26041)
-- Name: snooker_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_group (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    is_show character varying(1) NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 26044)
-- Name: snooker_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2513 (class 0 OID 0)
-- Dependencies: 234
-- Name: snooker_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_group_id_seq OWNED BY public.snooker_group.id;


--
-- TOC entry 235 (class 1259 OID 26046)
-- Name: snooker_gym; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_gym (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    road character varying(45) NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 26049)
-- Name: snooker_gym_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_gym_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2514 (class 0 OID 0)
-- Dependencies: 236
-- Name: snooker_gym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_gym_id_seq OWNED BY public.snooker_gym.id;


--
-- TOC entry 237 (class 1259 OID 26051)
-- Name: snooker_player; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_player (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 26054)
-- Name: snooker_player_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.snooker_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2515 (class 0 OID 0)
-- Dependencies: 238
-- Name: snooker_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_player_id_seq OWNED BY public.snooker_player.id;


--
-- TOC entry 2223 (class 2604 OID 26056)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2224 (class 2604 OID 26057)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2225 (class 2604 OID 26058)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2226 (class 2604 OID 26059)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2227 (class 2604 OID 26060)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2228 (class 2604 OID 26061)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2229 (class 2604 OID 26062)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2231 (class 2604 OID 26063)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2232 (class 2604 OID 26064)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2233 (class 2604 OID 26065)
-- Name: game_cg_mp700_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_detail ALTER COLUMN id SET DEFAULT nextval('public.game_cg_mp700_detail_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26066)
-- Name: game_cg_mp700_produce id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_produce ALTER COLUMN id SET DEFAULT nextval('public.game_cg_mp700_produce_id_seq'::regclass);


--
-- TOC entry 2235 (class 2604 OID 26067)
-- Name: snooker_campaign id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_campaign ALTER COLUMN id SET DEFAULT nextval('public.snooker_campaign_id_seq'::regclass);


--
-- TOC entry 2236 (class 2604 OID 26068)
-- Name: snooker_cue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_cue ALTER COLUMN id SET DEFAULT nextval('public.snooker_cue_id_seq'::regclass);


--
-- TOC entry 2237 (class 2604 OID 26069)
-- Name: snooker_frame id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_frame ALTER COLUMN id SET DEFAULT nextval('public.snooker_frame_id_seq'::regclass);


--
-- TOC entry 2238 (class 2604 OID 26070)
-- Name: snooker_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_group ALTER COLUMN id SET DEFAULT nextval('public.snooker_group_id_seq'::regclass);


--
-- TOC entry 2239 (class 2604 OID 26071)
-- Name: snooker_gym id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_gym ALTER COLUMN id SET DEFAULT nextval('public.snooker_gym_id_seq'::regclass);


--
-- TOC entry 2240 (class 2604 OID 26072)
-- Name: snooker_player id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_player ALTER COLUMN id SET DEFAULT nextval('public.snooker_player_id_seq'::regclass);


--
-- TOC entry 2450 (class 0 OID 25929)
-- Dependencies: 196
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2452 (class 0 OID 25934)
-- Dependencies: 198
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2454 (class 0 OID 25939)
-- Dependencies: 200
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add campaign', 7, 'add_campaign');
INSERT INTO public.auth_permission VALUES (26, 'Can change campaign', 7, 'change_campaign');
INSERT INTO public.auth_permission VALUES (27, 'Can delete campaign', 7, 'delete_campaign');
INSERT INTO public.auth_permission VALUES (28, 'Can view campaign', 7, 'view_campaign');
INSERT INTO public.auth_permission VALUES (29, 'Can add cue', 8, 'add_cue');
INSERT INTO public.auth_permission VALUES (30, 'Can change cue', 8, 'change_cue');
INSERT INTO public.auth_permission VALUES (31, 'Can delete cue', 8, 'delete_cue');
INSERT INTO public.auth_permission VALUES (32, 'Can view cue', 8, 'view_cue');
INSERT INTO public.auth_permission VALUES (33, 'Can add frame', 9, 'add_frame');
INSERT INTO public.auth_permission VALUES (34, 'Can change frame', 9, 'change_frame');
INSERT INTO public.auth_permission VALUES (35, 'Can delete frame', 9, 'delete_frame');
INSERT INTO public.auth_permission VALUES (36, 'Can view frame', 9, 'view_frame');
INSERT INTO public.auth_permission VALUES (37, 'Can add group', 10, 'add_group');
INSERT INTO public.auth_permission VALUES (38, 'Can change group', 10, 'change_group');
INSERT INTO public.auth_permission VALUES (39, 'Can delete group', 10, 'delete_group');
INSERT INTO public.auth_permission VALUES (40, 'Can view group', 10, 'view_group');
INSERT INTO public.auth_permission VALUES (41, 'Can add gym', 11, 'add_gym');
INSERT INTO public.auth_permission VALUES (42, 'Can change gym', 11, 'change_gym');
INSERT INTO public.auth_permission VALUES (43, 'Can delete gym', 11, 'delete_gym');
INSERT INTO public.auth_permission VALUES (44, 'Can view gym', 11, 'view_gym');
INSERT INTO public.auth_permission VALUES (45, 'Can add player', 12, 'add_player');
INSERT INTO public.auth_permission VALUES (46, 'Can change player', 12, 'change_player');
INSERT INTO public.auth_permission VALUES (47, 'Can delete player', 12, 'delete_player');
INSERT INTO public.auth_permission VALUES (48, 'Can view player', 12, 'view_player');
INSERT INTO public.auth_permission VALUES (49, 'Can add cg_mp700_detail', 13, 'add_cg_mp700_detail');
INSERT INTO public.auth_permission VALUES (50, 'Can change cg_mp700_detail', 13, 'change_cg_mp700_detail');
INSERT INTO public.auth_permission VALUES (51, 'Can delete cg_mp700_detail', 13, 'delete_cg_mp700_detail');
INSERT INTO public.auth_permission VALUES (52, 'Can view cg_mp700_detail', 13, 'view_cg_mp700_detail');
INSERT INTO public.auth_permission VALUES (53, 'Can add cg_mp700_produce', 14, 'add_cg_mp700_produce');
INSERT INTO public.auth_permission VALUES (54, 'Can change cg_mp700_produce', 14, 'change_cg_mp700_produce');
INSERT INTO public.auth_permission VALUES (55, 'Can delete cg_mp700_produce', 14, 'delete_cg_mp700_produce');
INSERT INTO public.auth_permission VALUES (56, 'Can view cg_mp700_produce', 14, 'view_cg_mp700_produce');


--
-- TOC entry 2456 (class 0 OID 25944)
-- Dependencies: 202
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$150000$3FLh8ycBcZ8O$fJwv0SsAZtPmueQxToSNirhXltVYRu0vi9QStsEjUH8=', '2025-03-06 10:40:43.622453+08', true, 'pig0301', '', '', 'pig860301@msn.com', true, true, '2018-10-16 13:44:19.988916+08');


--
-- TOC entry 2457 (class 0 OID 25950)
-- Dependencies: 203
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2460 (class 0 OID 25957)
-- Dependencies: 206
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2462 (class 0 OID 25962)
-- Dependencies: 208
-- Data for Name: coding_spider_emall_api; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coding_spider_emall_api VALUES (1, '1JTG5wnz', 'APPDGqrxPAe2ZqsCnGSQbrlXPfP7WG2n', 'gJF1uejpOIlKFeIrFjyBwSZk1TyzS8OnastyCr5jatEtbnnyPGDli3v60HSEWeED', '自动增加');


--
-- TOC entry 2463 (class 0 OID 25965)
-- Dependencies: 209
-- Data for Name: coding_spider_product_storage; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108316, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:10:02.474108+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108317, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:10:02.477517+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108318, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:10:02.479783+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108319, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:10:02.482209+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108320, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:10:02.484627+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108321, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:10:02.4872+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108352, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:10:02.975945+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108353, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:10:02.993117+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108354, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:10:02.99524+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108355, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:10:02.996729+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108356, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:10:02.998354+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108357, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:10:02.99973+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108388, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 84, '2025-03-11 09:10:02.636466+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108389, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 246, '2025-03-11 09:10:02.639378+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108390, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 138, '2025-03-11 09:10:02.641372+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108391, '2025-03-11', '000010050', '如意金条50g', 34526, 25, '2025-03-11 09:10:02.643376+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108392, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 09:10:02.645359+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108393, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 09:10:02.647066+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108424, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 305, '2025-03-11 10:10:02.56675+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108425, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 354, '2025-03-11 10:10:02.570389+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108426, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 150, '2025-03-11 10:10:02.572965+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108427, '2025-03-11', '000010050', '如意金条50g', 34526, 19, '2025-03-11 10:10:02.575332+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108428, '2025-03-11', '000010100', '如意金条100g', 69052, 10, '2025-03-11 10:10:02.580062+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108429, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 10:10:02.582876+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108460, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 42, '2025-03-11 11:10:02.05849+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108461, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 237, '2025-03-11 11:10:02.061843+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108462, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 21, '2025-03-11 11:10:02.063649+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108463, '2025-03-11', '000010050', '如意金条50g', 34526, 8, '2025-03-11 11:10:02.06532+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108464, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 11:10:02.066789+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108465, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 11:10:02.068416+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108496, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 235, '2025-03-11 12:10:02.82356+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108497, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 275, '2025-03-11 12:10:02.827191+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108498, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 162, '2025-03-11 12:10:02.829089+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108499, '2025-03-11', '000010050', '如意金条50g', 34526, 17, '2025-03-11 12:10:02.830863+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108500, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 12:10:02.832835+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108501, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 12:10:02.834387+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108532, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 129, '2025-03-11 13:10:02.660185+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108533, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 83, '2025-03-11 13:10:02.664126+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108534, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 128, '2025-03-11 13:10:02.670416+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108535, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 13:10:02.672876+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108536, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 13:10:02.675078+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108537, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 13:10:02.677614+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108568, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 278, '2025-03-11 14:10:02.537227+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108569, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 338, '2025-03-11 14:10:02.541386+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108570, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 125, '2025-03-11 14:10:02.543766+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108571, '2025-03-11', '000010050', '如意金条50g', 34526, 15, '2025-03-11 14:10:02.546447+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108572, '2025-03-11', '000010100', '如意金条100g', 69052, 9, '2025-03-11 14:10:02.548202+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108573, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 14:10:02.549903+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108604, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 171, '2025-03-11 15:10:02.15807+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108605, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 262, '2025-03-11 15:10:02.16204+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108606, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 54, '2025-03-11 15:10:02.165156+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108607, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 15:10:02.168375+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108608, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:10:02.172365+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108609, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 15:10:02.174587+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108640, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 66, '2025-03-11 16:10:02.510308+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108641, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 164, '2025-03-11 16:10:02.513917+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108642, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 2, '2025-03-11 16:10:02.51708+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108643, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 16:10:02.519226+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108644, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 16:10:02.521615+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108645, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 16:10:02.523191+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108676, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 240, '2025-03-11 17:10:02.116517+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108677, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 324, '2025-03-11 17:10:02.127099+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108678, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 151, '2025-03-11 17:10:02.128967+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108679, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 17:10:02.130635+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108680, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 17:10:02.132829+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108681, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 17:10:02.138093+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108712, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 217, '2025-03-11 18:10:02.63154+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108713, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 301, '2025-03-11 18:10:02.639419+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108714, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 139, '2025-03-11 18:10:02.641631+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108715, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 18:10:02.643622+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108716, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:10:02.645607+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108717, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 18:10:02.647468+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108748, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 179, '2025-03-11 19:10:02.321197+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108749, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 273, '2025-03-11 19:10:02.325314+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108750, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 72, '2025-03-11 19:10:02.328018+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108751, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 19:10:02.330353+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108752, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 19:10:02.332741+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108753, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 19:10:02.33509+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108784, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 177, '2025-03-11 20:10:03.054436+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108785, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 279, '2025-03-11 20:10:03.058808+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108786, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 112, '2025-03-11 20:10:03.069917+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108787, '2025-03-11', '000010050', '如意金条50g', 34714.5, 5, '2025-03-11 20:10:03.072523+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108788, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 20:10:03.07593+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108789, '2025-03-11', '000010200', '如意金条200g', 138658, 2, '2025-03-11 20:10:03.078308+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108818, '2025-03-11', '000010100', '如意金条100g', 69429, 1, '2025-03-11 21:00:03.168482+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108819, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 21:00:03.170383+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108832, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 116, '2025-03-11 21:30:02.63009+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108833, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 216, '2025-03-11 21:30:02.634358+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108322, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:20:02.747235+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108323, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:20:02.750972+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108324, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:20:02.753241+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108325, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:20:02.755412+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108326, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:20:02.75747+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108327, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:20:02.759549+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108358, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:20:02.416938+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108359, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:20:02.420215+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108360, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:20:02.422565+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108361, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:20:02.425058+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108362, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:20:02.427323+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108363, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:20:02.429534+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108394, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 28, '2025-03-11 09:20:03.069717+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108395, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 197, '2025-03-11 09:20:03.073405+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108396, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 100, '2025-03-11 09:20:03.07611+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108397, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 09:20:03.078342+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108398, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 09:20:03.080744+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108399, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 09:20:03.083046+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108430, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 232, '2025-03-11 10:20:02.998905+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108431, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 338, '2025-03-11 10:20:03.010673+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108432, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 140, '2025-03-11 10:20:03.013257+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108433, '2025-03-11', '000010050', '如意金条50g', 34526, 12, '2025-03-11 10:20:03.015753+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108434, '2025-03-11', '000010100', '如意金条100g', 69052, 5, '2025-03-11 10:20:03.018898+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108435, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 10:20:03.02116+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108466, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 28, '2025-03-11 11:20:02.417826+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108467, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 239, '2025-03-11 11:20:02.42162+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108468, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 9, '2025-03-11 11:20:02.423941+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108469, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 11:20:02.425465+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108470, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 11:20:02.427169+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108471, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 11:20:02.429167+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108502, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 216, '2025-03-11 12:20:02.202393+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108503, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 269, '2025-03-11 12:20:02.205909+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108504, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 159, '2025-03-11 12:20:02.20858+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108505, '2025-03-11', '000010050', '如意金条50g', 34526, 12, '2025-03-11 12:20:02.210729+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108506, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 12:20:02.213016+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108507, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 12:20:02.21527+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108538, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 105, '2025-03-11 13:20:01.998164+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108539, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 75, '2025-03-11 13:20:02.008441+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108540, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 117, '2025-03-11 13:20:02.020755+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108541, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 13:20:02.023904+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108542, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 13:20:02.030691+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108543, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 13:20:02.034092+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108574, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 266, '2025-03-11 14:20:02.989643+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108575, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 326, '2025-03-11 14:20:02.993746+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108576, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 114, '2025-03-11 14:20:02.996357+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108577, '2025-03-11', '000010050', '如意金条50g', 34526, 22, '2025-03-11 14:20:02.999546+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108578, '2025-03-11', '000010100', '如意金条100g', 69052, 9, '2025-03-11 14:20:03.001906+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108579, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 14:20:03.003986+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108610, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 155, '2025-03-11 15:20:02.564756+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108611, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 252, '2025-03-11 15:20:02.570173+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108612, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 28, '2025-03-11 15:20:02.575157+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108613, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 15:20:02.577448+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108614, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:20:02.57996+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108615, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 15:20:02.582092+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108646, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 300, '2025-03-11 16:20:02.921743+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108647, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 353, '2025-03-11 16:20:02.934197+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108648, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 153, '2025-03-11 16:20:02.937005+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108649, '2025-03-11', '000010050', '如意金条50g', 34526, 21, '2025-03-11 16:20:02.946011+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108650, '2025-03-11', '000010100', '如意金条100g', 69052, 10, '2025-03-11 16:20:02.948523+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108651, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 16:20:02.950908+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108682, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 253, '2025-03-11 17:20:02.495269+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108683, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 332, '2025-03-11 17:20:02.498895+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108684, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 143, '2025-03-11 17:20:02.500625+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108685, '2025-03-11', '000010050', '如意金条50g', 34526, 7, '2025-03-11 17:20:02.50255+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108686, '2025-03-11', '000010100', '如意金条100g', 69052, 3, '2025-03-11 17:20:02.504383+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108687, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 17:20:02.506442+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108718, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 206, '2025-03-11 18:20:02.055484+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108719, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 296, '2025-03-11 18:20:02.059574+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108720, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 131, '2025-03-11 18:20:02.062132+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108721, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 18:20:02.069377+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108722, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:20:02.071613+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108723, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 18:20:02.074535+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108754, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 177, '2025-03-11 19:20:02.786714+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108755, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 275, '2025-03-11 19:20:02.790597+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108756, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 64, '2025-03-11 19:20:02.793337+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108757, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 19:20:02.796595+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108758, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 19:20:02.798261+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108759, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 19:20:02.799874+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108790, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 162, '2025-03-11 20:20:02.500098+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108791, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 270, '2025-03-11 20:20:02.503568+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108792, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 101, '2025-03-11 20:20:02.505405+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108793, '2025-03-11', '000010050', '如意金条50g', 34714.5, 3, '2025-03-11 20:20:02.507359+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108794, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 20:20:02.508877+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108795, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 20:20:02.510777+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108820, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 124, '2025-03-11 21:10:02.682433+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108821, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 225, '2025-03-11 21:10:02.686646+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108822, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 73, '2025-03-11 21:10:02.688656+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108823, '2025-03-11', '000010050', '如意金条50g', 34714.5, 9, '2025-03-11 21:10:02.690209+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108328, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:30:02.201735+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108329, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:30:02.205397+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108330, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:30:02.207736+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108331, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:30:02.213697+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108332, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:30:02.215475+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108333, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:30:02.218115+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108364, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:30:02.855778+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108365, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:30:02.859913+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108366, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:30:02.862242+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108367, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:30:02.86819+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108368, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:30:02.87004+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108369, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:30:02.871827+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108400, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 0, '2025-03-11 09:30:02.504918+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108401, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 125, '2025-03-11 09:30:02.508034+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108402, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 35, '2025-03-11 09:30:02.510035+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108403, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 09:30:02.51171+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108404, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 09:30:02.513375+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108405, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 09:30:02.516011+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108436, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 177, '2025-03-11 10:30:02.388079+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108437, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 309, '2025-03-11 10:30:02.391163+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108438, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 121, '2025-03-11 10:30:02.393602+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108439, '2025-03-11', '000010050', '如意金条50g', 34526, 7, '2025-03-11 10:30:02.395616+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108440, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 10:30:02.397858+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108441, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 10:30:02.399917+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108472, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 283, '2025-03-11 11:30:02.888893+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108473, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 324, '2025-03-11 11:30:02.894401+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108474, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 130, '2025-03-11 11:30:02.896418+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108475, '2025-03-11', '000010050', '如意金条50g', 34526, 10, '2025-03-11 11:30:02.898257+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108476, '2025-03-11', '000010100', '如意金条100g', 69052, 9, '2025-03-11 11:30:02.899806+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108477, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 11:30:02.901404+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108508, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 193, '2025-03-11 12:30:02.753514+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108509, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 209, '2025-03-11 12:30:02.756462+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108510, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 150, '2025-03-11 12:30:02.75873+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108511, '2025-03-11', '000010050', '如意金条50g', 34526, 7, '2025-03-11 12:30:02.761375+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108512, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 12:30:02.763475+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108513, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 12:30:02.76555+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108544, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 97, '2025-03-11 13:30:02.418519+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108545, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 71, '2025-03-11 13:30:02.421979+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108546, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 115, '2025-03-11 13:30:02.424456+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108547, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 13:30:02.426786+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108548, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 13:30:02.428722+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108549, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 13:30:02.430311+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108580, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 251, '2025-03-11 14:30:02.440926+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108581, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 311, '2025-03-11 14:30:02.444376+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108582, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 109, '2025-03-11 14:30:02.446381+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108583, '2025-03-11', '000010050', '如意金条50g', 34526, 18, '2025-03-11 14:30:02.448347+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108584, '2025-03-11', '000010100', '如意金条100g', 69052, 6, '2025-03-11 14:30:02.453234+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108585, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 14:30:02.455386+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108616, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 137, '2025-03-11 15:30:02.967896+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108617, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 230, '2025-03-11 15:30:02.975437+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108618, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 13, '2025-03-11 15:30:02.97806+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108619, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 15:30:02.979704+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108620, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:30:02.981471+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108621, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 15:30:02.982984+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108652, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 273, '2025-03-11 16:30:02.502643+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108653, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 323, '2025-03-11 16:30:02.507282+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108654, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 154, '2025-03-11 16:30:02.510515+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108655, '2025-03-11', '000010050', '如意金条50g', 34526, 17, '2025-03-11 16:30:02.512767+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108656, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 16:30:02.514909+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108657, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 16:30:02.517004+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108688, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 243, '2025-03-11 17:30:02.921927+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108689, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 325, '2025-03-11 17:30:02.937022+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108690, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 139, '2025-03-11 17:30:02.939385+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108691, '2025-03-11', '000010050', '如意金条50g', 34526, 8, '2025-03-11 17:30:02.940992+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108692, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 17:30:02.942478+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108693, '2025-03-11', '000010200', '如意金条200g', 137904, 3, '2025-03-11 17:30:02.943927+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108724, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 202, '2025-03-11 18:30:02.57196+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108725, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 276, '2025-03-11 18:30:02.578387+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108726, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 102, '2025-03-11 18:30:02.586358+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108727, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 18:30:02.589626+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108728, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:30:02.592114+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108729, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 18:30:02.601811+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108760, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 177, '2025-03-11 19:30:02.301008+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108761, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 264, '2025-03-11 19:30:02.304931+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108762, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 67, '2025-03-11 19:30:02.308549+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108763, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 19:30:02.314938+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108764, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 19:30:02.31692+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108765, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 19:30:02.319501+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108796, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 151, '2025-03-11 20:30:02.94081+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108797, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 257, '2025-03-11 20:30:02.953309+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108798, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 87, '2025-03-11 20:30:02.957787+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108799, '2025-03-11', '000010050', '如意金条50g', 34714.5, 0, '2025-03-11 20:30:02.966853+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108800, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 20:30:02.972938+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108801, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 20:30:02.97459+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108824, '2025-03-11', '000010100', '如意金条100g', 69429, 1, '2025-03-11 21:10:02.69213+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108825, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 21:10:02.694946+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108834, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 82, '2025-03-11 21:30:02.636934+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108835, '2025-03-11', '000010050', '如意金条50g', 34714.5, 6, '2025-03-11 21:30:02.639096+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108334, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:40:02.674955+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108335, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:40:02.677763+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108336, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:40:02.680224+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108337, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:40:02.682596+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108338, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:40:02.684755+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108339, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:40:02.687056+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108370, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:40:02.243345+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108371, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:40:02.246547+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108372, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:40:02.248411+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108373, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:40:02.250511+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108374, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:40:02.253322+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108375, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:40:02.254986+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108406, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 1, '2025-03-11 09:40:02.93798+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108407, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 50, '2025-03-11 09:40:02.945258+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108408, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 1, '2025-03-11 09:40:02.947357+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108409, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 09:40:02.949693+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108410, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 09:40:02.951766+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108411, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 09:40:02.953991+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108442, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 140, '2025-03-11 10:40:02.807896+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108443, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 297, '2025-03-11 10:40:02.810907+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108444, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 82, '2025-03-11 10:40:02.813435+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108445, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 10:40:02.815951+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108446, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 10:40:02.817891+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108447, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 10:40:02.819581+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108478, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 270, '2025-03-11 11:40:02.451393+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108479, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 317, '2025-03-11 11:40:02.455029+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108480, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 157, '2025-03-11 11:40:02.456879+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108481, '2025-03-11', '000010050', '如意金条50g', 34526, 9, '2025-03-11 11:40:02.45872+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108482, '2025-03-11', '000010100', '如意金条100g', 69052, 8, '2025-03-11 11:40:02.460508+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108483, '2025-03-11', '000010200', '如意金条200g', 137904, 3, '2025-03-11 11:40:02.463763+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108514, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 171, '2025-03-11 12:40:02.194446+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108515, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 197, '2025-03-11 12:40:02.199329+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108516, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 151, '2025-03-11 12:40:02.20119+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108517, '2025-03-11', '000010050', '如意金条50g', 34526, 4, '2025-03-11 12:40:02.202951+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108518, '2025-03-11', '000010100', '如意金条100g', 69052, 5, '2025-03-11 12:40:02.204758+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108519, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 12:40:02.20635+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108550, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 97, '2025-03-11 13:40:03.101529+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108551, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 69, '2025-03-11 13:40:03.105013+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108552, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 121, '2025-03-11 13:40:03.106783+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108553, '2025-03-11', '000010050', '如意金条50g', 34526, 5, '2025-03-11 13:40:03.108602+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108554, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 13:40:03.110236+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108555, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 13:40:03.111914+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108586, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 241, '2025-03-11 14:40:02.853906+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108587, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 296, '2025-03-11 14:40:02.857321+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108588, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 92, '2025-03-11 14:40:02.859362+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108589, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 14:40:02.861122+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108590, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 14:40:02.862876+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108591, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 14:40:02.864617+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108622, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 127, '2025-03-11 15:40:02.331942+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108623, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 208, '2025-03-11 15:40:02.336574+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108624, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 5, '2025-03-11 15:40:02.338593+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108625, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 15:40:02.340443+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108626, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:40:02.34289+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108627, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 15:40:02.344995+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108658, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 269, '2025-03-11 16:40:02.92115+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108659, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 336, '2025-03-11 16:40:02.924695+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108660, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 166, '2025-03-11 16:40:02.926724+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108661, '2025-03-11', '000010050', '如意金条50g', 34526, 3, '2025-03-11 16:40:02.928849+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108662, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 16:40:02.931719+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108663, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 16:40:02.933904+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108694, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 232, '2025-03-11 17:40:02.431332+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108695, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 315, '2025-03-11 17:40:02.435436+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108696, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 131, '2025-03-11 17:40:02.437553+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108697, '2025-03-11', '000010050', '如意金条50g', 34526, 8, '2025-03-11 17:40:02.439336+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108698, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 17:40:02.44107+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108699, '2025-03-11', '000010200', '如意金条200g', 137904, 3, '2025-03-11 17:40:02.443306+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108730, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 209, '2025-03-11 18:40:02.931848+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108731, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 283, '2025-03-11 18:40:02.954652+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108732, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 94, '2025-03-11 18:40:02.957068+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108733, '2025-03-11', '000010050', '如意金条50g', 34526, 5, '2025-03-11 18:40:02.959388+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108734, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:40:02.960961+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108735, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 18:40:02.962446+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108766, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 173, '2025-03-11 19:40:02.691694+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108767, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 267, '2025-03-11 19:40:02.695739+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108768, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 72, '2025-03-11 19:40:02.698364+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108769, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 19:40:02.700415+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108770, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 19:40:02.702812+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108771, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 19:40:02.705634+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108802, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 150, '2025-03-11 20:40:02.319588+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108803, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 252, '2025-03-11 20:40:02.323844+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108804, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 81, '2025-03-11 20:40:02.326507+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108805, '2025-03-11', '000010050', '如意金条50g', 34714.5, 2, '2025-03-11 20:40:02.331356+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108806, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 20:40:02.3334+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108807, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 20:40:02.33609+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108826, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 123, '2025-03-11 21:20:02.134676+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108827, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 222, '2025-03-11 21:20:02.14073+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108828, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 80, '2025-03-11 21:20:02.145355+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108829, '2025-03-11', '000010050', '如意金条50g', 34714.5, 8, '2025-03-11 21:20:02.147852+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108340, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:50:02.141691+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108341, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:50:02.145015+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108342, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:50:02.146596+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108343, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:50:02.148138+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108344, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:50:02.149749+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108345, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:50:02.151321+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108376, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:50:02.657881+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108377, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:50:02.680487+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108378, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:50:02.682811+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108379, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:50:02.685745+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108380, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:50:02.687895+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108381, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:50:02.689993+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108412, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 0, '2025-03-11 09:50:02.512173+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108413, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 2, '2025-03-11 09:50:02.515442+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108414, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 0, '2025-03-11 09:50:02.517257+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108415, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 09:50:02.519328+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108416, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 09:50:02.520962+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108417, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 09:50:02.522478+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108448, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 113, '2025-03-11 10:50:02.212532+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108449, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 258, '2025-03-11 10:50:02.215665+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108450, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 32, '2025-03-11 10:50:02.217707+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108451, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 10:50:02.219619+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108452, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 10:50:02.222573+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108453, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 10:50:02.224783+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108484, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 252, '2025-03-11 11:50:02.904118+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108485, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 302, '2025-03-11 11:50:02.90851+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108486, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 171, '2025-03-11 11:50:02.911351+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108487, '2025-03-11', '000010050', '如意金条50g', 34526, 6, '2025-03-11 11:50:02.913719+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108488, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 11:50:02.916154+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108489, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 11:50:02.91948+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108520, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 164, '2025-03-11 12:50:02.867827+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108521, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 168, '2025-03-11 12:50:02.871378+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108522, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 151, '2025-03-11 12:50:02.873184+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108523, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 12:50:02.874916+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108524, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 12:50:02.876544+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108525, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 12:50:02.878007+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108556, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 75, '2025-03-11 13:50:02.583942+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108557, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 122, '2025-03-11 13:50:02.59341+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108558, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 118, '2025-03-11 13:50:02.596565+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108559, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 13:50:02.598751+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108560, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 13:50:02.601487+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108561, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 13:50:02.604051+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108592, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 218, '2025-03-11 14:50:02.326623+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108593, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 282, '2025-03-11 14:50:02.332301+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108594, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 75, '2025-03-11 14:50:02.33564+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108595, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 14:50:02.337872+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108596, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 14:50:02.340137+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108597, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 14:50:02.342421+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108628, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 115, '2025-03-11 15:50:02.657319+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108629, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 188, '2025-03-11 15:50:02.661446+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108630, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 5, '2025-03-11 15:50:02.663766+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108631, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 15:50:02.666097+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108632, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:50:02.668255+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108633, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 15:50:02.670478+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108664, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 254, '2025-03-11 16:50:02.220893+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108665, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 321, '2025-03-11 16:50:02.224814+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108666, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 167, '2025-03-11 16:50:02.226913+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108667, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 16:50:02.235478+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108668, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 16:50:02.23851+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108669, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 16:50:02.240448+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108700, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 237, '2025-03-11 17:50:02.873915+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108701, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 312, '2025-03-11 17:50:02.878138+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108702, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 133, '2025-03-11 17:50:02.880175+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108703, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 17:50:02.882054+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108704, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 17:50:02.885169+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108705, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 17:50:02.890104+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108736, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 206, '2025-03-11 18:50:02.428665+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108737, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 280, '2025-03-11 18:50:02.433519+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108738, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 77, '2025-03-11 18:50:02.435591+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108739, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 18:50:02.437514+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108740, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:50:02.439568+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108741, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 18:50:02.441484+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108772, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 181, '2025-03-11 19:50:02.228788+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108773, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 269, '2025-03-11 19:50:02.231682+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108774, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 83, '2025-03-11 19:50:02.233372+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108775, '2025-03-11', '000010050', '如意金条50g', 34526, 2, '2025-03-11 19:50:02.235087+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108776, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 19:50:02.237127+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108777, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 19:50:02.239081+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108808, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 132, '2025-03-11 20:50:02.628096+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108809, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 234, '2025-03-11 20:50:02.63222+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108810, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 74, '2025-03-11 20:50:02.633977+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108811, '2025-03-11', '000010050', '如意金条50g', 34714.5, 1, '2025-03-11 20:50:02.636012+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108812, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 20:50:02.637887+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108813, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 20:50:02.640952+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108830, '2025-03-11', '000010100', '如意金条100g', 69429, 1, '2025-03-11 21:20:02.150114+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108831, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 21:20:02.15344+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108836, '2025-03-11', '000010100', '如意金条100g', 69429, 1, '2025-03-11 21:30:02.641046+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108837, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 21:30:02.643419+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108346, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 08:00:02.537152+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108347, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 08:00:02.540142+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108348, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 08:00:02.542233+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108349, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 08:00:02.544242+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108350, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 08:00:02.545991+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108351, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 08:00:02.547709+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108382, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 09:00:02.153321+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108383, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 09:00:02.157642+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108384, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 09:00:02.159565+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108385, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 09:00:02.163528+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108386, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 09:00:02.165405+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108387, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 09:00:02.167134+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108418, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 2, '2025-03-11 10:00:03.00479+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108419, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 1, '2025-03-11 10:00:03.007612+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108420, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 3, '2025-03-11 10:00:03.009793+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108421, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 10:00:03.013883+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108422, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 10:00:03.01599+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108423, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 10:00:03.018168+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108454, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 64, '2025-03-11 11:00:02.66281+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108455, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 241, '2025-03-11 11:00:02.668043+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108456, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 9, '2025-03-11 11:00:02.673519+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108457, '2025-03-11', '000010050', '如意金条50g', 34526, 1, '2025-03-11 11:00:02.675926+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108458, '2025-03-11', '000010100', '如意金条100g', 69052, 1, '2025-03-11 11:00:02.678436+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108459, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 11:00:02.681821+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108490, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 250, '2025-03-11 12:00:02.441309+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108491, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 292, '2025-03-11 12:00:02.445203+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108492, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 163, '2025-03-11 12:00:02.448412+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108493, '2025-03-11', '000010050', '如意金条50g', 34526, 12, '2025-03-11 12:00:02.45209+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108494, '2025-03-11', '000010100', '如意金条100g', 69052, 4, '2025-03-11 12:00:02.456979+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108495, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 12:00:02.46097+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108526, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 149, '2025-03-11 13:00:02.217191+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108527, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 138, '2025-03-11 13:00:02.22097+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108528, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 147, '2025-03-11 13:00:02.223259+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108529, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 13:00:02.225521+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108530, '2025-03-11', '000010100', '如意金条100g', 69052, 3, '2025-03-11 13:00:02.227662+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108531, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 13:00:02.230156+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108562, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 71, '2025-03-11 14:00:03.113862+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108563, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 178, '2025-03-11 14:00:03.117042+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108564, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 127, '2025-03-11 14:00:03.118796+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108565, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 14:00:03.120467+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108566, '2025-03-11', '000010100', '如意金条100g', 69052, 3, '2025-03-11 14:00:03.122321+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108567, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 14:00:03.12406+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108598, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 187, '2025-03-11 15:00:02.667428+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108599, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 267, '2025-03-11 15:00:02.671791+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108600, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 65, '2025-03-11 15:00:02.674162+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108601, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 15:00:02.676303+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108602, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 15:00:02.678575+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108603, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 15:00:02.681354+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108634, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 89, '2025-03-11 16:00:02.116166+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108635, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 168, '2025-03-11 16:00:02.123498+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108636, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 0, '2025-03-11 16:00:02.126154+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108637, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 16:00:02.128169+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108638, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 16:00:02.130142+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108639, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 16:00:02.132918+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108670, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 228, '2025-03-11 17:00:02.66433+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108671, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 322, '2025-03-11 17:00:02.668722+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108672, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 169, '2025-03-11 17:00:02.670515+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108673, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 17:00:02.672656+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108674, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 17:00:02.674701+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108675, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 17:00:02.676275+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108706, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 231, '2025-03-11 18:00:02.246547+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108707, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 308, '2025-03-11 18:00:02.250798+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108708, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 140, '2025-03-11 18:00:02.253198+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108709, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 18:00:02.255387+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108710, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 18:00:02.257537+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108711, '2025-03-11', '000010200', '如意金条200g', 137904, 0, '2025-03-11 18:00:02.260684+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108742, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 197, '2025-03-11 19:00:02.88475+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108743, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 278, '2025-03-11 19:00:02.887979+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108744, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 81, '2025-03-11 19:00:02.890049+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108745, '2025-03-11', '000010050', '如意金条50g', 34526, 0, '2025-03-11 19:00:02.892002+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108746, '2025-03-11', '000010100', '如意金条100g', 69052, 0, '2025-03-11 19:00:02.894103+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108747, '2025-03-11', '000010200', '如意金条200g', 137904, 2, '2025-03-11 19:00:02.89636+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108310, '2025-03-11', '050100001', '如意金条5g', 3479.80000000000018, 115, '2025-03-11 07:00:03.015604+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108311, '2025-03-11', '050100002', '如意金条10g', 6959.60000000000036, 270, '2025-03-11 07:00:03.019529+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108312, '2025-03-11', '050100003', '如意金条20g', 13899.2000000000007, 156, '2025-03-11 07:00:03.021698+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108313, '2025-03-11', '000010050', '如意金条50g', 34748, 32, '2025-03-11 07:00:03.023969+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108314, '2025-03-11', '000010100', '如意金条100g', 69496, 8, '2025-03-11 07:00:03.026169+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108315, '2025-03-11', '000010200', '如意金条200g', 138792, 0, '2025-03-11 07:00:03.031246+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108778, '2025-03-11', '050100001', '如意金条5g', 3457.59999999999991, 189, '2025-03-11 20:00:02.615548+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108779, '2025-03-11', '050100002', '如意金条10g', 6915.19999999999982, 278, '2025-03-11 20:00:02.619813+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108780, '2025-03-11', '050100003', '如意金条20g', 13810.3999999999996, 89, '2025-03-11 20:00:02.622955+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108781, '2025-03-11', '000010050', '如意金条50g', 34526, 4, '2025-03-11 20:00:02.62548+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108782, '2025-03-11', '000010100', '如意金条100g', 69052, 2, '2025-03-11 20:00:02.627644+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108783, '2025-03-11', '000010200', '如意金条200g', 137904, 1, '2025-03-11 20:00:02.629839+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108814, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 119, '2025-03-11 21:00:03.158631+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108815, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 225, '2025-03-11 21:00:03.16226+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108816, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 74, '2025-03-11 21:00:03.164499+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108817, '2025-03-11', '000010050', '如意金条50g', 34714.5, 4, '2025-03-11 21:00:03.166479+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108838, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 114, '2025-03-11 21:40:02.02195+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108839, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 209, '2025-03-11 21:40:02.025935+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108840, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 73, '2025-03-11 21:40:02.028151+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108841, '2025-03-11', '000010050', '如意金条50g', 34714.5, 8, '2025-03-11 21:40:02.030067+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108842, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 21:40:02.036216+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108843, '2025-03-11', '000010200', '如意金条200g', 138658, 1, '2025-03-11 21:40:02.040275+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108844, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 105, '2025-03-11 21:50:02.547627+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108845, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 216, '2025-03-11 21:50:02.551177+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108846, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 65, '2025-03-11 21:50:02.553212+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108847, '2025-03-11', '000010050', '如意金条50g', 34714.5, 3, '2025-03-11 21:50:02.555179+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108848, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 21:50:02.557129+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108849, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 21:50:02.559043+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108850, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 96, '2025-03-11 22:00:02.917357+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108851, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 213, '2025-03-11 22:00:02.921098+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108852, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 67, '2025-03-11 22:00:02.923465+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108853, '2025-03-11', '000010050', '如意金条50g', 34714.5, 4, '2025-03-11 22:00:02.925661+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108854, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 22:00:02.928084+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108855, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:00:02.930129+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108856, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 81, '2025-03-11 22:10:02.380156+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108857, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 207, '2025-03-11 22:10:02.393934+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108858, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 69, '2025-03-11 22:10:02.396062+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108859, '2025-03-11', '000010050', '如意金条50g', 34714.5, 1, '2025-03-11 22:10:02.397884+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108860, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 22:10:02.400076+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108861, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:10:02.405698+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108862, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 79, '2025-03-11 22:20:02.882792+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108863, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 199, '2025-03-11 22:20:02.886166+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108864, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 55, '2025-03-11 22:20:02.888904+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108865, '2025-03-11', '000010050', '如意金条50g', 34714.5, 0, '2025-03-11 22:20:02.891302+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108866, '2025-03-11', '000010100', '如意金条100g', 69429, 0, '2025-03-11 22:20:02.89349+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108867, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:20:02.895854+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108868, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 76, '2025-03-11 22:30:02.347881+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108869, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 194, '2025-03-11 22:30:02.351821+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108870, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 46, '2025-03-11 22:30:02.35493+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108871, '2025-03-11', '000010050', '如意金条50g', 34714.5, 0, '2025-03-11 22:30:02.357758+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108872, '2025-03-11', '000010100', '如意金条100g', 69429, 1, '2025-03-11 22:30:02.359767+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108873, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:30:02.361852+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108874, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 87, '2025-03-11 22:40:02.717768+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108875, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 202, '2025-03-11 22:40:02.721713+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108876, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 61, '2025-03-11 22:40:02.723351+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108877, '2025-03-11', '000010050', '如意金条50g', 34714.5, 4, '2025-03-11 22:40:02.725133+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108878, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 22:40:02.726841+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108879, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:40:02.729063+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108880, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 90, '2025-03-11 22:50:02.113709+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108881, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 209, '2025-03-11 22:50:02.124847+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108882, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 68, '2025-03-11 22:50:02.137699+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108883, '2025-03-11', '000010050', '如意金条50g', 34714.5, 6, '2025-03-11 22:50:02.140618+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108884, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 22:50:02.143525+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108885, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 22:50:02.146806+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108886, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 95, '2025-03-11 23:00:02.550491+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108887, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 214, '2025-03-11 23:00:02.560765+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108888, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 70, '2025-03-11 23:00:02.563954+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108889, '2025-03-11', '000010050', '如意金条50g', 34714.5, 7, '2025-03-11 23:00:02.56621+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108890, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:00:02.570961+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108891, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:00:02.572781+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108892, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 101, '2025-03-11 23:10:03.048241+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108893, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 222, '2025-03-11 23:10:03.055273+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108894, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 80, '2025-03-11 23:10:03.057347+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108895, '2025-03-11', '000010050', '如意金条50g', 34714.5, 8, '2025-03-11 23:10:03.059199+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108896, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:10:03.060872+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108897, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:10:03.066604+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108898, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 102, '2025-03-11 23:20:02.530911+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108899, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 230, '2025-03-11 23:20:02.53385+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108900, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 88, '2025-03-11 23:20:02.535424+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108901, '2025-03-11', '000010050', '如意金条50g', 34714.5, 9, '2025-03-11 23:20:02.536955+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108902, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:20:02.538639+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108903, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:20:02.540257+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108904, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 102, '2025-03-11 23:30:02.951875+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108905, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 234, '2025-03-11 23:30:02.956992+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108906, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 91, '2025-03-11 23:30:02.959668+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108907, '2025-03-11', '000010050', '如意金条50g', 34714.5, 9, '2025-03-11 23:30:02.962412+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108908, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:30:02.964783+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108909, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:30:02.968268+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108910, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 102, '2025-03-11 23:40:02.494599+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108911, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 234, '2025-03-11 23:40:02.498423+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108912, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 91, '2025-03-11 23:40:02.50126+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108913, '2025-03-11', '000010050', '如意金条50g', 34714.5, 9, '2025-03-11 23:40:02.504885+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108914, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:40:02.506947+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108915, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:40:02.509044+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108916, '2025-03-11', '050100001', '如意金条5g', 3476.44999999999982, 102, '2025-03-11 23:50:02.822735+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108917, '2025-03-11', '050100002', '如意金条10g', 6952.89999999999964, 234, '2025-03-11 23:50:02.826246+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108918, '2025-03-11', '050100003', '如意金条20g', 13885.7999999999993, 91, '2025-03-11 23:50:02.82805+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108919, '2025-03-11', '000010050', '如意金条50g', 34714.5, 9, '2025-03-11 23:50:02.829883+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108920, '2025-03-11', '000010100', '如意金条100g', 69429, 2, '2025-03-11 23:50:02.831562+08');
INSERT INTO public.coding_spider_product_storage OVERRIDING SYSTEM VALUE VALUES (108921, '2025-03-11', '000010200', '如意金条200g', 138658, 0, '2025-03-11 23:50:02.833078+08');


--
-- TOC entry 2465 (class 0 OID 25970)
-- Dependencies: 211
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_admin_log VALUES (1, '2019-06-21 15:01:28.499409+08', '6', '黄浦工体', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (2, '2019-06-21 15:02:12.747545+08', '11', '黄浦工体(外马路)', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log VALUES (3, '2019-06-21 15:03:03.257061+08', '6', '路人合集', 2, '[{"changed": {"fields": ["name"]}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (4, '2019-06-21 15:03:27.600342+08', '16', '长发男', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (5, '2024-08-03 14:09:56.614087+08', '7', '工银大厦', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (6, '2024-08-03 14:10:35.463323+08', '12', '工银大厦(银城路)', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log VALUES (7, '2024-08-03 14:11:02.306942+08', '17', '黄老师', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (8, '2024-09-12 18:53:55.003854+08', '20', '王炜（工银大厦）', 1, '[{"added": {}}]', 12, 1);
INSERT INTO public.django_admin_log VALUES (9, '2024-09-14 07:10:44.596237+08', '21', '苏师傅（工银大厦）', 1, '[{"added": {}}]', 12, 1);


--
-- TOC entry 2467 (class 0 OID 25979)
-- Dependencies: 213
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'snooker', 'campaign');
INSERT INTO public.django_content_type VALUES (8, 'snooker', 'cue');
INSERT INTO public.django_content_type VALUES (9, 'snooker', 'frame');
INSERT INTO public.django_content_type VALUES (10, 'snooker', 'group');
INSERT INTO public.django_content_type VALUES (11, 'snooker', 'gym');
INSERT INTO public.django_content_type VALUES (12, 'snooker', 'player');
INSERT INTO public.django_content_type VALUES (13, 'game', 'cg_mp700_detail');
INSERT INTO public.django_content_type VALUES (14, 'game', 'cg_mp700_produce');


--
-- TOC entry 2469 (class 0 OID 25984)
-- Dependencies: 215
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2018-10-16 13:43:54.633084+08');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2018-10-16 13:43:54.954898+08');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2018-10-16 13:43:55.019861+08');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-10-16 13:43:55.028856+08');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2018-10-16 13:43:55.037851+08');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2018-10-16 13:43:55.056838+08');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-10-16 13:43:55.062835+08');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-10-16 13:43:55.07283+08');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-10-16 13:43:55.084823+08');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-10-16 13:43:55.094817+08');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-10-16 13:43:55.097816+08');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-10-16 13:43:55.109808+08');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-10-16 13:43:55.136794+08');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-10-16 13:43:55.146798+08');
INSERT INTO public.django_migrations VALUES (15, 'sessions', '0001_initial', '2018-10-16 13:43:55.195759+08');
INSERT INTO public.django_migrations VALUES (16, 'snooker', '0001_initial', '2018-10-16 13:43:55.307696+08');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0010_alter_group_name_max_length', '2019-10-21 19:57:26.696132+08');
INSERT INTO public.django_migrations VALUES (18, 'auth', '0011_update_proxy_permissions', '2019-10-21 19:57:26.707103+08');
INSERT INTO public.django_migrations VALUES (21, 'game', '0001_initial', '2021-11-26 19:55:45.743523+08');


--
-- TOC entry 2471 (class 0 OID 25992)
-- Dependencies: 217
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_session VALUES ('6u4e46y9yynaeow48zdsuvv0l2qzt1ql', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2018-10-30 13:59:01.566435+08');
INSERT INTO public.django_session VALUES ('7m1gbfpeg740ya4i1izwjzwoa8e5ntng', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2018-10-30 21:02:34.627586+08');
INSERT INTO public.django_session VALUES ('hj9zm71f6dnbutd44i4zpivz67syc5j9', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2018-11-01 17:07:58.512928+08');
INSERT INTO public.django_session VALUES ('3uz4data99g5y42fbkomhmgofg7k8yi3', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2018-11-17 13:07:29.197006+08');
INSERT INTO public.django_session VALUES ('ogqolk58me8cfkn03lhcucxnahsh9ptn', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-01-05 19:03:06.685984+08');
INSERT INTO public.django_session VALUES ('j7huhxql1uqba0p2izpk4lc37j7ynp6y', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-01-12 15:57:42.720364+08');
INSERT INTO public.django_session VALUES ('6glscal3cx10k9eih94yawuoxh2md346', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-03-30 21:14:17.774111+08');
INSERT INTO public.django_session VALUES ('ll1s2w0b4b4uhyjc7uck1jnbfb9ckf6m', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-04-03 14:42:52.170711+08');
INSERT INTO public.django_session VALUES ('8p02wu9h1ps19s10esu4q1dw1sqk0pul', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-04-20 19:23:03.736229+08');
INSERT INTO public.django_session VALUES ('9ha720r3sov0eiygky5obci6u2mszy66', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-04-22 16:29:39.203091+08');
INSERT INTO public.django_session VALUES ('yuy1yfzffyh80y68k8pwxwbquc9k6t75', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-06-13 09:25:45.228702+08');
INSERT INTO public.django_session VALUES ('kr4f8sidlqhkd8w2tqnx8javfnwl1mcf', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-06-15 08:43:56.20706+08');
INSERT INTO public.django_session VALUES ('6yd6ue5u87rew0opvgmht03y4zupo2rj', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-07-05 14:59:26.968158+08');
INSERT INTO public.django_session VALUES ('zw4ozhxzujrq2b9387vxiaesy5zl0mba', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-08-01 15:57:16.061402+08');
INSERT INTO public.django_session VALUES ('c16gek2jth0qdwvs2tsvmvtz22intje3', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-08-22 15:45:25.55152+08');
INSERT INTO public.django_session VALUES ('mk95owfugi0fjocjgeutfum9x48vz22e', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-09-05 17:02:33.280563+08');
INSERT INTO public.django_session VALUES ('y0yeubngp79ywg1gnvfufd01y0sn1e3b', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-09-26 13:45:45.808603+08');
INSERT INTO public.django_session VALUES ('yyf6mfd2ni3iueugba0l9x1qp5a8cpk4', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-10-10 18:03:23.546259+08');
INSERT INTO public.django_session VALUES ('gmem45w26efzcg61dpoffkg7320tbf4y', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-10-14 18:37:02.825313+08');
INSERT INTO public.django_session VALUES ('r7hnigv40crzfwzqqkagdn6jtbb4m2vv', 'MTdkYmE4ZmYxODlkNmM4N2M4YTNhNDQwMThmOTk5MTk5MzlkODIzOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Y2RiZjA3YzViYWE1MjE0ZGVhNDgyZDc4ODk2NmYxODI2NWM3ZDhhIn0=', '2019-10-31 19:28:12.242248+08');
INSERT INTO public.django_session VALUES ('7advp2c0755hdiqothext9gboka4cbqg', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-11-04 15:56:02.615365+08');
INSERT INTO public.django_session VALUES ('umdo71ydhh3rxllqaxk5m67tjvlp0dvv', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-11-04 20:23:26.401516+08');
INSERT INTO public.django_session VALUES ('ny403bntuf6gt74wm0uw4a4gesyo8dj1', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-11-20 16:30:45.10483+08');
INSERT INTO public.django_session VALUES ('jlys2kp0bqlsi6kj9q93xvqhexwk1c41', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-11-29 21:59:25.386808+08');
INSERT INTO public.django_session VALUES ('xtle8r8yk1prnmjmytlqdfg6tdv73zpe', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-12-05 15:32:40.954927+08');
INSERT INTO public.django_session VALUES ('pyb040t648qj5j579qfawhb4iprdbuxr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-12-14 14:08:50.880358+08');
INSERT INTO public.django_session VALUES ('i6m8zma36snjpp27704disv7qf9el1ng', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2019-12-19 16:20:15.260131+08');
INSERT INTO public.django_session VALUES ('bffxiggtwhvgpgjcdsy98y1nxzf45oij', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2020-01-25 10:46:22.750013+08');
INSERT INTO public.django_session VALUES ('oslw560nzeehi4o64rgm6l3if0prok69', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2020-01-25 10:46:23.195693+08');
INSERT INTO public.django_session VALUES ('adzghv5f4n1vbwkby4lu8hawj5d1h0ba', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2020-09-18 09:02:59.273014+08');
INSERT INTO public.django_session VALUES ('wglmo595g4ol4zw356u5gdy8073mq9g4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2020-11-03 11:27:54.95405+08');
INSERT INTO public.django_session VALUES ('12wip3645o9crwkcr38q9a6i467y4tyn', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2021-07-09 09:30:36.577287+08');
INSERT INTO public.django_session VALUES ('lkkh9jcy7tq50iq5dbk2d5e4q58juigm', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2021-12-18 02:04:01.435788+08');
INSERT INTO public.django_session VALUES ('fxaca9vr2m9wh5t42e0sfysbwvhyjsmo', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-03-06 11:16:15.718914+08');
INSERT INTO public.django_session VALUES ('g4cv4xhe88if8inu6znhpilnv7y4j0e9', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-11 16:12:47.387485+08');
INSERT INTO public.django_session VALUES ('7muw0bhqnhfmncx7dpeot31k70mftik4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-12 04:04:00.782644+08');
INSERT INTO public.django_session VALUES ('c9bgrywsod1yhvpg32ggcxa2iaizlr2e', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-12 12:53:04.031297+08');
INSERT INTO public.django_session VALUES ('f1lw9gdktb2goo7ywg8fgtky4ajamtn5', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-12 13:18:36.126913+08');
INSERT INTO public.django_session VALUES ('gvyk3owsrtg3o24kzmm8fe08z7gntxvh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-19 22:42:17.274722+08');
INSERT INTO public.django_session VALUES ('t716r1jvvu35gkll19ds7ylmqjf5drcs', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-04-26 09:45:31.617138+08');
INSERT INTO public.django_session VALUES ('k9t44zpqkcbiinjpi1amhyhtv63eodjn', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-05-03 23:32:48.164399+08');
INSERT INTO public.django_session VALUES ('xpz8bix3romwwoh2s8j59v45z4i5ai6v', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-05-12 09:14:57.058125+08');
INSERT INTO public.django_session VALUES ('j2mwybkvh8cgbeklqk4buca0e58abf8h', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-05-18 00:13:48.31305+08');
INSERT INTO public.django_session VALUES ('ntdnfmj0h49mkcubgysxg253unyxq24i', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-05-26 10:21:29.521398+08');
INSERT INTO public.django_session VALUES ('6f0bpnnie9voljksj4ixy5ypbfto92kx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-06-01 00:59:14.330269+08');
INSERT INTO public.django_session VALUES ('man4qip12ujbtwh7k8wau736txzfqnov', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-06-10 07:21:10.748224+08');
INSERT INTO public.django_session VALUES ('y61rkvrbiz78u2og9a9ti4j989m4p819', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-06-15 02:11:44.456932+08');
INSERT INTO public.django_session VALUES ('l3y29evwkay8lkpwiqjuijfkth79rth0', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-06-24 10:53:28.590326+08');
INSERT INTO public.django_session VALUES ('fe8c191nv57glrz4z68g9k20xn9do0xi', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-06-29 19:43:09.815585+08');
INSERT INTO public.django_session VALUES ('qi78goalhtp2r8hgy18phpjixkq6e9uf', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-02 08:40:15.637757+08');
INSERT INTO public.django_session VALUES ('xq3ahac1mo335zcei4xszzd32ywx65d7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-07-08 14:19:41.865465+08');
INSERT INTO public.django_session VALUES ('wbtmktq1wirhwkkee7dxzpnhppr1b6ld', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-07-13 20:08:29.650537+08');
INSERT INTO public.django_session VALUES ('nwao5h2vtljwkgv5vt32n3yr80urklm2', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-07-23 02:16:06.605882+08');
INSERT INTO public.django_session VALUES ('z2k0dd0n4ljmrtqc1tivhonz82kjmexh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-07-27 20:26:13.039229+08');
INSERT INTO public.django_session VALUES ('nb9pd8gx2ofamfwqker90tqiryzc2vvx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-07 03:33:17.090937+08');
INSERT INTO public.django_session VALUES ('q8b4spadr9hquwplssj1xknjqnq3va0n', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-10 22:35:41.778467+08');
INSERT INTO public.django_session VALUES ('ggxz8r2xetpo9n4lilsruty5tpgwlmxe', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-22 06:46:30.779438+08');
INSERT INTO public.django_session VALUES ('sepf595x268exdf9mfqes26wvtth3wyy', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-22 12:37:17.327512+08');
INSERT INTO public.django_session VALUES ('r22yu6bwu29mvxownhppvvi697ibg5mc', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-25 00:00:47.715988+08');
INSERT INTO public.django_session VALUES ('fa56gwjc475a3p2k4ida4uuadx3pcy0s', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-08-30 16:07:02.508531+08');
INSERT INTO public.django_session VALUES ('pqahq73kgrxvs2tsv8tc1mpxxwzxy8mo', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-09-05 20:36:37.619395+08');
INSERT INTO public.django_session VALUES ('6lwfdm0ze3e8f6lcvftyk5f0gc3gx6kp', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-09-08 00:39:40.722458+08');
INSERT INTO public.django_session VALUES ('65giwqaw5iqcva8lg3z77fwgfcr9tnxw', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-09-08 08:14:25.854173+08');
INSERT INTO public.django_session VALUES ('rd352l7sb2j1nkoqy0pies5u7s39vuk5', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-09-23 21:36:07.876759+08');
INSERT INTO public.django_session VALUES ('hh2ebpqbvdf9h0ls8jwelqxgw75len49', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-09-24 15:58:13.922371+08');
INSERT INTO public.django_session VALUES ('1zrpamrazennwq4xhzufsms59tu3bfe6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-07 21:49:09.399447+08');
INSERT INTO public.django_session VALUES ('8sqiyngobntncuqm5hielzvh6ncg6tf6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-10 14:25:14.84889+08');
INSERT INTO public.django_session VALUES ('keod27o4kkfjrvo9ffozf50u02gr8vil', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-11 11:31:33.719179+08');
INSERT INTO public.django_session VALUES ('ws4bz3b408yihj2j20t9luvrut7biue2', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-21 12:33:12.708355+08');
INSERT INTO public.django_session VALUES ('kp778w8p87fm4me1wrsqt4nv1f4t4910', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-21 23:46:51.992522+08');
INSERT INTO public.django_session VALUES ('oqllesfb2ziy7xvj9gdr7v5vgeav9cl5', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-10-25 12:49:52.391909+08');
INSERT INTO public.django_session VALUES ('lgbd5jixs5ty58ld7j9nd6op94mnuecu', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-05 01:39:16.984645+08');
INSERT INTO public.django_session VALUES ('24nthoubbowkp9dyx5p02xgqzslslxzp', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-09 00:43:23.284282+08');
INSERT INTO public.django_session VALUES ('hkwp443yl9trrt3lh5pbvdy7op6by6if', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-13 09:21:24.588268+08');
INSERT INTO public.django_session VALUES ('p9oyk8a1haslpdsz046admuued7xvesd', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-19 01:47:33.866247+08');
INSERT INTO public.django_session VALUES ('4ni6hdf414fvs8rpedv467ym3qyla6ja', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-23 07:01:12.952495+08');
INSERT INTO public.django_session VALUES ('m9kxmz5c7ohjvmvldw5q1ewn2pxf1anx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-11-29 09:14:09.806359+08');
INSERT INTO public.django_session VALUES ('cver4hxvtipaitt5amd5894h5jtl10ds', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-03 02:07:52.857428+08');
INSERT INTO public.django_session VALUES ('4y0erca36utqf9n2fjkj1zo4je1ii197', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-07 13:59:01.775203+08');
INSERT INTO public.django_session VALUES ('tof0kcr8ccsxvm9pkpzzx09hkf62i05v', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-13 22:57:01.349062+08');
INSERT INTO public.django_session VALUES ('zhxc9sxgne13acsxcbbzbch236469fve', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-17 02:16:36.092389+08');
INSERT INTO public.django_session VALUES ('56wctt6x3lqj7yv47itqjdcnxxa2andv', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-21 19:19:41.080585+08');
INSERT INTO public.django_session VALUES ('k7rzpk11blwxz503794pqfsf92beyaq7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2022-12-31 06:59:25.90524+08');
INSERT INTO public.django_session VALUES ('j9jo6ctirony2en1t87nvs350oliv61o', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-03 10:45:20.372984+08');
INSERT INTO public.django_session VALUES ('4ugwx5jsbf8sep78l0dhegyhbd2uvgx9', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-08 02:27:09.524903+08');
INSERT INTO public.django_session VALUES ('f5hgcvq6zkkfcwmgbh8vk1gmx0ey15fk', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-14 23:21:08.67951+08');
INSERT INTO public.django_session VALUES ('ypuwq57i4rtp2ljd0tt3zx1oiknzkrtg', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-17 11:48:09.208955+08');
INSERT INTO public.django_session VALUES ('vo46gk6jagn96ii1w1dwxl92b5x1eirc', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-23 15:49:54.866574+08');
INSERT INTO public.django_session VALUES ('w2bw8dwcpyb86ytvd1ru8gqt2512tzyd', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-29 00:05:14.792941+08');
INSERT INTO public.django_session VALUES ('lc95g0u3b57qeju2ba65ui56dwq1zobt', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-01-31 16:04:40.603904+08');
INSERT INTO public.django_session VALUES ('xr9bb77ofojit2ejvoz7ofg5phrfccal', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-02-07 21:27:25.736865+08');
INSERT INTO public.django_session VALUES ('2x9n790jh65cfg07n4q8praxajsyuv7u', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-02-12 00:22:13.655353+08');
INSERT INTO public.django_session VALUES ('05t7842hstqzhtihvqlzner6mhrig39k', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-02-15 16:03:00.56811+08');
INSERT INTO public.django_session VALUES ('60lheja7s9r9ptpkgiqkkdzepzn11l37', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-02-22 00:48:51.277745+08');
INSERT INTO public.django_session VALUES ('mne00clg1avui1flasxq2wbllw6aq5u7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-02-26 01:28:06.456004+08');
INSERT INTO public.django_session VALUES ('ehdl6wkrpdtktiv6nqmvhk1mudf6w655', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-09 01:22:20.623819+08');
INSERT INTO public.django_session VALUES ('w2h776ezq00o39n6yi5193rgoxc0rtkz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-09 18:21:04.75066+08');
INSERT INTO public.django_session VALUES ('4vdohqt07per5bzegflfdvqf8q1cddet', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-09 20:22:14.157592+08');
INSERT INTO public.django_session VALUES ('03j2nfr0zryodqjja4fx3u1c54z9l5xf', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-12 02:10:53.048588+08');
INSERT INTO public.django_session VALUES ('iuc4lgk7464lhfnsj3119avc1iufpbe6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-17 10:30:35.894394+08');
INSERT INTO public.django_session VALUES ('j2jvszg2pr8l1z4c4frmbebrmagfwlx8', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-18 12:29:45.865141+08');
INSERT INTO public.django_session VALUES ('tz6haltvb9y25p27mgjqconu26j2vcjl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-22 14:54:45.691123+08');
INSERT INTO public.django_session VALUES ('azotza92qzfqetjvlqu1qcjggqkbhkfl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-24 12:54:04.56941+08');
INSERT INTO public.django_session VALUES ('m80upqmc5rzikjgl7iwvtpbbk7x2l610', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-26 02:13:42.580248+08');
INSERT INTO public.django_session VALUES ('4535l9vcr08jatcat09f5ikw29vffzrj', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-27 08:07:41.052296+08');
INSERT INTO public.django_session VALUES ('j5ea8md4lid672zjzx0onhhu7amh4kqh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-03-31 14:24:12.563568+08');
INSERT INTO public.django_session VALUES ('2wpefnkku4vf0jmjimhf7w1a47qiyrbg', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-05 14:59:30.904634+08');
INSERT INTO public.django_session VALUES ('ns69l0s8kvjcxwu8dii3ttmiw73fnr2g', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-07 14:24:21.504435+08');
INSERT INTO public.django_session VALUES ('f91gwwrzd60j17cl5uksdg60oh0mayl2', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-09 12:30:59.862102+08');
INSERT INTO public.django_session VALUES ('hp0qlolsh97btlanxq47pxcz061u7ohz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-10 08:09:37.934345+08');
INSERT INTO public.django_session VALUES ('phdspf7tf0svzknxkaqq7lo1p5pcwx5i', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-14 15:19:51.17309+08');
INSERT INTO public.django_session VALUES ('ryy57t0kqik4ylpvh9x0dth54cca10r0', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-17 13:41:07.709785+08');
INSERT INTO public.django_session VALUES ('3ns7708tnv38zfimxxjeoec72gvw2b6q', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-18 08:06:25.506373+08');
INSERT INTO public.django_session VALUES ('tnxq5dr51az1e7qd0deu272l78yjpmsb', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-19 13:41:23.694477+08');
INSERT INTO public.django_session VALUES ('0b2u9y1fwgmfktd1axz8hchfzmt6k157', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-23 21:53:18.585525+08');
INSERT INTO public.django_session VALUES ('p44dfs1gna90zn4hcgq31zq1w7oqo9k3', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-04-24 19:30:50.638038+08');
INSERT INTO public.django_session VALUES ('ztdoqgbfry08hgd4w5yx3bjmoyp2ybnh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-01 12:26:04.533993+08');
INSERT INTO public.django_session VALUES ('ltjch15cgs1aemjmrohnuw1xn1nhgz7d', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-02 08:32:19.418196+08');
INSERT INTO public.django_session VALUES ('uopgxsys641tbld1keu8fhoivhslxwhm', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-03 09:24:39.732744+08');
INSERT INTO public.django_session VALUES ('pudgbt3sc5ue93038qori2tni871mu2g', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-03 21:09:59.216409+08');
INSERT INTO public.django_session VALUES ('m3xnfnd8k03jpaeyddzzyyxnuau6ii3h', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-03 22:18:00.679405+08');
INSERT INTO public.django_session VALUES ('hki2i4ki8aea8nso8vq07coid8muctq5', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-07 22:58:37.200625+08');
INSERT INTO public.django_session VALUES ('21g3j2v130tlbf76lmrjqcb39jj5ot8n', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-11 08:03:53.977915+08');
INSERT INTO public.django_session VALUES ('jlpa735b5t1tz5mj9r0gzj8emg4iplic', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-12 09:14:29.700334+08');
INSERT INTO public.django_session VALUES ('sx8ck25pisjs22t35tlouct1rxnxcg9b', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-15 09:27:18.667647+08');
INSERT INTO public.django_session VALUES ('crkj1rpfeey37y89s69shy3ome6oqmn7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-18 08:46:31.640294+08');
INSERT INTO public.django_session VALUES ('dyofmmm4s9r4eb2ckgv1cbxjk4l6y3x8', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-18 13:58:57.200257+08');
INSERT INTO public.django_session VALUES ('5719bkvr4pqcq5pexg3cqn9z57hfk7tn', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-21 13:05:01.030086+08');
INSERT INTO public.django_session VALUES ('5x70epg7dw23ro7u08ov1h49ra01izxz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-21 23:24:45.212567+08');
INSERT INTO public.django_session VALUES ('xsfxqbecppd2pfrz3c2oblvs01x10j03', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-24 08:10:56.194864+08');
INSERT INTO public.django_session VALUES ('351mt5bocoz98ettu2yr96fgcxwace2y', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-26 10:19:29.668593+08');
INSERT INTO public.django_session VALUES ('7iay7yqf74d08uxx16suze1cn6cd3xov', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-29 09:16:48.217466+08');
INSERT INTO public.django_session VALUES ('6f0qtt62mp2j3sy52xw61sfefxuje4xa', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-05-31 08:04:49.044636+08');
INSERT INTO public.django_session VALUES ('kkvpvzsc7m894o3uj4xcwelx2n2mdyfh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-01 08:59:29.273149+08');
INSERT INTO public.django_session VALUES ('th38985s87epp61cuuhljfx88eh1jgtr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-01 17:39:24.596894+08');
INSERT INTO public.django_session VALUES ('trktq65mkuvj4b2xsakhzes7r5bohsa2', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-02 15:38:38.023535+08');
INSERT INTO public.django_session VALUES ('vrv9u1rwdo4qp7kd70dt37th2ovhnrqu', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-02 22:33:48.211987+08');
INSERT INTO public.django_session VALUES ('2s40oa76q7a5qjopj0akkah4ph9s0fdl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-05 08:10:06.101647+08');
INSERT INTO public.django_session VALUES ('aohlxp4pnlwmvaoewbxuzp6uznkx8mna', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-06 21:26:15.811056+08');
INSERT INTO public.django_session VALUES ('niglqkrl95t4mssc2mmp32xd1iyv94tv', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-15 17:48:47.350936+08');
INSERT INTO public.django_session VALUES ('0s9zcyyjr2mg7uxx64i9bxecyovdn87d', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-15 18:41:21.876428+08');
INSERT INTO public.django_session VALUES ('f476sjpwonsmanci8m240wfwnxtlmz29', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-16 23:33:07.84566+08');
INSERT INTO public.django_session VALUES ('ptim2bp48yhwfvsy7fnppsdu4ww0n0m7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-17 14:43:06.361283+08');
INSERT INTO public.django_session VALUES ('knpoprou3k3mj8vudk51dqb0hb7okxel', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-19 11:46:45.347111+08');
INSERT INTO public.django_session VALUES ('n2jje49ljyoiqm9yc2a6oa4i98lnlbvt', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-20 23:03:27.836031+08');
INSERT INTO public.django_session VALUES ('7h004lqgzv6e6qvrrnoznv1mb0c0jbqi', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-06-30 09:43:27.503133+08');
INSERT INTO public.django_session VALUES ('i6mt9yaah6962mdn5kvsikgdwq0iqdaz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-01 14:16:00.458587+08');
INSERT INTO public.django_session VALUES ('42e7z2t34r16t5x7jn3unv13tagh8m3u', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-01 16:37:00.120827+08');
INSERT INTO public.django_session VALUES ('s9dkyfmegn03r5ikcr8p4mkiw4oawk3l', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-03 08:08:35.298903+08');
INSERT INTO public.django_session VALUES ('zbnx8699d9ah0omrux8tm4pbhcmfyupw', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-04 23:10:40.093419+08');
INSERT INTO public.django_session VALUES ('z4j23urnv6kqhxt7a9eobl3hk85iw811', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-14 12:06:55.070091+08');
INSERT INTO public.django_session VALUES ('ar18nw8hrlu67k64ptbkj1wp06wefx0p', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-16 13:06:19.529852+08');
INSERT INTO public.django_session VALUES ('i4q2pv1tmqnwf4hehh189oqcuit13hat', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-17 08:21:02.260038+08');
INSERT INTO public.django_session VALUES ('sa9f6e1cy0ouae0ote51uwwjsmig3hy0', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-18 23:11:32.391015+08');
INSERT INTO public.django_session VALUES ('r0hpz8so7w0twqkbk55ziop3kwy2jl2u', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-20 00:57:46.419892+08');
INSERT INTO public.django_session VALUES ('ke4xo994ytviua6f4iuerbdv96aoh1vl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-20 10:50:04.44135+08');
INSERT INTO public.django_session VALUES ('n75gj68pf58wcmv4zpeexacenqulhysu', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-26 08:20:26.793858+08');
INSERT INTO public.django_session VALUES ('8zzsvgr3fmuzx9253u9v5b86lyw5ocoj', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-28 14:45:00.034356+08');
INSERT INTO public.django_session VALUES ('4uf6uofard3gjkzehof1hqogbc1ed20l', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-07-31 06:54:22.181194+08');
INSERT INTO public.django_session VALUES ('m6wi4wnj5t1ov2bms9686xz0sf9m1rgr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-02 20:08:22.240253+08');
INSERT INTO public.django_session VALUES ('ens9cinzoehc7exval3lbs7gv7m7qri4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-07 21:41:11.658382+08');
INSERT INTO public.django_session VALUES ('epfnkxnern9x7s9cgpcgxsc1bz8u34y1', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-10 08:00:45.49037+08');
INSERT INTO public.django_session VALUES ('dr3wme3jabzomk481w84vmrzqfung6fb', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-11 15:37:03.344668+08');
INSERT INTO public.django_session VALUES ('740l1cui8b0i6venlv1w3rkldy2jk0ug', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-14 08:09:28.242241+08');
INSERT INTO public.django_session VALUES ('d03rgl01ip8sy33qrxrc30clh66m7eo3', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-14 17:48:19.38913+08');
INSERT INTO public.django_session VALUES ('xvxyfttqid07hqcn9vgeyt70u7jv585w', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-17 00:32:17.671902+08');
INSERT INTO public.django_session VALUES ('zd43wldov7pz3j0mqp1wzy2y48403t43', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-18 08:00:33.012386+08');
INSERT INTO public.django_session VALUES ('5nrabu1tr5kbbhqhbs8dlr1q5m6g90ak', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-21 09:08:50.523843+08');
INSERT INTO public.django_session VALUES ('ek01g059ertjctp0k4acxjfy3jtctmgf', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-23 08:54:56.16816+08');
INSERT INTO public.django_session VALUES ('sn0zce0cgtpbbieqg1ksk6xpu8b3pcti', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-08-28 10:29:14.568682+08');
INSERT INTO public.django_session VALUES ('fpecztca9betwi6focq6zxk1hzeupl9b', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-02 19:26:30.892537+08');
INSERT INTO public.django_session VALUES ('ubj95d3gk524a29krz5joqk5hst050af', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-12 03:22:46.123928+08');
INSERT INTO public.django_session VALUES ('hb0bwc7og8vm86ly14cegjg56j3aif33', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-12 04:07:56.173375+08');
INSERT INTO public.django_session VALUES ('ie1qwv4f8wlwh49a3oa70ncv9y6ar8nj', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-12 07:21:12.14048+08');
INSERT INTO public.django_session VALUES ('3u8nvske20v8mdlulop1tl9zaz8c3tiw', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-13 09:17:24.509955+08');
INSERT INTO public.django_session VALUES ('yc81vqjo0esjs8pv9l1kp1uvlnvfx3j2', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-26 09:03:15.90151+08');
INSERT INTO public.django_session VALUES ('xwqsx6l0egl9ll1594v68ip2cq80luw4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-27 16:22:44.561222+08');
INSERT INTO public.django_session VALUES ('8yehrfg0hi9onjqtp6tngmop6tvgymy9', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-09-29 23:57:06.674073+08');
INSERT INTO public.django_session VALUES ('z76kypph9rzqsk1dzlwart97637ojujr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-10 09:34:29.533389+08');
INSERT INTO public.django_session VALUES ('tfq9taddqwt4ltruqwoe43glzx1msvxd', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-11 19:07:02.072575+08');
INSERT INTO public.django_session VALUES ('u01owjs7aiyj1dihyat7gk2v9amue48j', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-14 00:21:16.389399+08');
INSERT INTO public.django_session VALUES ('a0cc3rv6re7es1g3obtpt4o162fn45nk', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-14 23:08:37.049734+08');
INSERT INTO public.django_session VALUES ('9oeyfd9luq3s3cmwfckak18bzwh0yqvd', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-23 07:51:13.050267+08');
INSERT INTO public.django_session VALUES ('ibenqeexzvurx2m9ku9u8pvql5pzy05z', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-24 07:55:30.434294+08');
INSERT INTO public.django_session VALUES ('xhj43h7osxkmp30gpseamzaqliy3m5dp', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-24 15:33:45.139136+08');
INSERT INTO public.django_session VALUES ('2akv5ug4mi2zipmnsn6o8n24t4aswxji', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-26 02:30:49.401317+08');
INSERT INTO public.django_session VALUES ('1ipnm122wvxhzufmjx9rju0i6rr58eti', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-10-28 04:20:44.146646+08');
INSERT INTO public.django_session VALUES ('mzuw4b3bm7rsjlfmg33ov2u7pp7vg2f4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-07 17:06:36.949073+08');
INSERT INTO public.django_session VALUES ('84nxygoqtlybjwe3heiwtgg476zrgk0f', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-09 07:51:52.739796+08');
INSERT INTO public.django_session VALUES ('x31jr9gw8vke5ghmu3ufbct6ch2sds2y', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-11 15:40:31.412199+08');
INSERT INTO public.django_session VALUES ('id3fti36d1ydseb36g7z9vk4dxx107ih', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-22 07:19:59.241531+08');
INSERT INTO public.django_session VALUES ('uncpjbmofv43w85yic2k11xdhs46hdyp', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-23 08:01:57.323674+08');
INSERT INTO public.django_session VALUES ('thzsid8vpukes8dkwmjdfqfy71h8wpyf', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-11-25 16:02:27.541635+08');
INSERT INTO public.django_session VALUES ('nc1v5e5w3mdr2rgnjg9kcvcgc1kp2c3x', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-06 12:30:57.579029+08');
INSERT INTO public.django_session VALUES ('s0t4gsnkkm4f3163f98tmn7950znro16', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-07 21:28:36.1595+08');
INSERT INTO public.django_session VALUES ('lpd5i7iz8xcidctbv957kzzwo8hzzy8g', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-09 21:52:56.11547+08');
INSERT INTO public.django_session VALUES ('wqv7d5zv5afakqgcmtostxv2lfslhtzm', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-20 13:41:50.802041+08');
INSERT INTO public.django_session VALUES ('uzdc19mzou63nea00w9jcnblbov7qyjb', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-22 07:37:34.541233+08');
INSERT INTO public.django_session VALUES ('4qrqmls9acutgyka5o8fkrv0mw73b1wv', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2023-12-24 01:04:45.579037+08');
INSERT INTO public.django_session VALUES ('jjriunejvpvs3pw0kzj4dm3gqtudme6c', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-03 15:04:30.877066+08');
INSERT INTO public.django_session VALUES ('6w174695iopx8k7twp3cvh1pana08a19', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-05 07:58:16.078296+08');
INSERT INTO public.django_session VALUES ('sk2m0lti5ah9ie7v8lfyip11grifw81d', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-07 01:17:13.621461+08');
INSERT INTO public.django_session VALUES ('5dnuqd0p1353xm1dd2cezskpm5gtzpn5', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-19 07:58:44.953218+08');
INSERT INTO public.django_session VALUES ('6tvpxvl0nje9voxqe38n8t9si0hsrz5f', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-21 01:39:04.321003+08');
INSERT INTO public.django_session VALUES ('cyvtfwjruhga4z0inb9o53o0oakbomi3', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-01-30 17:51:12.359697+08');
INSERT INTO public.django_session VALUES ('sq3asuqps941e01miloojeub9lugkh0v', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-02-02 08:01:56.524804+08');
INSERT INTO public.django_session VALUES ('0rcbgp5ydy6g2g8o4eeffbsas2czr5uq', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-02-04 19:43:07.702211+08');
INSERT INTO public.django_session VALUES ('9dz4wdxrs814kk4hfusomxspv2xd2vd1', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-02-14 13:42:22.182051+08');
INSERT INTO public.django_session VALUES ('xsv1882jh6o0wgpsozamtif2mu0rsz15', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-02-16 11:04:43.428784+08');
INSERT INTO public.django_session VALUES ('etklsalfdcdu7qr67g47019xnix8ae0d', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-02-18 21:17:50.217206+08');
INSERT INTO public.django_session VALUES ('7pcupsck7wfishy6q8i0kn60zra4iajc', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-01 13:37:03.131327+08');
INSERT INTO public.django_session VALUES ('5122osg50vd1njwc04p3n86yplgplmkw', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-03 17:54:16.160282+08');
INSERT INTO public.django_session VALUES ('jqjqr0vpmnshqyfg46u1c4lob0t35nel', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-03 21:40:38.636248+08');
INSERT INTO public.django_session VALUES ('sf39ju7elolmqkhx7kgkf2fn6z4ljiky', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-15 23:47:21.759614+08');
INSERT INTO public.django_session VALUES ('4yvc173p1h1t9yy7pg5ycpgx3o2lh3fx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-17 21:30:20.414484+08');
INSERT INTO public.django_session VALUES ('aej4s9jw5wjktw6krz6sffknrp7ok3wr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-18 20:11:31.601078+08');
INSERT INTO public.django_session VALUES ('jucyhkwwcfdllssybfwbnoeaozyty89g', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-03-30 09:14:05.494302+08');
INSERT INTO public.django_session VALUES ('esj6gqvpcd8up4s5ymhfwklfvwkm59kr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-01 20:31:23.524096+08');
INSERT INTO public.django_session VALUES ('b1ml6oq6u4x55a0ts3dn22dbhc3v5s6z', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-02 11:46:18.067291+08');
INSERT INTO public.django_session VALUES ('2ezz3bq3ghqk8jr4fb4rdh46n5nci6i7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-13 09:21:20.223563+08');
INSERT INTO public.django_session VALUES ('5dp3xol3dv8vu0spvzr4cg7umii5eyie', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-13 11:00:05.639243+08');
INSERT INTO public.django_session VALUES ('5fkfa6oz3wyr0h7qxbsjnmw2t07of2rz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-15 21:08:41.983119+08');
INSERT INTO public.django_session VALUES ('t61jn4202dbgj0evklhbnln2udfqwsop', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-16 14:30:22.851692+08');
INSERT INTO public.django_session VALUES ('3n8tpeax55cfn1lntvq4qnqnxjn1lrkc', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-27 14:28:49.228432+08');
INSERT INTO public.django_session VALUES ('c9ui67s0l0yp84jk5f05te6kf1itqhu7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-29 21:17:02.296+08');
INSERT INTO public.django_session VALUES ('6cdcae6r6fpy6jhbjlry208ffrnli4jl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-04-30 16:09:59.954449+08');
INSERT INTO public.django_session VALUES ('tffbkupd80ifl7758vz29qzfxk4l8uzd', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-12 08:56:31.660254+08');
INSERT INTO public.django_session VALUES ('eqx5h5z0e5klcf5zbt0u50qebgxz0sya', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-13 21:30:30.488683+08');
INSERT INTO public.django_session VALUES ('70vab0kcd9flxhulzhwg7e3eza074okf', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-14 17:37:50.619134+08');
INSERT INTO public.django_session VALUES ('s6ovexb7bqnifuq4c256m1wsfz991n8u', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-26 11:28:43.566323+08');
INSERT INTO public.django_session VALUES ('0ehcjcpdu580mmgs343itmh5frvyg8ou', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-27 21:32:01.547281+08');
INSERT INTO public.django_session VALUES ('qa7m0miwfymiswlaoc7aksul8o2jm9qz', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-05-29 08:19:56.455082+08');
INSERT INTO public.django_session VALUES ('lhhqutbelxqlflo6runw71fv7aljod05', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-10 15:34:59.04387+08');
INSERT INTO public.django_session VALUES ('9ljui59cxdagbouvjdd02mgsmtlvwjje', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-11 20:43:48.606822+08');
INSERT INTO public.django_session VALUES ('wqsj7hcfz8usw1g8mvgj9c7d5brhrngc', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-12 11:21:51.684273+08');
INSERT INTO public.django_session VALUES ('2p21p0x54bdvjg75lvs194tts30ojjdk', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-24 17:03:02.688992+08');
INSERT INTO public.django_session VALUES ('fch52gtpm8zhlzzhpn8i2gtprovhgvpx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-25 21:19:47.127005+08');
INSERT INTO public.django_session VALUES ('ueeyo3othoajq0c2qlfhkhlmweag51qn', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-06-27 08:54:17.564434+08');
INSERT INTO public.django_session VALUES ('ml7nbu7sakhf0b4ip8tkpved5hso86vl', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-07-09 21:46:33.952154+08');
INSERT INTO public.django_session VALUES ('e9wdcgodl1q4sn8l9anwjqza8knas293', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-07-11 11:01:33.383273+08');
INSERT INTO public.django_session VALUES ('y3cc2ijfjsbq6f2bs45nmmryk0s9jyd6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-07-14 11:52:42.944287+08');
INSERT INTO public.django_session VALUES ('pqry0gpipafcnyv8rhhnsle0jmdbikte', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-07-23 22:17:35.595247+08');
INSERT INTO public.django_session VALUES ('cgco2ocmeh16k8592ph5qh3p3yxhw804', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-07-25 11:16:29.640697+08');
INSERT INTO public.django_session VALUES ('87bvh2s9lu42uevxkew98usflwvm35p8', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-03 10:11:38.17941+08');
INSERT INTO public.django_session VALUES ('2mo0qqmdvk3sdp63r1gd7vearq6uk0b7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-07 20:39:26.905988+08');
INSERT INTO public.django_session VALUES ('oqrjpv6llivs5m1g8oa4uie4bhlqitwe', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-08 11:20:50.097404+08');
INSERT INTO public.django_session VALUES ('i9jteu6ydzh3el3epq0v1r74j7alufu4', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-17 13:06:13.85435+08');
INSERT INTO public.django_session VALUES ('hjocbhb47tsp4o145w0hnn1q8739flq1', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-21 20:55:41.158364+08');
INSERT INTO public.django_session VALUES ('a6o3wt7a7wwk3cx2phu861ezqz6spzs6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-08-22 11:21:30.809248+08');
INSERT INTO public.django_session VALUES ('h7w919sz7w1kx1xyl97xs2t9szlt04b8', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-04 21:58:24.455147+08');
INSERT INTO public.django_session VALUES ('bhquhfq2iwgpjz6yzafj30x8f3bin7xw', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-05 14:27:17.456081+08');
INSERT INTO public.django_session VALUES ('uiurklx02hxpgop6urxjpzitg852ssgi', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-05 18:12:50.955794+08');
INSERT INTO public.django_session VALUES ('tai9hswaa8he5r8ci0chc7wkwksa1jsb', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-18 22:26:50.126186+08');
INSERT INTO public.django_session VALUES ('c150rtrw8wy24ur6z45herltbe9edh0x', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-19 17:43:04.273875+08');
INSERT INTO public.django_session VALUES ('rd5bviuok8p4djzax0dq1uhgg84zao6f', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-09-20 18:07:21.434172+08');
INSERT INTO public.django_session VALUES ('66tro3225q5v880ezsd4g8ia3ntspr4j', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-02 22:46:35.525149+08');
INSERT INTO public.django_session VALUES ('ivgzvh6k3uh8tveankmbq0dejzbg76sx', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-04 10:06:36.661077+08');
INSERT INTO public.django_session VALUES ('v6rcx11ib63nswt1x7jmqyx9bi2wydp7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-04 19:45:07.662374+08');
INSERT INTO public.django_session VALUES ('lnncjjzvx5qs3e20myjiixak4c50920j', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-16 23:32:38.493462+08');
INSERT INTO public.django_session VALUES ('gnzyr29y3yywbpv9zgpo91e7w4p1olh1', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-22 09:33:16.380092+08');
INSERT INTO public.django_session VALUES ('0w48riatzvjfcggy6wqlzdxz1jck4s6a', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-22 18:23:02.987724+08');
INSERT INTO public.django_session VALUES ('uclx5m2mbr36jx6l3uwk7i5byuqn9mui', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-25 21:10:49.934458+08');
INSERT INTO public.django_session VALUES ('qptrn5cfo19e5mvu4pzaoceoec104kky', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-10-31 00:12:11.97449+08');
INSERT INTO public.django_session VALUES ('9ukmc1rol1l5v9udx9ezb7jy9gzgj0g7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-05 11:45:48.526748+08');
INSERT INTO public.django_session VALUES ('jgsth1edr5opc6snefsbri7ep1xqlg4p', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-05 18:23:47.432146+08');
INSERT INTO public.django_session VALUES ('p0tmf48vz5rqwnmpn74n35pk5xlgd5cp', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-14 21:57:43.879976+08');
INSERT INTO public.django_session VALUES ('a7885wm73r5wxvsygdop5xdvnzqchggs', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-19 13:38:51.589364+08');
INSERT INTO public.django_session VALUES ('jgbsfmk65vneya0b4vb6ab7rre1ed13b', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-20 14:00:56.143764+08');
INSERT INTO public.django_session VALUES ('6p04lr186l2dowyeqnxuw4nkdgm87djb', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-11-29 00:58:03.917048+08');
INSERT INTO public.django_session VALUES ('yo2w4tjex5yylesvei9qeqf0c5q4cb6r', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-12-03 13:39:51.027076+08');
INSERT INTO public.django_session VALUES ('jrrzf9abaepuysq0o63h0s20p0omcajy', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-12-07 15:06:24.584991+08');
INSERT INTO public.django_session VALUES ('204x8w6e64crp1y9ivjql4ru5qesbwog', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-12-14 12:39:37.401089+08');
INSERT INTO public.django_session VALUES ('2lxlmkacd5vzvgk5653kvt4jlwgsaa1o', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-12-17 13:41:53.559916+08');
INSERT INTO public.django_session VALUES ('70k04pgrqjh0hkr56l13yqhe5g0gygwt', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2024-12-29 21:08:39.008918+08');
INSERT INTO public.django_session VALUES ('0fiblw16dht70rlgdbphvc3tuwj1xyzm', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-01 10:55:34.258315+08');
INSERT INTO public.django_session VALUES ('9llq5p2p5nnjxfwczimv27ul3h6x4oj7', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-02 20:19:05.331655+08');
INSERT INTO public.django_session VALUES ('ur1dfuqxppf58pyf7dnt7bqrf0676sgi', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-13 21:29:19.197136+08');
INSERT INTO public.django_session VALUES ('r4pxvzp1eea2c066f1khrrbygso404qk', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-16 13:46:02.901628+08');
INSERT INTO public.django_session VALUES ('gzbf19q649h9oyqra60q3a7ik067afha', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-29 01:07:11.822614+08');
INSERT INTO public.django_session VALUES ('gqas4z3u9uccino09sy95kllxr1a4qp6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-01-30 15:08:33.332921+08');
INSERT INTO public.django_session VALUES ('mpm4j93khdhj2i3xf405vk4etojs40ly', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-02-10 10:35:01.089405+08');
INSERT INTO public.django_session VALUES ('ta13uoadq2879tnqeiek6wygi6oxxqsn', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-02-12 01:45:42.284597+08');
INSERT INTO public.django_session VALUES ('kkpo3hj1y0ycn0ncd9a8ygchyhavub7q', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-02-19 10:12:07.497036+08');
INSERT INTO public.django_session VALUES ('sslt0saxffbxi7reanl5zb0m7v9stzin', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-02-26 20:15:44.17443+08');
INSERT INTO public.django_session VALUES ('apsuzwf8jyukh4yfiez86spj16qu19n6', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-03-06 09:27:18.034469+08');
INSERT INTO public.django_session VALUES ('2d65z45lq2tnlbjqjhrku1ci7ruaduxr', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-03-09 17:08:01.519282+08');
INSERT INTO public.django_session VALUES ('uuic8rpfrhbmes3wnxf0oahpapaqwdzh', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-03-16 20:15:08.322585+08');
INSERT INTO public.django_session VALUES ('5y9hz43isgxt702kmjb11ih5v44lu3az', 'OTlkNjM2MzZjN2U0YjI5MjYxMGUzOTEwZjYyNjIzMDVhYzFjNzE0MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Q0ODE0NmUzNDFkYjljOWU2OWE1ZDRlMGY3YjM2NTE0OGE5ZjU5In0=', '2025-03-20 10:40:43.62518+08');


--
-- TOC entry 2472 (class 0 OID 25998)
-- Dependencies: 218
-- Data for Name: game_cg_mp700_detail; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.game_cg_mp700_detail VALUES (84949, 2, 1, '2024-04-01 09:10:51.890324+08', '2024-04-01 09:17:57.973593+08', 7255, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84914, 2, 2, '2024-03-31 21:12:19.977422+08', '2024-03-31 21:22:41.351346+08', 7249, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84958, 1, 1, '2024-04-01 11:51:40.214756+08', '2024-04-01 11:57:38.522755+08', 7257, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84967, 2, 1, '2024-04-01 14:11:43.168337+08', '2024-04-01 14:18:44.174482+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84923, 1, 2, '2024-04-01 02:09:11.11654+08', '2024-04-01 02:19:28.401389+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84893, 2, 1, '2024-03-31 13:33:46.839952+08', '2024-03-31 13:40:39.205583+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84902, 1, 1, '2024-03-31 16:01:30.772247+08', '2024-03-31 16:07:27.549903+08', 7248, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84932, 2, 2, '2024-04-01 04:29:14.881498+08', '2024-04-01 04:39:33.827821+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84976, 1, 1, '2024-04-01 16:42:13.500892+08', '2024-04-01 16:48:10.883555+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84985, 2, 1, '2024-04-01 19:01:06.853963+08', NULL, 7261, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84907, 2, 3, '2024-03-31 17:16:13.384951+08', '2024-03-31 17:48:04.812907+08', 7248, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84941, 1, 2, '2024-04-01 06:57:39.370409+08', '2024-04-01 07:07:55.720835+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84950, 2, 2, '2024-04-01 09:17:57.976657+08', '2024-04-01 09:28:15.182761+08', 7255, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84959, 1, 2, '2024-04-01 11:57:38.525955+08', '2024-04-01 12:07:57.99686+08', 7257, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84915, 2, 3, '2024-03-31 21:22:41.353995+08', '2024-03-31 21:54:14.332467+08', 7249, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84968, 2, 2, '2024-04-01 14:18:44.180784+08', '2024-04-01 14:29:06.785169+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84894, 2, 2, '2024-03-31 13:40:39.214636+08', '2024-03-31 13:51:02.720092+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84903, 1, 2, '2024-03-31 16:07:27.552158+08', '2024-03-31 16:17:44.15556+08', 7248, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84924, 1, 3, '2024-04-01 02:19:28.403867+08', '2024-04-01 02:46:43.080153+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84933, 2, 3, '2024-04-01 04:39:33.830368+08', '2024-04-01 05:11:19.413231+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84977, 1, 2, '2024-04-01 16:48:10.886041+08', '2024-04-01 16:58:29.045577+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84908, 1, 1, '2024-03-31 20:05:16.227486+08', '2024-03-31 20:12:40.54778+08', 7249, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84942, 1, 3, '2024-04-01 07:07:55.723526+08', '2024-04-01 07:35:09.028627+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84916, 1, 1, '2024-04-01 00:27:42.449798+08', '2024-04-01 00:33:41.059372+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84925, 2, 1, '2024-04-01 02:46:43.082652+08', '2024-04-01 02:53:33.138888+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84934, 1, 1, '2024-04-01 05:14:24.507122+08', '2024-04-01 05:20:24.861659+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84943, 2, 1, '2024-04-01 07:35:09.031129+08', '2024-04-01 07:42:00.157089+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84951, 2, 3, '2024-04-01 09:28:15.18505+08', '2024-04-01 10:10:12.474599+08', 7255, 8, 1);
INSERT INTO public.game_cg_mp700_detail VALUES (84895, 2, 3, '2024-03-31 13:51:02.723075+08', '2024-03-31 14:22:47.289077+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84904, 1, 3, '2024-03-31 16:17:44.159139+08', '2024-03-31 16:44:24.540717+08', 7248, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84960, 1, 3, '2024-04-01 12:07:57.999266+08', '2024-04-01 12:35:53.535348+08', 7257, 1, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84909, 1, 2, '2024-03-31 20:12:40.550088+08', '2024-03-31 20:23:49.225156+08', 7249, 1, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84969, 2, 3, '2024-04-01 14:29:06.789464+08', '2024-04-01 15:02:06.550767+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84978, 1, 3, '2024-04-01 16:58:29.048294+08', '2024-04-01 17:25:38.101311+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84952, 1, 1, '2024-04-01 10:13:16.174752+08', '2024-04-01 10:19:14.580697+08', 7256, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84917, 1, 2, '2024-04-01 00:33:41.061592+08', '2024-04-01 00:44:01.195209+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84926, 2, 2, '2024-04-01 02:53:33.141348+08', '2024-04-01 03:03:49.081327+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84935, 1, 2, '2024-04-01 05:20:24.864001+08', '2024-04-01 05:30:42.800913+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84961, 2, 1, '2024-04-01 12:35:53.539493+08', '2024-04-01 12:42:53.271502+08', 7257, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84970, 1, 1, '2024-04-01 15:06:56.760726+08', '2024-04-01 15:12:53.707116+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84896, 1, 1, '2024-03-31 14:25:48.22558+08', '2024-03-31 14:31:46.424473+08', 7247, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84905, 2, 1, '2024-03-31 16:44:24.543098+08', '2024-03-31 16:51:55.410217+08', 7248, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84944, 2, 2, '2024-04-01 07:42:00.160213+08', '2024-04-01 07:52:18.874311+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84979, 2, 1, '2024-04-01 17:25:38.103577+08', '2024-04-01 17:32:30.761261+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84910, 1, 3, '2024-03-31 20:23:49.227673+08', '2024-03-31 20:34:41.61192+08', 7249, 5, 1);
INSERT INTO public.game_cg_mp700_detail VALUES (84918, 1, 3, '2024-04-01 00:44:01.197691+08', '2024-04-01 01:11:11.478079+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84953, 1, 2, '2024-04-01 10:19:14.583134+08', '2024-04-01 10:29:35.385736+08', 7256, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84962, 2, 2, '2024-04-01 12:42:53.273584+08', '2024-04-01 12:53:11.68073+08', 7257, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84971, 1, 2, '2024-04-01 15:12:53.719586+08', '2024-04-01 15:23:11.915953+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84897, 1, 2, '2024-03-31 14:31:46.427759+08', '2024-03-31 14:42:08.412648+08', 7247, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84927, 2, 3, '2024-04-01 03:03:49.084315+08', '2024-04-01 03:35:55.696882+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84936, 1, 3, '2024-04-01 05:30:42.803584+08', '2024-04-01 05:57:48.517318+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84945, 2, 3, '2024-04-01 07:52:18.877165+08', '2024-04-01 08:24:20.736587+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84980, 2, 2, '2024-04-01 17:32:30.763514+08', '2024-04-01 17:43:01.142046+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84906, 2, 2, '2024-03-31 16:51:55.415555+08', '2024-03-31 17:16:13.284643+08', 7248, 195, 2);
INSERT INTO public.game_cg_mp700_detail VALUES (84911, 1, 3, '2024-03-31 20:34:41.721385+08', '2024-03-31 20:36:48.799602+08', 7249, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84919, 2, 1, '2024-04-01 01:11:11.480205+08', '2024-04-01 01:18:03.491834+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84954, 1, 3, '2024-04-01 10:29:35.387784+08', '2024-04-01 10:58:48.909213+08', 7256, 1, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84963, 2, 3, '2024-04-01 12:53:11.682946+08', '2024-04-01 13:24:44.354955+08', 7257, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84898, 1, 3, '2024-03-31 14:42:08.420094+08', '2024-03-31 15:09:14.580099+08', 7247, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84928, 1, 1, '2024-04-01 03:38:56.390609+08', '2024-04-01 03:44:52.445985+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84937, 2, 1, '2024-04-01 05:57:48.519342+08', '2024-04-01 06:04:40.224581+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84946, 1, 1, '2024-04-01 08:27:21.567954+08', '2024-04-01 08:33:19.463819+08', 7255, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84972, 1, 3, '2024-04-01 15:23:11.918589+08', '2024-04-01 15:50:09.261781+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84981, 2, 3, '2024-04-01 17:43:01.144367+08', '2024-04-01 18:14:42.317783+08', 7260, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84912, 1, 3, '2024-03-31 20:36:48.905131+08', '2024-03-31 21:02:31.067419+08', 7249, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84955, 2, 1, '2024-04-01 10:58:48.911423+08', '2024-04-01 11:05:39.681456+08', 7256, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84964, 1, 1, '2024-04-01 13:27:50.520821+08', '2024-04-01 13:33:51.187931+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84973, 2, 1, '2024-04-01 15:50:09.264097+08', '2024-04-01 15:56:59.495733+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84982, 1, 1, '2024-04-01 18:17:43.015638+08', '2024-04-01 18:24:05.528475+08', 7261, 2, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84913, 2, 1, '2024-03-31 21:02:31.069647+08', '2024-03-31 21:12:19.973837+08', 7249, 12, 1);
INSERT INTO public.game_cg_mp700_detail VALUES (84920, 2, 2, '2024-04-01 01:18:03.494453+08', '2024-04-01 01:28:23.16958+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84890, 1, 1, '2024-03-31 12:50:20.516619+08', '2024-03-31 12:56:17.899401+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84899, 2, 1, '2024-03-31 15:09:14.582772+08', '2024-03-31 15:16:05.6798+08', 7247, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84929, 1, 2, '2024-04-01 03:44:52.448233+08', '2024-04-01 03:55:10.585155+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84938, 2, 2, '2024-04-01 06:04:40.226654+08', '2024-04-01 06:14:58.412246+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84947, 1, 2, '2024-04-01 08:33:19.468593+08', '2024-04-01 08:43:39.699239+08', 7255, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84921, 2, 3, '2024-04-01 01:28:23.172193+08', '2024-04-01 02:00:13.413582+08', 7250, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84948, 1, 3, '2024-04-01 08:43:39.701461+08', '2024-04-01 09:10:51.883777+08', 7255, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84956, 2, 2, '2024-04-01 11:05:39.683805+08', '2024-04-01 11:16:03.727189+08', 7256, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84930, 1, 3, '2024-04-01 03:55:10.587898+08', '2024-04-01 04:22:24.148952+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84939, 2, 3, '2024-04-01 06:14:58.414857+08', '2024-04-01 06:46:53.472548+08', 7253, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84965, 1, 2, '2024-04-01 13:33:51.190163+08', '2024-04-01 13:44:32.922526+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84974, 2, 2, '2024-04-01 15:56:59.504188+08', '2024-04-01 16:07:16.279121+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84983, 1, 2, '2024-04-01 18:24:05.532162+08', '2024-04-01 18:34:21.60347+08', 7261, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84891, 1, 2, '2024-03-31 12:56:17.901921+08', '2024-03-31 13:06:44.293262+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84900, 2, 2, '2024-03-31 15:16:05.683262+08', '2024-03-31 15:26:24.585603+08', 7247, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84922, 1, 1, '2024-04-01 02:03:14.145057+08', '2024-04-01 02:09:11.114157+08', 7251, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84931, 2, 1, '2024-04-01 04:22:24.153096+08', '2024-04-01 04:29:14.877789+08', 7252, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84957, 2, 3, '2024-04-01 11:16:03.730548+08', '2024-04-01 11:48:39.320286+08', 7256, 1, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84940, 1, 1, '2024-04-01 06:51:42.696948+08', '2024-04-01 06:57:39.36783+08', 7254, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84966, 1, 3, '2024-04-01 13:44:32.928089+08', '2024-04-01 14:11:43.165772+08', 7258, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84975, 2, 3, '2024-04-01 16:07:16.281337+08', '2024-04-01 16:39:12.704621+08', 7259, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84984, 1, 3, '2024-04-01 18:34:21.605705+08', '2024-04-01 19:01:06.800201+08', 7261, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84892, 1, 3, '2024-03-31 13:06:44.296446+08', '2024-03-31 13:33:46.837414+08', 7246, 0, 0);
INSERT INTO public.game_cg_mp700_detail VALUES (84901, 2, 3, '2024-03-31 15:26:24.58784+08', '2024-03-31 15:58:27.934894+08', 7247, 0, 0);


--
-- TOC entry 2474 (class 0 OID 26003)
-- Dependencies: 220
-- Data for Name: game_cg_mp700_prepare; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.game_cg_mp700_prepare VALUES (8, '料理国议员', '00D（以德修身）', '0', '2024-03-31 14:48:20.646458+08', '2024-04-01 08:27:21.474058+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (9, '料理界前辈', '00E（以德立威）', '0', '2024-03-31 14:52:51.582925+08', '2024-04-01 10:13:15.662889+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (10, '料理界元老', '00E（以德服众）', '0', '2024-04-01 00:40:11.814157+08', '2024-04-01 11:51:40.119414+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (11, '料理帮帮主', '00F（弘扬优良传统）', '0', '2024-04-01 00:42:03.447679+08', '2024-04-01 13:27:50.321916+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (3, '料理班教授', '00B（以德立威）', '1', '2024-04-01 13:45:05.68946+08', '2024-04-01 00:27:42.357613+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (4, '料理班讲师', '00B（以德服众）', '1', '2024-04-01 13:46:51.672646+08', '2024-04-01 02:03:14.057581+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (5, '料理厂厂长', '00C（弘扬优良传统）', '1', '2024-04-01 13:48:43.502789+08', '2024-04-01 03:38:56.29556+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (6, '料理厂主任', '00C（弘扬优良传统）', '1', '2024-04-01 13:50:26.928743+08', '2024-04-01 05:14:24.418323+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (7, '料理国总统', '00D（以德为先）', '1', '2024-04-01 13:55:24.6117+08', '2024-04-01 06:51:42.605815+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (12, '料理帮长老', '00F（弘扬优良传统）', '0', '2024-04-01 00:43:48.807647+08', '2024-04-01 15:06:56.734674+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (1, '料理粉碎机', '00A（以德为先）', '0', '2024-04-01 00:45:40.53107+08', '2024-04-01 16:42:13.403566+08');
INSERT INTO public.game_cg_mp700_prepare VALUES (2, '料理切配机', '00A（以德修身）', '0', '2024-04-01 00:50:34.2096+08', '2024-04-01 18:17:42.971349+08');


--
-- TOC entry 2475 (class 0 OID 26006)
-- Dependencies: 221
-- Data for Name: game_cg_mp700_produce; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.game_cg_mp700_produce VALUES (7249, '料理切配机', '以德修身');
INSERT INTO public.game_cg_mp700_produce VALUES (7250, '料理班教授', '以德立威');
INSERT INTO public.game_cg_mp700_produce VALUES (7251, '料理班讲师', '以德服众');
INSERT INTO public.game_cg_mp700_produce VALUES (7252, '料理厂厂长', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7253, '料理厂主任', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7254, '料理国总统', '以德为先');
INSERT INTO public.game_cg_mp700_produce VALUES (7255, '料理国议员', '以德修身');
INSERT INTO public.game_cg_mp700_produce VALUES (7256, '料理界前辈', '以德立威');
INSERT INTO public.game_cg_mp700_produce VALUES (7257, '料理界元老', '以德服众');
INSERT INTO public.game_cg_mp700_produce VALUES (7258, '料理帮帮主', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7259, '料理帮长老', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7260, '料理粉碎机', '以德为先');
INSERT INTO public.game_cg_mp700_produce VALUES (7261, '料理切配机', '以德修身');
INSERT INTO public.game_cg_mp700_produce VALUES (7246, '料理帮帮主', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7247, '料理帮长老', '弘扬优良传统');
INSERT INTO public.game_cg_mp700_produce VALUES (7248, '料理粉碎机', '以德为先');


--
-- TOC entry 2477 (class 0 OID 26011)
-- Dependencies: 223
-- Data for Name: game_cg_mp700_status; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.game_cg_mp700_status VALUES (1, 19, '2024-04-01 15:03:55.216566+08', '2024-03-31 01:56:44.315699+08', '2024-03-31 01:56:40.531064+08', 1);


--
-- TOC entry 2478 (class 0 OID 26014)
-- Dependencies: 224
-- Data for Name: home_dingding_message; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.home_dingding_message VALUES (1, 'dingx3btvbklxdnvbqol', '1vfC5Dh1X0FmEYF3qvW61vGMaCBu2flEgAigTA1Rj6lJYiIRLBuV1Jaehh57Zgbo', 2693766248, '126768234337093344', 'AI小助手（本人）');
INSERT INTO public.home_dingding_message VALUES (2, 'dingx3btvbklxdnvbqol', '1vfC5Dh1X0FmEYF3qvW61vGMaCBu2flEgAigTA1Rj6lJYiIRLBuV1Jaehh57Zgbo', 2693766248, '220530153921745330,126768234337093344,0140512510734324,026050552826702398,250423464920917670,0612466426763386,01554824605526187752,1024291468771016,01176961365332297247', 'AI小助手（全员）');


--
-- TOC entry 2479 (class 0 OID 26020)
-- Dependencies: 225
-- Data for Name: home_message_level; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.home_message_level VALUES (1, '线上库存预警', NULL, NULL, NULL);


--
-- TOC entry 2480 (class 0 OID 26023)
-- Dependencies: 226
-- Data for Name: home_wechat_message; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.home_wechat_message VALUES (1, 'ww5a6e777c0654c320', 'AXI2oicadrVaghtHLNL_AcVvyEUC3izHMjnGbjpsx04', 1000003, 'GPLite', 'PKML');
INSERT INTO public.home_wechat_message VALUES (2, 'ww5a6e777c0654c320', '-5rQHhXzKggb_23SHcoSgMV5ODLREAc1e7GBavRvqyk', 1000006, 'GPLite', 'AI');


--
-- TOC entry 2481 (class 0 OID 26026)
-- Dependencies: 227
-- Data for Name: snooker_campaign; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_campaign VALUES (1, '2016-02-05', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (2, '2016-02-15', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (3, '2016-02-17', 1, 1, 6, 0, '1');
INSERT INTO public.snooker_campaign VALUES (4, '2016-02-24', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (5, '2016-02-29', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (6, '2016-03-04', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (7, '2016-03-07', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (8, '2016-03-11', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (9, '2016-03-11', 1, 1, 8, 0, '1');
INSERT INTO public.snooker_campaign VALUES (10, '2016-03-14', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (11, '2016-03-21', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (12, '2016-03-24', 1, 1, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (13, '2016-04-11', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (14, '2016-04-14', 1, 1, 9, 0, '1');
INSERT INTO public.snooker_campaign VALUES (15, '2016-04-16', 4, 3, 14, 0, '1');
INSERT INTO public.snooker_campaign VALUES (16, '2016-04-18', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (17, '2016-04-25', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (18, '2016-04-29', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (19, '2016-04-29', 1, 1, 9, 0, '1');
INSERT INTO public.snooker_campaign VALUES (20, '2016-05-05', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (21, '2016-05-11', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (22, '2016-05-19', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (23, '2016-05-23', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (24, '2016-05-26', 1, 1, 6, 0, '1');
INSERT INTO public.snooker_campaign VALUES (25, '2016-06-02', 5, 3, 11, 0, '1');
INSERT INTO public.snooker_campaign VALUES (26, '2016-06-06', 5, 3, 12, 0, '1');
INSERT INTO public.snooker_campaign VALUES (27, '2016-06-11', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (28, '2016-06-18', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (29, '2016-06-20', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (30, '2016-06-23', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (31, '2016-06-26', 6, 3, 10, 0, '1');
INSERT INTO public.snooker_campaign VALUES (32, '2016-06-27', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (33, '2016-06-30', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (34, '2016-07-07', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (35, '2016-07-09', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (36, '2016-07-11', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (37, '2016-07-14', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (38, '2016-07-18', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (39, '2016-07-25', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (40, '2016-07-29', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (41, '2016-07-30', 1, 1, 7, 0, '1');
INSERT INTO public.snooker_campaign VALUES (42, '2016-08-08', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (43, '2016-08-15', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (44, '2016-08-22', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (45, '2016-08-29', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (46, '2016-09-05', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (47, '2016-09-18', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (48, '2016-09-26', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (49, '2016-10-02', 7, 3, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (50, '2016-10-08', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (51, '2016-10-13', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (52, '2016-10-20', 5, 3, 11, 0, '1');
INSERT INTO public.snooker_campaign VALUES (53, '2016-11-05', 1, 1, 6, 0, '1');
INSERT INTO public.snooker_campaign VALUES (54, '2016-11-07', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (55, '2016-11-14', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (56, '2016-11-21', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (57, '2016-11-28', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (58, '2016-12-05', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (59, '2016-12-19', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (60, '2016-12-26', 1, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (61, '2016-12-29', 1, 1, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (62, '2017-01-08', 5, 1, 15, 0, '1');
INSERT INTO public.snooker_campaign VALUES (63, '2017-01-12', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (64, '2017-01-23', 8, 3, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (65, '2017-01-29', 9, 3, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (66, '2017-02-08', 3, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (67, '2017-02-13', 9, 3, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (68, '2017-02-20', 9, 3, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (69, '2017-02-27', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (70, '2017-03-06', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (71, '2017-03-20', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (72, '2017-03-23', 10, 3, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (73, '2017-03-27', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (74, '2017-04-08', 10, 1, 14, 0, '1');
INSERT INTO public.snooker_campaign VALUES (75, '2017-04-17', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (76, '2017-04-25', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (77, '2017-04-30', 9, 1, 2, 0, '1');
INSERT INTO public.snooker_campaign VALUES (78, '2017-05-08', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (79, '2017-05-15', 9, 1, 3, 0, '1');
INSERT INTO public.snooker_campaign VALUES (80, '2024-08-22', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (81, '2024-08-27', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (82, '2024-09-02', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (83, '2024-09-11', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (84, '2024-09-18', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (85, '2024-09-23', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (86, '2024-10-08', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (87, '2024-10-21', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (88, '2024-10-28', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (89, '2024-11-11', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (90, '2024-12-02', 12, 1, 17, 0, '1');
INSERT INTO public.snooker_campaign VALUES (91, '2024-12-23', 12, 1, 17, 0, '1');


--
-- TOC entry 2483 (class 0 OID 26031)
-- Dependencies: 229
-- Data for Name: snooker_cue; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_cue VALUES (1, 'TW', '白蜡', 1);
INSERT INTO public.snooker_cue VALUES (2, '白沙', '枫木', 1);
INSERT INTO public.snooker_cue VALUES (3, '公杆', '白蜡', 4);


--
-- TOC entry 2485 (class 0 OID 26036)
-- Dependencies: 231
-- Data for Name: snooker_frame; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_frame VALUES (499, 81, 18, 1, 0, 38, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (1, 1, 3, 1, 0, 46, 12, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (2, 1, 3, 1, 0, 59, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (3, 1, 3, 1, 0, 54, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (4, 1, 3, 1, 0, 48, 47, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (5, 1, 3, 1, 0, 35, 53, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (6, 1, 3, 1, 0, 42, 10, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (7, 2, 2, 3, 0, 33, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (8, 2, 2, 3, 0, 31, 74, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (9, 2, 2, 3, 0, 54, 46, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (10, 2, 2, 3, 0, 43, 5, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (11, 2, 2, 3, 0, 41, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (12, 2, 2, 3, 0, 4, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (13, 2, 2, 3, 0, 23, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (14, 3, 6, 1, 0, 42, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (15, 3, 6, 1, 0, 13, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (16, 3, 6, 1, 0, 37, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (17, 3, 6, 1, 0, 12, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (18, 3, 6, 1, 0, 34, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (19, 3, 6, 1, 0, 49, 27, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (20, 3, 6, 1, 0, 50, 30, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (21, 4, 2, 3, 0, 61, 51, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (22, 4, 2, 3, 0, 12, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (23, 4, 2, 3, 0, 28, 66, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (24, 4, 2, 3, 0, 66, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (25, 4, 2, 3, 0, 29, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (26, 4, 2, 3, 0, 48, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (27, 4, 2, 3, 0, 47, 51, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (28, 4, 2, 3, 0, 30, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (29, 5, 2, 3, 0, 60, 28, '1', 36, NULL);
INSERT INTO public.snooker_frame VALUES (30, 5, 2, 3, 0, 14, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (31, 5, 2, 3, 0, 56, 50, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (32, 5, 2, 3, 0, 56, 49, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (33, 5, 2, 3, 0, 38, 60, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (34, 5, 2, 3, 0, 31, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (35, 5, 2, 3, 0, 42, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (36, 5, 2, 3, 0, 49, 33, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (37, 6, 7, 1, 0, 41, 60, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (38, 6, 7, 1, 0, 48, 13, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (39, 6, 7, 1, 0, 2, 43, '0', NULL, '什么都打不进！');
INSERT INTO public.snooker_frame VALUES (40, 6, 7, 1, 0, 49, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (41, 6, 7, 1, 0, 46, 29, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (42, 7, 3, 1, 0, 48, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (43, 7, 3, 1, 0, 42, 13, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (44, 7, 3, 1, 0, 59, 46, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (45, 7, 3, 1, 0, 32, 40, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (46, 7, 3, 1, 0, 42, 44, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (47, 7, 3, 1, 0, 47, 11, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (48, 7, 3, 1, 0, 54, 26, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (49, 8, 7, 1, 0, 45, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (50, 9, 8, 1, 0, 52, 23, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (51, 8, 7, 1, 0, 68, 53, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (52, 9, 8, 1, 0, 47, 13, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (53, 8, 7, 1, 0, 44, 14, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (54, 10, 3, 1, 0, 47, 39, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (55, 10, 3, 1, 0, 49, 26, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (56, 10, 3, 1, 0, 42, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (57, 10, 3, 1, 0, 45, 25, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (58, 10, 3, 1, 0, 39, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (59, 10, 3, 1, 0, 40, 9, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (60, 11, 3, 1, 0, 43, 13, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (61, 11, 3, 1, 0, 49, 8, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (62, 11, 3, 1, 0, 30, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (63, 11, 3, 1, 0, 54, 12, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (64, 11, 3, 1, 0, 58, 46, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (65, 11, 3, 1, 0, 28, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (66, 11, 3, 1, 0, 60, 35, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (67, 12, 2, 1, 0, 53, 40, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (68, 12, 2, 1, 0, 60, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (69, 12, 2, 1, 0, 24, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (70, 12, 2, 1, 0, 49, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (71, 12, 2, 1, 0, 52, 32, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (72, 12, 2, 1, 0, 50, 42, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (73, 12, 2, 1, 0, 56, 49, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (74, 13, 3, 1, 0, 67, 34, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (75, 13, 3, 1, 0, 62, 34, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (76, 13, 3, 1, 0, 56, 11, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (77, 13, 3, 1, 0, 52, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (78, 13, 3, 1, 0, 42, 12, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (79, 14, 9, 1, 0, 20, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (80, 14, 9, 1, 0, 43, 27, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (81, 14, 9, 1, 0, 49, 23, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (82, 14, 9, 1, 0, 46, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (83, 14, 9, 1, 0, 42, 17, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (84, 15, 14, 3, 0, 42, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (85, 15, 14, 3, 0, 47, 23, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (86, 15, 14, 3, 0, 55, 16, '1', 15, '小组赛（2：1）');
INSERT INTO public.snooker_frame VALUES (87, 15, 14, 3, 0, 45, 63, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (88, 15, 14, 3, 0, 56, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (89, 15, 14, 3, 0, 46, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (90, 15, 14, 3, 0, 35, 42, '0', NULL, '1/8决赛（1：3）');
INSERT INTO public.snooker_frame VALUES (91, 16, 3, 1, 0, 46, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (92, 16, 3, 1, 0, 50, 13, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (93, 16, 3, 1, 0, 47, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (94, 16, 3, 1, 0, 42, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (95, 16, 3, 1, 0, 44, 41, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (96, 16, 3, 1, 0, 54, 8, '1', 25, NULL);
INSERT INTO public.snooker_frame VALUES (97, 17, 3, 1, 0, 51, 20, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (98, 17, 3, 1, 0, 55, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (99, 17, 3, 1, 0, 49, 16, '1', 33, NULL);
INSERT INTO public.snooker_frame VALUES (100, 17, 3, 1, 0, 46, 42, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (101, 17, 3, 1, 0, 47, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (102, 17, 3, 1, 0, 59, 9, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (103, 18, 7, 1, 0, 44, 10, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (104, 19, 9, 1, 0, 42, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (105, 18, 7, 1, 0, 46, 4, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (106, 19, 9, 1, 0, 50, 63, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (107, 19, 9, 1, 0, 27, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (108, 19, 9, 1, 0, 23, 51, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (109, 19, 9, 1, 0, 39, 52, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (110, 20, 7, 1, 0, 43, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (111, 20, 7, 1, 0, 38, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (112, 20, 7, 1, 0, 12, 40, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (113, 20, 7, 1, 0, 26, 39, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (114, 20, 7, 1, 0, 29, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (115, 20, 7, 1, 0, 44, 53, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (116, 21, 7, 1, 0, 38, 10, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (117, 21, 7, 1, 0, 44, 11, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (118, 21, 7, 1, 0, 37, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (119, 21, 7, 1, 0, 65, 52, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (120, 21, 7, 1, 0, 53, 46, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (121, 21, 7, 1, 0, 37, 55, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (122, 21, 7, 1, 0, 50, 9, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (123, 22, 7, 1, 0, 39, 40, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (124, 22, 7, 1, 0, 51, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (125, 22, 7, 1, 0, 41, 53, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (126, 22, 7, 1, 0, 54, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (127, 22, 7, 1, 0, 9, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (128, 22, 7, 1, 0, 57, 49, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (129, 23, 3, 1, 0, 36, 50, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (130, 23, 3, 1, 0, 42, 11, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (131, 23, 3, 1, 0, 48, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (132, 23, 3, 1, 0, 56, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (133, 23, 3, 1, 0, 22, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (134, 23, 3, 1, 0, 49, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (135, 24, 6, 1, 0, 31, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (136, 24, 6, 1, 0, 43, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (137, 24, 6, 1, 0, 48, 18, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (138, 24, 6, 1, 0, 56, 40, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (139, 24, 6, 1, 0, 39, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (140, 24, 6, 1, 0, 53, 27, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (141, 25, 11, 3, 0, 50, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (142, 25, 11, 3, 0, 32, 42, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (143, 25, 11, 3, 0, 26, 42, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (144, 25, 11, 3, 0, 60, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (145, 25, 11, 3, 0, 52, 33, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (146, 25, 11, 3, 0, 44, 18, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (147, 25, 11, 3, 0, 16, 32, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (148, 25, 11, 3, 0, 37, 74, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (149, 26, 12, 3, 0, 52, 24, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (150, 26, 12, 3, 0, 23, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (151, 26, 12, 3, 0, 49, 19, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (152, 26, 12, 3, 0, 53, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (153, 26, 12, 3, 0, 26, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (154, 26, 12, 3, 0, 50, 20, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (155, 26, 12, 3, 0, 44, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (156, 26, 12, 3, 0, 47, 11, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (157, 27, 7, 1, 0, 43, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (158, 27, 7, 1, 0, 39, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (159, 27, 7, 1, 0, 20, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (160, 27, 7, 1, 0, 36, 21, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (161, 27, 7, 1, 0, 54, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (162, 27, 7, 1, 0, 50, 41, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (163, 27, 7, 1, 0, 31, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (164, 27, 7, 1, 0, 36, 63, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (165, 27, 7, 1, 0, 54, 28, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (166, 28, 7, 1, 0, 31, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (167, 28, 7, 1, 0, 32, 13, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (168, 28, 7, 1, 0, 56, 7, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (169, 28, 7, 1, 0, 43, 53, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (170, 28, 7, 1, 0, 23, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (171, 28, 7, 1, 0, 49, 37, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (172, 28, 7, 1, 0, 40, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (173, 28, 7, 1, 0, 40, 53, '0', 23, NULL);
INSERT INTO public.snooker_frame VALUES (174, 28, 7, 1, 0, 8, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (175, 29, 3, 1, 0, 42, 22, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (176, 29, 3, 1, 0, 40, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (177, 29, 3, 1, 0, 18, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (178, 29, 3, 1, 0, 43, 28, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (179, 29, 3, 1, 0, 41, 31, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (180, 29, 3, 1, 0, 53, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (181, 30, 2, 3, 0, 37, 63, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (182, 30, 2, 3, 0, 59, 49, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (183, 30, 2, 3, 0, 56, 30, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (184, 30, 2, 3, 0, 12, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (185, 30, 2, 3, 0, 43, 56, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (186, 30, 2, 3, 0, 28, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (187, 30, 2, 3, 0, 43, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (188, 30, 2, 3, 0, 31, 56, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (189, 31, 10, 3, -6, 15, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (190, 31, 10, 3, -6, 53, 9, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (191, 31, 10, 3, -6, 50, 34, '1', NULL, '第一轮（2：1）');
INSERT INTO public.snooker_frame VALUES (192, 31, 10, 3, 3, 21, 55, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (193, 31, 10, 3, 3, 40, 54, '0', 22, '1/4决赛（0：2）');
INSERT INTO public.snooker_frame VALUES (194, 32, 3, 1, 0, 38, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (195, 32, 3, 1, 0, 47, 31, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (196, 32, 3, 1, 0, 34, 35, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (197, 32, 3, 1, 0, 41, 61, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (198, 32, 3, 1, 0, 35, 8, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (199, 32, 3, 1, 0, 47, 28, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (200, 33, 2, 3, 0, 55, 39, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (201, 33, 2, 3, 0, 34, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (202, 33, 2, 3, 0, 50, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (203, 33, 2, 3, 0, 63, 57, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (204, 33, 2, 3, 0, 17, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (205, 33, 2, 3, 0, 38, 48, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (206, 33, 2, 3, 0, 24, 56, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (207, 34, 7, 1, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (208, 34, 7, 1, 0, 10, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (209, 34, 7, 1, 0, 49, 38, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (210, 34, 7, 1, 0, 28, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (211, 34, 7, 1, 0, 39, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (212, 34, 7, 1, 0, 59, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (213, 34, 7, 1, 0, 47, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (214, 35, 7, 1, 0, 29, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (215, 35, 7, 1, 0, 19, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (216, 35, 7, 1, 0, 23, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (217, 35, 7, 1, 0, 29, 15, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (218, 35, 7, 1, 0, 22, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (219, 35, 7, 1, 0, 8, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (220, 35, 7, 1, 0, 40, 17, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (221, 35, 7, 1, 0, 39, 7, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (222, 35, 7, 1, 0, 52, 33, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (223, 36, 3, 1, 0, 31, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (224, 36, 3, 1, 0, 58, 47, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (450, 72, 2, 3, 0, 39, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (225, 36, 3, 1, 0, 46, 4, '1', 26, NULL);
INSERT INTO public.snooker_frame VALUES (226, 36, 3, 1, 0, 47, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (227, 36, 3, 1, 0, 41, 28, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (228, 36, 3, 1, 0, 35, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (229, 37, 2, 3, 0, 46, 50, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (230, 37, 2, 3, 0, 49, 42, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (231, 37, 2, 3, 0, 59, 27, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (232, 37, 2, 3, 0, 56, 63, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (233, 37, 2, 3, 0, 49, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (234, 37, 2, 3, 0, 59, 38, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (235, 37, 2, 3, 0, 64, 45, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (236, 38, 3, 1, 0, 39, 30, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (237, 38, 3, 1, 0, 41, 42, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (238, 38, 3, 1, 0, 56, 24, '1', 31, NULL);
INSERT INTO public.snooker_frame VALUES (239, 38, 3, 1, 0, 24, 34, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (240, 38, 3, 1, 0, 62, 13, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (241, 38, 3, 1, 0, 46, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (242, 39, 3, 1, 0, 44, 55, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (243, 39, 3, 1, 0, 58, 11, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (244, 39, 3, 1, 0, 9, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (245, 39, 3, 1, 0, 49, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (246, 39, 3, 1, 0, 59, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (247, 40, 2, 3, 0, 40, 64, '0', 22, NULL);
INSERT INTO public.snooker_frame VALUES (248, 40, 2, 3, 0, 13, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (249, 40, 2, 3, 0, 52, 19, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (250, 40, 2, 3, 0, 42, 58, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (251, 40, 2, 3, 0, 3, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (252, 40, 2, 3, 0, 36, 21, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (253, 40, 2, 3, 0, 30, 64, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (254, 40, 2, 3, 0, 58, 35, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (255, 40, 2, 3, 0, 37, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (256, 40, 2, 3, 0, 51, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (257, 41, 7, 1, 0, 41, 36, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (258, 41, 7, 1, 0, 32, 45, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (259, 41, 7, 1, 0, 43, 63, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (260, 41, 7, 1, 0, 25, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (261, 41, 7, 1, 0, 56, 44, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (262, 41, 7, 1, 0, 52, 31, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (263, 42, 3, 1, 0, 37, 44, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (264, 42, 3, 1, 0, 43, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (265, 42, 3, 1, 0, 40, 63, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (266, 42, 3, 1, 0, 50, 26, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (267, 42, 3, 1, 0, 15, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (268, 42, 3, 1, 0, 27, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (269, 43, 3, 1, 0, 47, 8, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (270, 43, 3, 1, 0, 41, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (271, 43, 3, 1, 0, 56, 46, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (272, 43, 3, 1, 0, 19, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (273, 43, 3, 1, 0, 45, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (274, 44, 3, 1, 0, 57, 44, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (275, 44, 3, 1, 0, 58, 3, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (276, 44, 3, 1, 0, 47, 20, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (277, 44, 3, 1, 0, 52, 28, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (278, 44, 3, 1, 0, 59, 47, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (279, 45, 3, 1, 0, 53, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (280, 45, 3, 1, 0, 47, 30, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (281, 45, 3, 1, 0, 57, 29, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (282, 45, 3, 1, 0, 47, 13, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (283, 45, 3, 1, 0, 34, 31, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (284, 46, 3, 1, 0, 48, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (285, 46, 3, 1, 0, 23, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (286, 46, 3, 1, 0, 30, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (287, 46, 3, 1, 0, 45, 59, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (288, 46, 3, 1, 0, 42, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (289, 46, 3, 1, 0, 63, 31, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (290, 47, 3, 1, 0, 49, 36, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (291, 47, 3, 1, 0, 31, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (292, 47, 3, 1, 0, 71, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (293, 47, 3, 1, 0, 23, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (294, 47, 3, 1, 0, 67, 46, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (295, 48, 3, 1, 0, 52, 20, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (296, 48, 3, 1, 0, 22, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (297, 48, 3, 1, 0, 53, 20, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (298, 48, 3, 1, 0, 57, 43, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (299, 48, 3, 1, 0, 34, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (300, 49, 3, 3, 0, 55, 32, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (301, 49, 3, 3, 0, 55, 28, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (302, 49, 3, 3, 0, 43, 48, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (303, 49, 3, 3, 0, 14, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (304, 49, 3, 3, 0, 49, 39, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (305, 49, 3, 3, 0, 40, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (306, 49, 3, 3, 0, 48, 30, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (307, 49, 3, 3, 0, 59, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (308, 49, 3, 3, 0, 19, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (309, 49, 3, 3, 0, 54, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (310, 50, 3, 1, 0, 53, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (311, 50, 3, 1, 0, 49, 21, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (312, 50, 3, 1, 0, 45, 36, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (313, 50, 3, 1, 0, 18, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (314, 50, 3, 1, 0, 56, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (315, 50, 3, 1, 0, 59, 52, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (316, 51, 2, 3, 0, 38, 67, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (317, 51, 2, 3, 0, 41, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (318, 51, 2, 3, 0, 45, 35, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (319, 51, 2, 3, 0, 15, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (320, 51, 2, 3, 0, 35, 37, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (321, 51, 2, 3, 0, 48, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (322, 51, 2, 3, 0, 60, 50, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (323, 51, 2, 3, 0, 72, 6, '1', 32, NULL);
INSERT INTO public.snooker_frame VALUES (324, 52, 11, 3, 0, 19, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (325, 52, 11, 3, 0, 19, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (326, 52, 11, 3, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (327, 52, 11, 3, 0, 20, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (328, 52, 11, 3, 0, 52, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (329, 52, 11, 3, 0, 42, 14, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (330, 52, 11, 3, 0, 45, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (331, 52, 11, 3, 0, 52, 49, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (332, 52, 11, 3, 0, 15, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (333, 53, 6, 1, 0, 44, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (334, 53, 6, 1, 0, 12, 38, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (335, 53, 6, 1, 0, 5, 39, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (336, 53, 6, 1, 0, 41, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (337, 53, 6, 1, 0, 48, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (338, 53, 6, 1, 0, 25, 56, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (339, 54, 3, 1, 0, 15, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (340, 54, 3, 1, 0, 26, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (341, 54, 3, 1, 0, 17, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (342, 54, 3, 1, 0, 53, 57, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (343, 54, 3, 1, 0, 74, 36, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (344, 55, 3, 1, 0, 34, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (345, 55, 3, 1, 0, 52, 37, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (346, 55, 3, 1, 0, 54, 44, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (347, 55, 3, 1, 0, 50, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (348, 55, 3, 1, 0, 46, 11, '1', 26, NULL);
INSERT INTO public.snooker_frame VALUES (349, 56, 3, 1, 0, 34, 27, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (350, 56, 3, 1, 0, 51, 31, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (351, 56, 3, 1, 0, 65, 55, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (352, 56, 3, 1, 0, 64, 37, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (353, 56, 3, 1, 0, 53, 16, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (354, 57, 3, 1, 0, 31, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (355, 57, 3, 1, 0, 53, 32, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (356, 57, 3, 1, 0, 63, 32, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (357, 57, 3, 1, 0, 27, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (358, 57, 3, 1, 0, 35, 58, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (359, 58, 3, 1, 0, 37, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (360, 58, 3, 1, 0, 40, 37, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (361, 58, 3, 1, 0, 28, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (362, 58, 3, 1, 0, 51, 46, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (363, 59, 3, 1, 0, 28, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (364, 59, 3, 1, 0, 49, 15, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (365, 59, 3, 1, 0, 20, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (366, 59, 3, 1, 0, 40, 23, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (367, 59, 3, 1, 0, 38, 46, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (368, 59, 3, 1, 0, 42, 58, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (369, 60, 3, 1, 0, 39, 57, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (370, 60, 3, 1, 0, 25, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (371, 60, 3, 1, 0, 16, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (372, 60, 3, 1, 0, 34, 55, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (373, 60, 3, 1, 0, 43, 67, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (374, 61, 2, 1, 0, 26, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (375, 61, 2, 1, 0, 45, 30, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (376, 61, 2, 1, 0, 72, 43, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (377, 61, 2, 1, 0, 44, 39, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (378, 61, 2, 1, 0, 26, 52, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (379, 61, 2, 1, 0, 39, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (380, 61, 2, 1, 0, 44, 55, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (381, 62, 15, 1, 0, 36, 56, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (382, 62, 15, 1, 0, 45, 35, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (383, 62, 15, 1, 0, 48, 26, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (384, 62, 15, 1, 0, 27, 38, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (385, 62, 15, 1, 0, 63, 46, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (386, 62, 15, 1, 0, 41, 52, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (387, 63, 2, 3, 0, 13, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (388, 63, 2, 3, 0, 32, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (389, 63, 2, 3, 0, 25, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (390, 63, 2, 3, 0, 40, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (391, 63, 2, 3, 0, 46, 14, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (392, 63, 2, 3, 0, 3, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (393, 63, 2, 3, 0, 34, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (394, 63, 2, 3, 0, 64, 33, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (395, 63, 2, 3, 0, 62, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (396, 64, 3, 3, 0, 44, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (397, 64, 3, 3, 0, 22, 53, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (398, 64, 3, 3, 0, 50, 34, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (399, 64, 3, 3, 0, 54, 32, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (400, 64, 3, 3, 0, 4, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (401, 64, 3, 3, 0, 47, 24, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (402, 64, 3, 3, 0, 52, 30, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (403, 65, 3, 3, 0, 58, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (404, 65, 3, 3, 0, 17, 34, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (405, 65, 3, 3, 0, 41, 54, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (406, 65, 3, 3, 0, 26, 55, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (407, 65, 3, 3, 0, 72, 46, '1', 27, NULL);
INSERT INTO public.snooker_frame VALUES (408, 65, 3, 3, 0, 60, 51, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (409, 65, 3, 3, 0, 28, 47, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (410, 65, 3, 3, 0, 25, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (411, 66, 2, 3, 0, 22, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (412, 66, 2, 3, 0, 18, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (413, 66, 2, 3, 0, 46, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (414, 66, 2, 3, 0, 24, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (415, 66, 2, 3, 0, 36, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (416, 66, 2, 3, 0, 31, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (417, 66, 2, 3, 0, 49, 18, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (418, 67, 3, 3, 0, 44, 29, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (419, 67, 3, 3, 0, 20, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (420, 67, 3, 3, 0, 48, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (421, 67, 3, 3, 0, 42, 49, '0', 21, NULL);
INSERT INTO public.snooker_frame VALUES (422, 67, 3, 3, 0, 54, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (423, 67, 3, 3, 0, 59, 41, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (424, 68, 3, 3, 0, 54, 46, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (425, 68, 3, 3, 0, 56, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (426, 68, 3, 3, 0, 38, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (427, 68, 3, 3, 0, 53, 32, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (428, 68, 3, 3, 0, 60, 40, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (429, 68, 3, 3, 0, 51, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (430, 69, 3, 1, 0, 56, 45, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (431, 69, 3, 1, 0, 27, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (432, 69, 3, 1, 0, 45, 43, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (433, 69, 3, 1, 0, 51, 55, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (434, 69, 3, 1, 0, 54, 41, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (435, 69, 3, 1, 0, 58, 41, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (436, 70, 3, 1, 0, 52, 14, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (437, 70, 3, 1, 0, 55, 44, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (438, 70, 3, 1, 0, 17, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (439, 70, 3, 1, 0, 55, 28, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (440, 70, 3, 1, 0, 53, 25, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (441, 70, 3, 1, 0, 49, 20, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (442, 71, 3, 1, 0, 53, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (443, 71, 3, 1, 0, 38, 49, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (444, 71, 3, 1, 0, 55, 52, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (445, 71, 3, 1, 0, 36, 47, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (446, 71, 3, 1, 0, 45, 15, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (447, 71, 3, 1, 0, 56, 33, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (448, 72, 2, 3, 0, 48, 39, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (449, 72, 2, 3, 0, 51, 23, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (451, 72, 2, 3, 0, 56, 55, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (452, 72, 2, 3, 0, 42, 25, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (453, 73, 3, 1, 0, 50, 20, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (454, 73, 3, 1, 0, 57, 40, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (455, 73, 3, 1, 0, 53, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (456, 73, 3, 1, 0, 47, 11, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (457, 73, 3, 1, 0, 32, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (458, 74, 14, 1, 0, 73, 19, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (459, 74, 14, 1, 0, 54, 42, '1', 14, '1/8决赛（2：0）');
INSERT INTO public.snooker_frame VALUES (460, 74, 14, 1, 0, 41, 54, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (461, 74, 14, 1, 0, 21, 51, '0', NULL, '1/4决赛（0：2）');
INSERT INTO public.snooker_frame VALUES (462, 75, 3, 1, 0, 57, 30, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (463, 75, 3, 1, 0, 63, 61, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (464, 75, 3, 1, 0, 52, 17, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (465, 75, 3, 1, 0, 50, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (466, 75, 3, 1, 0, 49, 60, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (467, 76, 3, 1, 0, 47, 21, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (468, 76, 3, 1, 0, 36, 32, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (469, 76, 3, 1, 0, 30, 47, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (470, 76, 3, 1, 0, 69, 57, '1', 27, NULL);
INSERT INTO public.snooker_frame VALUES (471, 76, 3, 1, 0, 56, 17, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (472, 76, 3, 1, 0, 15, 70, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (473, 77, 2, 1, 0, 36, 67, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (474, 77, 2, 1, 0, 56, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (475, 77, 2, 1, 0, 23, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (476, 77, 2, 1, 0, 53, 61, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (477, 77, 2, 1, 0, 26, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (478, 77, 2, 1, 0, 44, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (479, 77, 2, 1, 0, 21, 58, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (480, 77, 2, 1, 0, 25, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (481, 77, 2, 1, 0, 37, 35, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (482, 78, 3, 1, 0, 34, 36, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (483, 78, 3, 1, 0, 60, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (484, 78, 3, 1, 0, 42, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (485, 78, 3, 1, 0, 51, 59, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (486, 78, 3, 1, 0, 61, 49, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (487, 78, 3, 1, 0, 54, 38, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (488, 79, 3, 1, 0, 48, 33, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (489, 79, 3, 1, 0, 47, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (490, 79, 3, 1, 0, 46, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (491, 79, 3, 1, 0, 25, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (492, 79, 3, 1, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (493, 79, 3, 1, 0, 42, 24, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (494, 80, 17, 1, 0, 50, 25, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (495, 80, 17, 1, 0, 21, 42, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (496, 80, 17, 1, 0, 23, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (497, 81, 17, 1, 0, 47, 60, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (498, 81, 17, 1, 0, 55, 17, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (501, 81, 17, 1, 0, 53, 23, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (502, 81, 17, 1, 0, 28, 47, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (503, 81, 17, 1, 0, 54, 22, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (507, 81, 17, 1, 0, 44, 53, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (508, 81, 17, 1, 0, 16, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (510, 82, 17, 1, 0, 49, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (511, 82, 17, 1, 0, 14, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (512, 82, 17, 1, 0, 56, 37, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (509, 82, 17, 1, 0, 44, 33, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (500, 81, 18, 1, 0, 50, 30, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (504, 81, 19, 1, 0, 24, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (505, 81, 2, 1, 0, 31, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (506, 81, 2, 1, 0, 52, 21, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (513, 82, 17, 1, 0, 41, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (514, 82, 18, 1, 0, 40, 13, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (515, 82, 17, 1, 0, 21, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (516, 82, 17, 1, 0, 53, 31, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (517, 82, 17, 1, 0, 12, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (518, 83, 17, 1, 0, 38, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (519, 83, 17, 1, 0, 18, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (523, 83, 20, 1, 0, 61, 36, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (524, 83, 17, 1, 0, 55, 31, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (525, 83, 21, 1, 0, 55, 7, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (526, 83, 17, 1, 0, 52, 27, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (527, 83, 17, 1, 0, 37, 46, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (528, 84, 17, 1, 0, 43, 25, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (529, 84, 17, 1, 0, 62, 13, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (530, 84, 17, 1, 0, 16, 56, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (531, 84, 17, 1, 0, 48, 39, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (532, 84, 17, 1, 0, 17, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (533, 84, 17, 1, 0, 35, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (534, 85, 17, 1, 0, 33, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (536, 85, 18, 1, 0, 49, 12, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (537, 85, 19, 1, 0, 60, 41, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (538, 85, 18, 1, 0, 57, 29, '1', 29, NULL);
INSERT INTO public.snooker_frame VALUES (539, 85, 18, 1, 0, 55, 34, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (540, 85, 18, 1, 0, 47, 18, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (541, 85, 17, 1, 0, 39, 40, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (542, 85, 18, 1, 0, 43, 24, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (543, 86, 17, 1, 0, 62, 24, '1', 39, NULL);
INSERT INTO public.snooker_frame VALUES (544, 86, 17, 1, 0, 58, 27, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (545, 86, 17, 1, 0, 47, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (546, 86, 17, 1, 0, 46, 53, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (547, 86, 17, 1, 0, 55, 47, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (548, 86, 17, 1, 0, 37, 46, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (549, 86, 19, 1, 0, 50, 15, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (550, 86, 19, 1, 0, 45, 42, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (551, 87, 17, 1, 0, 49, 19, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (552, 87, 17, 1, 0, 55, 15, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (553, 87, 17, 1, 0, 54, 35, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (554, 87, 17, 1, 0, 30, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (555, 87, 17, 1, 0, 52, 15, '1', 33, NULL);
INSERT INTO public.snooker_frame VALUES (556, 87, 17, 1, 0, 14, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (557, 87, 17, 1, 0, 36, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (558, 87, 17, 1, 0, 35, 32, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (559, 87, 17, 1, 0, 62, 31, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (560, 87, 17, 1, 0, 33, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (561, 87, 17, 1, 0, 49, 48, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (562, 88, 17, 1, 0, 59, 45, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (563, 88, 17, 1, 0, 45, 10, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (564, 89, 17, 1, 0, 56, 29, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (565, 89, 17, 1, 0, 25, 39, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (566, 89, 18, 1, 0, 31, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (567, 89, 18, 1, 0, 55, 29, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (568, 89, 18, 1, 0, 42, 5, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (569, 89, 17, 1, 0, 52, 17, '1', 25, NULL);
INSERT INTO public.snooker_frame VALUES (570, 89, 17, 1, 0, 69, 23, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (571, 90, 17, 1, 0, 52, 15, '1', 32, NULL);
INSERT INTO public.snooker_frame VALUES (572, 90, 17, 1, 0, 54, 61, '0', 22, NULL);
INSERT INTO public.snooker_frame VALUES (573, 90, 17, 1, 0, 23, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (574, 91, 17, 1, 0, 44, 51, '0', 23, NULL);
INSERT INTO public.snooker_frame VALUES (576, 91, 17, 1, 0, 61, 22, '1', 21, NULL);


--
-- TOC entry 2487 (class 0 OID 26041)
-- Dependencies: 233
-- Data for Name: snooker_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_group VALUES (1, '系统', '0');
INSERT INTO public.snooker_group VALUES (2, '上研', '1');
INSERT INTO public.snooker_group VALUES (3, '集中营', '1');
INSERT INTO public.snooker_group VALUES (4, '曹杨群', '1');
INSERT INTO public.snooker_group VALUES (5, '比赛', '1');
INSERT INTO public.snooker_group VALUES (6, '路人合集', '1');
INSERT INTO public.snooker_group VALUES (7, '工银大厦', '1');


--
-- TOC entry 2489 (class 0 OID 26046)
-- Dependencies: 235
-- Data for Name: snooker_gym; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_gym VALUES (1, '新新', '兰溪路');
INSERT INTO public.snooker_gym VALUES (2, '利都', '鞍山路');
INSERT INTO public.snooker_gym VALUES (3, '新新', '凉城路');
INSERT INTO public.snooker_gym VALUES (4, '威尔士', '东川路');
INSERT INTO public.snooker_gym VALUES (5, '丁俊晖', '大连路');
INSERT INTO public.snooker_gym VALUES (6, '健怡', '竹韵路');
INSERT INTO public.snooker_gym VALUES (7, '比乐', '长寿路');
INSERT INTO public.snooker_gym VALUES (8, '新新', '瑞金南路');
INSERT INTO public.snooker_gym VALUES (9, '星伟', '愚园路');
INSERT INTO public.snooker_gym VALUES (10, '潘晓婷', '龙阳路');
INSERT INTO public.snooker_gym VALUES (11, '黄工体', '外马路');
INSERT INTO public.snooker_gym VALUES (12, '工银大厦', '银城路');


--
-- TOC entry 2491 (class 0 OID 26051)
-- Dependencies: 237
-- Data for Name: snooker_player; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_player VALUES (1, 'GPLite', 1);
INSERT INTO public.snooker_player VALUES (2, 'Just!N', 2);
INSERT INTO public.snooker_player VALUES (3, '平步青云', 2);
INSERT INTO public.snooker_player VALUES (4, '球房', 1);
INSERT INTO public.snooker_player VALUES (5, 'Sheva', 2);
INSERT INTO public.snooker_player VALUES (6, '乖乖', 4);
INSERT INTO public.snooker_player VALUES (7, '偷偷', 4);
INSERT INTO public.snooker_player VALUES (8, '飞飞', 4);
INSERT INTO public.snooker_player VALUES (9, 'chuyimin', 4);
INSERT INTO public.snooker_player VALUES (10, '比赛（让分）', 5);
INSERT INTO public.snooker_player VALUES (11, 'Mr.小R', 3);
INSERT INTO public.snooker_player VALUES (12, '月如', 3);
INSERT INTO public.snooker_player VALUES (13, '东', 3);
INSERT INTO public.snooker_player VALUES (14, '比赛（常规）', 5);
INSERT INTO public.snooker_player VALUES (15, '钱胖', 3);
INSERT INTO public.snooker_player VALUES (16, '长发男', 6);
INSERT INTO public.snooker_player VALUES (17, '黄老师', 7);
INSERT INTO public.snooker_player VALUES (18, '陈师傅', 7);
INSERT INTO public.snooker_player VALUES (19, '陈工', 7);
INSERT INTO public.snooker_player VALUES (20, '王炜', 7);
INSERT INTO public.snooker_player VALUES (21, '苏师傅', 7);


--
-- TOC entry 2516 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2517 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2518 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- TOC entry 2519 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2520 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 2521 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2522 (class 0 OID 0)
-- Dependencies: 210
-- Name: coding_spider_product_storage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coding_spider_product_storage_id_seq', 108921, true);


--
-- TOC entry 2523 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 9, true);


--
-- TOC entry 2524 (class 0 OID 0)
-- Dependencies: 214
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- TOC entry 2525 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- TOC entry 2526 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_cg_mp700_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.game_cg_mp700_detail_id_seq', 84985, true);


--
-- TOC entry 2527 (class 0 OID 0)
-- Dependencies: 222
-- Name: game_cg_mp700_produce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.game_cg_mp700_produce_id_seq', 7261, true);


--
-- TOC entry 2528 (class 0 OID 0)
-- Dependencies: 228
-- Name: snooker_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_campaign_id_seq', 91, true);


--
-- TOC entry 2529 (class 0 OID 0)
-- Dependencies: 230
-- Name: snooker_cue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_cue_id_seq', 3, true);


--
-- TOC entry 2530 (class 0 OID 0)
-- Dependencies: 232
-- Name: snooker_frame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_frame_id_seq', 576, true);


--
-- TOC entry 2531 (class 0 OID 0)
-- Dependencies: 234
-- Name: snooker_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_group_id_seq', 7, true);


--
-- TOC entry 2532 (class 0 OID 0)
-- Dependencies: 236
-- Name: snooker_gym_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_gym_id_seq', 12, true);


--
-- TOC entry 2533 (class 0 OID 0)
-- Dependencies: 238
-- Name: snooker_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_player_id_seq', 21, true);


--
-- TOC entry 2243 (class 2606 OID 26074)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2248 (class 2606 OID 26076)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2251 (class 2606 OID 26078)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 26080)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 26082)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2256 (class 2606 OID 26084)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 26086)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 26088)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2258 (class 2606 OID 26090)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 26092)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 26094)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 26096)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2296 (class 2606 OID 26098)
-- Name: game_cg_mp700_prepare cg_mp700_prepare_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_prepare
    ADD CONSTRAINT cg_mp700_prepare_pkey PRIMARY KEY (id);


--
-- TOC entry 2275 (class 2606 OID 26100)
-- Name: coding_spider_emall_api coding_spider_emall_api_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coding_spider_emall_api
    ADD CONSTRAINT coding_spider_emall_api_pkey PRIMARY KEY (id);


--
-- TOC entry 2277 (class 2606 OID 26102)
-- Name: coding_spider_product_storage coding_spider_product_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coding_spider_product_storage
    ADD CONSTRAINT coding_spider_product_storage_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 26104)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 26106)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2285 (class 2606 OID 26108)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 26110)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 26112)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2293 (class 2606 OID 26114)
-- Name: game_cg_mp700_detail game_cg_mp700_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_detail
    ADD CONSTRAINT game_cg_mp700_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 26116)
-- Name: game_cg_mp700_produce game_cg_mp700_produce_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_produce
    ADD CONSTRAINT game_cg_mp700_produce_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 26118)
-- Name: game_cg_mp700_status game_cg_mp700_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_status
    ADD CONSTRAINT game_cg_mp700_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 26120)
-- Name: home_dingding_message home_dingding_message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_dingding_message
    ADD CONSTRAINT home_dingding_message_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 26122)
-- Name: home_message_level home_message_level_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_message_level
    ADD CONSTRAINT home_message_level_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 26124)
-- Name: snooker_campaign snooker_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_campaign
    ADD CONSTRAINT snooker_campaign_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 26126)
-- Name: snooker_cue snooker_cue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_cue
    ADD CONSTRAINT snooker_cue_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 26128)
-- Name: snooker_frame snooker_frame_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_frame
    ADD CONSTRAINT snooker_frame_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 26130)
-- Name: snooker_group snooker_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_group
    ADD CONSTRAINT snooker_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 26132)
-- Name: snooker_gym snooker_gym_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_gym
    ADD CONSTRAINT snooker_gym_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 26134)
-- Name: snooker_player snooker_player_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_player
    ADD CONSTRAINT snooker_player_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 26136)
-- Name: home_wechat_message wechat_agent_message_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.home_wechat_message
    ADD CONSTRAINT wechat_agent_message_info_pkey PRIMARY KEY (id);


--
-- TOC entry 2241 (class 1259 OID 26137)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2246 (class 1259 OID 26138)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2249 (class 1259 OID 26139)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2252 (class 1259 OID 26140)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2262 (class 1259 OID 26141)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2265 (class 1259 OID 26142)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2268 (class 1259 OID 26143)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2271 (class 1259 OID 26144)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2259 (class 1259 OID 26145)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2278 (class 1259 OID 26146)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2281 (class 1259 OID 26147)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2288 (class 1259 OID 26148)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2291 (class 1259 OID 26149)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2294 (class 1259 OID 26150)
-- Name: game_cg_mp700_detail_produce_id_8285fb6d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX game_cg_mp700_detail_produce_id_8285fb6d ON public.game_cg_mp700_detail USING btree (produce_id);


--
-- TOC entry 2319 (class 2606 OID 26151)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2320 (class 2606 OID 26156)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2321 (class 2606 OID 26161)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2322 (class 2606 OID 26166)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2323 (class 2606 OID 26171)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2324 (class 2606 OID 26176)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2325 (class 2606 OID 26181)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2326 (class 2606 OID 26186)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2327 (class 2606 OID 26191)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2328 (class 2606 OID 26196)
-- Name: game_cg_mp700_detail game_cg_mp700_detail_produce_id_8285fb6d_fk_game_cg_m; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.game_cg_mp700_detail
    ADD CONSTRAINT game_cg_mp700_detail_produce_id_8285fb6d_fk_game_cg_m FOREIGN KEY (produce_id) REFERENCES public.game_cg_mp700_produce(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2025-03-12 01:24:33

--
-- PostgreSQL database dump complete
--

