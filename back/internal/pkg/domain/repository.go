package domain

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain/model"
	"context"
	"errors"
)

var (
	ErrMessagingAddressExists = errors.New("phone number exists")
	ErrUserNotFound           = errors.New("user not found")
	ErrConversationNotFound   = errors.New("conversation not found")
)

// Direction is a custom type representing the enum for forward and backward directions.
type Direction int

// Define constants for the enum values.
const (
	DirectionBackward Direction = iota
	DirectionForward
)

type Transaction interface {
	Begin() (ChatRepository, error)
	Commit() ([]model.DataUpdate, error)
	Rollback() error
	MustRollback(ctx context.Context)
	InTransaction(ctx context.Context, f func(ctx context.Context, r ChatRepository) error) ([]model.DataUpdate, error)
	WithoutTransaction() (ChatRepository, error)
}

//nolint:interfacebloat
type ChatRepository interface {
	CreateWorkspace(ctx context.Context, name string) (model.Workspace, error)
	// GetConversations returns all conversations sorted id
	// TODO: it should also work by change date, in order to sync conversations
	// between the first page download and the first Websocket message
	GetConversations(
		ctx context.Context,
		workspaceID int64,
		externalUserID *int64,
		id *int64,
		limit int,
		direction Direction) ([]model.Conversation, error)

	GetConversation(ctx context.Context, id int64) (model.Conversation, error)

	GetMessages(
		ctx context.Context,
		conversationID int64,
		id *int64,
		limit int,
		direction Direction) ([]model.Message, error)

	// GetMessagesAfter returns all messages after the given message RequestID.
	// (typically used to sync messages for a conversation)
	GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]model.Message, error)

	// GetMessagesBefore returns all messages before the given message RequestID.
	// (typically used for progressive loading of messages
	GetMessagesBefore(ctx context.Context, conversationID int64, beforeID int64, limit int) ([]model.Message, error)

	// CreateUser creates a new user with the given phone number.
	// Returns ErrMessagingAddressExists if phone number is already used
	CreateUser(
		ctx context.Context,
		workspaceID int64,
		messagingAddress string,
		userType genModel.UserType,
		passwordHash string) (model.User, error)

	// GetUserByMessagingAddress returns the user having the given phone number. err is ErrUserNotFound if user not found
	GetUserByMessagingAddress(ctx context.Context, workspaceID int64, messagingAddress string) (model.User, error)

	// GetUserByID returns the user having the given user id. err is ErrUserNotFound if user not found
	GetUserByID(ctx context.Context, id int64) (model.User, error)

	// GetOrCreateConversation creates a new conversation between two users or returns existing one
	GetOrCreateConversation(
		ctx context.Context,
		workspaceID int64,
		externalUserID int64,
		name string) (model.Conversation, error)

	CreateMessage(
		ctx context.Context,
		conversationID int64,
		senderID int64,
		message string,
		messageType genModel.MessageType,
		attachments []string) (model.Message, error)

	GetSyncState(
		ctx context.Context,
		user model.User,
		current model.RTCRemote) (model.RTCRemoteUpdate, error)
	GetUserByFBUID(ctx context.Context, workspaceID int64, fbUID string) (model.User, error)
}
