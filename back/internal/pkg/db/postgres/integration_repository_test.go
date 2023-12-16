//go:build integration

package postgres_test

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/db/postgres"
	"back/internal/pkg/db/postgres/test_util"
	"back/internal/pkg/domain"
	"context"
	"fmt"
	"github.com/jmoiron/sqlx"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"math"
)

var _ = Describe("IntegrationRepository", Ordered, func() {
	var testDb *sqlx.DB
	var messagesRepo *postgres.MessageRepository

	ctx := context.Background()
	createUser := func(messagingAddress string) domain.User {
		u, err := messagesRepo.CreateUser(ctx, messagingAddress, genModel.UserType_External)
		Expect(err).ToNot(HaveOccurred())
		Expect(u.MessagingAddress).To(Equal(messagingAddress))
		Expect(u.CreatedAt).ToNot(BeZero())
		Expect(u.UpdatedAt).ToNot(BeZero())
		Expect(u.Type).To(Equal(genModel.UserType_External))
		return u
	}

	createConversation := func(user1Id int64, name string) domain.Conversation {
		c, err := messagesRepo.GetOrCreateConversation(ctx, user1Id, name)
		Expect(err).ToNot(HaveOccurred())
		Expect(c.ID).ToNot(BeZero())
		Expect(c.Name).To(Equal(name))
		Expect(c.ExternalUserID).To(Equal(user1Id))
		Expect(c.CreatedAt).ToNot(BeZero())
		Expect(c.UpdatedAt).ToNot(BeZero())
		return c
	}
	createMessage := func(conversationId, senderId int64, messageText string) domain.Message {
		message, err := messagesRepo.CreateMessage(ctx, conversationId, senderId, messageText, genModel.MessageType_Msg)
		Expect(err).ToNot(HaveOccurred())
		return message
	}

	BeforeAll(func() {
		testDb, _ = test_util.MustCreateTestDBWithMigrations(false)
	})

	BeforeEach(func() {
		testDb.MustExec(truncateTables)
		messagesRepo = postgres.NewMessageRepository(testDb)
	})

	Specify("user operations", func() {
		_, err := messagesRepo.GetUserByMessagingAddress(ctx, "+1234567890")
		Expect(err).Should(MatchError(domain.UserNotFoundError))

		By("creating user")

		user1 := createUser("+1234567890")

		By("getting user by phone")
		user, err := messagesRepo.GetUserByMessagingAddress(ctx, "+1234567890")
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("getting user by id")
		user, err = messagesRepo.GetUserById(ctx, user1.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("creating another user with different phone")

		user2 := createUser("+0987654321")

		Expect(user1.ID).ToNot(Equal(user2.ID))

		By("Fail to create user with same phone")
		_, err = messagesRepo.CreateUser(ctx, "+1234567890", genModel.UserType_External)
		Expect(err).To(MatchError(domain.MessagingAddressExistsError))
	})

	Specify("conversation operations", func() {
		user1 := createUser("+1234567890")
		user2 := createUser("+0987654321")
		c1 := createConversation(user2.ID, "")

		By("getting conversation by id instead of creating")
		c2 := createConversation(user2.ID, "")
		Expect(c2).To(Equal(c1))
		By("creating a new conversation")
		c3 := createConversation(user1.ID, "")
		Expect(c3).ToNot(Equal(c1))
	})

	Specify("named conversation operations", func() {
		user1 := createUser("+1234567890")
		user2 := createUser("+0987654321")
		conv1Name := "conv 1"
		c1 := createConversation(user2.ID, conv1Name)

		By("getting conversation by id instead of creating")
		c2 := createConversation(user2.ID, conv1Name)
		Expect(c2).To(Equal(c1))
		By("creating a new conversation")
		c3 := createConversation(user1.ID, conv1Name)
		Expect(c3).ToNot(Equal(c1))

		By("creating a new conversation with different name")
		conv2Name := "conv 2"
		c4 := createConversation(user1.ID, conv2Name)
		Expect(c4).ToNot(Equal(c1))

	})

	Specify("message create", func() {
		u1 := createUser("+1234567890")
		c := createConversation(u1.ID, "")
		message, err := messagesRepo.CreateMessage(ctx, c.ID, u1.ID, "Hello, world!", genModel.MessageType_Ask)
		Expect(err).ToNot(HaveOccurred())
		Expect(message.ID).ToNot(BeZero())
		Expect(message.ConversationID).To(Equal(c.ID))
		Expect(message.SenderID).To(Equal(u1.ID))
		Expect(message.Message).To(Equal("Hello, world!"))
		Expect(message.CreatedAt).ToNot(BeZero())
	})

	Specify("message get after/before", func() {
		u1 := createUser("+1234567890")
		c := createConversation(u1.ID, "")

		By("getting messages in empty conversation")
		messages, err := messagesRepo.GetMessagesAfter(ctx, c.ID, 0, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(messages).To(BeEmpty())
		messages, err = messagesRepo.GetMessagesBefore(ctx, c.ID, math.MaxInt32, 10)
		Expect(err).ToNot(HaveOccurred())
		By("creating messages")
		createdMessages := make([]domain.Message, 0, 12)
		for i := 0; i < 12; i++ {
			txt := fmt.Sprintf("%d", i)
			createdMessages = append(createdMessages, createMessage(c.ID, u1.ID, txt))
		}
		By("GetMessagesBefore - first page")
		actualMessages, err := messagesRepo.GetMessagesBefore(ctx, c.ID, math.MaxInt32, 10)
		Expect(err).ToNot(HaveOccurred())
		expected := reverseCopy(createdMessages[2:])
		Expect(actualMessages).To(Equal(expected))

		By("GetMessagesBefore - last page")
		actualMessages, err = messagesRepo.GetMessagesBefore(ctx, c.ID, expected[9].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		expected = reverseCopy(createdMessages[:2])
		Expect(actualMessages).To(Equal(expected))

		By("GetMessagesBefore - after last page")
		actualMessages, err = messagesRepo.GetMessagesBefore(ctx, c.ID, expected[1].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(BeEmpty())

		By("GetMessagesAfter - first page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, c.ID, -1, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(Equal(createdMessages[:10]))

		By("GetMessagesAfter - last page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, c.ID, createdMessages[9].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(Equal(createdMessages[10:]))

		By("GetMessagesAfter - after last page")
		actualMessages, err = messagesRepo.GetMessagesAfter(ctx, c.ID, createdMessages[11].ID, 10)
		Expect(err).ToNot(HaveOccurred())
		Expect(actualMessages).To(BeEmpty())
	})

	Specify("conversation list", func() {
		u1 := createUser("+2222222222")
		u2 := createUser("+3333333333")
		u3 := createUser("+4444444444")
		u4 := createUser("+5555555555")

		c1 := createConversation(u1.ID, "")
		c2 := createConversation(u2.ID, "")
		c3 := createConversation(u3.ID, "")
		c4 := createConversation(u4.ID, "")
		By("getting first page, without prev_id")
		cs, err := messagesRepo.GetConversations(ctx, nil, 2, domain.Backward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c4, c3}))
		By("getting prev page")
		cs, err = messagesRepo.GetConversations(ctx, &c3.ID, 2, domain.Backward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c2, c1}))

		By("getting first page, without next_id")
		cs, err = messagesRepo.GetConversations(ctx, nil, 2, domain.Forward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c1, c2}))
		By("getting next page")
		cs, err = messagesRepo.GetConversations(ctx, &c2.ID, 5, domain.Forward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c3, c4}))

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
