SET ROLE ddl_grp;
CREATE TABLE IF NOT EXISTS "user"
(
    id                BIGSERIAL PRIMARY KEY,
    workspace_id      BIGINT      NOT NULL,
    messaging_address VARCHAR(50) NOT NULL,
    type              user_type   NOT NULL,
    created_at        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    password_hash     VARCHAR(256) NOT NULL,
    FOREIGN KEY (workspace_id) REFERENCES "workspace" (id),
    CONSTRAINT unique_messaging_address UNIQUE (messaging_address, workspace_id)
);