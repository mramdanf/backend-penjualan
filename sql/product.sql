CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.product (
    product_code character varying(255) UNIQUE NOT NULL,
    product_name character varying(255),
    price integer,
    currency character varying(20),
    discount integer,
    unit character varying(20)
);


ALTER TABLE public.product OWNER TO postgres;

SELECT pg_catalog.setval('public.product_id_seq', 1, true);

ALTER TABLE ONLY public.product
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_code);


INSERT INTO "public"."product"("product_code","product_name","price","currency","discount","unit")
VALUES
(E'P1',E'So Klin Pewangi',18000,'IDR',2,'PCS');