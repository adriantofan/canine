BEGIN;
SET ROLE ddl_grp;
-- Rename messaging_address to email and increase its length
ALTER TABLE "user"
    RENAME COLUMN messaging_address TO email;

ALTER TABLE "user"
    ALTER COLUMN email TYPE VARCHAR(100);

-- Remove password_hash
ALTER TABLE "user"
    DROP COLUMN password_hash;

-- Update unique constraint to reference new email column
ALTER TABLE "user"
    DROP CONSTRAINT unique_messaging_address;

ALTER TABLE "user"
    ADD CONSTRAINT unique_email_in_wksp UNIQUE (email, workspace_id);
COMMIT;