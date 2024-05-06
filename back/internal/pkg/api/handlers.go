package api

import (
	genModel "back/.gen/canine/public/model"
	apiModel "back/internal/pkg/api/model"
	"back/internal/pkg/app"
	"back/internal/pkg/auth"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"back/internal/pkg/rt"
	"back/internal/pkg/rt/buffer"
	"back/internal/pkg/rt/eventlog"
	"back/internal/pkg/rt/websocket"
	"errors"
	"fmt"
	"math"
	"net/http"
	"strconv"
	"sync"

	"github.com/rs/zerolog/log"

	gorillaWebsocket "github.com/gorilla/websocket"

	"github.com/gin-gonic/gin"
)

type ChatHandlers struct {
	transaction      domain.Transaction
	Service          *app.Service
	input            eventlog.Input
	closeWSSignalsMX *sync.Mutex
	closeWSSignals   []chan<- struct{}
}

func NewChatHandlers(f domain.Transaction, service *app.Service, input eventlog.Input) *ChatHandlers {
	return &ChatHandlers{
		transaction:      f,
		Service:          service,
		input:            input,
		closeWSSignalsMX: &sync.Mutex{},
		closeWSSignals:   make([]chan<- struct{}, 0, 10),
	}
}

func (h ChatHandlers) GetUser(ctx *gin.Context) {
	user := h.getUser(ctx)

	userRef := struct { //nolint:exhaustruct
		UserID int `binding:"required" uri:"user_id"`
	}{}
	err := ctx.ShouldBindUri(&userRef)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, apiModel.ErrorNotAuthorized)
		return
	}
	ctx.JSON(http.StatusOK, user)
}

func (h ChatHandlers) rollback() {
	_ = h.transaction.Rollback()
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

	err := ctx.ShouldBind(&payload)
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
		Data []model.Conversation `json:"data"`
		Meta PaginationMeta       `json:"meta"`
	}{
		Data: conversations,
		Meta: PaginationMeta{
			Limit:   limit,
			PrevID:  prevId,
			NextID:  nextId,
			HasMore: len(conversations) == limit,
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
		Data []model.Message `json:"data"`
		Meta PaginationMeta  `json:"meta"`
	}{
		Data: messages,
		Meta: PaginationMeta{
			Limit:   limit,
			PrevID:  prevId,
			NextID:  nextId,
			HasMore: len(messages) == limit,
		},
	}
	c.JSON(http.StatusOK, response)
}
func (h ChatHandlers) RTCStartSession(c *gin.Context) {
	var payload model.RTCRemote

	err := c.ShouldBindJSON(&payload)
	if err != nil {
		c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	update, err := h.Service.GetRTCRemoteUpdate(c, getIdentity(c), payload)
	if err != nil {
		abortWithAppError(c, err)
		return
	}

	c.JSON(http.StatusOK, update)
}

var upgrader = gorillaWebsocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
}

func (h ChatHandlers) RTCConnect(c *gin.Context) {
	payload := struct {
		SyncToken string `form:"sync_token" json:"sync_token" binding:"required"`
	}{}

	err := c.ShouldBindQuery(&payload)
	if err != nil {
		abortBadRequest(c, err)
		return
	}

	repo, err := h.transaction.WithoutTransaction()
	if err != nil {
		abortWithAppError(c, fmt.Errorf("error getting repo: %w", err))
		return
	}

	identity := getIdentity(c)
	user, err := repo.GetUserByID(c, identity.UserID)
	if err != nil {
		abortWithAppError(c, fmt.Errorf("error getting user: %w", err))
		return
	}

	mask := eventlog.MaskBroadcastMarker
	switch user.Type {
	case genModel.UserType_Internal:
		mask = mask | eventlog.MaskBroadcastInternal
	case genModel.UserType_External:
		mask = mask | eventlog.MaskBroadcastExternal
	default:
		abortBadRequest(c, fmt.Errorf("invalid user type: %s", user.Type))
	}

	conn, err := upgrader.Upgrade(c.Writer, c.Request, nil)
	if err != nil {
		log.Ctx(c.Request.Context()).Error().Err(err).Msg("error upgrading websocket")
		abortWithAppError(c, fmt.Errorf("error upgrading websocket: %w", err))

		return
	}
	log.Ctx(c.Request.Context()).Debug().Msgf("client %s connected", c.Request.RemoteAddr)
	/*
			Shutdown sequence:
			1. server shutdown  - stopConnection is closed, handled by ClientStream
			2. client closes connection - in ClientStream read pump, connection is closed, stops the write pump and
			outputs a message to the clientDoneChan
			3. stream events closes clientEventLog, which stops the buffer and closes the clientOutChan
			initiating the graceful shutdown sequence in the client stream
			possible race condition: server shutdown is also initiated by eventlog, which closes the clientEventLog
			both paths lead to the same outcome => ok

			ClientStream shutdown in detail:
			1. stopConnection is closed -> graceful shutdown:
				- writePump sends a close message to the client
			    - writePump waits for the readPump to stop or timeout
				- readPump stops when the client closes the connection, unblocking the writePump close wait
			2. client stops the connection
				- readPump stops and closes the connection
			    - write pump stops
			when readpump stops clientDoneChan unblocks
		    Manual test atm:
		     - stop client side
		     - shutdown server side
		     - eventlog initiate stop
	*/
	stopStream, clientEventLog := h.input.StreamEvents(identity.WorkspaceID, identity.UserID, mask, payload.SyncToken)

	clientOutChan := buffer.Buffer(clientEventLog)
	clientDoneChan := make(chan struct{})
	stopConnection := make(chan struct{})
	h.addStopWSConnection(stopConnection)

	clientStream := websocket.NewClientStream(conn, stopConnection, clientDoneChan, clientOutChan)
	clientStream.Run()
	<-clientDoneChan
	stopStream() // also stops the buffer on clientOutChan
	log.Ctx(c.Request.Context()).Debug().Msgf("client %s disconnected", c.Request.RemoteAddr)
}
func (h ChatHandlers) addStopWSConnection(stop chan<- struct{}) {
	h.closeWSSignalsMX.Lock()
	defer h.closeWSSignalsMX.Unlock()
	if h.closeWSSignals == nil {
		close(stop)
		return
	}
	h.closeWSSignals = append(h.closeWSSignals, stop)
}

func (h ChatHandlers) ServerShutDownHandler() {
	h.closeWSSignalsMX.Lock()
	defer h.closeWSSignalsMX.Unlock()
	for _, stop := range h.closeWSSignals {
		close(stop)
	}
	h.closeWSSignals = nil
}

func (h ChatHandlers) RPC(c *gin.Context) {
	user := c.MustGet("user").(model.User)

	var msg rt.ClientMessage

	err := c.ShouldBindJSON(&msg)
	if err != nil {
		c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	switch msg.Kind {
	case rt.ClientMessageKindSyncState:
		h.HandleClientMessageKindSyncState(c, user, msg.RequestID, msg.MustGetClientSyncStateRepresentation())
		return
	}

	c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid rpc message kind", err.Error()))
}

func (h ChatHandlers) HandleClientMessageKindSyncState(c *gin.Context, user model.User, requestID string,
	clientState model.RTCRemote) {
	// Strict because we want serial responses on the queue

	repo, err := h.transaction.WithoutTransaction()

	stateUpdate, err := repo.GetSyncState(c, user, clientState)

	if err != nil {
		log.Ctx(c.Request.Context()).Error().Err(err).Msg("error getting sync state")
		c.AbortWithStatusJSON(http.StatusInternalServerError, apiModel.ErrorInternalServer)

		return
	}

	_ = rt.MakeServerMessageSyncState(requestID, stateUpdate)
	// TODO: send message to client

}

func getPaginatedParams(c *gin.Context) (int, *int64, domain.Direction, bool) {
	greaterThanStr := c.Query("greater_than")
	lowerThanStr := c.Query("lower_than")
	limitStr := c.DefaultQuery("limit", "25") // Default limit is 10

	limit, err := strconv.Atoi(limitStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid payload - limit", err.Error()))
		return 0, nil, 0, false
	}

	var id *int64
	direction := domain.DirectionBackward

	if greaterThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(greaterThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid payload - greater_than", err.Error()))
			return 0, nil, 0, false
		}
		direction = domain.DirectionForward
	} else if lowerThanStr != "" {
		id = new(int64)
		*id, err = strconv.ParseInt(lowerThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, apiModel.MakeError(apiModel.ErrorCodeInvalidRequest, "Invalid payload - lower_than", err.Error()))
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
