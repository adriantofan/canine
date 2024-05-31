SET ROLE ddl_grp;
ALTER TABLE workspace
    DROP COLUMN auth_id;
ALTER TABLE "user"
    DROP COLUMN auth_id;