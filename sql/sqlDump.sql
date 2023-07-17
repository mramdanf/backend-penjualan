CREATE TABLE public.users (
  user character varying(255),
  password character varying(60)
);

INSERT INTO "public"."users"("user","password")
VALUES
(E'ramdan',E'$2a$12$1zGLuYDDNvATh4RA4avbKuheAMpb1svexSzrQm7up.bnpwQHs0jNe');