package api

import (
	"back/internal/pkg/api/model"
	"back/internal/pkg/app"
	appModel "back/internal/pkg/app/model"
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
	if errors.Is(err, app.ErrCreateUserEmailExists) {
		ctx.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodePayloadExists, "Messaging address already exists", ""))
	}
	if errors.Is(err, app.ErrConversationNotFound) {
		ctx.JSON(http.StatusBadRequest, model.MakeError(model.ErrorCodeInvalidRequest, "Conversation not found", ""))
	}

	if errors.Is(err, app.ErrZitadelWorkspaceExists) {
		ctx.JSON(
			http.StatusBadRequest,
			model.MakeError(model.ErrorCodeAuthWorkspaceOrUserExists, "Workspace or user already exists", ""))
	}

	var invalidRequestError *appModel.InvalidRequestError
	if errors.As(err, &invalidRequestError) {
		ctx.JSON(
			http.StatusBadRequest,
			model.MakeError(
				model.ErrorCodeInvalidRequest,
				invalidRequestError.UserMessage,
				invalidRequestError.Error()),
		)
	}

	_ = ctx.AbortWithError(http.StatusInternalServerError, err)
}
