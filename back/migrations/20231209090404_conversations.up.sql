SET ROLE ddl_grp;
CREATE TABLE IF NOT EXISTS conversation
(
    id               BIGSERIAL,
    workspace_id     BIGINT    NOT NULL,
    external_user_id BIGINT    NOT NULL,
    name             VARCHAR(256),
    created_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_seq      BIGINT    NOT NULL DEFAULT 0,
    archived         BOOLEAN   NOT NULL DEFAULT FALSE,
    last_message_id  BIGINT UNIQUE,
    PRIMARY KEY (id),
    FOREIGN KEY (external_user_id) REFERENCES "user" (id),
    FOREIGN KEY (workspace_id) REFERENCES "workspace" (id),
    CONSTRAINT unique_conversation_user UNIQUE (workspace_id, external_user_id, name)
);


