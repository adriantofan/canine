package postgres

import (
	"back/internal/pkg/domain/model"
	"context"
	"database/sql"
	"errors"
	"fmt"
	"log"

	"back/.gen/canine/public/enum"
	genModel "back/.gen/canine/public/model"
	"back/.gen/canine/public/table"
	"back/internal/pkg/domain"

	. "github.com/go-jet/jet/v2/postgres"
	"github.com/go-jet/jet/v2/qrm"
	"github.com/jmoiron/sqlx"
	"github.com/lib/pq"
)

type TransactionFactory struct {
	db                    *sqlx.DB
	tx                    *sql.Tx
	repo                  *MessageRepository
	cachedInternalUserIDs []int64
}

func NewTransactionFactory(db *sqlx.DB) *TransactionFactory {
	return &TransactionFactory{
		db: db,
		// FIXME: should probably keep only one repository, at least if we want to keep the changes
	}
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
	t.repo = NewMessageRepository(tx, &t.cachedInternalUserIDs)
	if t.cachedInternalUserIDs == nil {
		t.cachedInternalUserIDs, err = t.repo.GetInternalUserIds(context.Background())
		if err != nil {
			return nil, err
		}
	}

	return t.repo, nil
}

func (t *TransactionFactory) WithoutTransaction() (domain.ChatRepository, error) {
	if t.tx != nil || t.repo != nil {
		return nil, errors.New("transaction already started")
	}

	repo := NewMessageRepository(t.db, &t.cachedInternalUserIDs)
	var err error
	if t.cachedInternalUserIDs == nil {
		t.cachedInternalUserIDs, err = repo.GetInternalUserIds(context.Background())
		if err != nil {
			return nil, err
		}
	}
	return repo, nil
}

func (t *TransactionFactory) Commit() ([]model.DataUpdate, error) {
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

func (t *TransactionFactory) MustRollback() {
	err := t.Rollback()
	if err != nil {
		log.Println("failed to rollback transaction", err)
	}
}

func (t *TransactionFactory) InTransaction(ctx context.Context, f func(ctx context.Context, r domain.ChatRepository) error) ([]model.DataUpdate, error) {
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
	db                    qrm.DB
	changes               []model.DataUpdate
	cachedInternalUserIDs *[]int64
}

func NewMessageRepository(db qrm.DB, cachedInternalUserIDs *[]int64) *MessageRepository {
	return &MessageRepository{
		db:                    db,
		changes:               make([]model.DataUpdate, 0),
		cachedInternalUserIDs: cachedInternalUserIDs,
	}
}

func (s *MessageRepository) GetChanges() []model.DataUpdate {
	return s.changes
}

func (s *MessageRepository) GetMessages(ctx context.Context, conversationID int64, id *int64, limit int, direction domain.Direction) ([]model.Message, error) {
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
	conversations := make([]model.Message, 0)
	err := stmt.QueryContext(ctx, s.db, &conversations)
	return conversations, err
}

func (s *MessageRepository) GetMessagesBefore(ctx context.Context, conversationID int64, beforeID int64, limit int) ([]model.Message, error) {
	return s.GetMessages(ctx, conversationID, &beforeID, limit, domain.Backward)
}

func (s *MessageRepository) GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]model.Message, error) {
	return s.GetMessages(ctx, conversationID, &afterID, limit, domain.Forward)
}

func (s *MessageRepository) CreateUser(ctx context.Context, messagingAddress string, userType genModel.UserType) (model.User, error) {
	var user model.User
	stmt := table.User.
		INSERT(table.User.MessagingAddress, table.User.Type).
		VALUES(String(messagingAddress), userType).
		RETURNING(table.User.AllColumns)

	err := stmt.QueryContext(ctx, s.db, &user)
	var pqError *pq.Error
	if err != nil && errors.As(err, &pqError) && pqError.Code.Name() == "unique_violation" {
		return user, domain.ErrMessagingAddressExists
	}
	return user, err
}

// GetUser implements MessageRepository
func (s *MessageRepository) GetUserByMessagingAddress(ctx context.Context, messagingAddress string) (model.User, error) {
	var user model.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(table.User.MessagingAddress.EQ(String(messagingAddress)))

	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.ErrUserNotFound
	}

	return user, err
}

func (s *MessageRepository) GetUserById(ctx context.Context, id int64) (model.User, error) {
	var user model.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(table.User.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.ErrUserNotFound
	}

	return user, err
}
func (s *MessageRepository) GetInternalUserIds(ctx context.Context) ([]int64, error) {
	if s.cachedInternalUserIDs != nil {
		return *s.cachedInternalUserIDs, nil
	}
	var ids []int64
	stmt := SELECT(table.User.ID).
		FROM(table.User).
		WHERE(table.User.Type.EQ(enum.UserType.Internal))
	err := stmt.QueryContext(ctx, s.db, &ids)
	if err != nil {
		*s.cachedInternalUserIDs = ids
	}
	return ids, err
}

func (s *MessageRepository) GetOrCreateConversation(ctx context.Context, externalUserID int64, name string) (model.Conversation, error) {
	var conversation model.Conversation
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
			s.changes = append(s.changes, model.DataUpdate{
				Kind: model.DataUpdateKindUpdate,
				Type: model.DataUpdateTypeConversation,
				Data: &conversation,
			})
		}
		return conversation, err

	}
	s.changes = append(s.changes, model.DataUpdate{
		Kind: model.DataUpdateKindCreate,
		Type: model.DataUpdateTypeConversation,
		Data: &conversation,
	})
	return conversation, nil
}

func (s *MessageRepository) CreateMessage(ctx context.Context, conversationID int64, senderID int64, message string, messageType genModel.MessageType) (model.Message, error) {
	var msg model.Message
	stmt := table.
		Message.INSERT(table.Message.ConversationID, table.Message.SenderID, table.Message.Message, table.Message.Type).
		VALUES(Int64(conversationID), Int64(senderID), String(message), messageType).
		RETURNING(table.Message.AllColumns)
	err := stmt.QueryContext(ctx, s.db, &msg)
	if err == nil {
		s.changes = append(s.changes, model.DataUpdate{
			Kind: model.DataUpdateKindCreate,
			Type: model.DataUpdateTypeMessage,
			Data: &msg,
		})
	}
	return msg, err
}

func (s *MessageRepository) GetConversations(ctx context.Context, id *int64, limit int, direction domain.Direction) ([]model.Conversation, error) {
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
	conversations := make([]model.Conversation, 0)
	err := stmt.QueryContext(ctx, s.db, &conversations)
	return conversations, err
}

func (s *MessageRepository) GetConversation(ctx context.Context, id int64) (model.Conversation, error) {
	var conversation model.Conversation
	stmt := SELECT(table.Conversation.AllColumns).
		FROM(table.Conversation).
		WHERE(table.Conversation.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &conversation)

	if errors.Is(err, qrm.ErrNoRows) {
		return conversation, domain.ErrConversationNotFound
	}

	return conversation, err
}

func (s *MessageRepository) GetSyncState(ctx context.Context, user model.User, known model.ClientSyncStateRepresentation) (model.UserSyncState, error) {
	r := model.UserSyncState{}

	// Only need to return the full conversation object for each changed known conversation.
	// Given their changed status it is not required to get last known message because messages for known conversations
	// are updated in an additional step
	changedConversations, newMessagesNewConversations, err := s.GetUserChangedConversations(
		ctx,
		user,
		known.ConversationsUpdateSeq,
		known.Messages)
	if err != nil {
		return r, fmt.Errorf("user sync failed to get updated conversations: %w", err)
	}

	newMessagesExistingConversations := make([]model.ConversationMessages, 0)
	for _, mr := range known.Messages {
		messages, err := s.GetMessages(ctx, mr.ConversationID, &mr.Range.Last, 10000, domain.Forward)
		if err != nil {
			return r, fmt.Errorf("user sync failed to get messages: %w", err)
		}

		if len(messages) > 5000 {
			log.Printf("warning: user sync returned %d messages for conversation %d", len(messages), mr.ConversationID)
		}

		newMessagesExistingConversations = append(newMessagesExistingConversations, model.ConversationMessages{
			ConversationID: mr.ConversationID,
			Messages:       messages,
		})
	}
	// TODO: maybe sort this
	messages := append(newMessagesNewConversations, newMessagesExistingConversations...)

	users, err := s.GetChangedUsersForUser(ctx, user, known.LastKnownUserVersion)
	if err != nil {
		return r, fmt.Errorf("user sync failed to get changed users: %w", err)
	}

	return model.UserSyncState{
		ChangedConversations: changedConversations,
		Messages:             messages,
		Users:                users,
	}, nil

}

func (s *MessageRepository) GetUserChangedConversations(
	ctx context.Context,
	user model.User,
	knownUpdateSeq *model.UpdateSeqRange,
	knownConversationMessages []model.MessageRange) ([]model.Conversation, []model.ConversationMessages, error) {
	condition := Bool(true)

	if user.Type == genModel.UserType_External {
		condition.AND(table.Conversation.ExternalUserID.EQ(Int64(user.ID)))
	}

	orderBy := table.Conversation.UpdatedSeq.DESC() // take newest first, so we can limit

	if knownUpdateSeq != nil {
		condition = condition.AND(table.Conversation.UpdatedSeq.GT(Int64(knownUpdateSeq.Last)))
		orderBy = table.Conversation.UpdatedSeq.ASC() // take oldest first
	}

	var results []struct {
		model.Conversation
		Message *model.Message
	}

	stmt := SELECT(table.Conversation.AllColumns, table.Message.AllColumns).
		FROM(table.Conversation.LEFT_JOIN(table.Message, table.Conversation.LastMessageID.EQ(table.Message.ID))).
		WHERE(condition).
		ORDER_BY(orderBy)

	ORDER_BY(table.Conversation.UpdatedSeq.ASC())

	if knownUpdateSeq == nil {
		stmt = stmt.LIMIT(100) // don't return too many results  for a first sync
	}

	err := stmt.QueryContext(ctx, s.db, results)
	if err != nil {
		return nil, nil, fmt.Errorf("failed to get new results : %w", err)
	}

	knownConversationIDs := make(map[int64]bool, len(knownConversationMessages))
	for _, cm := range knownConversationMessages {
		knownConversationIDs[cm.ConversationID] = true
	}
	// Remove last messages for known results
	messages := make([]model.ConversationMessages, 0)
	conversations := make([]model.Conversation, 0)

	for i := range results {
		if _, ok := knownConversationIDs[results[i].ID]; !ok {
			if lastMessage := results[i].Message; lastMessage != nil {
				messages = append(messages, model.ConversationMessages{
					ConversationID: results[i].ID,
					Messages:       []model.Message{*lastMessage},
				})
			}
		}
		conversations = append(conversations, results[i].Conversation)
	}

	return conversations, messages, nil
}

func (s *MessageRepository) GetChangedUsersForUser(ctx context.Context, user model.User, userVersion model.UserVersion) ([]model.User, error) {
	condition := table.User.UpdatedAt.GT(TimestampT(userVersion.MaxUpdateTime.Time))

	if user.Type == genModel.UserType_Internal {
		condition.AND(table.User.Type.EQ(enum.UserType.Internal).
			OR(table.User.Type.EQ(enum.UserType.External).AND(table.User.ID.EQ(Int64(user.ID)))))
	}

	// TODO: this needs a archival function similar to conversations otherwise this will grow indefinitely
	stmt := SELECT(table.User.AllColumns).
		WHERE(condition).
		ORDER_BY(table.User.UpdatedAt.ASC())

	users := make([]model.User, 0)
	err := stmt.QueryContext(ctx, s.db, &users)
	if err != nil && len(users) > 1000 {
		log.Printf("warning: user sync returned %d users", len(users))
	}
	return users, err
}
