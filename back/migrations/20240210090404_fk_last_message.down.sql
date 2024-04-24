SET ROLE ddl_grp;
ALTER TABLE Conversation
    DROP CONSTRAINT fk_last_message;