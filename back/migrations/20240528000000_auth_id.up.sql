SET ROLE ddl_grp;
ALTER TABLE workspace
    ADD COLUMN auth_id VARCHAR(150) NOT NULL DEFAULT '';
ALTER TABLE "user"
    ADD COLUMN auth_id VARCHAR(150) NOT NULL DEFAULT '';