package zitadel

import (
	"back/internal/pkg/auth/zitadel/oauth"
	"context"
	"errors"
	"fmt"
	"net/http"
	"strings"

	"github.com/zitadel/oidc/pkg/client/rs"
	"github.com/zitadel/oidc/pkg/oidc"
)

var (
	ErrInvalidHeader       = errors.New("invalid auth header")
	ErrIntrospectionFailed = errors.New("token introspection failed")
)

// Introspect calls the OAuth2 Introspection endpoint and returns an error if token is not active.
func Introspect(
	ctx context.Context,
	request *http.Request,
	resourceServer rs.ResourceServer) (*oauth.IntrospectionContext, error) {
	var token string
	if strings.HasSuffix(request.URL.Path, "rtc/connect") {
		token = request.URL.Query().Get("token")
	} else {
		authHeader := request.Header.Get("authorization")
		accessToken, ok := strings.CutPrefix(authHeader, oidc.BearerToken)
		if !ok {
			return nil, ErrInvalidHeader
		}
		token = strings.TrimSpace(accessToken)
	}

	resp, err := rs.Introspect(ctx, resourceServer, token)
	if err != nil {
		return nil, fmt.Errorf("%w: %w", ErrIntrospectionFailed, err)
	}
	r := &oauth.IntrospectionContext{
		IntrospectionResponse: resp,
	}
	r.SetToken(token)

	return r, nil
}
