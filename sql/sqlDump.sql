CREATE SEQUENCE public.login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.login (
    username character varying(255) UNIQUE NOT NULL,
    password character varying(60)
);


ALTER TABLE public.login OWNER TO postgres;

SELECT pg_catalog.setval('public.login_id_seq', 1, true);

ALTER TABLE ONLY public.login
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


INSERT INTO "public"."login"("username","password")
VALUES
(E'ramdan',E'$2a$12$1zGLuYDDNvATh4RA4avbKuheAMpb1svexSzrQm7up.bnpwQHs0jNe');
