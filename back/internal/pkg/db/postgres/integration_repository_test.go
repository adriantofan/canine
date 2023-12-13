//go:build integration

package postgres_test

import (
	"back/internal/pkg/db/postgres"
	"back/internal/pkg/domain"
	"context"
	"fmt"
	"github.com/jmoiron/sqlx"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"math"
	"os"
)

var _ = Describe("IntegrationRepository", Ordered, func() {
	var dsn string
	var testDb *sqlx.DB
	var messagesRepo *postgres.MessageRepository

	ctx := context.Background()
	createUser := func(phone string) domain.User {
		user1, err := messagesRepo.CreateUser(ctx, phone)
		Expect(err).ToNot(HaveOccurred())
		return user1
	}

	createConversation := func(user1Id, user2Id int64) domain.Conversation {
		conversation, err := messagesRepo.GetOrCreateConversation(ctx, user1Id, user2Id)
		Expect(err).ToNot(HaveOccurred())
		return conversation
	}
	createMessage := func(conversationId, senderId int64, messageText string) domain.Message {
		message, err := messagesRepo.CreateMessage(ctx, conversationId, senderId, messageText)
		Expect(err).ToNot(HaveOccurred())
		return message
	}

	BeforeAll(func() {
		dsn = os.Getenv("POSTGRES_DSN")
		if dsn == "" {
			Fail("POSTGRES_DSN is not set")
		}
		testDb = postgres.MustConnect(dsn)
		postgres.MustExecMigrations(testDb, true)
	})

	BeforeEach(func() {
		testDb.MustExec(truncateTables)
		messagesRepo = postgres.NewMessageRepository(testDb)
	})

	Specify("user operations", func() {
		_, err := messagesRepo.GetUserByPhone(ctx, "+1234567890")
		Expect(err).Should(MatchError(domain.UserNotFoundError))

		By("creating user")

		user1, err := messagesRepo.CreateUser(ctx, "+1234567890")
		Expect(user1.Phone).To(Equal("+1234567890"))
		Expect(user1.CreatedAt).ToNot(BeZero())
		Expect(err).ToNot(HaveOccurred())

		By("getting user by phone")
		user, err := messagesRepo.GetUserByPhone(ctx, "+1234567890")
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("getting user by id")
		user, err = messagesRepo.GetUserById(ctx, user1.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(user).To(Equal(user1))

		By("creating another user with different phone")

		user2, err := messagesRepo.CreateUser(ctx, "+0987654321")
		Expect(err).ToNot(HaveOccurred())
		Expect(user2.Phone).To(Equal("+0987654321"))
		Expect(user1.ID).ToNot(Equal(user2.ID))

		By("Fail to create user with same phone")
		_, err = messagesRepo.CreateUser(ctx, "+1234567890")
		Expect(err).To(MatchError(domain.PhoneNumberExistsError))
	})

	Specify("conversation operations", func() {
		user1 := createUser("+1234567890")
		user2 := createUser("+0987654321")
		c1, err := messagesRepo.GetOrCreateConversation(ctx, user2.ID, user1.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(c1.ID).ToNot(BeZero())
		Expect(c1.User1ID).To(Equal(user1.ID))
		Expect(c1.User2ID).To(Equal(user2.ID))
		Expect(c1.CreatedAt).ToNot(BeZero())
		c2, err := messagesRepo.GetOrCreateConversation(ctx, user2.ID, user1.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(c1).To(Equal(c2))
		c3, err := messagesRepo.GetOrCreateConversation(ctx, user1.ID, user2.ID)
		Expect(err).ToNot(HaveOccurred())
		Expect(c1).To(Equal(c3))
	})

	Specify("message create", func() {
		u1 := createUser("+1234567890")
		u2 := createUser("+0987654321")
		c := createConversation(u1.ID, u2.ID)
		message, err := messagesRepo.CreateMessage(ctx, c.ID, u1.ID, "Hello, world!")
		Expect(err).ToNot(HaveOccurred())
		Expect(message.ID).ToNot(BeZero())
		Expect(message.ConversationID).To(Equal(c.ID))
		Expect(message.SenderID).To(Equal(u1.ID))
		Expect(message.Message).To(Equal("Hello, world!"))
		Expect(message.CreatedAt).ToNot(BeZero())
	})

	Specify("message get after/before", func() {
		u1 := createUser("+1234567890")
		u2 := createUser("+0987654321")
		c := createConversation(u1.ID, u2.ID)

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
		u1 := createUser("+1111111111")
		u2 := createUser("+2222222222")
		u3 := createUser("+3333333333")
		u4 := createUser("+4444444444")
		u5 := createUser("+5555555555")

		c12 := createConversation(u1.ID, u2.ID)
		c13 := createConversation(u1.ID, u3.ID)
		c14 := createConversation(u1.ID, u4.ID)
		c15 := createConversation(u1.ID, u5.ID)
		By("getting first page, without prev_id")
		cs, err := messagesRepo.GetConversations(ctx, nil, 2, domain.Backward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c15, c14}))
		By("getting prev page")
		cs, err = messagesRepo.GetConversations(ctx, &c14.ID, 2, domain.Backward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c13, c12}))

		By("getting first page, without next_id")
		cs, err = messagesRepo.GetConversations(ctx, nil, 2, domain.Forward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c12, c13}))
		By("getting next page")
		cs, err = messagesRepo.GetConversations(ctx, &c13.ID, 5, domain.Forward)
		Expect(err).ToNot(HaveOccurred())
		Expect(cs).To(Equal([]domain.Conversation{c14, c15}))

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
