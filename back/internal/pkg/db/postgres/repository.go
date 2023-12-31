package postgres

import (
	genModel "back/.gen/canine/public/model"
	"back/.gen/canine/public/table"
	"back/internal/pkg/domain"
	"context"
	"database/sql"
	"errors"
	. "github.com/go-jet/jet/v2/postgres"
	"github.com/go-jet/jet/v2/qrm"
	"github.com/jmoiron/sqlx"
	"github.com/lib/pq"
	"log"
)

type TransactionFactory struct {
	db   *sqlx.DB
	tx   *sql.Tx
	repo *MessageRepository
}

func NewTransactionFactory(db *sqlx.DB) *TransactionFactory {
	return &TransactionFactory{db: db}
}

func (t *TransactionFactory) Begin() (domain.ChatRepository, error) {
	if t.tx != nil || t.repo != nil {
		return nil, errors.New("transaction already started")
	}
	tx, err := t.db.Begin()
	if err != nil {
		return nil, err
	}
	t.tx = tx
	t.repo = NewMessageRepository(tx)
	return t.repo, nil
}
func (t *TransactionFactory) Commit() ([]domain.DataUpdate, error) {
	err := t.tx.Commit()

	if err != nil {
		return nil, err
	}
	t.tx = nil
	changes := t.repo.GetChanges()
	t.repo = nil
	return changes, nil
}

func (t *TransactionFactory) Rollback() error {
	if t.tx == nil {
		return nil
	}
	err := t.tx.Rollback()
	t.tx = nil
	t.repo = nil
	return err
}

func (t *TransactionFactory) InTransaction(ctx context.Context, f func(ctx context.Context, r domain.ChatRepository) error) ([]domain.DataUpdate, error) {
	repo, err := t.Begin()
	defer func() {
		err := t.Rollback()
		if err != nil {
			log.Println("failed to rollback transaction", err)
		}
	}()
	if err != nil {
		return nil, err
	}
	err = f(ctx, repo)
	if err != nil {
		return nil, err
	}
	return t.Commit()
}

type MessageRepository struct {
	db      qrm.DB
	changes []domain.DataUpdate
}

func NewMessageRepository(db qrm.DB) *MessageRepository {
	return &MessageRepository{db, make([]domain.DataUpdate, 0)}
}

func (s *MessageRepository) GetChanges() []domain.DataUpdate {
	return s.changes
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
	return s.GetMessages(ctx, conversationID, &beforeID, limit, domain.Backward)
}

func (s *MessageRepository) GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]domain.Message, error) {
	return s.GetMessages(ctx, conversationID, &afterID, limit, domain.Forward)
}

func (s *MessageRepository) CreateUser(ctx context.Context, messagingAddress string, userType genModel.UserType) (domain.User, error) {
	var user domain.User
	stmt := table.User.
		INSERT(table.User.MessagingAddress, table.User.Type).
		VALUES(String(messagingAddress), userType).
		RETURNING(table.User.AllColumns)

	err := stmt.QueryContext(ctx, s.db, &user)
	var pqError *pq.Error
	if err != nil && errors.As(err, &pqError) && pqError.Code.Name() == "unique_violation" {
		return user, domain.MessagingAddressExistsError

	}
	return user, err
}

// GetUser implements MessageRepository
func (s *MessageRepository) GetUserByMessagingAddress(ctx context.Context, messagingAddress string) (domain.User, error) {
	var user domain.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(table.User.MessagingAddress.EQ(String(messagingAddress)))

	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.UserNotFoundError
	}

	return user, err
}

func (s *MessageRepository) GetUserById(ctx context.Context, id int64) (domain.User, error) {
	var user domain.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(table.User.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.UserNotFoundError
	}

	return user, err
}

func (s *MessageRepository) GetOrCreateConversation(ctx context.Context, externalUserID int64, name string) (domain.Conversation, error) {

	var conversation domain.Conversation
	createStmt := table.Conversation.
		INSERT(table.Conversation.ExternalUserID, table.Conversation.Name).
		VALUES(Int64(externalUserID), String(name)).
		RETURNING(table.Conversation.AllColumns).
		ON_CONFLICT(table.Conversation.ExternalUserID, table.Conversation.Name).
		DO_NOTHING()
	err := createStmt.QueryContext(ctx, s.db, &conversation)
	if err != nil {
		if !errors.Is(err, qrm.ErrNoRows) {
			return conversation, err
		}
		loadStmt := SELECT(table.Conversation.AllColumns).
			FROM(table.Conversation).
			WHERE(
				AND(
					table.Conversation.ExternalUserID.EQ(Int64(externalUserID)),
					table.Conversation.Name.EQ(String(name)))).
			LIMIT(1)
		err := loadStmt.QueryContext(ctx, s.db, &conversation)
		if err != nil {
			s.changes = append(s.changes, domain.DataUpdate{
				Kind: domain.DataUpdateKindUpdate,
				Type: domain.DataUpdateTypeConversation,
				Data: &conversation,
			})
		}
		return conversation, err

	}
	s.changes = append(s.changes, domain.DataUpdate{
		Kind: domain.DataUpdateKindCreate,
		Type: domain.DataUpdateTypeConversation,
		Data: &conversation,
	})
	return conversation, nil
}

func (s *MessageRepository) CreateMessage(ctx context.Context, conversationID int64, senderID int64, message string, messageType genModel.MessageType) (domain.Message, error) {
	var msg domain.Message
	stmt := table.
		Message.INSERT(table.Message.ConversationID, table.Message.SenderID, table.Message.Message, table.Message.Type).
		VALUES(Int64(conversationID), Int64(senderID), String(message), messageType).
		RETURNING(table.Message.AllColumns)
	err := stmt.QueryContext(ctx, s.db, &msg)
	if err == nil {
		s.changes = append(s.changes, domain.DataUpdate{
			Kind: domain.DataUpdateKindCreate,
			Type: domain.DataUpdateTypeMessage,
			Data: &msg,
		})
	}
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

func (s *MessageRepository) GetConversation(ctx context.Context, id int64) (domain.Conversation, error) {
	var conversation domain.Conversation
	stmt := SELECT(table.Conversation.AllColumns).
		FROM(table.Conversation).
		WHERE(table.Conversation.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &conversation)

	if errors.Is(err, qrm.ErrNoRows) {
		return conversation, domain.ConversationNotFoundError
	}

	return conversation, err
}
