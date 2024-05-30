package zitadel

import (
	appModel "back/internal/pkg/app/model"

	"github.com/gin-gonic/gin"
)

const (
	roleCtxKey     = "zitadel_roles"
	identityCtxKey = "identity"
	userAuthIDKey  = "user_auth_id"
)

// Ctx represents the authorization context with information about the authorized user.
type Ctx interface {
	IsAuthorized() bool
	UserID() string
	IsGrantedRole(role string) bool
	IsGrantedRoleInOrganization(role, organizationID string) bool
	SetToken(token string)
	GetToken() string
	// GrantedRoles returns map[role][]organizationID , where `organizationID` is the ID of the organization
	// from where the `role` was granted.
	GrantedRoles() map[string][]string
	// GrantedRolesInProject returns map[role][]organizationID , where `organizationID` is the ID of the organization
	// from where the `role` was granted on the project with the provided `projectId`.
	GrantedRolesInProject(projectID string) map[string][]string
}

func GinCtxSetUserAuthID(ctx *gin.Context, userAuthID string) {
	ctx.Set(userAuthIDKey, userAuthID)
}

func GinCtxMustGetUserAuthID(ctx *gin.Context) string {
	return ctx.MustGet(userAuthIDKey).(string) //nolint: forcetypeassert
}

func GinCtxSetRoles(ctx *gin.Context, roles map[string][]string) {
	ctx.Set(roleCtxKey, roles)
}

func GinCtxMustGetRoles(ctx *gin.Context) map[string][]string {
	roles, ok := ctx.Get(roleCtxKey)
	if !ok {
		return nil
	}

	return roles.(map[string][]string) //nolint: forcetypeassert
}

func GinCtxMustGetIdentity(ctx *gin.Context) *appModel.Identity {
	return ctx.MustGet(identityCtxKey).(*appModel.Identity) //nolint: forcetypeassert
}

func GinCtxSetIdentity(ctx *gin.Context, identity appModel.Identity) {
	ctx.Set(identityCtxKey, &identity)
}
