/*
 * Below, we grant usage on an application schema called 'public'.
 *
 * Multiple schema names can be separated by a comma
 */

-- This will allow anyone in the group to use and create
-- new objects in the schema. Because this group will own
-- the objects, they can modify them later.
GRANT USAGE, CREATE
    ON SCHEMA public TO ddl_grp;

-- modify privileges for any existing tables and sequences
GRANT ALL
    ON ALL TABLES IN SCHEMA public TO ddl_grp;

GRANT ALL
    ON ALL SEQUENCES IN SCHEMA public TO ddl_grp;