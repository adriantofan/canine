package domain

import (
	"context"
	"errors"
)

var (
	PhoneNumberExistsError = errors.New("phone number exists")
	UserNotFoundError      = errors.New("user not found")
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

	// GetMessagesAfter returns all messages after the given message ID (typically used to sync messages for a conversation)
	GetMessagesAfter(ctx context.Context, conversationID int64, afterID int64, limit int) ([]Message, error)

	// GetMessagesBefore returns all messages before the given message ID (typically used for progressive loading of messages
	GetMessagesBefore(ctx context.Context, conversationID int64, beforeID int64, limit int) ([]Message, error)

	// CreateUser creates a new user with the given phone number. Returns PhoneNumberExistsError if phone number is already used
	CreateUser(ctx context.Context, phone string) (User, error)

	// GetUserByPhone returns the user having the given phone number. err is UserNotFoundError if user not found
	GetUserByPhone(ctx context.Context, phone string) (User, error)

	// GetUserById returns the user having the given user id. err is UserNotFoundError if user not found
	GetUserById(ctx context.Context, id int64) (User, error)

	// GetOrCreateConversation creates a new conversation between two users or returns existing one
	GetOrCreateConversation(ctx context.Context, user1Id, user2Id int64) (Conversation, error)

	CreateMessage(ctx context.Context, conversationID int64, senderID int64, message string) (Message, error)
}
