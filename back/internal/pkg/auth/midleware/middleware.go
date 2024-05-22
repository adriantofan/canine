package midleware

import (
	apiInternal "back/internal/pkg/api/model"
	"back/internal/pkg/app"
	"back/internal/pkg/auth/hash"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"errors"
	"fmt"

	"github.com/rs/zerolog/log"

	"net/http"
	"strconv"
	"time"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
)

type login struct {
	Username    string `binding:"required" form:"username" json:"username"`
	Password    string `binding:"required" form:"password" json:"password"`
	WorkspaceID int64  `binding:"required" form:"workspace_id" json:"workspace_id"`
}

const (
	IdentityKey  = "id"
	workspaceKey = "wid"
)

func Middleware(t domain.Transaction, realm string, secretKey []byte) (*jwt.GinJWTMiddleware, error) {
	repo, err := t.WithoutTransaction()
	if err != nil {
		return nil, fmt.Errorf("failed to get repository: %w", err)
	}
	log.Warn().Msg("Set JWT timeout and refresh")
	return jwt.New(&jwt.GinJWTMiddleware{ //nolint:exhaustruct
		//SigningAlgorithm: "RS256",
		//PrivKeyFile:      "/Users/adriantofan/code/canine/back/jwtRS256.key",
		//PubKeyFile:       "/Users/adriantofan/code/canine/back/jwtRS256.key.pub",
		Realm:   realm,
		Key:     secretKey,
		Timeout: time.Hour * 24,
		// TODO: clients should be limited to generate tokens somehow
		MaxRefresh: time.Hour * 24, // the doc seems incorrect, because this is a absolute value, threshold for refresh
		// independent on Timeout
		IdentityKey: IdentityKey,
		// Login step 1. checks password and returns user
		Authenticator: func(c *gin.Context) (interface{}, error) {
			var loginVars login
			if err := c.ShouldBind(&loginVars); err != nil {
				return "", jwt.ErrMissingLoginValues
			}
			userID := loginVars.Username
			submittedPassword := loginVars.Password
			user, err := repo.GetUserByMessagingAddress(c, loginVars.WorkspaceID, userID)
			if err != nil {
				if errors.Is(err, domain.ErrUserNotFound) {
					return nil, jwt.ErrFailedAuthentication
				}

				return nil, fmt.Errorf("failed to get user by messaging address: %w", err)
			}
			passwordHash := user.PasswordHash
			match, err := hash.ComparePasswordAndHash(submittedPassword, passwordHash)
			if err != nil {
				return nil, fmt.Errorf("failed to compare password and hash: %w", err)
			}

			if match {
				return user, nil

			}

			return nil, jwt.ErrFailedAuthentication

		},
		// Login step 2. returns jwt MapClaims
		PayloadFunc: func(data interface{}) jwt.MapClaims {
			if v, ok := data.(model.User); ok {
				return jwt.MapClaims{
					// by default all number fields become float64 . this is a workaround
					// due to the fact that jwt.MapClaims is a map[string]interface{}
					IdentityKey:  strconv.FormatInt(v.ID, 10),
					workspaceKey: strconv.FormatInt(v.WorkspaceID, 10),
				}
			}
			log.Debug().Msgf("failed to cast user in PayloadFunc %v", data)
			return jwt.MapClaims{}
		},
		IdentityHandler: func(c *gin.Context) interface{} {
			claims := jwt.ExtractClaims(c)

			userID, err := strconv.ParseInt(claims[IdentityKey].(string), 10, 64)
			if err != nil {
				return nil
			}
			workspaceID, err := strconv.ParseInt(claims[workspaceKey].(string), 10, 64)
			if err != nil {
				return nil
			}

			return &app.Identity{
				UserID:      userID,
				WorkspaceID: workspaceID,
			}
		},

		Authorizator: func(data interface{}, c *gin.Context) bool {
			if data == nil {
				return false
			}

			pathWorkspaceIDStr := c.Param("workspace_id")
			pathWorkspaceID, err := strconv.ParseInt(pathWorkspaceIDStr, 10, 64)
			if err != nil {
				return false
			}

			if v, ok := data.(*app.Identity); ok && pathWorkspaceID == v.WorkspaceID {

				return true
			}

			return false
		},
		Unauthorized: func(c *gin.Context, code int, message string) {
			switch code {
			case http.StatusUnauthorized:
				c.JSON(code, apiInternal.MakeError(apiInternal.ErrorCodeUnauthorized, message, ""))
			case http.StatusForbidden:
				c.JSON(code, apiInternal.MakeError(apiInternal.ErrorCodeForbidden, message, ""))
			case http.StatusBadRequest:
				c.JSON(code, apiInternal.MakeError(apiInternal.ErrorCodeInvalidRequest, message, ""))
			default:
				c.JSON(code, apiInternal.MakeError("", message, ""))
			}
		},
		// TokenLookup is a string in the form of "<source>:<name>" that is used
		// to extract token from the request.
		// Optional. Default value "header:Authorization".
		// Possible values:
		// - "header:<name>"
		// - "query:<name>"
		// - "cookie:<name>"
		// - "param:<name>"
		TokenLookup: "header: Authorization, query: token, cookie: jwt",

		// TokenHeadName is a string in the header. Default value is "Bearer"
		TokenHeadName: "Bearer",

		// TimeFunc provides the current time. You can override it to use another time value. This is useful for testing
		// or if your server uses a different time zone than your tokens.
		TimeFunc: time.Now,
	})
}
