package zitadel

import (
	"back/internal/pkg/auth/zitadel/oauth"
	"context"
	"errors"
	"fmt"
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
	authHeader string,
	resourceServer rs.ResourceServer) (*oauth.IntrospectionContext, error) {
	accessToken, ok := strings.CutPrefix(authHeader, oidc.BearerToken)
	if !ok {
		return nil, ErrInvalidHeader
	}
	resp, err := rs.Introspect(ctx, resourceServer, strings.TrimSpace(accessToken))
	if err != nil {
		return nil, fmt.Errorf("%w: %w", ErrIntrospectionFailed, err)
	}
	r := &oauth.IntrospectionContext{
		IntrospectionResponse: resp,
	}
	r.SetToken(accessToken)

	return r, nil
}
