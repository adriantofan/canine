package repository

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/infrastructure"
	"context"
)

type MemoryMessageRepository struct {
	messages           []model.Message
	conversations      []model.Conversation
	users              []model.User
	timeService        infrastructure.TimeService
	nextUserID         int64
	nextConversationID int64
	nextMessageID      int64
}

func (r *MemoryMessageRepository) GetConversation(ctx context.Context, id int64) (model.Conversation, error) {
	//TODO implement me
	panic("implement me")
}

func NewInMemoryRepository(timeService infrastructure.TimeService) *MemoryMessageRepository {
	return &MemoryMessageRepository{
		messages:           make([]model.Message, 0),
		users:              make([]model.User, 0),
		timeService:        timeService,
		nextUserID:         1,
		conversations:      make([]model.Conversation, 0),
		nextConversationID: 1,
		nextMessageID:      1,
	}
}

func (r *MemoryMessageRepository) GetMessagesAfter(
	ctx context.Context, conversationID int64, afterID int64, limit int) ([]model.Message, error) {
	panic("implement me")
}
func (r *MemoryMessageRepository) GetMessagesBefore(
	ctx context.Context, conversationID int64, beforeID int64, limit int) ([]model.Message, error) {
	panic("implement me")
}
func (r *MemoryMessageRepository) CreateUser(
	_ context.Context, messagingAddress string, userType genModel.UserType) (model.User, error) {
	for _, user := range r.users {
		if user.MessagingAddress == messagingAddress {
			return model.User{}, domain.ErrMessagingAddressExists
		}
	}

	newID := r.nextUserID
	r.nextUserID++
	user := model.User{
		ID:               newID,
		MessagingAddress: messagingAddress,
		Type:             userType,
	}
	r.users = append(r.users, user)
	return user, nil
}
func (r *MemoryMessageRepository) GetUserByMessagingAddress(
	_ context.Context, messagingAddress string) (model.User, error) {
	for _, user := range r.users {
		if user.MessagingAddress == messagingAddress {
			return user, nil
		}
	}
	return model.User{}, domain.ErrUserNotFound
}

func (r *MemoryMessageRepository) GetUserById(_ context.Context, id int64) (model.User, error) {
	for _, user := range r.users {
		if user.ID == id {
			return user, nil
		}
	}
	return model.User{}, domain.ErrUserNotFound
}
func (r *MemoryMessageRepository) GetOrCreateConversation(ctx context.Context, externalUserID int64, name string) (model.Conversation, error) {

	for _, conversation := range r.conversations {
		if conversation.ExternalUserID == externalUserID && conversation.Name == name {
			return conversation, nil
		}
	}
	conversation := model.Conversation{
		ID:             r.nextConversationID,
		ExternalUserID: externalUserID,
		Name:           name,
		CreatedAt:      model.NewMillisecondsTime(r.timeService.NowUTC()),
	}
	r.nextConversationID++
	r.conversations = append(r.conversations, conversation)
	return conversation, nil
}

func (r *MemoryMessageRepository) CreateMessage(_ context.Context, conversationID int64, senderID int64, message string, messageType genModel.MessageType) (model.Message, error) {
	newID := r.nextMessageID
	r.nextMessageID++
	msg := model.Message{
		ID:             newID,
		ConversationID: conversationID,
		SenderID:       senderID,
		Message:        message,
		Type:           messageType,
		CreatedAt:      model.NewMillisecondsTime(r.timeService.NowUTC()),
	}
	r.messages = append(r.messages, msg)
	return msg, nil
}

func (r *MemoryMessageRepository) GetConversations(ctx context.Context, id *int64, limit int, direction domain.Direction) ([]model.Conversation, error) {
	// TODO: make sure it works :-) (it's not tested)
	if direction == domain.DirectionForward {
		if id != nil {
			for i, conversation := range r.conversations {
				if conversation.ID == *id {
					if i+1 < len(r.conversations) {
						return r.conversations[i+1 : i+1+limit], nil
					}
					return []model.Conversation{}, nil
				}
			}
		}
		return r.conversations[:limit], nil
	} else {
		if id != nil {
			for i, conversation := range r.conversations {
				if conversation.ID == *id {
					if i-limit >= 0 {
						return reverseSlice(r.conversations[i-limit : i]), nil
					}
					return []model.Conversation{}, nil
				}
			}
		}
		if limit > len(r.conversations) {
			return r.conversations, nil
		}
		return reverseSlice(r.conversations[len(r.conversations)-limit:]), nil
	}
}
func (r *MemoryMessageRepository) GetMessages(ctx context.Context, conversationID int64, id *int64, limit int, direction domain.Direction) ([]model.Message, error) {
	panic("implement me")
}

func (r *MemoryMessageRepository) GetSyncState(ctx context.Context, userID int64, current model.ClientSyncStateRepresentation) (model.UserSyncState, error) {
	panic("implement MemoryMessageRepository.GetSyncState")
}

func reverseSlice[T any](input []T) []T {
	length := len(input)
	reversed := make([]T, length)

	for i, v := range input {
		reversed[length-i-1] = v
	}

	return reversed
}
