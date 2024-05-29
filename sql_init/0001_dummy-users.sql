CREATE ROLE dummy_manager;
ALTER ROLE dummy_manager 
    WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB
    LOGIN NOREPLICATION NOBYPASSRLS 
    PASSWORD 'manager';

CREATE ROLE dummy_user;
ALTER ROLE dummy_user 
    WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB
    LOGIN NOREPLICATION NOBYPASSRLS 
    PASSWORD 'user';

GRANT plhdb_managers TO dummy_manager GRANTED BY plhdb_admin;
GRANT plhdb_users TO dummy_user GRANTED BY plhdb_admin;