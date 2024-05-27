package zitadel

import "github.com/gin-gonic/gin"

const (
	roleCtxKey = "zitadel_roles"
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
