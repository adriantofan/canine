package postgres

import (
	"back/.gen/canine/public/table"
	"back/internal/pkg/domain"
	"context"
	"errors"
	. "github.com/go-jet/jet/v2/postgres"
	"github.com/go-jet/jet/v2/qrm"
	"github.com/jmoiron/sqlx"
	"github.com/lib/pq"
)

type MessageRepository struct {
	db *sqlx.DB
}

func NewMessageRepository(db *sqlx.DB) *MessageRepository {
	return &MessageRepository{db}
}

func (s *MessageRepository) GetMessages(ctx context.Context, conversationID int64, id *int64, limit int, direction domain.Direction) ([]domain.Message, error) {
	fromConversation := table.Message.ConversationID.EQ(Int64(conversationID))
	stmt := SELECT(table.Message.AllColumns).
		FROM(table.Message)
	if direction == domain.Forward {
		if id != nil {
			stmt = stmt.WHERE(AND(fromConversation, table.Message.ID.GT(Int64(*id))))
		}
		stmt = stmt.ORDER_BY(table.Message.ID.ASC()).LIMIT(int64(limit))
	} else {
		if id != nil {
			stmt = stmt.WHERE(AND(fromConversation, table.Message.ID.LT(Int64(*id))))
		}
		stmt = stmt.ORDER_BY(table.Message.ID.DESC()).LIMIT(int64(limit))
	}
	conversations := make([]domain.Message, 0)
	err := stmt.QueryContext(ctx, s.db, &conversations)
	return conversations, err
}

func (s *MessageRepository) GetMessagesBefore(ctx context.Context, conversationID int64, beforeID int64, limit int) ([]domain.Message, error) {
	messages := make([]domain.Message, 0)
	err := s.db.SelectContext(ctx, &messages, `
		SELECT id, conversation_id, sender_id, message, created_at
		FROM message
		WHERE conversation_id = $1 AND id < $2
		ORDER BY id DESC
		LIMIT $3
	`, conversationID, beforeID, limit)

	return messages, err
}

func (s *MessageRepository) GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]domain.Message, error) {
	messages := make([]domain.Message, 0)
	err := s.db.SelectContext(ctx, &messages, `
		SELECT id, conversation_id, sender_id, message, created_at
		FROM message
		WHERE conversation_id = $1 AND id > $2
		ORDER BY id ASC
		LIMIT $3
	`, conversationID, afterID, limit)

	return messages, err
}

func (s *MessageRepository) CreateUser(ctx context.Context, phone string) (domain.User, error) {
	var user domain.User
	stmt := table.User.
		INSERT(table.User.Phone).
		VALUES(String(phone)).
		RETURNING(table.User.AllColumns)
	println(stmt.DebugSql())
	err := stmt.QueryContext(ctx, s.db, &user)
	var pqError *pq.Error
	if err != nil && errors.As(err, &pqError) && pqError.Code.Name() == "unique_violation" {
		return user, domain.PhoneNumberExistsError

	}

	return user, err
}

// GetUser implements MessageRepository
func (s *MessageRepository) GetUserByPhone(ctx context.Context, phone string) (domain.User, error) {
	var user domain.User
	stmt := SELECT(table.User.ID, table.User.Phone, table.User.CreatedAt).
		FROM(table.User).
		WHERE(table.User.Phone.EQ(String(phone)))

	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.UserNotFoundError
	}

	return user, err
}

func (s *MessageRepository) GetUserById(ctx context.Context, id int64) (domain.User, error) {
	var user domain.User
	stmt := SELECT(table.User.ID, table.User.Phone, table.User.CreatedAt).
		FROM(table.User).
		WHERE(table.User.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.UserNotFoundError
	}

	return user, err
}

func (s *MessageRepository) GetOrCreateConversation(ctx context.Context, user1Id, user2Id int64) (domain.Conversation, error) {
	var conversation domain.Conversation
	if user1Id > user2Id {
		user1Id, user2Id = user2Id, user1Id
	}
	err := s.db.GetContext(ctx, &conversation, `
		WITH new_conversation AS (
			INSERT INTO conversation (user1_id, user2_id)
			VALUES ($1, $2)
			ON CONFLICT (user1_id, user2_id) DO NOTHING 
			RETURNING id, user1_id, user2_id, last_message_id, created_at
		)
		SELECT id, user1_id, user2_id, last_message_id, created_at FROM new_conversation
		UNION ALL
		SELECT id, user1_id, user2_id, last_message_id, created_at
		FROM conversation
		WHERE user1_id = user1_id
  		AND user2_id = user2_id
		LIMIT 1
	`, user1Id, user2Id)

	return conversation, err

}

func (s *MessageRepository) CreateMessage(ctx context.Context, conversationID int64, senderID int64, message string) (domain.Message, error) {
	var msg domain.Message
	err := s.db.GetContext(ctx, &msg, `
		INSERT INTO message (conversation_id, sender_id, message)
		VALUES ($1, $2, $3)
		RETURNING id, conversation_id, sender_id, message, created_at
	`, conversationID, senderID, message)

	return msg, err
}

func (s *MessageRepository) GetConversations(ctx context.Context, id *int64, limit int, direction domain.Direction) ([]domain.Conversation, error) {
	stmt := SELECT(table.Conversation.AllColumns).
		FROM(table.Conversation)
	if direction == domain.Forward {
		if id != nil {
			stmt = stmt.WHERE(table.Conversation.ID.GT(Int64(*id)))
		}
		stmt = stmt.ORDER_BY(table.Conversation.ID.ASC()).LIMIT(int64(limit))
	} else {
		if id != nil {
			stmt = stmt.WHERE(table.Conversation.ID.LT(Int64(*id)))
		}
		stmt = stmt.ORDER_BY(table.Conversation.ID.DESC()).LIMIT(int64(limit))
	}
	conversations := make([]domain.Conversation, 0)
	err := stmt.QueryContext(ctx, s.db, &conversations)
	return conversations, err
}
