CREATE TABLE IF NOT EXISTS message
(
    id              BIGSERIAL,
    conversation_id BIGINT       NOT NULL,
    sender_id       BIGINT       NOT NULL,
    type            message_type NOT NULL,
    message         TEXT         NOT NULL,
    created_at      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation (id),
    FOREIGN KEY (sender_id) REFERENCES "user" (id)
);



