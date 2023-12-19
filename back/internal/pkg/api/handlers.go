package api

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/infrastructure"
	"errors"
	"github.com/gin-contrib/sse"
	"github.com/gin-gonic/gin"
	"github.com/redis/go-redis/v9"
	"io"
	"log"
	"math"
	"net/http"
	"strconv"
	"time"
)

type ChatHandlers struct {
	r   domain.ChatRepository
	rdb *redis.Client
}

func NewChatHandlers(r domain.ChatRepository, rdb *redis.Client) *ChatHandlers {
	return &ChatHandlers{r, rdb}
}

func (h ChatHandlers) GetUser(c *gin.Context) {
	user := c.MustGet("user").(domain.User)

	userRef := struct {
		UserID int `uri:"user_id" binding:"required"`
	}{}
	err := c.ShouldBindUri(&userRef)
	if err != nil {
		c.JSON(http.StatusUnauthorized, ErrorNotAuthorized)
		return
	}
	c.JSON(http.StatusOK, user)
}

func (h ChatHandlers) CreateUser(ctx *gin.Context) {
	var payload CreateUserPayload

	err := ctx.ShouldBindJSON(&payload)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	user, err := h.r.CreateUser(ctx, payload.Phone, genModel.UserType_External)
	if errors.Is(err, domain.MessagingAddressExistsError) {
		ctx.JSON(http.StatusBadRequest, MakeError(ErrorCodePayloadExists, "Phone number exists", err.Error()))
		return
	}

	if err != nil {
		ctx.JSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}

	ctx.JSON(http.StatusCreated, user)
}
func (h ChatHandlers) CreateConversation(c *gin.Context) {
	var payload CreateConversationPayload

	err := c.ShouldBindJSON(&payload)
	if err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	recipient, err := h.r.GetUserByMessagingAddress(c, payload.RecipientMessagingAddress)
	if errors.Is(err, domain.UserNotFoundError) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Recipient not found", ""))
		return
	}

	if err != nil {
		log.Printf("error getting recipient: %v", err)
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	conversation, err := h.r.GetOrCreateConversation(c, recipient.ID, "")
	// TODO: eventually introduce a name for the conversation

	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusCreated, conversation)
}

func (h ChatHandlers) CreateMessage(c *gin.Context) {
	var params struct {
		ConversationID int64 `uri:"conversation_id" binding:"required"`
	}

	if err := c.ShouldBindUri(&params); err != nil {
		// maybe a not found instead
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	var payload CreateMessagePayload

	err := c.ShouldBindJSON(&payload)
	if err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	sender, err := h.r.GetUserById(c, payload.SenderID)
	if errors.Is(err, domain.UserNotFoundError) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Sender not found", ""))
		return
	}
	if sender.Type != genModel.UserType_Internal {
		conversation, err := h.r.GetConversation(c, params.ConversationID)
		if errors.Is(err, domain.ConversationNotFoundError) {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Conversation not found", ""))
			return
		}

		if sender.Type == genModel.UserType_External && conversation.ExternalUserID != sender.ID {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Sender not part of conversation", ""))
			return
		}
	}

	message, err := h.r.CreateMessage(c, params.ConversationID, sender.ID, payload.Message, genModel.MessageType_Msg)
	if err != nil {
		if !errors.Is(err, domain.FailedUpdate{}) {
			_ = c.AbortWithError(http.StatusInternalServerError, err)
			return
		}
		log.Printf("error notifying update....: %v", err)
		// TODO: need to force resync of clients
	}
	c.JSON(http.StatusCreated, message)
}

func (h ChatHandlers) GetConversations(c *gin.Context) {

	limit, id, direction, ok := getPaginatedParams(c)
	if !ok {
		return
	}

	conversations, err := h.r.GetConversations(c, id, limit, direction)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	var prevId int64 = math.MaxInt64
	var nextId int64 = 0

	if len(conversations) > 0 {
		prevId = conversations[0].ID
		nextId = conversations[len(conversations)-1].ID
	}
	response := struct {
		Data []domain.Conversation `json:"data"`
		Meta PaginationInfo        `json:"meta"`
	}{
		Data: conversations,
		Meta: PaginationInfo{
			Limit:  limit,
			PrevID: prevId,
			NextID: nextId,
		},
	}
	c.JSON(http.StatusOK, response)

}

func (h ChatHandlers) GetConversationMessages(c *gin.Context) {
	limit, id, direction, ok := getPaginatedParams(c)
	if !ok {
		return
	}

	var params struct {
		ConversationID int64 `uri:"conversation_id" binding:"required"`
	}

	if err := c.ShouldBindUri(&params); err != nil {
		// maybe a not found instead
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	messages, err := h.r.GetMessages(c, params.ConversationID, id, limit, direction)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	var prevId int64 = math.MaxInt64
	var nextId int64 = 0

	if len(messages) > 0 {
		prevId = messages[0].ID
		nextId = messages[len(messages)-1].ID
	}
	response := struct {
		Data []domain.Message `json:"data"`
		Meta PaginationInfo   `json:"meta"`
	}{
		Data: messages,
		Meta: PaginationInfo{
			Limit:  limit,
			PrevID: prevId,
			NextID: nextId,
		},
	}
	c.JSON(http.StatusOK, response)
}

func (h ChatHandlers) ServerSideEventsHandler(c *gin.Context) {
	log.Println("Serving SSE for client", c.Request.RemoteAddr)
	rc := http.NewResponseController(c.Writer)
	err := rc.SetWriteDeadline(time.Time{})
	if err != nil {
		log.Printf("error setting write deadline: %v", err)
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)

	}
	pubsub := h.rdb.Subscribe(c, infrastructure.PubSubChannelSSE)
	defer func() {
		err := pubsub.Close()
		if err != nil {
			log.Printf("error closing pubsub: %v", err)
		}
	}()

	tickerChan := time.NewTicker(1 * time.Second).C
	c.Stream(func(writer io.Writer) bool {
		select {
		case msg, ok := <-pubsub.Channel():
			if !ok {
				return false
			}

			c.Render(-1, sse.Event{
				Event: "update",
				Data:  msg.Payload,
				Retry: 2000,
			})

		case <-tickerChan:
			c.Render(-1, sse.Event{
				Event: "ping",
				Data:  time.Now().UnixMilli(),
				Retry: 2000,
			})
		}

		return true
	})
}

type ChatMiddleware struct {
	r domain.ChatRepository
}

func NewChatMiddleware(r domain.ChatRepository) *ChatMiddleware {
	return &ChatMiddleware{r}
}
func (m *ChatMiddleware) UserMiddleware(c *gin.Context) {
	userRef := struct {
		UserID int64 `uri:"user_id" binding:"required"`
	}{}
	if err := c.ShouldBindUri(&userRef); err != nil {
		c.AbortWithStatusJSON(http.StatusNotFound, ErrorNotFound)
		return
	}

	user, err := m.r.GetUserById(c, userRef.UserID)

	if errors.Is(err, domain.UserNotFoundError) {
		c.AbortWithStatusJSON(http.StatusNotFound, ErrorNotFound)
		return
	}

	if err != nil {
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}

	c.Set("user", user)
	c.Next()
}

func getPaginatedParams(c *gin.Context) (int, *int64, domain.Direction, bool) {
	greaterThanStr := c.Query("greater_than")
	lowerThanStr := c.Query("lower_than")
	limitStr := c.DefaultQuery("limit", "25") // Default limit is 10

	limit, err := strconv.Atoi(limitStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - limit", err.Error()))
		return 0, nil, 0, false
	}

	var id *int64
	direction := domain.Backward

	if greaterThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(greaterThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - greater_than", err.Error()))
			return 0, nil, 0, false
		}
		direction = domain.Forward
	} else if lowerThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(lowerThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - lower_than", err.Error()))
			return 0, nil, 0, false
		}
		direction = domain.Backward
	}
	return limit, id, direction, true
}

func SSEMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Writer.Header().Set("Content-Type", "text/event-stream")
		c.Writer.Header().Set("Cache-Control", "no-cache")
		c.Writer.Header().Set("Connection", "keep-alive")
		//c.Writer.Header().Set("Transfer-Encoding", "chunked")
		c.Next()
	}
}
