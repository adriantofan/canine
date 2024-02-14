package auth

import (
	"back/internal/pkg/app"
	"back/internal/pkg/auth/hash"
	"back/internal/pkg/domain"
	"back/internal/pkg/domain/model"
	"errors"
	"fmt"
	"log"
	"time"

	jwt "github.com/appleboy/gin-jwt/v2"
	"github.com/gin-gonic/gin"
)

type login struct {
	Username string `binding:"required" form:"username" json:"username"`
	Password string `binding:"required" form:"password" json:"password"`
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

	return jwt.New(&jwt.GinJWTMiddleware{
		Realm:       realm,
		Key:         secretKey,
		Timeout:     time.Hour,
		MaxRefresh:  time.Hour,
		IdentityKey: IdentityKey,
		// Login step 1. checks password and returns user
		Authenticator: func(c *gin.Context) (interface{}, error) {
			var loginVars login
			if err := c.ShouldBind(&loginVars); err != nil {
				return "", jwt.ErrMissingLoginValues
			}
			userID := loginVars.Username
			submittedPassword := loginVars.Password
			user, err := repo.GetUserByMessagingAddress(c, userID)
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
			if v, ok := data.(*model.User); ok {
				return jwt.MapClaims{
					IdentityKey:  v.ID,
					workspaceKey: v.WorkspaceID,
				}
			}
			log.Printf("failed to cast user in PayloadFunc %v", data)
			return jwt.MapClaims{}
		},
		IdentityHandler: func(c *gin.Context) interface{} {
			claims := jwt.ExtractClaims(c)

			return &app.Identity{
				UserID:      claims[IdentityKey].(int64),
				WorkspaceID: claims[workspaceKey].(int64),
			}
		},
		Authorizator: func(data interface{}, c *gin.Context) bool {
			if v, ok := data.(*app.Identity); ok && c.MustGet("workspace_id").(int64) == v.WorkspaceID {

				return true
			}

			return false
		},
		Unauthorized: func(c *gin.Context, code int, message string) {
			c.JSON(code, gin.H{
				"code":    code,
				"message": message,
			})
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
