package postgres

import (
	"back/internal/pkg/domain/model"
	"back/internal/pkg/infrastructure"
	"context"
	"database/sql"
	"errors"
	"fmt"
	"math/rand"
	"strings"
	"time"

	"github.com/rs/zerolog"

	"github.com/jackc/pgerrcode"

	"github.com/jackc/pgx/v5/pgconn"
	"github.com/jackc/pgx/v5/pgtype"

	"back/.gen/canine/public/enum"
	genModel "back/.gen/canine/public/model"
	"back/.gen/canine/public/table"
	"back/internal/pkg/domain"

	. "github.com/go-jet/jet/v2/postgres" //nolint
	"github.com/go-jet/jet/v2/qrm"
)

type RealTransactionFactory struct {
	db          *sql.DB
	tx          *sql.Tx
	repo        *MessageRepository
	timeService infrastructure.TimeService
}

var (
	ErrTransactionStarted  = errors.New("transaction already started")
	ErrInvalidPasswordHash = fmt.Errorf("password hould be hashed with argon2id")
)

func NewTransactionFactory(db *sql.DB) *RealTransactionFactory {
	return &RealTransactionFactory{
		db:          db,
		tx:          nil,
		repo:        nil,
		timeService: infrastructure.NewRealTimeService(),
		// FIXME: should probably keep only one repository, at least if we want to keep the changes
	}
}
func (t *RealTransactionFactory) SetTimeService(timeService infrastructure.TimeService) {
	t.timeService = timeService
}

func (t *RealTransactionFactory) Begin() (domain.ChatRepository, error) { //nolint:ireturn
	if t.tx != nil || t.repo != nil {
		return nil, ErrTransactionStarted
	}
	tx, err := t.db.Begin()
	if err != nil {
		return nil, fmt.Errorf("failed to start transaction: %w", err)
	}
	t.tx = tx
	t.repo = NewMessageRepository(tx, t.timeService)

	return t.repo, nil
}

func (t *RealTransactionFactory) WithoutTransaction() (domain.ChatRepository, error) { //nolint:ireturn
	if t.tx != nil || t.repo != nil {
		return nil, ErrTransactionStarted
	}

	repo := NewMessageRepository(t.db, t.timeService)

	return repo, nil
}

func (t *RealTransactionFactory) Commit() ([]model.DataUpdate, error) {
	err := t.tx.Commit()
	if err != nil {
		return nil, fmt.Errorf("failed to commit transaction: %w", err)
	}
	t.tx = nil
	changes := t.repo.GetChanges()
	t.repo = nil

	return changes, nil
}

func (t *RealTransactionFactory) Rollback() error {
	if t.tx == nil {
		return nil
	}
	err := t.tx.Rollback()
	t.tx = nil
	t.repo = nil
	if err != nil {
		return fmt.Errorf("failed to rollback transaction: %w", err)
	}

	return nil
}

func (t *RealTransactionFactory) MustRollback(ctx context.Context) {
	err := t.Rollback()
	if err != nil {
		zerolog.Ctx(ctx).Error().Err(err).Msg("failed to rollback transaction")
	}
}

func (t *RealTransactionFactory) InTransaction(
	ctx context.Context,
	worker func(ctx context.Context, r domain.ChatRepository) error) ([]model.DataUpdate, error) {
	repo, err := t.Begin()
	defer func() {
		err := t.Rollback()
		if err != nil {
			zerolog.Ctx(ctx).Error().Err(err).Msg("failed to rollback transaction")
		}
	}()
	if err != nil {
		return nil, err
	}
	err = worker(ctx, repo)
	if err != nil {
		return nil, err
	}

	return t.Commit()
}

type MessageRepository struct {
	db          qrm.DB
	changes     []model.DataUpdate
	timeService infrastructure.TimeService
}

func NewMessageRepository(db qrm.DB, timeService infrastructure.TimeService) *MessageRepository {
	return &MessageRepository{
		db:          db,
		changes:     make([]model.DataUpdate, 0),
		timeService: timeService,
	}
}

func (s *MessageRepository) GetChanges() []model.DataUpdate {
	return s.changes
}

func (s *MessageRepository) GetMessages(
	ctx context.Context,
	conversationID int64,
	fromID *int64,
	limit int,
	direction domain.Direction) ([]model.Message, error) {
	fromConversation := table.Message.ConversationID.EQ(Int64(conversationID))

	stmt := SELECT(table.Message.AllColumns).
		FROM(table.Message).
		LIMIT(int64(limit))

	var condition BoolExpression
	if fromID != nil {
		if direction == domain.DirectionForward {
			condition = AND(fromConversation, table.Message.ID.GT(Int64(*fromID)))
		} else {
			condition = AND(fromConversation, table.Message.ID.LT(Int64(*fromID)))
		}
	} else {
		condition = fromConversation
	}

	stmt = stmt.WHERE(condition)

	if direction == domain.DirectionForward {
		stmt = stmt.ORDER_BY(table.Message.ID.ASC())
	} else {
		stmt = stmt.ORDER_BY(table.Message.ID.DESC())
	}

	messages := make([]model.Message, 0)
	err := stmt.QueryContext(ctx, s.db, &messages)
	if err != nil {
		return messages, fmt.Errorf("failed to get messages: %w", err)
	}

	return messages, nil
}

func (s *MessageRepository) GetMessagesBefore(
	ctx context.Context, conversationID int64, beforeID int64, limit int) ([]model.Message, error) {
	return s.GetMessages(ctx, conversationID, &beforeID, limit, domain.DirectionBackward)
}

func (s *MessageRepository) GetMessagesAfter(
	ctx context.Context, conversationID int64, afterID int64, limit int) ([]model.Message, error) {
	return s.GetMessages(ctx, conversationID, &afterID, limit, domain.DirectionForward)
}

func (s *MessageRepository) CreateUser(
	ctx context.Context,
	workspaceID int64,
	messagingAddress string,
	userType genModel.UserType,
	passwordHash string) (model.User, error) {
	// TODO: check empty hashes in db
	if passwordHash != "" && !strings.HasPrefix(passwordHash, "$argon2id$v") {
		return model.User{}, ErrInvalidPasswordHash
	}
	var user model.User
	stmt := table.User.
		INSERT(table.User.WorkspaceID, table.User.MessagingAddress, table.User.Type, table.User.PasswordHash).
		VALUES(Int64(workspaceID), String(messagingAddress), userType, String(passwordHash)).
		RETURNING(table.User.AllColumns)

	err := stmt.QueryContext(ctx, s.db, &user)
	var pgError *pgconn.PgError

	if errors.As(err, &pgError) && pgError.Code == pgerrcode.UniqueViolation {
		return user, domain.ErrMessagingAddressExists
	}
	if err != nil {
		return user, fmt.Errorf("failed to create user: %w", err)
	}

	s.changes = append(s.changes, model.DataUpdate{
		Kind: model.DataUpdateKindCreate,
		Type: model.DataUpdateTypeUser,
		Data: user,
	})

	return user, nil
}

// GetUserByMessagingAddress implements MessageRepository.
func (s *MessageRepository) GetUserByMessagingAddress(
	ctx context.Context,
	workspaceID int64,
	messagingAddress string) (model.User, error) {
	var user model.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(AND(
			table.User.MessagingAddress.EQ(String(messagingAddress)),
			table.User.WorkspaceID.EQ(Int64(workspaceID))))

	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.ErrUserNotFound
	}
	if err != nil {
		return user, fmt.Errorf("failed to get user by messaging address: %w", err)
	}

	return user, nil
}

func (s *MessageRepository) GetUserByID(ctx context.Context, id int64) (model.User, error) {
	var user model.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(table.User.ID.EQ(Int64(id)))
	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.ErrUserNotFound
	}
	if err != nil {
		return user, fmt.Errorf("failed to get user by id: %w", err)
	}

	return user, nil
}

func (s *MessageRepository) GetOrCreateConversation(
	ctx context.Context,
	workspaceID int64,
	externalUserID int64,
	name string) (model.Conversation, error) {
	var conversation model.Conversation
	createStmt := table.Conversation.
		INSERT(table.Conversation.WorkspaceID, table.Conversation.ExternalUserID, table.Conversation.Name).
		VALUES(Int64(workspaceID), Int64(externalUserID), String(name)).
		RETURNING(table.Conversation.AllColumns).
		ON_CONFLICT(table.Conversation.WorkspaceID, table.Conversation.ExternalUserID, table.Conversation.Name).
		DO_NOTHING()
	err := createStmt.QueryContext(ctx, s.db, &conversation)
	if err != nil {
		if !errors.Is(err, qrm.ErrNoRows) {
			return conversation, fmt.Errorf("failed to create conversation: %w", err)
		}
		loadStmt := SELECT(table.Conversation.AllColumns).
			FROM(table.Conversation).
			WHERE(
				AND(
					table.Conversation.WorkspaceID.EQ(Int64(workspaceID)),
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

			return conversation, fmt.Errorf("failed to load conversation: %w", err)
		}

		return conversation, nil

	}
	s.changes = append(s.changes, model.DataUpdate{
		Kind: model.DataUpdateKindCreate,
		Type: model.DataUpdateTypeConversation,
		Data: &conversation,
	})

	return conversation, nil
}

func (s *MessageRepository) CreateMessage(
	ctx context.Context,
	conversationID int64,
	senderID int64,
	message string,
	messageType genModel.MessageType,
	attachments []string) (model.Message, error) {

	var msg model.Message
	stmt := table.
		Message.INSERT(
		table.Message.ConversationID,
		table.Message.SenderID,
		table.Message.Message,
		table.Message.Type,
		table.Message.Attachments).
		VALUES(
			Int64(conversationID),
			Int64(senderID),
			String(message),
			messageType,
			pgtype.FlatArray[string](attachments),
		).
		RETURNING(table.Message.AllColumns)
	err := stmt.QueryContext(ctx, s.db, &msg)

	if err != nil {
		return msg, fmt.Errorf("failed to create message: %w", err)
	}

	updateStmt := table.Conversation.
		UPDATE(table.Conversation.LastMessageID).
		SET(Int64(msg.ID)).
		WHERE(
			AND(table.Conversation.ID.EQ(Int64(conversationID)),
				OR(table.Conversation.LastMessageID.IS_NULL(),
					table.Conversation.LastMessageID.LT(Int64(msg.ID)))))
	result, err := updateStmt.ExecContext(ctx, s.db)

	if err != nil {
		return msg, fmt.Errorf("failed to update conversation after msg insertion: %w", err)
	}

	count, err := result.RowsAffected()

	if err != nil {
		return msg, fmt.Errorf("failed to fetch rows affected after msg insertion: %w", err)
	}

	if count != 1 {
		return msg, fmt.Errorf("failed to update one conversation after msg insertion: %w", err)
	}

	s.changes = append(s.changes, model.DataUpdate{
		Kind: model.DataUpdateKindCreate,
		Type: model.DataUpdateTypeMessage,
		Data: &msg,
	})

	return msg, nil
}

func (s *MessageRepository) GetConversations(
	ctx context.Context,
	workspaceID int64,
	externalUserID *int64,
	id *int64,
	limit int,
	direction domain.Direction) ([]model.Conversation, error) {
	expression := table.Conversation.WorkspaceID.EQ(Int64(workspaceID))
	if externalUserID != nil {
		expression = expression.AND(table.Conversation.ExternalUserID.EQ(Int64(*externalUserID)))
	}
	stmt := SELECT(table.Conversation.AllColumns).
		FROM(table.Conversation)
	if direction == domain.DirectionForward {
		if id != nil {
			expression = expression.AND(table.Conversation.ID.GT(Int64(*id)))
		}
		stmt = stmt.ORDER_BY(table.Conversation.ID.ASC()).LIMIT(int64(limit))
	} else {
		if id != nil {
			expression = expression.AND(table.Conversation.ID.LT(Int64(*id)))
		}
		stmt = stmt.ORDER_BY(table.Conversation.ID.DESC()).LIMIT(int64(limit))
	}
	stmt = stmt.WHERE(expression)
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

func (s *MessageRepository) GetSyncState(ctx context.Context, user model.User, known model.RTCRemote) (model.RTCRemoteUpdate, error) {
	r := model.RTCRemoteUpdate{}

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
		messages, err := s.GetMessages(ctx, mr.ConversationID, &mr.Range.Last, 10000, domain.DirectionForward)
		if err != nil {
			return r, fmt.Errorf("user sync failed to get messages: %w", err)
		}

		const maxMessageCountSyncPerConversation = 5000
		if len(messages) > maxMessageCountSyncPerConversation {
			zerolog.Ctx(ctx).Error().
				Msgf("warning: user sync returned %d messages for conversation %d", len(messages), mr.ConversationID)
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

	return model.RTCRemoteUpdate{
		Conversations: changedConversations,
		Messages:      messages,
		Users:         users,
	}, nil

}

func (s *MessageRepository) GetUserChangedConversations(
	ctx context.Context,
	user model.User,
	knownUpdateSeq *model.UpdateSeqRange,
	knownConversationMessages []model.MessageRange) ([]model.Conversation, []model.ConversationMessages, error) {
	condition := table.Conversation.WorkspaceID.EQ(Int64(user.WorkspaceID))

	if user.Type == genModel.UserType_External {
		condition = condition.AND(table.Conversation.ExternalUserID.EQ(Int64(user.ID)))
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

	err := stmt.QueryContext(ctx, s.db, &results)
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
	condition := AND(
		table.User.UpdatedAt.GT(TimestampT(userVersion.MaxUpdateTime.Time)),
		table.User.WorkspaceID.EQ(Int64(user.WorkspaceID)),
	)

	if user.Type == genModel.UserType_External {
		condition = condition.AND(
			OR(
				table.User.Type.EQ(enum.UserType.Internal),
				AND(
					table.User.Type.EQ(enum.UserType.External),
					table.User.ID.EQ(Int64(user.ID)),
				)))
	}

	// TODO: this needs a archival function similar to conversations otherwise this will grow indefinitely
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(condition).
		ORDER_BY(table.User.UpdatedAt.ASC())

	users := make([]model.User, 0)
	err := stmt.QueryContext(ctx, s.db, &users)
	if err != nil && len(users) > 1000 {
		zerolog.Ctx(ctx).Warn().Msgf("warning: user sync returned %d users", len(users))
	}
	return users, err
}

func (s *MessageRepository) CreateWorkspace(ctx context.Context, name string) (model.Workspace, error) {
	var workspace model.Workspace
	id := s.timeService.Now().UnixMilli()
	for i := 0; i <= 4; i++ {
		stmt := table.Workspace.
			INSERT(table.Workspace.ID, table.Workspace.Name).
			VALUES(Int64(id), String(name)).
			RETURNING(table.Workspace.AllColumns)
		err := stmt.QueryContext(ctx, s.db, &workspace)
		if errors.Is(err, qrm.ErrNoRows) {
			time.Sleep(time.Duration(rand.Float64()*10) * time.Millisecond)
		}
		if err == nil {
			return workspace, err
		}
	}
	return workspace, fmt.Errorf("failed to create workspace (retry) %s", name)
}

func (s *MessageRepository) GetUserByFBUID(ctx context.Context, workspaceID int64, fbUID string) (model.User, error) {
	var user model.User
	stmt := SELECT(table.User.AllColumns).
		FROM(table.User).
		WHERE(
			AND(
				table.User.WorkspaceID.EQ(Int64(workspaceID)),
				// TODO add this back when the case
				//table.User.FBUID.EQ(String(fbUID)),
			))
	err := stmt.QueryContext(ctx, s.db, &user)

	if errors.Is(err, qrm.ErrNoRows) {
		return user, domain.ErrUserNotFound
	}
	if err != nil {
		return user, fmt.Errorf("failed to get user by FBUID: %w", err)
	}

	return user, nil
}
