package api

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	syncService "back/internal/pkg/domain/sync/service"
	"back/internal/pkg/infrastructure"
	"errors"
	"log"
	"math"
	"net/http"
	"strconv"

	"github.com/gorilla/websocket"

	"github.com/gin-gonic/gin"
	"github.com/redis/go-redis/v9"
)

type ChatHandlers struct {
	f        domain.Transaction
	rdb      *redis.Client
	notifier infrastructure.UpdateNotifier
}

func NewChatHandlers(f domain.Transaction, rdb *redis.Client, notifier infrastructure.UpdateNotifier) *ChatHandlers {
	return &ChatHandlers{f, rdb, notifier}
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
func (h ChatHandlers) rollback() {
	_ = h.f.Rollback()
}
func (h ChatHandlers) CreateUser(ctx *gin.Context) {
	var payload CreateUserPayload

	err := ctx.ShouldBindJSON(&payload)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}
	repo, err := h.f.Begin()
	defer h.rollback()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}
	user, err := repo.CreateUser(ctx, payload.Phone, genModel.UserType_External)

	if errors.Is(err, domain.MessagingAddressExistsError) {
		ctx.JSON(http.StatusBadRequest, MakeError(ErrorCodePayloadExists, "Phone number exists", err.Error()))
		return
	}
	_, err = h.f.Commit()

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

	repo, err := h.f.Begin()
	defer h.rollback()
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	recipient, err := repo.GetUserByMessagingAddress(c, payload.RecipientMessagingAddress)
	if errors.Is(err, domain.UserNotFoundError) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Recipient not found", ""))
		return
	}

	if err != nil {
		log.Printf("error getting recipient: %v", err)
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	conversation, err := repo.GetOrCreateConversation(c, recipient.ID, "")
	// TODO: eventually introduce a name for the conversation

	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	updates, err := h.f.Commit()

	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	for _, update := range updates {
		err := h.notifier.Notify(c, update)
		if err != nil {
			log.Printf("FIXME: kill all SSE connections - error notifying: %v", err)
			// TODO: should kill all SSE connections
		}
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
	repo, err := h.f.Begin()
	defer h.rollback()
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	sender, err := repo.GetUserById(c, payload.SenderID)
	if errors.Is(err, domain.UserNotFoundError) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Sender not found", ""))
		return
	}
	if sender.Type != genModel.UserType_Internal {
		conversation, err := repo.GetConversation(c, params.ConversationID)
		if errors.Is(err, domain.ConversationNotFoundError) {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Conversation not found", ""))
			return
		}

		if sender.Type == genModel.UserType_External && conversation.ExternalUserID != sender.ID {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Sender not part of conversation", ""))
			return
		}
	}

	message, err := repo.CreateMessage(c, params.ConversationID, sender.ID, payload.Message, genModel.MessageType_Msg)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	updates, err := h.f.Commit()
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	for _, update := range updates {
		err := h.notifier.Notify(c, update)
		if err != nil {
			log.Printf("FIXME: kill all SSE connections - error notifying: %v", err)
			// TODO: should kill all SSE connections
		}
	}

	c.JSON(http.StatusCreated, message)
}

func (h ChatHandlers) GetConversations(c *gin.Context) {

	limit, id, direction, ok := getPaginatedParams(c)
	if !ok {
		return
	}

	repo, err := h.f.Begin()
	defer h.rollback()
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	conversations, err := repo.GetConversations(c, id, limit, direction)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	_, err = h.f.Commit()
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

	repo, err := h.f.Begin()
	defer h.rollback()
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	messages, err := repo.GetMessages(c, params.ConversationID, id, limit, direction)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	_, err = h.f.Commit()

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

var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func (h ChatHandlers) UpdateWebSocket(c *gin.Context) {
	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		log.Printf("error upgrading websocket: %v", err)
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}
	log.Printf("client %s connected", c.Request.RemoteAddr)
	clientOutChan := make(chan []byte)
	clientDoneChan := make(chan struct{})
	clientStream := syncService.NewClientStream(conn, clientDoneChan, clientOutChan)
	clientStream.Run()
	<-clientDoneChan
	log.Printf("client %s disconnected", c.Request.RemoteAddr)
}

type ChatMiddleware struct {
	r domain.Transaction
}

func NewChatMiddleware(r domain.Transaction) *ChatMiddleware {
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

	repo, err := m.r.Begin()
	defer m.r.Rollback()

	if err != nil {
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}
	user, err := repo.GetUserById(c, userRef.UserID)

	if errors.Is(err, domain.UserNotFoundError) {
		c.AbortWithStatusJSON(http.StatusNotFound, ErrorNotFound)
		return
	}

	if err != nil {
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}

	_, err = m.r.Commit()
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
