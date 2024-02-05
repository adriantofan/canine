package app

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/user_queue"
	"errors"
	"fmt"
)

type Service struct {
	t  domain.Transaction
	wq user_queue.WriteQueue
}

func NewService(t domain.Transaction) *Service {
	return &Service{t: t}
}

var (
	ErrUserNotFound      = domain.ErrUserNotFound
	ErrUserNotAuthorized = errors.New("user not authorized to create chat")
)

func (s *Service) GetOrCreateConversation(
	c SerialContextStrict,
	user model.User,
	recipientMessagingAddress string) (model.Conversation, error) {

	if user.Type == genModel.UserType_Internal {
		return model.Conversation{}, ErrUserNotAuthorized
	}

	repo, err := s.t.Begin()
	defer s.t.MustRollback()

	if err != nil {
		return model.Conversation{}, fmt.Errorf("CreateChat begin transaction: %w", err)
	}

	recipient, err := repo.GetUserByMessagingAddress(c, recipientMessagingAddress)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			return model.Conversation{}, ErrUserNotFound
		}
		return model.Conversation{}, fmt.Errorf("CreateChat get recipient: %w", err)
	}

	conversation, err := repo.GetOrCreateConversation(c, recipient.ID, "")

	if err != nil {
		return model.Conversation{}, fmt.Errorf("CreateChat get or create conversation: %w", err)
	}

	changes, err := s.t.Commit()
	if err != nil {
		return model.Conversation{}, fmt.Errorf("CreateChat commit: %w", err)
	}

	if err := s.wq.Enqueue(c) {

	}

	return conversation, nil

}
