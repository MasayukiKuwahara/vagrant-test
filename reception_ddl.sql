--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

SET default_with_oids = false;

--
-- Name: mst_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_client (
    id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    kana character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false,
    hangouts_url character varying(255)
);


ALTER TABLE public.mst_client OWNER TO postgres;

--
-- Name: TABLE mst_client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_client IS '顧客（固定の業者など）を管理するマスタ';


--
-- Name: mst_client_counterparty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_client_counterparty (
    id integer NOT NULL,
    client_id integer NOT NULL,
    employee_id integer NOT NULL,
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_client_counterparty OWNER TO postgres;

--
-- Name: TABLE mst_client_counterparty; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_client_counterparty IS '顧客への対応者（顧客対応者の紐づけ）を管理するマスタ';


--
-- Name: mst_client_counterparty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_client_counterparty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_client_counterparty_id_seq OWNER TO postgres;

--
-- Name: mst_client_counterparty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_client_counterparty_id_seq OWNED BY public.mst_client_counterparty.id;


--
-- Name: mst_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_client_id_seq OWNER TO postgres;

--
-- Name: mst_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_client_id_seq OWNED BY public.mst_client.id;


--
-- Name: mst_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_department (
    id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_department OWNER TO postgres;

--
-- Name: TABLE mst_department; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_department IS '従業員の所属部門を管理するマスタ';


--
-- Name: mst_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_department_id_seq OWNER TO postgres;

--
-- Name: mst_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_department_id_seq OWNED BY public.mst_department.id;


--
-- Name: mst_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_employee (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    first_name character varying(20) NOT NULL,
    middle_name character varying(20),
    last_name character varying(20) NOT NULL,
    first_kana character varying(20) NOT NULL,
    middle_kana character varying(20),
    last_kana character varying(20) NOT NULL,
    department_id integer,
    section_id integer,
    office_position_id integer,
    phone_number character(12),
    mail_address character varying(50),
    hangouts_url character varying(255),
    slack_url character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_employee OWNER TO postgres;

--
-- Name: TABLE mst_employee; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_employee IS '従業員を管理するマスタ';


--
-- Name: mst_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_employee_id_seq OWNER TO postgres;

--
-- Name: mst_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_employee_id_seq OWNED BY public.mst_employee.id;


--
-- Name: mst_general_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_general_config (
    id integer NOT NULL,
    master_code character(5) NOT NULL,
    record_number integer NOT NULL,
    string_item_1 character varying(255),
    string_item_2 character varying(255),
    string_item_3 character varying(255),
    string_item_4 character varying(255),
    string_item_5 character varying(255),
    numeric_item_1 integer,
    numeric_item_2 integer,
    numeric_item_3 integer,
    numeric_item_4 integer,
    numeric_item_5 integer,
    date_item_1 timestamp(6) without time zone,
    date_item_2 timestamp(6) without time zone,
    date_item_3 timestamp(6) without time zone,
    date_item_4 timestamp(6) without time zone,
    date_item_5 timestamp(6) without time zone,
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_general_config OWNER TO postgres;

--
-- Name: TABLE mst_general_config; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_general_config IS '汎用的な設定値を管理するマスタ';


--
-- Name: mst_general_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_general_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_general_config_id_seq OWNER TO postgres;

--
-- Name: mst_general_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_general_config_id_seq OWNED BY public.mst_general_config.id;


--
-- Name: mst_location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_location (
    id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_location OWNER TO postgres;

--
-- Name: TABLE mst_location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_location IS '会議室やミーティングスペースなど、打合せ場所を管理するマスタ';


--
-- Name: mst_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_location_id_seq OWNER TO postgres;

--
-- Name: mst_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_location_id_seq OWNED BY public.mst_location.id;


--
-- Name: mst_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_messages (
    id integer NOT NULL,
    message_code character(6),
    message_type character(3),
    message_text character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_messages OWNER TO postgres;

--
-- Name: TABLE mst_messages; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_messages IS 'システムメッセージを管理するマスタ';


--
-- Name: mst_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_messages_id_seq OWNER TO postgres;

--
-- Name: mst_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_messages_id_seq OWNED BY public.mst_messages.id;


--
-- Name: mst_office_position; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_office_position (
    id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_office_position OWNER TO postgres;

--
-- Name: TABLE mst_office_position; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_office_position IS '従業員の役職を管理するマスタ';


--
-- Name: mst_office_position_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_office_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_office_position_id_seq OWNER TO postgres;

--
-- Name: mst_office_position_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_office_position_id_seq OWNED BY public.mst_office_position.id;


--
-- Name: mst_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_requirements (
    id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    requirement character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_requirements OWNER TO postgres;

--
-- Name: TABLE mst_requirements; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_requirements IS 'アポイントなしの訪問者の用件を管理するマスタ';


--
-- Name: mst_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_requirements_id_seq OWNER TO postgres;

--
-- Name: mst_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_requirements_id_seq OWNED BY public.mst_requirements.id;


--
-- Name: mst_section; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mst_section (
    id integer NOT NULL,
    department_id integer NOT NULL,
    sort_number integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(50) NOT NULL,
    remarks character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.mst_section OWNER TO postgres;

--
-- Name: TABLE mst_section; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.mst_section IS '従業員の所属課を管理するマスタ';


--
-- Name: mst_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mst_section_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mst_section_id_seq OWNER TO postgres;

--
-- Name: mst_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mst_section_id_seq OWNED BY public.mst_section.id;


--
-- Name: tbl_appointment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_appointment (
    id integer NOT NULL,
    is_completed boolean DEFAULT false,
    visitor_number character(4) NOT NULL,
    visit_date date NOT NULL,
    visit_time_from time(6) without time zone NOT NULL,
    visit_time_to time(6) without time zone NOT NULL,
    location_id integer,
    visitor_name character varying(50) NOT NULL,
    visitor_company character varying(50),
    visitor_information character varying(255),
    internal_message character varying(255),
    internal_reception_message character varying(255),
    external_message character varying(255),
    create_id integer NOT NULL,
    create_date timestamp(6) with time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.tbl_appointment OWNER TO postgres;

--
-- Name: TABLE tbl_appointment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tbl_appointment IS '受付申請画面から登録するアポイント情報を保持するテーブル';


--
-- Name: tbl_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_appointment_id_seq OWNER TO postgres;

--
-- Name: tbl_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_appointment_id_seq OWNED BY public.tbl_appointment.id;


--
-- Name: tbl_participant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_participant (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    employee_id integer NOT NULL,
    create_id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    update_id integer NOT NULL,
    update_date timestamp(6) without time zone NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.tbl_participant OWNER TO postgres;

--
-- Name: TABLE tbl_participant; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tbl_participant IS '登録されたアポイントに参加する従業員を保持するテーブル';


--
-- Name: tbl_participant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tbl_participant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tbl_participant_id_seq OWNER TO postgres;

--
-- Name: tbl_participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tbl_participant_id_seq OWNED BY public.tbl_participant.id;


--
-- Name: tbl_visitor_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tbl_visitor_number (
    visitor_number character(4) NOT NULL,
    appointment_id integer
);


ALTER TABLE public.tbl_visitor_number OWNER TO postgres;

--
-- Name: TABLE tbl_visitor_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tbl_visitor_number IS '訪問者番号の払い出しに使用するテーブル';


--
-- Name: mst_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_client ALTER COLUMN id SET DEFAULT nextval('public.mst_client_id_seq'::regclass);


--
-- Name: mst_client_counterparty id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_client_counterparty ALTER COLUMN id SET DEFAULT nextval('public.mst_client_counterparty_id_seq'::regclass);


--
-- Name: mst_department id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_department ALTER COLUMN id SET DEFAULT nextval('public.mst_department_id_seq'::regclass);


--
-- Name: mst_employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_employee ALTER COLUMN id SET DEFAULT nextval('public.mst_employee_id_seq'::regclass);


--
-- Name: mst_general_config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_general_config ALTER COLUMN id SET DEFAULT nextval('public.mst_general_config_id_seq'::regclass);


--
-- Name: mst_location id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_location ALTER COLUMN id SET DEFAULT nextval('public.mst_location_id_seq'::regclass);


--
-- Name: mst_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_messages ALTER COLUMN id SET DEFAULT nextval('public.mst_messages_id_seq'::regclass);


--
-- Name: mst_office_position id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_office_position ALTER COLUMN id SET DEFAULT nextval('public.mst_office_position_id_seq'::regclass);


--
-- Name: mst_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_requirements ALTER COLUMN id SET DEFAULT nextval('public.mst_requirements_id_seq'::regclass);


--
-- Name: mst_section id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_section ALTER COLUMN id SET DEFAULT nextval('public.mst_section_id_seq'::regclass);


--
-- Name: tbl_appointment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_appointment ALTER COLUMN id SET DEFAULT nextval('public.tbl_appointment_id_seq'::regclass);


--
-- Name: tbl_participant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_participant ALTER COLUMN id SET DEFAULT nextval('public.tbl_participant_id_seq'::regclass);


--
-- Name: mst_client_counterparty mst_client_counterparty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_client_counterparty
    ADD CONSTRAINT mst_client_counterparty_pkey PRIMARY KEY (id);


--
-- Name: mst_client mst_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_client
    ADD CONSTRAINT mst_client_pkey PRIMARY KEY (id);


--
-- Name: mst_department mst_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_department
    ADD CONSTRAINT mst_department_pkey PRIMARY KEY (id);


--
-- Name: mst_employee mst_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_employee
    ADD CONSTRAINT mst_employee_pkey PRIMARY KEY (id);


--
-- Name: mst_general_config mst_general_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_general_config
    ADD CONSTRAINT mst_general_config_pkey PRIMARY KEY (id);


--
-- Name: mst_location mst_location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_location
    ADD CONSTRAINT mst_location_pkey PRIMARY KEY (id);


--
-- Name: mst_messages mst_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_messages
    ADD CONSTRAINT mst_messages_pkey PRIMARY KEY (id);


--
-- Name: mst_office_position mst_office_position_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_office_position
    ADD CONSTRAINT mst_office_position_pkey PRIMARY KEY (id);


--
-- Name: mst_requirements mst_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_requirements
    ADD CONSTRAINT mst_requirements_pkey PRIMARY KEY (id);


--
-- Name: mst_section mst_section_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mst_section
    ADD CONSTRAINT mst_section_pkey PRIMARY KEY (id);


--
-- Name: tbl_appointment tbl_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_appointment
    ADD CONSTRAINT tbl_appointment_pkey PRIMARY KEY (id);


--
-- Name: tbl_participant tbl_participant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_participant
    ADD CONSTRAINT tbl_participant_pkey PRIMARY KEY (id);


--
-- Name: tbl_visitor_number tbl_visitor_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tbl_visitor_number
    ADD CONSTRAINT tbl_visitor_number_pkey PRIMARY KEY (visitor_number);


--
-- PostgreSQL database dump complete
--

