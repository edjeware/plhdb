

-- CREATE ROLE plhdb_admin;
-- ALTER ROLE plhdb_admin WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'localpassword';
-- COMMENT ON ROLE plhdb_admin IS 'Role (user) used by system build tools to construct system.';

CREATE ROLE postgres;
ALTER ROLE postgres 
    WITH SUPERUSER INHERIT CREATEROLE CREATEDB 
    LOGIN REPLICATION BYPASSRLS;

CREATE ROLE plhdb_managers;
ALTER ROLE plhdb_managers WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
COMMENT ON ROLE plhdb_managers IS 'Role (group) who''s members have "system manager" access.';

CREATE ROLE plhdb_users;
ALTER ROLE plhdb_users WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
COMMENT ON ROLE plhdb_users IS 'Role (group) who''s members have "study user" access.';

CREATE ROLE demo_user;
ALTER ROLE demo_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB 
    LOGIN NOREPLICATION NOBYPASSRLS 
    PASSWORD 'demo';
COMMENT ON ROLE demo_user IS 'Role (user) used when connecting the public at large to the demo database.';
