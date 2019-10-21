--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 12.0

-- Started on 2019-10-21 19:58:45

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
-- TOC entry 4 (class 2615 OID 24752)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 24753)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 24756)
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
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 198 (class 1259 OID 24758)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 24761)
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
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 200 (class 1259 OID 24763)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 24766)
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
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 202 (class 1259 OID 24768)
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
-- TOC entry 203 (class 1259 OID 24774)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 24777)
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
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 205 (class 1259 OID 24779)
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
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 206 (class 1259 OID 24781)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 24784)
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
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 208 (class 1259 OID 24786)
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
-- TOC entry 209 (class 1259 OID 24793)
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
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 210 (class 1259 OID 24795)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 24798)
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
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 212 (class 1259 OID 24800)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 24806)
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
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 214 (class 1259 OID 24808)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 24814)
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
-- TOC entry 216 (class 1259 OID 24817)
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
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 216
-- Name: snooker_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_campaign_id_seq OWNED BY public.snooker_campaign.id;


--
-- TOC entry 217 (class 1259 OID 24819)
-- Name: snooker_cue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_cue (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    material character varying(45) NOT NULL,
    owner_id integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 24822)
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
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 218
-- Name: snooker_cue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_cue_id_seq OWNED BY public.snooker_cue.id;


--
-- TOC entry 219 (class 1259 OID 24824)
-- Name: snooker_frame; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_frame (
    id integer NOT NULL,
    campaign_id integer NOT NULL,
    cue_id integer NOT NULL,
    let_points integer NOT NULL,
    get_points integer NOT NULL,
    oppo_points integer NOT NULL,
    is_win character varying(1) NOT NULL,
    max_break integer,
    memo character varying(200)
);


--
-- TOC entry 220 (class 1259 OID 24827)
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
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 220
-- Name: snooker_frame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_frame_id_seq OWNED BY public.snooker_frame.id;


--
-- TOC entry 221 (class 1259 OID 24829)
-- Name: snooker_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_group (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    is_show character varying(1) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 24832)
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
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 222
-- Name: snooker_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_group_id_seq OWNED BY public.snooker_group.id;


--
-- TOC entry 223 (class 1259 OID 24834)
-- Name: snooker_gym; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_gym (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    road character varying(45) NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 24837)
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
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 224
-- Name: snooker_gym_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_gym_id_seq OWNED BY public.snooker_gym.id;


--
-- TOC entry 225 (class 1259 OID 24839)
-- Name: snooker_player; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.snooker_player (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 24842)
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
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 226
-- Name: snooker_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.snooker_player_id_seq OWNED BY public.snooker_player.id;


--
-- TOC entry 2762 (class 2604 OID 24844)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 24845)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 24846)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 24847)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 24848)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 24849)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 24850)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 24851)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 24852)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 24853)
-- Name: snooker_campaign id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_campaign ALTER COLUMN id SET DEFAULT nextval('public.snooker_campaign_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 24854)
-- Name: snooker_cue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_cue ALTER COLUMN id SET DEFAULT nextval('public.snooker_cue_id_seq'::regclass);


--
-- TOC entry 2774 (class 2604 OID 24855)
-- Name: snooker_frame id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_frame ALTER COLUMN id SET DEFAULT nextval('public.snooker_frame_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 24856)
-- Name: snooker_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_group ALTER COLUMN id SET DEFAULT nextval('public.snooker_group_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 24857)
-- Name: snooker_gym id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_gym ALTER COLUMN id SET DEFAULT nextval('public.snooker_gym_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 24858)
-- Name: snooker_player id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_player ALTER COLUMN id SET DEFAULT nextval('public.snooker_player_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 24753)
-- Dependencies: 196
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2969 (class 0 OID 24758)
-- Dependencies: 198
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2971 (class 0 OID 24763)
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


--
-- TOC entry 2973 (class 0 OID 24768)
-- Dependencies: 202
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.auth_user VALUES (1, 'pbkdf2_sha256$150000$3FLh8ycBcZ8O$fJwv0SsAZtPmueQxToSNirhXltVYRu0vi9QStsEjUH8=', '2019-10-21 15:56:02.608254+08', true, 'pig0301', '', '', 'pig860301@msn.com', true, true, '2018-10-16 13:44:19.988916+08');


--
-- TOC entry 2974 (class 0 OID 24774)
-- Dependencies: 203
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2977 (class 0 OID 24781)
-- Dependencies: 206
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2979 (class 0 OID 24786)
-- Dependencies: 208
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.django_admin_log VALUES (1, '2019-06-21 15:01:28.499409+08', '6', '黄浦工体', 1, '[{"added": {}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (2, '2019-06-21 15:02:12.747545+08', '11', '黄浦工体(外马路)', 1, '[{"added": {}}]', 11, 1);
INSERT INTO public.django_admin_log VALUES (3, '2019-06-21 15:03:03.257061+08', '6', '路人合集', 2, '[{"changed": {"fields": ["name"]}}]', 10, 1);
INSERT INTO public.django_admin_log VALUES (4, '2019-06-21 15:03:27.600342+08', '16', '长发男', 1, '[{"added": {}}]', 12, 1);


--
-- TOC entry 2981 (class 0 OID 24795)
-- Dependencies: 210
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


--
-- TOC entry 2983 (class 0 OID 24800)
-- Dependencies: 212
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


--
-- TOC entry 2985 (class 0 OID 24808)
-- Dependencies: 214
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


--
-- TOC entry 2986 (class 0 OID 24814)
-- Dependencies: 215
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


--
-- TOC entry 2988 (class 0 OID 24819)
-- Dependencies: 217
-- Data for Name: snooker_cue; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_cue VALUES (1, 'TW', '白蜡', 1);
INSERT INTO public.snooker_cue VALUES (2, '白沙', '枫木', 1);
INSERT INTO public.snooker_cue VALUES (3, '公杆', '白蜡', 4);


--
-- TOC entry 2990 (class 0 OID 24824)
-- Dependencies: 219
-- Data for Name: snooker_frame; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_frame VALUES (1, 1, 1, 0, 46, 12, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (2, 1, 1, 0, 59, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (3, 1, 1, 0, 54, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (4, 1, 1, 0, 48, 47, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (5, 1, 1, 0, 35, 53, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (6, 1, 1, 0, 42, 10, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (7, 2, 3, 0, 33, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (8, 2, 3, 0, 31, 74, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (9, 2, 3, 0, 54, 46, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (10, 2, 3, 0, 43, 5, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (11, 2, 3, 0, 41, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (12, 2, 3, 0, 4, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (13, 2, 3, 0, 23, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (14, 3, 1, 0, 42, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (15, 3, 1, 0, 13, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (16, 3, 1, 0, 37, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (17, 3, 1, 0, 12, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (18, 3, 1, 0, 34, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (19, 3, 1, 0, 49, 27, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (20, 3, 1, 0, 50, 30, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (21, 4, 3, 0, 61, 51, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (22, 4, 3, 0, 12, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (23, 4, 3, 0, 28, 66, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (24, 4, 3, 0, 66, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (25, 4, 3, 0, 29, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (26, 4, 3, 0, 48, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (27, 4, 3, 0, 47, 51, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (28, 4, 3, 0, 30, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (29, 5, 3, 0, 60, 28, '1', 36, NULL);
INSERT INTO public.snooker_frame VALUES (30, 5, 3, 0, 14, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (31, 5, 3, 0, 56, 50, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (32, 5, 3, 0, 56, 49, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (33, 5, 3, 0, 38, 60, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (34, 5, 3, 0, 31, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (35, 5, 3, 0, 42, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (36, 5, 3, 0, 49, 33, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (37, 6, 1, 0, 41, 60, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (38, 6, 1, 0, 48, 13, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (39, 6, 1, 0, 2, 43, '0', NULL, '什么都打不进！');
INSERT INTO public.snooker_frame VALUES (40, 6, 1, 0, 49, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (41, 6, 1, 0, 46, 29, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (42, 7, 1, 0, 48, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (43, 7, 1, 0, 42, 13, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (44, 7, 1, 0, 59, 46, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (45, 7, 1, 0, 32, 40, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (46, 7, 1, 0, 42, 44, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (47, 7, 1, 0, 47, 11, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (48, 7, 1, 0, 54, 26, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (49, 8, 1, 0, 45, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (50, 9, 1, 0, 52, 23, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (51, 8, 1, 0, 68, 53, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (52, 9, 1, 0, 47, 13, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (53, 8, 1, 0, 44, 14, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (54, 10, 1, 0, 47, 39, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (55, 10, 1, 0, 49, 26, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (56, 10, 1, 0, 42, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (57, 10, 1, 0, 45, 25, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (58, 10, 1, 0, 39, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (59, 10, 1, 0, 40, 9, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (60, 11, 1, 0, 43, 13, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (61, 11, 1, 0, 49, 8, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (62, 11, 1, 0, 30, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (63, 11, 1, 0, 54, 12, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (64, 11, 1, 0, 58, 46, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (65, 11, 1, 0, 28, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (66, 11, 1, 0, 60, 35, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (67, 12, 1, 0, 53, 40, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (68, 12, 1, 0, 60, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (69, 12, 1, 0, 24, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (70, 12, 1, 0, 49, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (71, 12, 1, 0, 52, 32, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (72, 12, 1, 0, 50, 42, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (73, 12, 1, 0, 56, 49, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (74, 13, 1, 0, 67, 34, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (75, 13, 1, 0, 62, 34, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (76, 13, 1, 0, 56, 11, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (77, 13, 1, 0, 52, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (78, 13, 1, 0, 42, 12, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (79, 14, 1, 0, 20, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (80, 14, 1, 0, 43, 27, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (81, 14, 1, 0, 49, 23, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (82, 14, 1, 0, 46, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (83, 14, 1, 0, 42, 17, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (84, 15, 3, 0, 42, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (85, 15, 3, 0, 47, 23, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (86, 15, 3, 0, 55, 16, '1', 15, '小组赛（2：1）');
INSERT INTO public.snooker_frame VALUES (87, 15, 3, 0, 45, 63, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (88, 15, 3, 0, 56, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (89, 15, 3, 0, 46, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (90, 15, 3, 0, 35, 42, '0', NULL, '1/8决赛（1：3）');
INSERT INTO public.snooker_frame VALUES (91, 16, 1, 0, 46, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (92, 16, 1, 0, 50, 13, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (93, 16, 1, 0, 47, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (94, 16, 1, 0, 42, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (95, 16, 1, 0, 44, 41, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (96, 16, 1, 0, 54, 8, '1', 25, NULL);
INSERT INTO public.snooker_frame VALUES (97, 17, 1, 0, 51, 20, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (98, 17, 1, 0, 55, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (99, 17, 1, 0, 49, 16, '1', 33, NULL);
INSERT INTO public.snooker_frame VALUES (100, 17, 1, 0, 46, 42, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (101, 17, 1, 0, 47, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (102, 17, 1, 0, 59, 9, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (103, 18, 1, 0, 44, 10, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (104, 19, 1, 0, 42, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (105, 18, 1, 0, 46, 4, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (106, 19, 1, 0, 50, 63, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (107, 19, 1, 0, 27, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (108, 19, 1, 0, 23, 51, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (109, 19, 1, 0, 39, 52, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (110, 20, 1, 0, 43, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (111, 20, 1, 0, 38, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (112, 20, 1, 0, 12, 40, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (113, 20, 1, 0, 26, 39, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (114, 20, 1, 0, 29, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (115, 20, 1, 0, 44, 53, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (116, 21, 1, 0, 38, 10, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (117, 21, 1, 0, 44, 11, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (118, 21, 1, 0, 37, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (119, 21, 1, 0, 65, 52, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (120, 21, 1, 0, 53, 46, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (121, 21, 1, 0, 37, 55, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (122, 21, 1, 0, 50, 9, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (123, 22, 1, 0, 39, 40, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (124, 22, 1, 0, 51, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (125, 22, 1, 0, 41, 53, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (126, 22, 1, 0, 54, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (127, 22, 1, 0, 9, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (128, 22, 1, 0, 57, 49, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (129, 23, 1, 0, 36, 50, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (130, 23, 1, 0, 42, 11, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (131, 23, 1, 0, 48, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (132, 23, 1, 0, 56, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (133, 23, 1, 0, 22, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (134, 23, 1, 0, 49, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (135, 24, 1, 0, 31, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (136, 24, 1, 0, 43, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (137, 24, 1, 0, 48, 18, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (138, 24, 1, 0, 56, 40, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (139, 24, 1, 0, 39, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (140, 24, 1, 0, 53, 27, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (141, 25, 3, 0, 50, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (142, 25, 3, 0, 32, 42, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (143, 25, 3, 0, 26, 42, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (144, 25, 3, 0, 60, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (145, 25, 3, 0, 52, 33, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (146, 25, 3, 0, 44, 18, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (147, 25, 3, 0, 16, 32, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (148, 25, 3, 0, 37, 74, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (149, 26, 3, 0, 52, 24, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (150, 26, 3, 0, 23, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (151, 26, 3, 0, 49, 19, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (152, 26, 3, 0, 53, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (153, 26, 3, 0, 26, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (154, 26, 3, 0, 50, 20, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (155, 26, 3, 0, 44, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (156, 26, 3, 0, 47, 11, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (157, 27, 1, 0, 43, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (158, 27, 1, 0, 39, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (159, 27, 1, 0, 20, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (160, 27, 1, 0, 36, 21, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (161, 27, 1, 0, 54, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (162, 27, 1, 0, 50, 41, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (163, 27, 1, 0, 31, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (164, 27, 1, 0, 36, 63, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (165, 27, 1, 0, 54, 28, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (166, 28, 1, 0, 31, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (167, 28, 1, 0, 32, 13, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (168, 28, 1, 0, 56, 7, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (169, 28, 1, 0, 43, 53, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (170, 28, 1, 0, 23, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (171, 28, 1, 0, 49, 37, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (172, 28, 1, 0, 40, 59, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (173, 28, 1, 0, 40, 53, '0', 23, NULL);
INSERT INTO public.snooker_frame VALUES (174, 28, 1, 0, 8, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (175, 29, 1, 0, 42, 22, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (176, 29, 1, 0, 40, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (177, 29, 1, 0, 18, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (178, 29, 1, 0, 43, 28, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (179, 29, 1, 0, 41, 31, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (180, 29, 1, 0, 53, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (181, 30, 3, 0, 37, 63, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (182, 30, 3, 0, 59, 49, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (183, 30, 3, 0, 56, 30, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (184, 30, 3, 0, 12, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (185, 30, 3, 0, 43, 56, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (186, 30, 3, 0, 28, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (187, 30, 3, 0, 43, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (188, 30, 3, 0, 31, 56, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (189, 31, 3, -6, 15, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (190, 31, 3, -6, 53, 9, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (191, 31, 3, -6, 50, 34, '1', NULL, '第一轮（2：1）');
INSERT INTO public.snooker_frame VALUES (192, 31, 3, 3, 21, 55, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (193, 31, 3, 3, 40, 54, '0', 22, '1/4决赛（0：2）');
INSERT INTO public.snooker_frame VALUES (194, 32, 1, 0, 38, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (195, 32, 1, 0, 47, 31, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (196, 32, 1, 0, 34, 35, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (197, 32, 1, 0, 41, 61, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (198, 32, 1, 0, 35, 8, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (199, 32, 1, 0, 47, 28, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (200, 33, 3, 0, 55, 39, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (201, 33, 3, 0, 34, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (202, 33, 3, 0, 50, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (203, 33, 3, 0, 63, 57, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (204, 33, 3, 0, 17, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (205, 33, 3, 0, 38, 48, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (206, 33, 3, 0, 24, 56, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (207, 34, 1, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (208, 34, 1, 0, 10, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (209, 34, 1, 0, 49, 38, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (210, 34, 1, 0, 28, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (211, 34, 1, 0, 39, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (212, 34, 1, 0, 59, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (213, 34, 1, 0, 47, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (214, 35, 1, 0, 29, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (215, 35, 1, 0, 19, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (216, 35, 1, 0, 23, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (217, 35, 1, 0, 29, 15, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (218, 35, 1, 0, 22, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (219, 35, 1, 0, 8, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (220, 35, 1, 0, 40, 17, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (221, 35, 1, 0, 39, 7, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (222, 35, 1, 0, 52, 33, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (223, 36, 1, 0, 31, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (224, 36, 1, 0, 58, 47, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (225, 36, 1, 0, 46, 4, '1', 26, NULL);
INSERT INTO public.snooker_frame VALUES (226, 36, 1, 0, 47, 39, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (227, 36, 1, 0, 41, 28, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (228, 36, 1, 0, 35, 50, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (229, 37, 3, 0, 46, 50, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (230, 37, 3, 0, 49, 42, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (231, 37, 3, 0, 59, 27, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (232, 37, 3, 0, 56, 63, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (233, 37, 3, 0, 49, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (234, 37, 3, 0, 59, 38, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (235, 37, 3, 0, 64, 45, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (236, 38, 1, 0, 39, 30, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (237, 38, 1, 0, 41, 42, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (238, 38, 1, 0, 56, 24, '1', 31, NULL);
INSERT INTO public.snooker_frame VALUES (239, 38, 1, 0, 24, 34, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (240, 38, 1, 0, 62, 13, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (241, 38, 1, 0, 46, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (242, 39, 1, 0, 44, 55, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (243, 39, 1, 0, 58, 11, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (244, 39, 1, 0, 9, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (245, 39, 1, 0, 49, 60, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (246, 39, 1, 0, 59, 45, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (247, 40, 3, 0, 40, 64, '0', 22, NULL);
INSERT INTO public.snooker_frame VALUES (248, 40, 3, 0, 13, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (249, 40, 3, 0, 52, 19, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (250, 40, 3, 0, 42, 58, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (251, 40, 3, 0, 3, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (252, 40, 3, 0, 36, 21, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (253, 40, 3, 0, 30, 64, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (254, 40, 3, 0, 58, 35, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (255, 40, 3, 0, 37, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (256, 40, 3, 0, 51, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (257, 41, 1, 0, 41, 36, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (258, 41, 1, 0, 32, 45, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (259, 41, 1, 0, 43, 63, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (260, 41, 1, 0, 25, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (261, 41, 1, 0, 56, 44, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (262, 41, 1, 0, 52, 31, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (263, 42, 1, 0, 37, 44, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (264, 42, 1, 0, 43, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (265, 42, 1, 0, 40, 63, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (266, 42, 1, 0, 50, 26, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (267, 42, 1, 0, 15, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (268, 42, 1, 0, 27, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (269, 43, 1, 0, 47, 8, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (270, 43, 1, 0, 41, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (271, 43, 1, 0, 56, 46, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (272, 43, 1, 0, 19, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (273, 43, 1, 0, 45, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (274, 44, 1, 0, 57, 44, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (275, 44, 1, 0, 58, 3, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (276, 44, 1, 0, 47, 20, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (277, 44, 1, 0, 52, 28, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (278, 44, 1, 0, 59, 47, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (279, 45, 1, 0, 53, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (280, 45, 1, 0, 47, 30, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (281, 45, 1, 0, 57, 29, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (282, 45, 1, 0, 47, 13, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (283, 45, 1, 0, 34, 31, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (284, 46, 1, 0, 48, 18, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (285, 46, 1, 0, 23, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (286, 46, 1, 0, 30, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (287, 46, 1, 0, 45, 59, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (288, 46, 1, 0, 42, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (289, 46, 1, 0, 63, 31, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (290, 47, 1, 0, 49, 36, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (291, 47, 1, 0, 31, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (292, 47, 1, 0, 71, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (293, 47, 1, 0, 23, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (294, 47, 1, 0, 67, 46, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (295, 48, 1, 0, 52, 20, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (296, 48, 1, 0, 22, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (297, 48, 1, 0, 53, 20, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (298, 48, 1, 0, 57, 43, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (299, 48, 1, 0, 34, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (300, 49, 3, 0, 55, 32, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (301, 49, 3, 0, 55, 28, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (302, 49, 3, 0, 43, 48, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (303, 49, 3, 0, 14, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (304, 49, 3, 0, 49, 39, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (305, 49, 3, 0, 40, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (306, 49, 3, 0, 48, 30, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (307, 49, 3, 0, 59, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (308, 49, 3, 0, 19, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (309, 49, 3, 0, 54, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (310, 50, 1, 0, 53, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (311, 50, 1, 0, 49, 21, '1', 23, NULL);
INSERT INTO public.snooker_frame VALUES (312, 50, 1, 0, 45, 36, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (313, 50, 1, 0, 18, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (314, 50, 1, 0, 56, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (315, 50, 1, 0, 59, 52, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (316, 51, 3, 0, 38, 67, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (317, 51, 3, 0, 41, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (318, 51, 3, 0, 45, 35, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (319, 51, 3, 0, 15, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (320, 51, 3, 0, 35, 37, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (321, 51, 3, 0, 48, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (322, 51, 3, 0, 60, 50, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (323, 51, 3, 0, 72, 6, '1', 32, NULL);
INSERT INTO public.snooker_frame VALUES (324, 52, 3, 0, 19, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (325, 52, 3, 0, 19, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (326, 52, 3, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (327, 52, 3, 0, 20, 44, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (328, 52, 3, 0, 52, 35, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (329, 52, 3, 0, 42, 14, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (330, 52, 3, 0, 45, 16, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (331, 52, 3, 0, 52, 49, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (332, 52, 3, 0, 15, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (333, 53, 1, 0, 44, 31, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (334, 53, 1, 0, 12, 38, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (335, 53, 1, 0, 5, 39, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (336, 53, 1, 0, 41, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (337, 53, 1, 0, 48, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (338, 53, 1, 0, 25, 56, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (339, 54, 1, 0, 15, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (340, 54, 1, 0, 26, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (341, 54, 1, 0, 17, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (342, 54, 1, 0, 53, 57, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (343, 54, 1, 0, 74, 36, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (344, 55, 1, 0, 34, 52, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (345, 55, 1, 0, 52, 37, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (346, 55, 1, 0, 54, 44, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (347, 55, 1, 0, 50, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (348, 55, 1, 0, 46, 11, '1', 26, NULL);
INSERT INTO public.snooker_frame VALUES (349, 56, 1, 0, 34, 27, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (350, 56, 1, 0, 51, 31, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (351, 56, 1, 0, 65, 55, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (352, 56, 1, 0, 64, 37, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (353, 56, 1, 0, 53, 16, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (354, 57, 1, 0, 31, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (355, 57, 1, 0, 53, 32, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (356, 57, 1, 0, 63, 32, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (357, 57, 1, 0, 27, 58, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (358, 57, 1, 0, 35, 58, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (359, 58, 1, 0, 37, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (360, 58, 1, 0, 40, 37, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (361, 58, 1, 0, 28, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (362, 58, 1, 0, 51, 46, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (363, 59, 1, 0, 28, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (364, 59, 1, 0, 49, 15, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (365, 59, 1, 0, 20, 61, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (366, 59, 1, 0, 40, 23, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (367, 59, 1, 0, 38, 46, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (368, 59, 1, 0, 42, 58, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (369, 60, 1, 0, 39, 57, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (370, 60, 1, 0, 25, 45, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (371, 60, 1, 0, 16, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (372, 60, 1, 0, 34, 55, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (373, 60, 1, 0, 43, 67, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (374, 61, 1, 0, 26, 43, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (375, 61, 1, 0, 45, 30, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (376, 61, 1, 0, 72, 43, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (377, 61, 1, 0, 44, 39, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (378, 61, 1, 0, 26, 52, '0', 10, NULL);
INSERT INTO public.snooker_frame VALUES (379, 61, 1, 0, 39, 41, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (380, 61, 1, 0, 44, 55, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (381, 62, 1, 0, 36, 56, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (382, 62, 1, 0, 45, 35, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (383, 62, 1, 0, 48, 26, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (384, 62, 1, 0, 27, 38, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (385, 62, 1, 0, 63, 46, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (386, 62, 1, 0, 41, 52, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (387, 63, 3, 0, 13, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (388, 63, 3, 0, 32, 55, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (389, 63, 3, 0, 25, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (390, 63, 3, 0, 40, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (391, 63, 3, 0, 46, 14, '1', 10, NULL);
INSERT INTO public.snooker_frame VALUES (392, 63, 3, 0, 3, 48, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (393, 63, 3, 0, 34, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (394, 63, 3, 0, 64, 33, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (395, 63, 3, 0, 62, 40, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (396, 64, 3, 0, 44, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (397, 64, 3, 0, 22, 53, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (398, 64, 3, 0, 50, 34, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (399, 64, 3, 0, 54, 32, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (400, 64, 3, 0, 4, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (401, 64, 3, 0, 47, 24, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (402, 64, 3, 0, 52, 30, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (403, 65, 3, 0, 58, 34, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (404, 65, 3, 0, 17, 34, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (405, 65, 3, 0, 41, 54, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (406, 65, 3, 0, 26, 55, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (407, 65, 3, 0, 72, 46, '1', 27, NULL);
INSERT INTO public.snooker_frame VALUES (408, 65, 3, 0, 60, 51, '1', 24, NULL);
INSERT INTO public.snooker_frame VALUES (409, 65, 3, 0, 28, 47, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (410, 65, 3, 0, 25, 46, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (411, 66, 3, 0, 22, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (412, 66, 3, 0, 18, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (413, 66, 3, 0, 46, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (414, 66, 3, 0, 24, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (415, 66, 3, 0, 36, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (416, 66, 3, 0, 31, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (417, 66, 3, 0, 49, 18, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (418, 67, 3, 0, 44, 29, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (419, 67, 3, 0, 20, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (420, 67, 3, 0, 48, 38, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (421, 67, 3, 0, 42, 49, '0', 21, NULL);
INSERT INTO public.snooker_frame VALUES (422, 67, 3, 0, 54, 42, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (423, 67, 3, 0, 59, 41, '1', 20, NULL);
INSERT INTO public.snooker_frame VALUES (424, 68, 3, 0, 54, 46, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (425, 68, 3, 0, 56, 22, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (426, 68, 3, 0, 38, 50, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (427, 68, 3, 0, 53, 32, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (428, 68, 3, 0, 60, 40, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (429, 68, 3, 0, 51, 27, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (430, 69, 1, 0, 56, 45, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (431, 69, 1, 0, 27, 47, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (432, 69, 1, 0, 45, 43, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (433, 69, 1, 0, 51, 55, '0', 17, NULL);
INSERT INTO public.snooker_frame VALUES (434, 69, 1, 0, 54, 41, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (435, 69, 1, 0, 58, 41, '1', 21, NULL);
INSERT INTO public.snooker_frame VALUES (436, 70, 1, 0, 52, 14, '1', 14, NULL);
INSERT INTO public.snooker_frame VALUES (437, 70, 1, 0, 55, 44, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (438, 70, 1, 0, 17, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (439, 70, 1, 0, 55, 28, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (440, 70, 1, 0, 53, 25, '1', 19, NULL);
INSERT INTO public.snooker_frame VALUES (441, 70, 1, 0, 49, 20, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (442, 71, 1, 0, 53, 65, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (443, 71, 1, 0, 38, 49, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (444, 71, 1, 0, 55, 52, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (445, 71, 1, 0, 36, 47, '0', 12, NULL);
INSERT INTO public.snooker_frame VALUES (446, 71, 1, 0, 45, 15, '1', 15, NULL);
INSERT INTO public.snooker_frame VALUES (447, 71, 1, 0, 56, 33, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (448, 72, 3, 0, 48, 39, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (449, 72, 3, 0, 51, 23, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (450, 72, 3, 0, 39, 37, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (451, 72, 3, 0, 56, 55, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (452, 72, 3, 0, 42, 25, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (453, 73, 1, 0, 50, 20, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (454, 73, 1, 0, 57, 40, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (455, 73, 1, 0, 53, 30, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (456, 73, 1, 0, 47, 11, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (457, 73, 1, 0, 32, 51, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (458, 74, 1, 0, 73, 19, '1', 17, NULL);
INSERT INTO public.snooker_frame VALUES (459, 74, 1, 0, 54, 42, '1', 14, '1/8决赛（2：0）');
INSERT INTO public.snooker_frame VALUES (460, 74, 1, 0, 41, 54, '0', 16, NULL);
INSERT INTO public.snooker_frame VALUES (461, 74, 1, 0, 21, 51, '0', NULL, '1/4决赛（0：2）');
INSERT INTO public.snooker_frame VALUES (462, 75, 1, 0, 57, 30, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (463, 75, 1, 0, 63, 61, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (464, 75, 1, 0, 52, 17, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (465, 75, 1, 0, 50, 19, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (466, 75, 1, 0, 49, 60, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (467, 76, 1, 0, 47, 21, '1', 12, NULL);
INSERT INTO public.snooker_frame VALUES (468, 76, 1, 0, 36, 32, '1', 18, NULL);
INSERT INTO public.snooker_frame VALUES (469, 76, 1, 0, 30, 47, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (470, 76, 1, 0, 69, 57, '1', 27, NULL);
INSERT INTO public.snooker_frame VALUES (471, 76, 1, 0, 56, 17, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (472, 76, 1, 0, 15, 70, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (473, 77, 1, 0, 36, 67, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (474, 77, 1, 0, 56, 23, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (475, 77, 1, 0, 23, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (476, 77, 1, 0, 53, 61, '0', 14, NULL);
INSERT INTO public.snooker_frame VALUES (477, 77, 1, 0, 26, 57, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (478, 77, 1, 0, 44, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (479, 77, 1, 0, 21, 58, '0', 13, NULL);
INSERT INTO public.snooker_frame VALUES (480, 77, 1, 0, 25, 54, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (481, 77, 1, 0, 37, 35, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (482, 78, 1, 0, 34, 36, '0', 11, NULL);
INSERT INTO public.snooker_frame VALUES (483, 78, 1, 0, 60, 36, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (484, 78, 1, 0, 42, 49, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (485, 78, 1, 0, 51, 59, '0', 15, NULL);
INSERT INTO public.snooker_frame VALUES (486, 78, 1, 0, 61, 49, '1', 22, NULL);
INSERT INTO public.snooker_frame VALUES (487, 78, 1, 0, 54, 38, '1', 11, NULL);
INSERT INTO public.snooker_frame VALUES (488, 79, 1, 0, 48, 33, '1', 16, NULL);
INSERT INTO public.snooker_frame VALUES (489, 79, 1, 0, 47, 40, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (490, 79, 1, 0, 46, 39, '1', 13, NULL);
INSERT INTO public.snooker_frame VALUES (491, 79, 1, 0, 25, 53, '0', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (492, 79, 1, 0, 51, 33, '1', NULL, NULL);
INSERT INTO public.snooker_frame VALUES (493, 79, 1, 0, 42, 24, '1', 17, NULL);


--
-- TOC entry 2992 (class 0 OID 24829)
-- Dependencies: 221
-- Data for Name: snooker_group; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.snooker_group VALUES (1, '系统', '0');
INSERT INTO public.snooker_group VALUES (2, '上研', '1');
INSERT INTO public.snooker_group VALUES (3, '集中营', '1');
INSERT INTO public.snooker_group VALUES (4, '曹杨群', '1');
INSERT INTO public.snooker_group VALUES (5, '比赛', '1');
INSERT INTO public.snooker_group VALUES (6, '路人合集', '1');


--
-- TOC entry 2994 (class 0 OID 24834)
-- Dependencies: 223
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
INSERT INTO public.snooker_gym VALUES (11, '黄浦工体', '外马路');


--
-- TOC entry 2996 (class 0 OID 24839)
-- Dependencies: 225
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


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 201
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 205
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 209
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 211
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 213
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 216
-- Name: snooker_campaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_campaign_id_seq', 79, true);


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 218
-- Name: snooker_cue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_cue_id_seq', 3, true);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 220
-- Name: snooker_frame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_frame_id_seq', 493, true);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 222
-- Name: snooker_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_group_id_seq', 6, true);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 224
-- Name: snooker_gym_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_gym_id_seq', 11, true);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 226
-- Name: snooker_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.snooker_player_id_seq', 16, true);


--
-- TOC entry 2780 (class 2606 OID 24965)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2785 (class 2606 OID 24862)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2788 (class 2606 OID 24864)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 24866)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 24868)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2793 (class 2606 OID 24870)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 24872)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 24874)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2795 (class 2606 OID 24876)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 24878)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 24880)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2798 (class 2606 OID 24882)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2813 (class 2606 OID 24884)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 24886)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2818 (class 2606 OID 24888)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 24890)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 24892)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2826 (class 2606 OID 24894)
-- Name: snooker_campaign snooker_campaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_campaign
    ADD CONSTRAINT snooker_campaign_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 24896)
-- Name: snooker_cue snooker_cue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_cue
    ADD CONSTRAINT snooker_cue_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 24898)
-- Name: snooker_frame snooker_frame_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_frame
    ADD CONSTRAINT snooker_frame_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 24900)
-- Name: snooker_group snooker_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_group
    ADD CONSTRAINT snooker_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 24902)
-- Name: snooker_gym snooker_gym_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_gym
    ADD CONSTRAINT snooker_gym_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 24904)
-- Name: snooker_player snooker_player_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.snooker_player
    ADD CONSTRAINT snooker_player_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 1259 OID 24966)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2783 (class 1259 OID 24906)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2786 (class 1259 OID 24907)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2789 (class 1259 OID 24908)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2799 (class 1259 OID 24909)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2802 (class 1259 OID 24910)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2805 (class 1259 OID 24911)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2808 (class 1259 OID 24912)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2796 (class 1259 OID 24913)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2811 (class 1259 OID 24914)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2814 (class 1259 OID 24915)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2821 (class 1259 OID 24916)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2824 (class 1259 OID 24917)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2837 (class 2606 OID 24918)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2838 (class 2606 OID 24923)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2839 (class 2606 OID 24928)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2840 (class 2606 OID 24933)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2841 (class 2606 OID 24938)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2842 (class 2606 OID 24943)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2843 (class 2606 OID 24948)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2844 (class 2606 OID 24953)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2845 (class 2606 OID 24958)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2019-10-21 19:58:45

--
-- PostgreSQL database dump complete
--

