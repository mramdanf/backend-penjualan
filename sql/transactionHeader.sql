CREATE SEQUENCE public.transaction_header_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_header_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.transaction_header (
    document_code character varying(3),
    document_number character varying(10),
    username_id character varying(50),
    total integer,
    transaction_date date,
    foreign key (username_id) references login (username)
);


ALTER TABLE public.transaction_header OWNER TO postgres;

SELECT pg_catalog.setval('public.transaction_header_id_seq', 1, true);

ALTER TABLE ONLY public.transaction_header
    ADD CONSTRAINT transaction_headers_pkey PRIMARY KEY (document_number);


INSERT INTO "public"."transaction_header"("document_code","document_number","username_id","total","transaction_date")
VALUES
(E'TRX',E'001',E'ramdan',36000,'2023-07-17');
