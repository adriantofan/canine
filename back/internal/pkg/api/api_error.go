package api

import (
	"back/internal/pkg/app"
	"errors"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Error struct {
	Code    string
	Message string
	Reason  string
}

func MakeError(code string, message string, reason string) Error {
	return Error{code, message, reason}
}

var (
	ErrorInternalServer = Error{
		Message: "Internal server error",
	}
	ErrorNotFound = Error{
		Message: "Not found",
	}
	ErrorNotAuthorized = Error{
		Message: "Not authorized",
	}
)

const (
	ErrorCodeInvalidRequest = "invalid_request"
	ErrorCodePayloadExists  = "payload_exists"
)

func abortBadRequest(c *gin.Context, err error) {
	c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Invalid payload", err.Error()))
}

func abortWithError(c *gin.Context, err error) {

	if errors.Is(err, app.ErrUserNotAuthorized) {
		c.JSON(http.StatusUnauthorized, ErrorNotAuthorized)
	}
	if errors.Is(err, app.ErrUserNotFound) {
		c.JSON(http.StatusBadRequest, MakeError(ErrorCodeInvalidRequest, "Recipient not found", ""))
	}

	_ = c.AbortWithError(http.StatusInternalServerError, err)

}
