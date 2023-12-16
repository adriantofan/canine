CREATE TABLE IF NOT EXISTS conversation
(
    id               BIGSERIAL,
    external_user_id BIGINT    NOT NULL,
    name             VARCHAR(256),
    created_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_message_id  BIGINT    NOT NULL DEFAULT 9223372036854775807,
    PRIMARY KEY (id),
    FOREIGN KEY (external_user_id) REFERENCES "user" (id),
    CONSTRAINT unique_conversation_user UNIQUE (external_user_id, name)
);


