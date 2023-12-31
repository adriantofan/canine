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
)

var _ = Describe("Handlers", func() {
	Describe("Users", func() {
		var r *gin.Engine
		var repository *db.MemoryMessageRepository
		makeUser := func(phone string) domain.User {
			user := map[string]interface{}{
				"messaging_address": phone,
			}
			userJSON, _ := json.Marshal(user)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			var decoded domain.User
			_ = json.Unmarshal(w.Body.Bytes(), &decoded)
			Expect(decoded.MessagingAddress).To(Equal(phone))
			return decoded
		}

		createConversation := func(recipientPhone string) domain.Conversation {
			conversation := map[string]interface{}{
				"recipient_messaging_address": recipientPhone,
			}
			conversationJSON, _ := json.Marshal(conversation)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/conversations", bytes.NewReader(conversationJSON))
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
				"messaging_address": "+1234567890",
			}
			userJSON, _ := json.Marshal(user)
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			Expect(w.Body.String()).To(MatchJSON(`
{
				"id": 1,
				"messaging_address": "+1234567890",
				"type": "external",
				"created_at": "0001-01-01T00:00:00Z",
				"updated_at": "0001-01-01T00:00:00Z"
			  }
			`))
		})

		It("should get user", func() {

			w := httptest.NewRecorder()
			user := map[string]interface{}{
				"messaging_address": "+1234567890",
			}
			userJSON, _ := json.Marshal(user)
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			Expect(w.Body.String()).To(MatchJSON(`
				  {
					"id": 1,
					"messaging_address": "+1234567890",
					"type": "external",
					"created_at": "0001-01-01T00:00:00Z",
					"updated_at": "0001-01-01T00:00:00Z"
				  }
			`))

			w = httptest.NewRecorder()
			req = httptest.NewRequest("GET", "/users/1", nil)
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(200))
			Expect(w.Body.String()).To(MatchJSON(`
				  {
					"id": 1,
					"messaging_address": "+1234567890",
					"type": "external",
					"created_at": "0001-01-01T00:00:00Z",
					"updated_at": "0001-01-01T00:00:00Z"
				  }
	           `))
		})

		It("should get conversation", func() {
			_ = makeUser("+1111111111")

			createConversation("+1111111111")
			w := httptest.NewRecorder()
			req := httptest.NewRequest("GET", "/conversations", nil)
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
