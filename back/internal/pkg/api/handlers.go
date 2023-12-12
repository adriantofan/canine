package api

import (
	"back/internal/pkg/domain"
	"errors"
	"github.com/gin-gonic/gin"
	"log"
	"math"
	"net/http"
	"strconv"
)

type ChatHandlers struct {
	r domain.ChatRepository
}

func NewChatHandlers(r domain.ChatRepository) *ChatHandlers {
	return &ChatHandlers{r}
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

	user, err := h.r.CreateUser(ctx, payload.Phone)
	if errors.Is(err, domain.PhoneNumberExistsError) {
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

	recipient, err := h.r.GetUserByPhone(c, payload.RecipientPhone)
	if errors.Is(err, domain.UserNotFoundError) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Recipient not found", ""))
		return
	}

	if err != nil {
		log.Printf("error getting recipient: %v", err)
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	sender := c.MustGet("user").(domain.User)

	conversation, err := h.r.GetOrCreateConversation(c, sender.ID, recipient.ID)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, conversation)
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

	sender := c.MustGet("user").(domain.User)
	message, err := h.r.CreateMessage(c, params.ConversationID, sender.ID, payload.Message)
	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, message)
}

func (h ChatHandlers) GetConversations(c *gin.Context) {

	greaterThanStr := c.Query("greater_than")
	lowerThanStr := c.Query("lower_than")
	limitStr := c.DefaultQuery("limit", "25") // Default limit is 10

	limit, err := strconv.Atoi(limitStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - limit", err.Error()))
		return
	}

	var id int64 = math.MaxInt64
	direction := domain.Backward

	if greaterThanStr != "" {
		id, err = strconv.ParseInt(greaterThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - greater_than", err.Error()))
			return
		}
		direction = domain.Forward
	} else if lowerThanStr != "" {
		id, err = strconv.ParseInt(lowerThanStr, 10, 64)
		if err != nil {
			c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload - lower_than", err.Error()))
			return
		}
		direction = domain.Backward
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
		PaginationInfo
	}{
		Data: conversations,
		PaginationInfo: PaginationInfo{
			Limit:  limit,
			PrevID: prevId,
			NextID: nextId,
		},
	}
	c.JSON(http.StatusOK, response)
	return

}

func (h ChatHandlers) GetConversationMessages(c *gin.Context) {
	// TODO: make like conversation
	var queryParams struct {
		LastID    int64 `form:"last_id"`
		Ascending *bool `form:"ascending"`
		Limit     int   `form:"limit"`
	}
	if err := c.ShouldBindQuery(&queryParams); err != nil {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}
	if queryParams.Limit == 0 {
		queryParams.Limit = 25
	}

	var params struct {
		ConversationID int64 `uri:"conversation_id" binding:"required"`
	}

	if err := c.ShouldBindUri(&params); err != nil {
		// maybe a not found instead
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
		return
	}

	var messages []domain.Message
	var err error

	missingParams := queryParams.Ascending == nil && queryParams.LastID == 0
	ascending := queryParams.Ascending != nil && *queryParams.Ascending

	if missingParams || ascending {
		messages, err = h.r.GetMessagesAfter(c, params.ConversationID, queryParams.LastID, queryParams.Limit)
	} else {
		messages, err = h.r.GetMessagesBefore(c, params.ConversationID, queryParams.LastID, queryParams.Limit)
	}

	if err != nil {
		_ = c.AbortWithError(http.StatusInternalServerError, err)
		return
	}

	c.JSON(http.StatusOK, messages)
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
