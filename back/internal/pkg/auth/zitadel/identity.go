package zitadel

import (
	appModel "back/internal/pkg/app/model"
	"back/internal/pkg/domain"
	"errors"
	"fmt"
	"net/http"

	"github.com/rs/zerolog"

	"golang.org/x/exp/maps"

	"github.com/gin-gonic/gin"
)

type IdentityMiddleware struct {
	transactionFactory domain.Transaction
}

func NewIdentityMiddleware(transactionFactory domain.Transaction) *IdentityMiddleware {
	return &IdentityMiddleware{
		transactionFactory: transactionFactory,
	}
}

func (m *IdentityMiddleware) Authenticate() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		chatRepo, err := m.transactionFactory.WithoutTransaction()
		if err != nil {
			_ = ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("failed to get chat transactionFactory: %w", err))

			return
		}
		authID := GinCtxMustGetUserAuthID(ctx)
		user, err := chatRepo.GetUsersByAuthID(ctx, authID)
		if err != nil {
			if errors.Is(err, domain.ErrUserNotFound) {
				ctx.AbortWithStatus(http.StatusUnauthorized)

				return
			}
			_ = ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("failed to get user by auth id: %w", err))
			return
		}
		var params WorkspaceBased

		if err := ctx.ShouldBindUri(&params); err == nil {
			if user.WorkspaceID != params.WorkspaceID {
				ctx.AbortWithStatus(http.StatusForbidden)

				return
			}
		}

		identity := appModel.Identity{
			UserID:      user.ID,
			WorkspaceID: user.WorkspaceID,
		}

		GinCtxSetIdentity(ctx, identity)

		ctx.Next()
	}
}

// TODO: This will be useful for the frontend to know all user identities
func getIds(ctx *gin.Context, transactionFactory domain.Transaction) (map[int64]appModel.Identity, bool) {
	roles := GinCtxMustGetRoles(ctx)
	chatRepo, err := transactionFactory.WithoutTransaction()
	if err != nil {
		_ = ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("failed to get chat transactionFactory: %w", err))

		return nil, true
	}

	orgIdsRoleMap := make(map[string][]string)

	for role, orgIDs := range roles {
		for _, orgID := range orgIDs {
			orgIdsRoleMap[orgID] = append(orgIdsRoleMap[orgID], role)
		}
	}

	orgIDs := maps.Keys(orgIdsRoleMap)
	users, err := chatRepo.GetUsersByAuthIDs(ctx, orgIDs)

	if err != nil {
		_ = ctx.AbortWithError(http.StatusInternalServerError, fmt.Errorf("failed to get users by auth id: %w", err))
		return nil, true
	}
	if len(users) != len(orgIDs) {
		// TODO: is this an error or a unauthorized request?
		zerolog.Ctx(ctx.Request.Context()).Error().
			Msgf("authenticate expects workspace users to match auth roles %+v %+v", users, roles)
		_ = ctx.AbortWithError(500, fmt.Errorf("authenticate expects workspace users to match auth users"))

		return nil, true
	}
	identitiesByWorkspaceID := make(map[int64]appModel.Identity)

	for _, user := range users {
		identitiesByWorkspaceID[user.WorkspaceID] = appModel.Identity{
			UserID:      user.ID,
			WorkspaceID: user.WorkspaceID,
		}
	}
	return identitiesByWorkspaceID, false
}
