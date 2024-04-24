/*
 * Finally, as a user that has membership in the group role that
 * will run migration scripts setup the default access privileges.
 */
ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO dml_grp;

ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
    GRANT SELECT ON TABLES TO read_only_grp;

ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
    GRANT USAGE, SELECT ON SEQUENCES TO dml_grp, read_only_grp;

ALTER DEFAULT PRIVILEGES FOR ROLE ddl_grp IN SCHEMA public
    GRANT UPDATE ON SEQUENCES TO dml_grp;