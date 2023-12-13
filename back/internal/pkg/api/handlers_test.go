package api_test

import (
	"back/internal/pkg/api"
	"back/internal/pkg/db"
	"back/internal/pkg/domain"
	"back/internal/pkg/infrastructure"
	"bytes"
	"encoding/json"
	"github.com/gin-gonic/gin"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"net/http/httptest"
	"strconv"
)

var _ = Describe("Handlers", func() {
	Describe("Users", func() {
		var r *gin.Engine
		var repository *db.MemoryMessageRepository
		makeUser := func(phone string) domain.User {
			user := map[string]interface{}{
				"phone": phone,
			}
			userJSON, _ := json.Marshal(user)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			var decoded domain.User
			_ = json.Unmarshal(w.Body.Bytes(), &decoded)
			Expect(decoded.Phone).To(Equal(phone))
			return decoded
		}

		createConversation := func(user1ID int64, recipientPhone string) domain.Conversation {
			conversation := map[string]interface{}{
				"recipient_phone": recipientPhone,
			}
			conversationJSON, _ := json.Marshal(conversation)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/users/"+strconv.FormatInt(user1ID, 10)+"/conversations", bytes.NewReader(conversationJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			var decoded domain.Conversation
			_ = json.Unmarshal(w.Body.Bytes(), &decoded)
			return decoded
		}

		BeforeEach(func() {
			r = gin.Default()
			repository = db.NewInMemoryRepository(infrastructure.NewTimeService())
			handlers := api.NewChatHandlers(repository)
			middleware := api.NewChatMiddleware(repository)
			api.ConfigureRouter(r, handlers, middleware)
		})

		It("should return 404 when user not found", func() {

			w := httptest.NewRecorder()
			req := httptest.NewRequest("GET", "/users/1", nil)
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(404))
		})

		It("should create user", func() {

			w := httptest.NewRecorder()
			user := map[string]interface{}{
				"phone": "+1234567890",
			}
			userJSON, _ := json.Marshal(user)
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			Expect(w.Body.String()).To(MatchJSON(`{"id":1, "phone": "+1234567890", "created_at": "0001-01-01T00:00:00Z"}`))
		})

		It("should get user", func() {

			w := httptest.NewRecorder()
			user := map[string]interface{}{
				"phone": "+1234567890",
			}
			userJSON, _ := json.Marshal(user)
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			Expect(w.Body.String()).To(MatchJSON(`{"id":1, "phone": "+1234567890", "created_at": "0001-01-01T00:00:00Z"}`))

			w = httptest.NewRecorder()
			req = httptest.NewRequest("GET", "/users/1", nil)
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(200))
			Expect(w.Body.String()).To(MatchJSON(`{"id":1, "phone": "+1234567890", "created_at": "0001-01-01T00:00:00Z"}`))
		})

		It("should create conversation", func() {
			user1 := makeUser("+1111111111")
			user2 := makeUser("+2222222222")
			createConversation(user1.ID, user2.Phone)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("GET", "/users/"+strconv.FormatInt(user1.ID, 10)+"/conversations", nil)
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(200))
			var conversationPage struct {
				Data []domain.Conversation
				Meta api.PaginationInfo
			}
			_ = json.Unmarshal(w.Body.Bytes(), &conversationPage)
			Expect(conversationPage.Data).To(HaveLen(1))

		})

	})
})
