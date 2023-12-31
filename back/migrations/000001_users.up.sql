CREATE TYPE user_type AS ENUM ('external', 'internal', 'bot');

CREATE TABLE IF NOT EXISTS "user"
(
    id         BIGSERIAL PRIMARY KEY,
    messaging_address      VARCHAR(50) NOT NULL UNIQUE,
    type user_type NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);