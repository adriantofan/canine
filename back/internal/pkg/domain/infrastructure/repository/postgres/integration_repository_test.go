//go:build integration

package postgres_test

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/infrastructure/repository/postgres"
	"back/internal/pkg/domain/infrastructure/repository/postgres/test_util"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/infrastructure"
	"context"
	"database/sql"
	"fmt"
	"math"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("IntegrationRepository", Ordered, func() {
	var testDB *sql.DB
	var messagesRepo *postgres.MessageRepository
	var workspace model.Workspace
	const passHash = "$argon2id$v=toto" //nolint:gosec
	ctx := context.Background()

	createUser := func(messagingAddress string) model.User {
		user, err := messagesRepo.CreateUser(ctx, workspace.ID, messagingAddress, genModel.UserType_External, passHash)
		Expect(err).ToNot(HaveOccurred())
		Expect(user.MessagingAddress).To(Equal(messagingAddress))
		Expect(user.CreatedAt).ToNot(BeZero())
		Expect(user.UpdatedAt).ToNot(BeZero())
		Expect(user.Type).To(Equal(genModel.UserType_External))

		return user
	}

	createConversation := func(user1Id int64, name string) model.Conversation {
		conversation, err := messagesRepo.GetOrCreateConversation(ctx, workspace.ID, user1Id, name)
		Expect(err).ToNot(HaveOccurred())
		Expect(conversation.ID).ToNot(BeZero())
		Expect(conversation.Name).To(Equal(name))
		Expect(conversation.ExternalUserID).To(Equal(user1Id))
		Expect(conversation.CreatedAt).ToNot(BeZero())
		Expect(conversation.UpdatedAt).ToNot(BeZero())

		return conversation
	}
	createMessage := func(conversationId, senderId int64, messageText string) model.Message {
		message, err := messagesRepo.CreateMessage(ctx, conversationId, senderId, messageText, genModel.MessageType_Msg, nil)
		Expect(err).ToNot(HaveOccurred())

		return message
	}

	BeforeAll(func() {
		testDB, _ = test_util.MustCreateTestDBWithMigrations()
	})

	AfterAll(func() {
		if testDB != nil {
			_ = testDB.Close()
		}
	})

	BeforeEach(func() {
		_, err := testDB.Exec(truncateTables)
		Expect(err).ToNot(HaveOccurred())

		messagesRepo = postgres.NewMessageRepository(testDB, infrastructure.NewRealTimeService())
		workspace, err = messagesRepo.CreateWorkspace(ctx, "test workspace")
		Expect(err).ToNot(HaveOccurred())
	})

	Specify("user operations", func() {
		_, err := messagesRepo.GetUserByMessagingAddress(ctx, workspace.ID, "+1234567890")
		Expect(err).Should(MatchError(domain.ErrUserNotFound))

		By("creating user")

		user1 := createUser("+1234567890")

		By("getting user by phone")
		user, err := messagesRepo.GetUserByMessagingAddress(ctx, workspace.ID, "+1234567890")
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("getting user by id")
		user, err = messagesRepo.GetUserByID(ctx, user1.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("creating another user with different phone")

		user2 := createUser("+0987654321")

		Expect(user1.ID).ToNot(Equal(user2.ID))

		By("Fail to create user with same phone")
		_, err = messagesRepo.CreateUser(ctx, workspace.ID, "+1234567890", genModel.UserType_External, passHash)
		Expect(err).To(MatchError(domain.ErrMessagingAddressExists))
	})

	Specify("conversation operations", func() {
		user1 := createUser("+1234567890")
		user2 := createUser("+0987654321")
		conversation1 := createConversation(user2.ID, "")

		By("getting conversation by id instead of creating")
		conversation2 := createConversation(user2.ID, "")
		Expect(conversation2).To(Equal(conversation1))
		By("creating a new conversation")
		c3 := createConversation(user1.ID, "")
		Expect(c3).ToNot(Equal(conversation1))
	})

	Specify("named conversation operations", func() {
		user1 := createUser("+1234567890")
		user2 := createUser("+0987654321")
		conv1Name := "conv 1"
		conversation1 := createConversation(user2.ID, conv1Name)

		By("getting conversation by id instead of creating")
		conversation2 := createConversation(user2.ID, conv1Name)
		Expect(conversation2).To(Equal(conversation1))
		By("creating a new conversation")
		conversation3 := createConversation(user1.ID, conv1Name)
		Expect(conversation3).ToNot(Equal(conversation1))

		By("creating a new conversation with different name")
		conv2Name := "conv 2"
		c4 := createConversation(user1.ID, conv2Name)
		Expect(c4).ToNot(Equal(conversation1))

	})

	Specify("message create", func() {
		user1 := createUser("+1234567890")
		c := createConversation(user1.ID, "")
		message, err := messagesRepo.CreateMessage(ctx, c.ID, user1.ID, "Hello, world!", genModel.MessageType_Ask, nil)
		Expect(err).ToNot(HaveOccurred())
		Expect(message.ID).ToNot(BeZero())
		Expect(message.ConversationID).To(Equal(c.ID))
		Expect(message.SenderID).To(Equal(user1.ID))
		Expect(message.Message).To(Equal("Hello, world!"))
		Expect(message.CreatedAt).ToNot(BeZero())
	})

	Specify("message get after/before", func() {
		user1 := createUser("+1234567890")
		conversation1 := createConversation(user1.ID, "")

		By("getting messages in empty conversation")
		messages, err := messagesRepo.GetMessagesAfter(ctx, conversation1.ID, 0, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(messages).To(BeEmpty())
		messages, err = messagesRepo.GetMessagesBefore(ctx, conversation1.ID, math.MaxInt32, 10)
		Expect(err).ToNot(HaveOccurred())
		By("creating messages")
		createdMessages := make([]model.Message, 0, 12)
		for i := 0; i < 12; i++ {
			txt := fmt.Sprintf("%d", i)
			createdMessages = append(createdMessages, createMessage(conversation1.ID, user1.ID, txt))
		}
		By("GetMessagesBefore - first page")
		actualMessages, err := messagesRepo.GetMessagesBefore(ctx, conversation1.ID, math.MaxInt32, 10)
		Expect(err).ToNot(HaveOccurred())
		expected := reverseCopy(createdMessages[2:])
		Expect(actualMessages).To(Equal(expected))

		By("GetMessagesBefore - last page")
		actualMessages, err = messagesRepo.GetMessagesBefore(ctx, conversation1.ID, expected[9].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		expected = reverseCopy(createdMessages[:2])
		Expect(actualMessages).To(Equal(expected))

		By("GetMessagesBefore - after last page")
		actualMessages, err = messagesRepo.GetMessagesBefore(ctx, conversation1.ID, expected[1].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(BeEmpty())

		By("GetMessagesAfter - first page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, conversation1.ID, -1, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(Equal(createdMessages[:10]))

		By("GetMessagesAfter - last page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, conversation1.ID, createdMessages[9].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(Equal(createdMessages[10:]))

		By("GetMessagesAfter - after last page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, conversation1.ID, createdMessages[11].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(BeEmpty())
	})

	Specify("conversation list", func() {
		u1 := createUser("+2222222222")
		u2 := createUser("+3333333333")
		u3 := createUser("+4444444444")
		u4 := createUser("+5555555555")

		conversation1 := createConversation(u1.ID, "")
		conversation2 := createConversation(u2.ID, "")
		conversation3 := createConversation(u3.ID, "")
		conversation4 := createConversation(u4.ID, "")
		By("getting first page, without prev_id")
		conversations, err := messagesRepo.GetConversations(ctx, workspace.ID, nil, nil, 2, domain.DirectionBackward)
		Expect(err).ToNot(HaveOccurred())
		Expect(conversations).To(Equal([]model.Conversation{conversation4, conversation3}))
		By("getting prev page")
		conversations, err = messagesRepo.GetConversations(ctx, workspace.ID, nil, &conversation3.ID, 2, domain.DirectionBackward)
		Expect(err).ToNot(HaveOccurred())
		Expect(conversations).To(Equal([]model.Conversation{conversation2, conversation1}))

		By("getting first page, without next_id")
		conversations, err = messagesRepo.GetConversations(ctx, workspace.ID, nil, nil, 2, domain.DirectionForward)
		Expect(err).ToNot(HaveOccurred())
		Expect(conversations).To(Equal([]model.Conversation{conversation1, conversation2}))
		By("getting next page")
		conversations, err = messagesRepo.GetConversations(ctx, workspace.ID, nil, &conversation2.ID, 5, domain.DirectionForward)
		Expect(err).ToNot(HaveOccurred())
		Expect(conversations).To(Equal([]model.Conversation{conversation3, conversation4}))

	})

})

var truncateTables = `
TRUNCATE TABLE message, conversation, "user" CASCADE;
`

func reverseCopy[S ~[]E, E any](s S) S {
	c := make([]E, len(s))
	copy(c, s)
	reverse(c)
	return c
}
func reverse[S ~[]E, E any](s S) {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		s[i], s[j] = s[j], s[i]
	}
}
