//go:build integration

package app_test

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/app"
	"back/internal/pkg/auth/hash"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	"back/internal/pkg/domain/infrastructure/repository/postgres/test_util"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/rt/eventlog"
	"context"
	"encoding/json"
	"fmt"
	"time"

	"github.com/jmoiron/sqlx"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

type OutputMock struct {
	events []eventlog.Event
}

func (o *OutputMock) Write(e eventlog.Event) error {
	o.events = append(o.events, e)

	return nil
}

type TimeServiceMock struct {
	now time.Time
}

func NewTimeServiceMock() *TimeServiceMock {
	return &TimeServiceMock{now: time.Now()}
}

func (t *TimeServiceMock) NowUTC() time.Time {
	return t.now.UTC()
}

func (t *TimeServiceMock) Now() time.Time {
	return t.now
}

var _ = Describe("ServiceIntegration", Ordered, func() {
	var testDB *sqlx.DB
	var transactionFactory *postgres.RealTransactionFactory
	var service *app.Service
	var output *OutputMock
	var ctx serviceContext
	var timeServiceMock = NewTimeServiceMock()
	fatal := func(err error) {
		Fail(fmt.Sprintf("unexpected call with error: %v", err))
	}

	It("simple happy path", func() {
		By("build sentinel workspace")
		// TODO: concurrent workspace creation is not tested, this is just to push it working
		makeSentinelWorkspace(ctx)
		timeServiceMock.now = timeServiceMock.now.Add(time.Millisecond)

		By("one exchange in a workspace with emma and kitty")
		now := timeServiceMock.NowUTC()

		testWksp := newTestWorkspace(ctx)
		kitty := testWksp.makeKitty(ctx)
		withKitty := testWksp.makeExternalConversation(ctx, kitty)
		sendMessage(ctx, testWksp.emmaOwner, withKitty, "hello kitty")
		sendMessage(ctx, kitty, withKitty, "hello zoe")
		kittyMessages := getMessages(ctx, kitty, withKitty, nil, 10, domain.DirectionForward)
		emmaMessages := getMessages(ctx, testWksp.emmaOwner, withKitty, nil, 10, domain.DirectionForward)
		Expect(kittyMessages).To(HaveLen(2))
		Expect(emmaMessages).To(HaveLen(2))
		Expect(kittyMessages).To(ConsistOf(emmaMessages))
		By("introducing ava")
		output.events = nil
		broadcast := eventlog.MakeDestinationBroadcastAll()
		ava := testWksp.makeAva(ctx)

		avaCreatedEvent := makeUserEvent(ava, broadcast, model.DataUpdateKindCreate, now)
		Expect(output.events).To(ConsistOf([]eventlog.Event{avaCreatedEvent}))

		By("ava sends a message to kitty")
		output.events = nil
		broadcastWithKitty := eventlog.MakeDestinationExternalMessage(kitty.ID)
		msgAvaToKitty := sendMessage(ctx, ava, withKitty, "hello kitty, ava here")
		evaSendMsgEvent := makeMessageEvent(
			testWksp.workspace.ID,
			msgAvaToKitty,
			broadcastWithKitty,
			model.DataUpdateKindCreate, now)
		Expect(output.events).To(ConsistOf([]eventlog.Event{evaSendMsgEvent}))

		By("introducing whiskers")
		whiskers := testWksp.makeWhiskers(ctx)
		withWiskers := testWksp.makeExternalConversation(ctx, whiskers)
		mskEmmaToWiskers := sendMessage(ctx, testWksp.emmaOwner, withWiskers, "hello wiskers")

		By("ava initiates RT")
		state := startRTC(ctx, ava, model.NewClientSyncStateRepresentation())
		verifySyncState(
			state,
			[]model.Conversation{withKitty, withWiskers},
			[]model.ConversationMessages{
				{ConversationID: withKitty.ID, Messages: []model.Message{msgAvaToKitty}},
				{ConversationID: withWiskers.ID, Messages: []model.Message{mskEmmaToWiskers}},
			},
			[]model.User{testWksp.emmaOwner, ava, kitty, whiskers})

		By("kitty initiates RT")
		state = startRTC(ctx, kitty, model.NewClientSyncStateRepresentation())
		verifySyncState(
			state,
			[]model.Conversation{withKitty},
			[]model.ConversationMessages{
				{ConversationID: withKitty.ID, Messages: []model.Message{msgAvaToKitty}},
			},
			[]model.User{testWksp.emmaOwner, kitty, ava})

	})

	BeforeAll(func() {
		testDB, _ = test_util.MustCreateTestDBWithMigrations(false, "file://./../../../migrations")
		transactionFactory = postgres.NewTransactionFactory(testDB)
		transactionFactory.SetTimeService(timeServiceMock)
	})

	BeforeEach(func() {
		testDB.MustExec(truncateTablesStmt())
		output = &OutputMock{} //nolint:exhaustruct
		service = app.NewService(transactionFactory, output, fatal)
		service.SetTimeService(timeServiceMock)
		ctx = serviceContext{
			service: service,
			Context: context.Background(),
		}
	})
})

type serviceContext struct {
	service *app.Service
	//nolint:containedctx
	context.Context
}

type testWorkspace struct {
	workspace model.Workspace
	// internal users
	emmaOwner model.User
	ava       model.User
	// external users
	kitty    model.User
	whiskers model.User
}

func newTestWorkspace(ctx serviceContext) testWorkspace {
	workspace, owner := makeWorkspace(ctx, "girls", "emmaOwner@example.com", "emmaOwner for ever")
	result := testWorkspace{ //nolint:exhaustruct
		workspace: workspace,
		emmaOwner: owner,
	}
	result.emmaOwner = owner

	return result
}

func (g *testWorkspace) makeAva(ctx serviceContext) model.User {
	identity := app.Identity{
		WorkspaceID: g.workspace.ID,
		UserID:      g.emmaOwner.ID,
	}
	user := makeInternalUser(ctx, &identity, "ava@example.com", "ava for ever")
	g.ava = user

	return user
}

func (g *testWorkspace) makeKitty(ctx serviceContext) model.User {
	identity := app.Identity{
		WorkspaceID: g.workspace.ID,
		UserID:      g.emmaOwner.ID,
	}
	user := makeExternalUser(ctx, &identity, "kitty@example.com", "kitty for ever")
	g.kitty = user

	return user
}

func (g *testWorkspace) makeWhiskers(ctx serviceContext) model.User {
	identity := app.Identity{
		WorkspaceID: g.workspace.ID,
		UserID:      g.emmaOwner.ID,
	}
	user := makeExternalUser(ctx, &identity, "wiskers@example.com", "wiskers for ever")
	g.whiskers = user

	return user
}

func (g *testWorkspace) ownerIdentityRef() *app.Identity {
	return &app.Identity{
		WorkspaceID: g.workspace.ID,
		UserID:      g.emmaOwner.ID,
	}
}

func (g *testWorkspace) makeExternalConversation(ctx serviceContext, user model.User) model.Conversation {
	return makeExternalConversation(ctx, g.ownerIdentityRef(), user)
}

func makeExternalConversation(ctx serviceContext, owner *app.Identity, user model.User) model.Conversation {
	conversation, err := ctx.service.GetOrCreateConversation(ctx, owner, user.MessagingAddress)
	Expect(err).ToNot(HaveOccurred())
	Expect(conversation.ExternalUserID).To(Equal(user.ID))
	Expect(conversation.WorkspaceID).To(Equal(owner.WorkspaceID))
	Expect(conversation.Archived).To(BeFalse())

	return conversation
}

func getMessages(
	ctx serviceContext,
	user model.User,
	conversation model.Conversation,
	fromID *int64,
	limit int,
	direction domain.Direction) []model.Message {
	identity := app.Identity{
		WorkspaceID: user.WorkspaceID,
		UserID:      user.ID,
	}
	messages, err := ctx.service.GetConversationMessages(ctx, &identity, conversation.ID, fromID, limit, direction)
	Expect(err).ToNot(HaveOccurred())

	return messages
}

func startRTC(
	ctx serviceContext,
	user model.User,
	clientState model.ClientSyncStateRepresentation) model.UserSyncState {
	syncState, err := ctx.service.RTSyncStart(ctx, user.WorkspaceID, user, clientState)
	Expect(err).ToNot(HaveOccurred())

	return syncState
}
func verifySyncState(syncState model.UserSyncState,
	conversations []model.Conversation,
	messages []model.ConversationMessages,
	users []model.User) {
	Expect(syncState.Conversations).To(HaveLen(len(conversations)))
	for i, expected := range conversations {
		actual := syncState.Conversations[i]
		Expect(expected.ID).To(Equal(actual.ID))
		Expect(expected.Name).To(Equal(actual.Name))
		Expect(expected.ExternalUserID).To(Equal(actual.ExternalUserID))
		Expect(expected.Archived).To(Equal(actual.Archived))
		Expect(expected.WorkspaceID).To(Equal(actual.WorkspaceID))
	}

	Expect(syncState.Messages).To(ConsistOf(messages))
	Expect(syncState.Users).To(ConsistOf(users))
}
func sendMessage(ctx serviceContext, sender model.User, conversation model.Conversation, message string) model.Message {
	senderIdentity := app.Identity{
		WorkspaceID: sender.WorkspaceID,
		UserID:      sender.ID,
	}
	messageData := app.CreateMessageData{
		Message: message,
	}
	msg, err := ctx.service.CreateMessage(ctx, &senderIdentity, conversation.ID, messageData)
	Expect(err).ToNot(HaveOccurred())
	Expect(msg.ConversationID).To(Equal(conversation.ID))
	Expect(msg.SenderID).To(Equal(sender.ID))
	Expect(msg.Message).To(Equal(message))
	Expect(msg.Type).To(Equal(genModel.MessageType_Msg))

	return msg
}

func makeUser(
	ctx serviceContext,
	identity *app.Identity,
	email string,
	password string,
	userType genModel.UserType) model.User {
	user, err := ctx.service.CreateUser(ctx, identity, app.CreateUserData{
		MessagingAddress: email,
		UserType:         userType,
		Password:         password,
	})
	Expect(err).ToNot(HaveOccurred())
	Expect(err).ToNot(HaveOccurred())
	Expect(user.MessagingAddress).To(Equal(email))
	Expect(user.WorkspaceID).To(Equal(identity.WorkspaceID))
	Expect(user.Type).To(Equal(userType))
	Expect(hash.ComparePasswordAndHash(password, user.PasswordHash)).To(BeTrue())

	return user
}
func makeExternalUser(ctx serviceContext, identity *app.Identity, email string, password string) model.User {
	return makeUser(ctx, identity, email, password, genModel.UserType_External)
}
func makeInternalUser(ctx serviceContext, identity *app.Identity, email string, password string) model.User {
	return makeUser(ctx, identity, email, password, genModel.UserType_Internal)
}

func makeWorkspace(ctx serviceContext, workspaceName, email, password string) (model.Workspace, model.User) {
	result, err := ctx.service.CreateWorkspace(ctx, app.CreateWorkspaceData{
		Name:             workspaceName,
		MessagingAddress: email,
		Password:         password,
	})
	Expect(err).ToNot(HaveOccurred())
	Expect(result.Workspace.Name).To(Equal(workspaceName))
	Expect(result.User.MessagingAddress).To(Equal(email))
	Expect(result.User.WorkspaceID).To(Equal(result.Workspace.ID))
	Expect(hash.ComparePasswordAndHash(password, result.User.PasswordHash)).To(BeTrue())

	return result.Workspace, result.User
}

func makeUserEvent(
	user model.User,
	destination eventlog.Destination,
	kind model.DataUpdateKind,
	atTime time.Time) eventlog.Event {
	data, err := json.Marshal(model.DataUpdate{
		Kind: kind,
		Type: model.DataUpdateTypeUser,
		Data: user,
	})
	Expect(err).ToNot(HaveOccurred())

	return eventlog.Event{
		WorkspaceID: user.WorkspaceID, // can't be in another workspace
		Destination: destination,
		Time:        atTime,
		MarkerHash:  "",
		Payload:     data}
}

func makeMessageEvent(
	workspaceID int64,
	message model.Message,
	destination eventlog.Destination,
	kind model.DataUpdateKind,
	atTime time.Time) eventlog.Event {
	data, err := json.Marshal(model.DataUpdate{
		Kind: kind,
		Type: model.DataUpdateTypeMessage,
		Data: message,
	})
	Expect(err).ToNot(HaveOccurred())

	return eventlog.Event{
		WorkspaceID: workspaceID, // can't be in another workspace
		Destination: destination,
		Time:        atTime,
		MarkerHash:  "",
		Payload:     data,
	}
}

func makeSentinelWorkspace(ctx serviceContext) {
	// Nothing to test here because this simple workflow is tested in the main test
	// Goal being to have a sentinel workspace and prove that it is isolated
	// from the actual test workspace
	workspace := newTestWorkspace(ctx)
	kitty := workspace.makeKitty(ctx)
	withKitty := workspace.makeExternalConversation(ctx, kitty)
	sendMessage(ctx, workspace.emmaOwner, withKitty, "hello kitty")
}

func truncateTablesStmt() string {
	return `
TRUNCATE TABLE "message", "conversation", "user", "workspace" CASCADE;
`
}

/*

ChatGPT

Female Names
Emma
Ava
Zoe
Mia
Lily

Male Names
Max
Jack
Leo
Sam
Noah

Pet Names (Feline)
Whiskers
Bella
Kitty
Luna
Daisy

Pet Names (Canine)
Buddy
Charlie
Bailey
Rocky
Duke
*/
