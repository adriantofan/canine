package api

import (
	"back/internal/pkg/app"
	"back/internal/pkg/auth"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/rt"
	"back/internal/pkg/rt/websocket"
	"errors"
	"log"
	"math"
	"net/http"
	"strconv"

	gorillaWebsocket "github.com/gorilla/websocket"

	"github.com/gin-gonic/gin"
)

type ChatHandlers struct {
	f       domain.Transaction
	Service *app.Service
}

func NewChatHandlers(f domain.Transaction, service *app.Service) *ChatHandlers {
	return &ChatHandlers{f: f, Service: service}
}

func (h ChatHandlers) GetUser(ctx *gin.Context) {
	user := h.getUser(ctx)

	userRef := struct { //nolint:exhaustruct
		UserID int `binding:"required" uri:"user_id"`
	}{}
	err := ctx.ShouldBindUri(&userRef)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, ErrorNotAuthorized)
		return
	}
	ctx.JSON(http.StatusOK, user)
}

func (h ChatHandlers) rollback() {
	_ = h.f.Rollback()
}

func (h ChatHandlers) CreateWorkspace(ctx *gin.Context) {
	var payload CreateWorkspacePayload

	err := ctx.ShouldBindJSON(&payload)
	if err != nil {
		abortBadRequest(ctx, err)
	}

	workspaceWithUser, err := h.Service.CreateWorkspace(ctx, payload)

	if err != nil {
		abortWithAppError(ctx, err)
		return
	}

	ctx.JSON(http.StatusCreated, workspaceWithUser)
}
func (h ChatHandlers) CreateUser(ctx *gin.Context) {
	var payload CreateUserPayload

	err := ctx.ShouldBindJSON(&payload)
	if err != nil {
		abortBadRequest(ctx, err)

		return
	}

	user, err := h.Service.CreateUser(ctx, getIdentity(ctx), payload)

	if err != nil {
		abortWithAppError(ctx, err)

		return
	}

	ctx.JSON(http.StatusCreated, user)
}

func (h ChatHandlers) CreateConversation(ctx *gin.Context) {
	var payload CreateConversationPayload

	err := ctx.ShouldBindJSON(&payload)

	if err != nil {
		abortBadRequest(ctx, err)

		return
	}

	conversation, err := h.Service.GetOrCreateConversation(ctx, getIdentity(ctx), payload.RecipientMessagingAddress)

	if err != nil {
		abortWithAppError(ctx, err)

		return
	}

	ctx.JSON(http.StatusCreated, conversation)
}

func (h ChatHandlers) CreateMessage(ctx *gin.Context) {
	var params struct {
		ConversationID int64 `binding:"required" uri:"conversation_id"`
	}

	if err := ctx.ShouldBindUri(&params); err != nil {
		abortBadRequest(ctx, err)

		return
	}

	var payload CreateMessagePayload

	err := ctx.ShouldBindJSON(&payload)
	if err != nil {
		abortBadRequest(ctx, err)

		return
	}

	message, err := h.Service.CreateMessage(ctx, getIdentity(ctx), params.ConversationID, payload)

	if err != nil {
		abortWithAppError(ctx, err)
	}

	ctx.JSON(http.StatusCreated, message)
}

func (h ChatHandlers) GetConversations(c *gin.Context) {

	limit, id, direction, ok := getPaginatedParams(c)
	if !ok {
		abortBadRequest(c, errors.New("invalid pagination parameters"))
		return
	}

	conversations, err := h.Service.GetConversations(c, getIdentity(c), id, limit, direction)
	if err != nil {
		abortWithAppError(c, err)
		return
	}

	var prevId int64 = math.MaxInt64
	var nextId int64 = 0

	if len(conversations) > 0 {
		prevId = conversations[0].ID
		nextId = conversations[len(conversations)-1].ID
	}
	response := struct {
		Data []model.Conversation `json:"Data"`
		Meta PaginationInfo       `json:"meta"`
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
		abortBadRequest(c, errors.New("invalid pagination parameters"))
		return
	}
	// FIXME: check permissions
	var params struct {
		ConversationID int64 `uri:"conversation_id" binding:"required"`
	}

	if err := c.ShouldBindUri(&params); err != nil {
		// maybe a not found instead
		abortBadRequest(c, err)
		return
	}

	messages, err := h.Service.GetConversationMessages(c, getIdentity(c), params.ConversationID, id, limit, direction)
	if err != nil {
		abortWithAppError(c, err)
		return
	}

	var prevId int64 = math.MaxInt64
	var nextId int64 = 0

	if len(messages) > 0 {
		prevId = messages[0].ID
		nextId = messages[len(messages)-1].ID
	}
	response := struct {
		Data []model.Message `json:"Data"`
		Meta PaginationInfo  `json:"meta"`
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

var upgrader = gorillaWebsocket.Upgrader{
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
	clientStream := websocket.NewClientStream(conn, clientDoneChan, clientOutChan)
	clientStream.Run()
	<-clientDoneChan
	log.Printf("client %s disconnected", c.Request.RemoteAddr)
}

func (h ChatHandlers) RPC(c *gin.Context) {
	user := c.MustGet("user").(model.User)

	var msg rt.ClientMessage

	err := c.ShouldBindJSON(&msg)
	if err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	switch msg.Kind {
	case rt.ClientMessageKindSyncState:
		h.HandleClientMessageKindSyncState(c, user, msg.RequestID, msg.MustGetClientSyncStateRepresentation())
		return
	}

	c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid rpc message kind", err.Error()))
}

func (h ChatHandlers) HandleClientMessageKindSyncState(c *gin.Context, user model.User, requestID string,
	clientState model.ClientSyncStateRepresentation) {
	// Strict because we want serial responses on the queue

	repo, err := h.f.WithoutTransaction()

	stateUpdate, err := repo.GetSyncState(c, user, clientState)

	if err != nil {
		log.Printf("error getting sync state: %v", err)
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}

	_ = rt.MakeServerMessageSyncState(requestID, stateUpdate)
	// TODO: send message to client

}

type ChatMiddleware struct {
	r domain.Transaction
}

func NewChatMiddleware(r domain.Transaction) *ChatMiddleware {
	return &ChatMiddleware{
		r: r,
	}
}
func (m *ChatMiddleware) AuthMiddleware(c *gin.Context) {
	userRef := struct {
		WorkspaceID int64 `uri:"workspace_id" binding:"required"`
		UserID      int64 `uri:"user_id" binding:"required"`
	}{}
	if err := c.ShouldBindUri(&userRef); err != nil {
		c.AbortWithStatusJSON(http.StatusNotFound, ErrorNotFound)
		return
	}

	repo, err := m.r.WithoutTransaction()
	if err != nil {
		c.AbortWithStatusJSON(http.StatusInternalServerError, ErrorInternalServer)
		return
	}

	user, err := repo.GetUserByID(c, userRef.UserID)

	if errors.Is(err, domain.ErrUserNotFound) {
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
	direction := domain.DirectionBackward

	if greaterThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(greaterThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - greater_than", err.Error()))
			return 0, nil, 0, false
		}
		direction = domain.DirectionForward
	} else if lowerThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(lowerThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - lower_than", err.Error()))
			return 0, nil, 0, false
		}
		direction = domain.DirectionBackward
	}
	return limit, id, direction, true
}

func (h ChatHandlers) getUser(ctx *gin.Context) model.User {
	// TODO: kill and replace with getIdentity
	user, ok := ctx.MustGet("user").(model.User)
	if !ok {
		panic("user not found")
	}

	return user
}

func getIdentity(ctx *gin.Context) *app.Identity {
	return ctx.MustGet(auth.IdentityKey).(*app.Identity)
}
