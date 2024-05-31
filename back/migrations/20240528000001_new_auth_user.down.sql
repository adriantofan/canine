BEGIN;
SET ROLE ddl_grp;

ALTER TABLE "user"
    RENAME COLUMN email TO messaging_address;

ALTER TABLE "user"
    ALTER COLUMN messaging_address TYPE VARCHAR(50);

-- Re-add password_hash
ALTER TABLE "user"
    ADD COLUMN password_hash VARCHAR(256) NOT NULL DEFAULT '';

-- Update unique constraint to reference original messaging_address column
ALTER TABLE "user"
    DROP CONSTRAINT unique_email_in_wksp;

ALTER TABLE "user"
    ADD CONSTRAINT unique_messaging_address UNIQUE (messaging_address, workspace_id);
COMMIT;