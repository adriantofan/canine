package zitadel

import (
	"back/internal/pkg/auth/zitadel/oauth"
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"net/http"

	"github.com/zitadel/oidc/pkg/client"

	"github.com/gin-gonic/gin"

	"github.com/zitadel/oidc/pkg/client/rs"
)

type IntrospectionInterceptor struct {
	resourceServer rs.ResourceServer
}

// NewIntrospectionInterceptor intercepts every call and checks for a correct Bearer token using OAuth2 introspection
// by sending the token to the introspection endpoint).
func NewIntrospectionInterceptor(issuer, keyPath string, keyData string) (*IntrospectionInterceptor, error) {
	var resourceServer rs.ResourceServer
	if len(keyPath) != 0 {
		var err error
		resourceServer, err = rs.NewResourceServerFromKeyFile(issuer, keyPath)

		if err != nil {
			return nil, fmt.Errorf("failed to create resource server: %w", err)
		}
	} else {
		c, err := client.ConfigFromKeyFileData([]byte(keyData))
		if err != nil {
			return nil, fmt.Errorf("failed to create client config: %w", err)
		}
		resourceServer, err = rs.NewResourceServerJWTProfile(issuer, c.ClientID, c.KeyID, []byte(c.Key))
		if err != nil {
			return nil, fmt.Errorf("failed to create resource server: %w", err)
		}
	}

	return &IntrospectionInterceptor{
		resourceServer: resourceServer,
	}, nil
}

func (interceptor *IntrospectionInterceptor) Authorize() gin.HandlerFunc {
	var errUnauthorized UnauthorizedError

	return func(ctx *gin.Context) {
		authCtx, err := interceptor.LoadAuthorization(ctx.Request)

		if err != nil {
			if errors.Is(err, &errUnauthorized) {
				interceptor.writeError(ctx.Writer, http.StatusUnauthorized, err.Error())
				ctx.Abort()

				return
			}
			interceptor.writeError(ctx.Writer, http.StatusForbidden, err.Error())
			ctx.Abort()

			return
		}

		GinCtxSetUserAuthID(ctx, authCtx.UserID())
		GinSetUserContext(ctx, authCtx)
		ctx.Next()
	}
}

func (interceptor *IntrospectionInterceptor) LoadAuthorization(r *http.Request) (*oauth.IntrospectionContext, error) {
	authCtx, err := Introspect(r.Context(), r, interceptor.resourceServer)
	if err != nil || !authCtx.IsAuthorized() {
		if errors.Is(err, ErrIntrospectionFailed) {
			log.Println("introspection failed")
		}

		return authCtx, NewErrorUnauthorized(err)
	}

	return authCtx, nil
}

func (interceptor *IntrospectionInterceptor) writeError(
	responseWriter http.ResponseWriter,
	status int,
	errMessage interface{}) {
	errBytes, err := json.Marshal(errMessage)
	if err != nil {
		http.Error(responseWriter, err.Error(), http.StatusInternalServerError)

		return
	}
	responseWriter.Header().Set("content-type", "application/json")
	responseWriter.WriteHeader(status)
	_, err = responseWriter.Write(errBytes)
	if err != nil {
		log.Println("error writing response")
	}
}
