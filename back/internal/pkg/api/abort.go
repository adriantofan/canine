package api

import (
	"back/internal/pkg/api/model"
	"back/internal/pkg/app"
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
)

func abortBadRequest(c *gin.Context, err error) {
	c.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
}

func abortWithAppError(ctx *gin.Context, err error) {

	if errors.Is(err, app.ErrRecipientNotFound) {
		ctx.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodeInvalidRequest, "Recipient not found", ""))
	}
	if errors.Is(err, app.ErrNotAuthorized) {
		ctx.JSON(http.StatusUnauthorized, model.ErrorNotAuthorized)
	}
	if errors.Is(err, app.ErrForbidden) {
		ctx.JSON(http.StatusForbidden, model.ErrorNotAuthorized)
	}
	if errors.Is(err, app.ErrCreateUserMessagingAddressExists) {
		ctx.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodePayloadExists, "Messaging address already exists", ""))
	}
	if errors.Is(err, app.ErrConversationNotFound) {
		ctx.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodeInvalidRequest, "Conversation not found", ""))
	}

	_ = ctx.AbortWithError(http.StatusInternalServerError, err)

}
