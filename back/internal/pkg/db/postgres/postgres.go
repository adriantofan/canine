package postgres

import (
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"log"
)

func MustExecMigrations(db *sqlx.DB, drop bool) {
	if drop {
		db.MustExec(schemaDrop)
	}
	db.MustExec(schemaCreate)
}

func MustConnect(dsn string) *sqlx.DB {
	db, err := sqlx.Connect("postgres", dsn)
	if err != nil {
		log.Fatalln(err)
	}

	return db
}

var schemaDrop = `
DROP INDEX IF EXISTS idx_message_conversation_id_id;
DROP INDEX IF EXISTS idx_user1_id ;
DROP INDEX IF EXISTS idx_user2_id;
DROP TABLE IF EXISTS "user" CASCADE;
DROP TABLE IF EXISTS conversation CASCADE ;
DROP TABLE IF EXISTS message CASCADE ;
`
var schemaCreate = `
CREATE TABLE IF NOT EXISTS "user"(
    id BIGSERIAL PRIMARY KEY,
	phone VARCHAR(15) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS conversation(
    id BIGSERIAL,
    user1_id BIGINT NOT NULL,
    user2_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_message_id BIGINT NOT NULL DEFAULT 9223372036854775807,
    PRIMARY KEY (id),
    FOREIGN KEY (user1_id) REFERENCES "user"(id),
    FOREIGN KEY (user2_id) REFERENCES "user"(id),
    CONSTRAINT unique_conversation_user UNIQUE (user1_id, user2_id),
    CONSTRAINT valid_user_order CHECK (user1_id < user2_id)
);

CREATE TABLE IF NOT EXISTS message(
    id BIGSERIAL,
    conversation_id BIGINT NOT NULL,
    sender_id BIGINT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id), 
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (sender_id) REFERENCES "user"(id)
);


CREATE INDEX IF NOT EXISTS idx_message_conversation_id_id ON message (conversation_id ASC NULLS LAST, id ASC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_conversation_last_message_id_id_asc ON conversation (last_message_id ASC NULLS LAST, id ASC NULLS LAST);
CREATE INDEX IF NOT EXISTS idx_conversation_last_message_id_id_desc ON conversation (last_message_id DESC NULLS LAST, id DESC NULLS LAST);

CREATE INDEX IF NOT EXISTS idx_user1_id ON conversation (user1_id);
CREATE INDEX IF NOT EXISTS idx_user2_id ON conversation (user2_id);
`
