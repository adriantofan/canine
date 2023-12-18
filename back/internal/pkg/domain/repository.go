package domain

import (
	genModel "back/.gen/canine/public/model"
	"context"
	"errors"
)

var (
	MessagingAddressExistsError = errors.New("phone number exists")
	UserNotFoundError           = errors.New("user not found")
	ConversationNotFoundError   = errors.New("conversation not found")
)

// Direction is a custom type representing the enum for forward and backward directions.
type Direction int

// Define constants for the enum values.
const (
	Backward Direction = iota
	Forward
)

type ChatRepository interface {
	// GetConversations returns all conversations sorted id
	// TODO: it should also work by change date, in order to sync conversations
	// between the first page download and the first Websocket message
	GetConversations(ctx context.Context, id *int64, limit int, direction Direction) ([]Conversation, error)

	GetConversation(ctx context.Context, id int64) (Conversation, error)

	GetMessages(ctx context.Context, conversationID int64, id *int64, limit int, direction Direction) ([]Message, error)

	// GetMessagesAfter returns all messages after the given message ID (typically used to sync messages for a conversation)
	GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]Message, error)

	// GetMessagesBefore returns all messages before the given message ID (typically used for progressive loading of messages
	GetMessagesBefore(ctx context.Context, conversationID int64, beforeID int64, limit int) ([]Message, error)

	// CreateUser creates a new user with the given phone number. Returns MessagingAddressExistsError if phone number is already used
	CreateUser(ctx context.Context, messagingAddress string, userType genModel.UserType) (User, error)

	// GetUserByMessagingAddress returns the user having the given phone number. err is UserNotFoundError if user not found
	GetUserByMessagingAddress(ctx context.Context, messagingAddress string) (User, error)

	// GetUserById returns the user having the given user id. err is UserNotFoundError if user not found
	GetUserById(ctx context.Context, id int64) (User, error)

	// GetOrCreateConversation creates a new conversation between two users or returns existing one
	GetOrCreateConversation(ctx context.Context, externalUserID int64, name string) (Conversation, error)

	CreateMessage(ctx context.Context, conversationID int64, senderID int64, message string, messageType genModel.MessageType) (Message, error)
}
