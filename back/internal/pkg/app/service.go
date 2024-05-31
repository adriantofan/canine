package app

import (
	genModel "back/.gen/canine/public/model"
	appModel "back/internal/pkg/app/model"
	appZitadel "back/internal/pkg/app/zitadel"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/domain/service"

	"google.golang.org/grpc/metadata"

	zitadelManagement "github.com/zitadel/zitadel-go/v2/pkg/client/management"

	"google.golang.org/grpc/codes"

	"google.golang.org/grpc/status"

	"back/internal/pkg/infrastructure"
	"back/internal/pkg/rt/eventlog"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"mime/multipart"

	"github.com/rs/zerolog"
	zitadelAdmin "github.com/zitadel/zitadel-go/v2/pkg/client/admin"
	zAdminPb "github.com/zitadel/zitadel-go/v2/pkg/client/zitadel/admin"
	zManagementPb "github.com/zitadel/zitadel-go/v2/pkg/client/zitadel/management"
)

const ZitadelAppProjectGrantRoleWkspAdmin = "wksp_admin"
const ZitadelAppProjectGrantRoleUser = "user"

type Service struct {
	t                          domain.Transaction
	eventsOutput               eventlog.Output
	eventLogFatalErr           func(error)
	timeService                infrastructure.TimeService
	attachmentsService         service.Attachments
	zitadelAdmin               *zitadelAdmin.Client
	zitadelManagement          *zitadelManagement.Client
	zitadelGrantedProjectID    string
	zitadelGrantedProjectOrgID string
	zitadelAutoApprove         bool
}

func NewService(
	t domain.Transaction,
	eventsOutput eventlog.Output,
	fatalErr func(error),
	attachmentsService service.Attachments,
	zitadelAdmin *zitadelAdmin.Client,
	zitadelManagement *zitadelManagement.Client,
	zitadelGrantedProjectID string,
	zitadelGrantedProjectOrgID string,
	zitadelAutoApprove bool,
) *Service {
	return &Service{
		t:                          t,
		eventsOutput:               eventsOutput,
		eventLogFatalErr:           fatalErr,
		timeService:                infrastructure.NewRealTimeService(),
		attachmentsService:         attachmentsService,
		zitadelAdmin:               zitadelAdmin,
		zitadelManagement:          zitadelManagement,
		zitadelGrantedProjectID:    zitadelGrantedProjectID,
		zitadelGrantedProjectOrgID: zitadelGrantedProjectOrgID,
		zitadelAutoApprove:         true,
	}
}

var (
	ErrRecipientNotFound = errors.New("recipient not found")
	// ErrNotAuthorized mean identity lacks valid credentials:
	//  - user not found in db
	ErrNotAuthorized          = errors.New("user not authorized")
	ErrForbidden              = errors.New("forbidden to perform this action")
	ErrNotFound               = errors.New("not found")
	ErrZitadelWorkspaceExists = errors.New("authorization workspace already exists")

	ErrCreateUserEmailExists = domain.ErrEmailExists
	ErrConversationNotFound  = domain.ErrConversationNotFound

	// internal errors, should not be returned to the client.
	errEventLogInvalidUserType = errors.New("invalid user type")
)

type CreateWorkspaceData struct {
	Name      string `binding:"required" json:"name"`
	Email     string `binding:"required" json:"email"`
	Phone     string `json:"phone"`
	FirstName string `binding:"required" json:"first_name"`
	LastName  string `binding:"required" json:"last_name"`
	Password  string `binding:"required" json:"password"`
}

type CreateUserData struct {
	Email    string            `binding:"required" json:"email"`
	UserType genModel.UserType `binding:"required" json:"user_type"         validate:"oneof=external internal"`
}

type WorkspaceLoginData struct {
	WorkspaceID int64  `binding:"required" json:"workspace_id"`
	Token       string `binding:"required" json:"token"`
	Method      string `binding:"required" json:"method"`
}

type CreateMessageData struct {
	Message       string                 `form:"message"`
	IdempotencyID string                 `form:"idempotency_id"`
	Attachments   []multipart.FileHeader `form:"attachments"`
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

	defer s.t.MustRollback(ctx)
	setUpOrgRequest := zAdminPb.SetUpOrgRequest{
		Org: &zAdminPb.SetUpOrgRequest_Org{ //nolint:exhaustruct
			Name: data.Name,
		},
		User: &zAdminPb.SetUpOrgRequest_Human_{
			Human: &zAdminPb.SetUpOrgRequest_Human{ //nolint:exhaustruct
				UserName: data.Email,
				Profile: &zAdminPb.SetUpOrgRequest_Human_Profile{ //nolint:exhaustruct
					FirstName:         data.FirstName,
					LastName:          data.LastName,
					PreferredLanguage: "fr",
				},
				Email: &zAdminPb.SetUpOrgRequest_Human_Email{
					Email:           data.Email,
					IsEmailVerified: s.zitadelAutoApprove,
				},
				// TODO: do we want a phone number?
				//Phone: &zAdminPb.SetUpOrgRequest_Human_Phone{
				//	Phone:           "",
				//	IsPhoneVerified: false,
				// },
				Password: data.Password,
			},
		},
		//https://zitadel.com/docs/guides/manage/console/managers
		//Roles: []string{"ORG_OWNER_VIEWER", "ORG_USER_MANAGER", "ORG_USER_PERMISSION_EDITOR"},
		Roles: []string{"ORG_OWNER"},
	}

	setupResult, err := s.zitadelAdmin.SetUpOrg(ctx, &setUpOrgRequest)

	if statusErr := status.Convert(err); statusErr != nil {
		switch statusErr.Code() {
		case codes.InvalidArgument:
			return workspaceWithUser, appZitadel.NewInvalidRequestError(statusErr)
		case codes.AlreadyExists:
			return workspaceWithUser, ErrZitadelWorkspaceExists
		}
	}

	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace zitadel set up org: %w", err)
	}

	grantRequest := zManagementPb.AddProjectGrantRequest{
		ProjectId:    s.zitadelGrantedProjectID,
		GrantedOrgId: setupResult.OrgId,
		RoleKeys:     []string{ZitadelAppProjectGrantRoleWkspAdmin, ZitadelAppProjectGrantRoleUser},
	}

	grantResponse, err := s.zitadelManagement.AddProjectGrant(
		metadata.NewOutgoingContext(ctx, metadata.Pairs("x-zitadel-orgid", s.zitadelGrantedProjectOrgID)),
		&grantRequest,
	)

	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace zitadel add project grant: %w", err)
	}

	addUserGrantRequest := zManagementPb.AddUserGrantRequest{
		ProjectId:      s.zitadelGrantedProjectID,
		UserId:         setupResult.UserId,
		ProjectGrantId: grantResponse.GrantId,
		RoleKeys:       []string{ZitadelAppProjectGrantRoleWkspAdmin},
	}

	_, err = s.zitadelManagement.AddUserGrant(
		metadata.NewOutgoingContext(ctx, metadata.Pairs("x-zitadel-orgid", setupResult.OrgId)),
		&addUserGrantRequest)

	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace zitadel add user grant: %w", err)
	}

	workspace, err := repo.CreateWorkspace(ctx, data.Name, setupResult.OrgId)

	if err != nil {
		return workspaceWithUser, fmt.Errorf("CreateWorkspace create workspace: %w", err)
	}

	user, err := repo.CreateUser(ctx, workspace.ID, data.Email, genModel.UserType_Internal, setupResult.UserId)
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
	identity *appModel.Identity,
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
	serverState.SyncToken = marker.MarkerHash
	return serverState, nil
}

func (s *Service) CreateMessage(
	ctx context.Context,
	identity *appModel.Identity,
	conversationID int64,
	messageData CreateMessageData) (model.Message, error) {
	var message model.Message
	// TODO: use idempotency_id
	repo, err := s.t.Begin()
	defer s.t.MustRollback(ctx)
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
	attachments, err := s.attachmentsService.UploadMultipart(ctx, conversationID, messageData.Attachments)

	if err != nil {
		return message, fmt.Errorf("CreateMessage failed upload attachments: %w", err)
	}

	// FIXME: Starting here we should introduce the total ordering of messages
	message, err = repo.CreateMessage(ctx, conversationID, sender.ID, messageData.Message, genModel.MessageType_Msg, attachments)
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

func (s *Service) CreateUser(
	ctx context.Context,
	identity *appModel.Identity,
	userData CreateUserData,
) (model.User, error) {

	var user model.User

	repo, err := s.t.Begin()
	defer s.t.MustRollback(ctx)

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

	user, err = repo.CreateUser(ctx, identity.WorkspaceID, userData.Email, userData.UserType, "")

	if errors.Is(err, domain.ErrEmailExists) {
		return user, ErrCreateUserEmailExists
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
		zerolog.Ctx(ctx).Error().
			Msgf("unknown user type %v", user.Type)
		s.eventLogFatalErr(errEventLogInvalidUserType)

		return user, nil
	}
	s.sendChangesToEventLog(identity.WorkspaceID, changes, destination)

	return user, nil
}

func (s *Service) GetOrCreateConversation(
	ctx context.Context,
	identity *appModel.Identity,
	recipientEmail string) (model.Conversation, error) {
	var conversation model.Conversation

	repo, err := s.t.Begin()
	defer s.t.MustRollback(ctx)

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

	recipient, err := repo.GetUserByEmail(ctx, user.WorkspaceID, recipientEmail)
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
	identity *appModel.Identity,
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
	identity *appModel.Identity,
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

//nolint:gochecknoglobals
var (
	// EndUserAuthorizationPrivate means the user is attempting to authorize a private conversation
	EndUserAuthorizationPrivate = makeEndUserAuthorization(false, "private")
	// EndUserAuthorizationAlreadyAuthorized means the user is already authorized
	EndUserAuthorizationAlreadyAuthorized = makeEndUserAuthorization(true, "already_authorized")
	EndUserAuthorizationNA                = makeEndUserAuthorization(true, "does_not_apply")
	EndUserAuthorizationAlreadyLinked     = makeEndUserAuthorization(false, "already_linked")
	EndUserAuthorizationGranted           = makeEndUserAuthorization(true, "granted")
)

type EndUserAuthorization struct {
	Authorized bool
	Code       string
}

func makeEndUserAuthorization(authorized bool, code string) EndUserAuthorization {
	return EndUserAuthorization{
		Authorized: authorized,
		Code:       code,
	}
}

func (s *Service) CheckAuthorization(
	ctx context.Context,
	workspaceID int64,
	conversationID int64,
	userAuthID string) (EndUserAuthorization, error) {
	chatRepo, err := s.t.WithoutTransaction()
	if err != nil {
		return EndUserAuthorization{}, fmt.Errorf("CheckAuthorization begin transaction: %w", err)
	}

	// this must be one user at most (sole user in the wksp)
	conversation, err := chatRepo.GetConversation(ctx, conversationID)
	if err != nil {
		return EndUserAuthorization{}, fmt.Errorf("CheckAuthorization get conversation: %w", err)
	}

	if conversation.WorkspaceID != workspaceID {
		return EndUserAuthorization{}, ErrNotFound
	}

	if conversation.ExternalUserID == 0 {
		return EndUserAuthorizationPrivate, nil
	}

	wkspUser, err := chatRepo.GetUserByID(ctx, conversation.ExternalUserID)

	if errors.Is(err, domain.ErrUserNotFound) {
		return EndUserAuthorizationPrivate, nil
	}

	if err != nil {
		return EndUserAuthorization{}, fmt.Errorf("CheckAuthorization fail to get workspace user: %w", err)
	}

	if wkspUser.AuthID != "" {
		if wkspUser.AuthID == userAuthID {
			return EndUserAuthorizationAlreadyAuthorized, nil
		}

		return EndUserAuthorizationAlreadyLinked, nil
	}

	if wkspUser.Type != genModel.UserType_External {
		return EndUserAuthorizationNA, nil
	}

	// TODO: determine if the user has an authorized phone number identical to the auth user in zitadel
	hasAuthorizedPhoneNumberIdenticalToAuthUserInZitadel := false
	// there is a user without authID and he is external
	// Happy path: we can link the user because he has an authed phone number
	if hasAuthorizedPhoneNumberIdenticalToAuthUserInZitadel {
		// TODO: set the authID
		return EndUserAuthorizationGranted, nil
	}

	// TODO: need to send code to the phone number or determine if code already sent
	return EndUserAuthorization{}, nil
}

func (s *Service) WorkspaceLogin(
	ctx context.Context,
	data WorkspaceLoginData) (string, error) {
	_, err := s.t.WithoutTransaction()
	if err != nil {
		return "", fmt.Errorf("WorkspaceLogin begin transaction: %w", err)
	}

	return "", nil
}
