package api_test

import (
	"back/internal/pkg/domain/model"
	"bytes"
	"encoding/json"
	"net/http/httptest"

	"github.com/gin-gonic/gin"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("Handlers", func() {
	Describe("LastKnownUserVersion", func() {
		var r *gin.Engine
		// TODO: should mock the service and only test parameters + return values
		_ = func(phone string) model.User {
			user := map[string]interface{}{
				"messaging_address": phone,
			}
			userJSON, _ := json.Marshal(user)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/users", bytes.NewReader(userJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			var decoded model.User
			_ = json.Unmarshal(w.Body.Bytes(), &decoded)
			Expect(decoded.MessagingAddress).To(Equal(phone))
			return decoded
		}

		_ = func(recipientPhone string) model.Conversation {
			conversation := map[string]interface{}{
				"recipient_messaging_address": recipientPhone,
			}
			conversationJSON, _ := json.Marshal(conversation)
			w := httptest.NewRecorder()
			req := httptest.NewRequest("POST", "/conversations", bytes.NewReader(conversationJSON))
			r.ServeHTTP(w, req)
			Expect(w.Code).To(Equal(201))
			var decoded model.Conversation
			_ = json.Unmarshal(w.Body.Bytes(), &decoded)
			return decoded
		}

	})
})
