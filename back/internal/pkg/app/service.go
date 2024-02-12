package app

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/rt/eventlog"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"log"
)

var ()

type Service struct {
	t                domain.Transaction
	eventsOutput     eventlog.Output
	eventLogFatalErr func(error)
}

func NewService(t domain.Transaction, eventsOutput eventlog.Output, fatalErr func(error)) *Service {
	return &Service{t: t, eventsOutput: eventsOutput, eventLogFatalErr: fatalErr}
}

var (
	ErrUserNotFound      = domain.ErrUserNotFound
	ErrUserNotAuthorized = errors.New("user not authorized")

	ErrCreateUserMessagingAddressExists = domain.ErrMessagingAddressExists
	ErrSenderNotFound                   = errors.New("sender not found")
	ErrConversationNotFound             = domain.ErrConversationNotFound

	// internal errors, should not be returned to the client.
	errEventLogInvalidUserType = errors.New("invalid user type")
)

type CreateUserData struct {
	MessagingAddress string            `binding:"required" json:"messaging_address"`
	UserType         genModel.UserType `binding:"required" json:"user_type"         validate:"oneof=external internal"`
}

type CreateMessageData struct {
	Message  string `json:"message"`
	SenderID int64  `json:"sender_id"`
}

func (s *Service) CreateMessage(
	ctx context.Context,
	user model.User,
	conversationID int64,
	messageData CreateMessageData) (model.Message, error) {
	var message model.Message

	repo, err := s.t.Begin()
	defer s.t.MustRollback()
	if err != nil {
		return message, fmt.Errorf("CreateMessage begin transaction: %w", err)
	}

	sender, err := repo.GetUserByID(ctx, messageData.SenderID)

	if errors.Is(err, domain.ErrUserNotFound) {
		return message, ErrSenderNotFound
	}

	if err != nil {
		return message, fmt.Errorf("CreateMessage get sender: %w", err)
	}

	if sender.ID != user.ID {
		return message, ErrUserNotAuthorized
	}

	conversation, err := repo.GetConversation(ctx, conversationID)
	if errors.Is(err, domain.ErrConversationNotFound) {
		return message, ErrConversationNotFound
	}
	if err != nil {
		return message, fmt.Errorf("CreateMessage get conversation: %w", err)
	}

	if sender.Type == genModel.UserType_External && conversation.ExternalUserID != sender.ID {
		return message, ErrUserNotAuthorized
	}

	message, err = repo.CreateMessage(ctx, conversationID, sender.ID, messageData.Message, genModel.MessageType_Msg)
	if err != nil {
		return message, fmt.Errorf("CreateMessage create message: %w", err)
	}

	changes, err := s.t.Commit()
	if err != nil {
		return model.Message{}, fmt.Errorf("CreateMessage commit: %w", err)
	}

	destination := eventlog.MakeDestinationExternalMessage(conversation.ExternalUserID)
	s.sendChangesToEventLog(changes, destination)

	return message, nil
}

func (s *Service) CreateUser(ctx context.Context, creator model.User, userData CreateUserData) (model.User, error) {
	var user model.User
	if creator.Type == genModel.UserType_Internal {
		return user, ErrUserNotAuthorized
	}

	repo, err := s.t.Begin()
	defer s.t.MustRollback()
	if err != nil {
		return user, fmt.Errorf("CreateUser begin transaction: %w", err)
	}

	user, err = repo.CreateUser(ctx, userData.MessagingAddress, userData.UserType)

	if errors.Is(err, domain.ErrMessagingAddressExists) {
		return user, ErrCreateUserMessagingAddressExists
	}

	if err != nil {
		return user, fmt.Errorf("CreateUser create user: %w", err)
	}

	changes, err := s.t.Commit()
	if err != nil {
		return model.User{}, fmt.Errorf("CreateUser commit: %w", err)
	}

	var destination eventlog.Destination
	switch user.Type {
	case genModel.UserType_Bot:
		destination = eventlog.MakeDestinationInternalMessage()
	case genModel.UserType_Internal:
		destination = eventlog.MakeDestinationBroadcastAll()
	case genModel.UserType_External:
		destination = eventlog.MakeDestinationExternalMessage(user.ID)
	default:
		log.Println("unknown user type", user.Type)
		s.eventLogFatalErr(errEventLogInvalidUserType)

		return user, nil
	}
	s.sendChangesToEventLog(changes, destination)

	return user, nil
}

func (s *Service) GetOrCreateConversation(
	ctx context.Context,
	user model.User,
	recipientMessagingAddress string) (model.Conversation, error) {
	var conversation model.Conversation

	if user.Type == genModel.UserType_Internal {
		return conversation, ErrUserNotAuthorized
	}

	repo, err := s.t.Begin()
	defer s.t.MustRollback()

	if err != nil {
		return conversation, fmt.Errorf("CreateChat begin transaction: %w", err)
	}

	recipient, err := repo.GetUserByMessagingAddress(ctx, recipientMessagingAddress)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			return conversation, ErrUserNotFound
		}

		return conversation, fmt.Errorf("CreateChat get recipient: %w", err)
	}

	conversation, err = repo.GetOrCreateConversation(ctx, recipient.ID, "")

	if err != nil {
		return conversation, fmt.Errorf("CreateChat get or create conversation: %w", err)
	}

	changes, err := s.t.Commit()
	if err != nil {
		return model.Conversation{}, fmt.Errorf("CreateChat commit: %w", err)
	}

	destination := eventlog.MakeDestinationExternalMessage(recipient.ID)
	s.sendChangesToEventLog(changes, destination)

	return conversation, nil
}

func (s *Service) sendChangesToEventLog(changes []model.DataUpdate, destination eventlog.Destination) {
	// About better logging of errors here:
	// Probably need to extract info from context(convert it to gin) and add it to log
	for _, change := range changes {
		payload, err := json.Marshal(change)
		if err != nil {
			// TODO: log more context about what happened
			s.eventLogFatalErr(fmt.Errorf("marshal change: %w", err))

			break
		}

		err = s.eventsOutput.Write(eventlog.MakeEvent(
			0, destination, payload))
		if err != nil {
			// TODO: log more context about what happened
			s.eventLogFatalErr(fmt.Errorf("send change: %w", err))

			break
		}
	}
}
