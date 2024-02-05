ALTER TABLE Conversation
    ADD CONSTRAINT fk_last_message
        FOREIGN KEY (last_message_id) REFERENCES message(id)
            ON DELETE SET NULL;