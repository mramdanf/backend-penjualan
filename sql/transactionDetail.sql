CREATE SEQUENCE public.transaction_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_detail_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.transaction_detail (
    document_code character varying(3),
    document_number character varying(10),
    product_code character varying(18),
    price integer,
    quantity integer,
    unit character varying(5),
    subtotal integer,
    currency character varying(5),
    foreign key (product_code) references product (product_code)
);


ALTER TABLE public.transaction_detail OWNER TO postgres;

SELECT pg_catalog.setval('public.transaction_detail_id_seq', 1, true);

ALTER TABLE ONLY public.transaction_detail
    ADD CONSTRAINT transaction_details_pkey PRIMARY KEY (document_number);


INSERT INTO "public"."transaction_detail"("document_code","document_number","product_code","price","quantity","unit","subtotal","currency")
VALUES
(E'TRX',E'001',E'P1',18000,1,E'PCS',18000,E'IDR');
