-- This will allow all other "group" roles to connect
-- to the myapp schema and access objects if they have
-- have been granted privileges to do so.
GRANT USAGE ON SCHEMA public TO dml_grp, read_only_grp;

-- modify privileges for any existing tables and sequences
GRANT SELECT
    ON ALL TABLES IN SCHEMA public TO dml_grp, read_only_grp;

GRANT USAGE, SELECT
    ON ALL SEQUENCES IN SCHEMA public TO dml_grp, read_only_grp;