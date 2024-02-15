package app

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/auth/hash"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/infrastructure"
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
	timeService      infrastructure.TimeService
}

func NewService(t domain.Transaction, eventsOutput eventlog.Output, fatalErr func(error)) *Service {
	return &Service{
		t:                t,
		eventsOutput:     eventsOutput,
		eventLogFatalErr: fatalErr,
		timeService:      infrastructure.NewRealTimeService(),
	}
}

var (
	ErrRecipientNotFound = errors.New("recipient not found")
	// ErrNotAuthorized mean identity lacks valid credentials:
	//  - user not found in db
	ErrNotAuthorized = errors.New("user not authorized")
	ErrForbidden     = errors.New("forbidden to perform this action")

	ErrCreateUserMessagingAddressExists = domain.ErrMessagingAddressExists
	ErrConversationNotFound             = domain.ErrConversationNotFound

	// internal errors, should not be returned to the client.
	errEventLogInvalidUserType = errors.New("invalid user type")
)

type CreateWorkspaceData struct {
	Name             string `binding:"required" json:"name"`
	MessagingAddress string `binding:"required" json:"messaging_address"`
	Password         string `binding:"required" json:"password"`
}

type CreateUserData struct {
	MessagingAddress string            `binding:"required" json:"messaging_address"`
	UserType         genModel.UserType `binding:"required" json:"user_type"         validate:"oneof=external internal"`
	Password         string            `binding:"required" json:"password"`
}

type CreateMessageData struct {
	Message string `json:"message"`
}

type WorkspaceWithUser struct {
	Workspace model.Workspace `json:"workspace"`
	User      model.User      `json:"user"`
}

func (s *Service) SetTimeService(timeService infrastructure.TimeService) {
	s.timeService = timeService
}

func (s *Service) CreateWorkspace(
	ctx context.Context,
	data CreateWorkspaceData) (WorkspaceWithUser, error) {
	var workspaceWithUser WorkspaceWithUser

	repo, err := s.t.Begin()
	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace begin transaction: %w", err)
	}

	defer s.t.MustRollback()

	workspace, err := repo.CreateWorkspace(ctx, data.Name)
	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace create workspace: %w", err)
	}
	passwordHash, err := hash.CreateHash(data.Password)
	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace hash password: %w", err)
	}
	user, err := repo.CreateUser(ctx, workspace.ID, data.MessagingAddress, genModel.UserType_Internal, passwordHash)
	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace create user: %w", err)
	}

	_, err = s.t.Commit()
	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace commit: %w", err)
	}

	return WorkspaceWithUser{Workspace: workspace, User: user}, nil
}

func (s *Service) GetRTCRemoteUpdate(
	ctx context.Context,
	identity *Identity,
	clientState model.RTCRemote) (model.RTCRemoteUpdate, error) {

	var workspaceID int64

	var serverState model.RTCRemoteUpdate
	repo, err := s.t.WithoutTransaction()
	if err != nil {
		return serverState, fmt.Errorf("GetRTCRemoteUpdate begin transaction: %w", err)
	}

	var user model.User
	user, err = repo.GetUserByID(ctx, identity.UserID)
	if err != nil {
		return serverState, ErrNotAuthorized
	}

	marker := eventlog.MakeMarkerEvent(workspaceID)
	err = s.eventsOutput.Write(marker)
	if err != nil {
		// even if it would lead to a crash, on a create/edit request, here it is technically not fatal
		return serverState, fmt.Errorf("GetRTCRemoteUpdate write marker event: %w", err)
	}

	serverState, err = repo.GetSyncState(ctx, user, clientState)
	if err != nil {
		return serverState, fmt.Errorf("GetRTCRemoteUpdate get sync state: %w", err)
	}

	return serverState, nil
}

func (s *Service) CreateMessage(
	ctx context.Context,
	identity *Identity,
	conversationID int64,
	messageData CreateMessageData) (model.Message, error) {
	var message model.Message

	repo, err := s.t.Begin()
	defer s.t.MustRollback()
	if err != nil {
		return message, fmt.Errorf("CreateMessage begin transaction: %w", err)
	}

	sender, err := repo.GetUserByID(ctx, identity.UserID)

	if errors.Is(err, domain.ErrUserNotFound) {
		return message, ErrNotAuthorized
	}

	if err != nil {
		return message, fmt.Errorf("CreateMessage get sender: %w", err)
	}

	conversation, err := repo.GetConversation(ctx, conversationID)
	if errors.Is(err, domain.ErrConversationNotFound) {
		return message, ErrConversationNotFound
	}
	if err != nil {
		return message, fmt.Errorf("CreateMessage get conversation: %w", err)
	}

	if sender.Type == genModel.UserType_External && conversation.ExternalUserID != sender.ID {
		return message, ErrForbidden
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
	s.sendChangesToEventLog(identity.WorkspaceID, changes, destination)

	return message, nil
}

func (s *Service) CreateUser(ctx context.Context, identity *Identity, userData CreateUserData) (model.User, error) {

	var user model.User

	repo, err := s.t.Begin()
	defer s.t.MustRollback()

	if err != nil {
		return user, fmt.Errorf("CreateUser begin transaction: %w", err)
	}

	creator, err := repo.GetUserByID(ctx, identity.UserID)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			// TODO: not authorized or not found?
			return user, ErrRecipientNotFound
		}

		return user, fmt.Errorf("CreateUser get creator %d : %w", identity.UserID, err)
	}

	if creator.Type != genModel.UserType_Internal {
		return user, ErrForbidden
	}

	hashedPassword, err := hash.CreateHash(userData.Password)
	if err != nil {
		return user, fmt.Errorf("CreateUser hash password: %w", err)
	}

	user, err = repo.CreateUser(ctx, identity.WorkspaceID, userData.MessagingAddress, userData.UserType, hashedPassword)

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
	s.sendChangesToEventLog(identity.WorkspaceID, changes, destination)

	return user, nil
}

func (s *Service) GetOrCreateConversation(
	ctx context.Context,
	identity *Identity,
	recipientMessagingAddress string) (model.Conversation, error) {
	var conversation model.Conversation

	repo, err := s.t.Begin()
	defer s.t.MustRollback()

	if err != nil {
		return conversation, fmt.Errorf("CreateChat begin transaction: %w", err)
	}

	user, err := repo.GetUserByID(ctx, identity.UserID)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			return conversation, ErrNotAuthorized
		}

		return conversation, fmt.Errorf("CreateChat get user: %w", err)
	}

	if user.Type != genModel.UserType_Internal {
		return conversation, ErrForbidden
	}

	recipient, err := repo.GetUserByMessagingAddress(ctx, user.WorkspaceID, recipientMessagingAddress)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			return conversation, ErrRecipientNotFound
		}

		return conversation, fmt.Errorf("CreateChat get recipient: %w", err)
	}

	conversation, err = repo.GetOrCreateConversation(ctx, identity.WorkspaceID, recipient.ID, "")

	if err != nil {
		return conversation, fmt.Errorf("CreateChat get or create conversation: %w", err)
	}

	changes, err := s.t.Commit()
	if err != nil {
		return model.Conversation{}, fmt.Errorf("CreateChat commit: %w", err)
	}

	destination := eventlog.MakeDestinationExternalMessage(recipient.ID)
	s.sendChangesToEventLog(identity.WorkspaceID, changes, destination)

	return conversation, nil
}

func (s *Service) GetConversations(
	ctx context.Context,
	identity *Identity,
	fromID *int64,
	limit int,
	direction domain.Direction) ([]model.Conversation, error) {
	repo, err := s.t.WithoutTransaction()
	if err != nil {
		return nil, fmt.Errorf("GetConversations begin transaction: %w", err)
	}
	var externalUserID *int64
	user, err := repo.GetUserByID(ctx, identity.UserID)
	if err != nil {
		return nil, ErrNotAuthorized
	}
	if user.Type == genModel.UserType_External {
		externalUserID = &user.ID
	}
	conversations, err := repo.GetConversations(ctx, identity.WorkspaceID, externalUserID, fromID, limit, direction)
	if err != nil {
		return nil, fmt.Errorf("GetConversations get conversations: %w", err)
	}

	return conversations, nil
}

func (s *Service) GetConversationMessages(
	ctx context.Context,
	identity *Identity,
	conversationID int64,
	fromID *int64,
	limit int,
	direction domain.Direction) ([]model.Message, error) {
	repo, err := s.t.WithoutTransaction()
	if err != nil {
		return nil, fmt.Errorf("GetConversationMessages begin transaction: %w", err)
	}
	user, err := repo.GetUserByID(ctx, identity.UserID)
	if err != nil {
		return nil, ErrNotAuthorized
	}
	conversation, err := repo.GetConversation(ctx, conversationID)
	if err != nil {
		return nil, fmt.Errorf("GetConversationMessages get conversation: %w", err)
	}

	if conversation.WorkspaceID != identity.WorkspaceID {
		return nil, ErrConversationNotFound // it is not found from the perspective of the user
	}

	if user.Type == genModel.UserType_External && conversation.ExternalUserID != user.ID {
		return nil, ErrForbidden
	}

	messages, err := repo.GetMessages(ctx, conversationID, fromID, limit, direction)
	if err != nil {
		return nil, fmt.Errorf("GetConversationMessages get messages: %w", err)
	}

	return messages, nil
}

func (s *Service) sendChangesToEventLog(
	workspaceID int64,
	changes []model.DataUpdate,
	destination eventlog.Destination) {
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
			workspaceID, destination, payload, s.timeService.NowUTC()))
		if err != nil {
			// TODO: log more context about what happened
			s.eventLogFatalErr(fmt.Errorf("send change: %w", err))

			break
		}
	}
}
