package zitadel

type WorkspaceBased struct {
	// ATTENTION: This is a security check to ensure that the user is only allowed to access their own workspace
	// it MUST match the workspace_id param as defined in the router
	WorkspaceID int64 `binding:"required" uri:"workspace_id"`
}

// WorkspaceIDParam ATTENTION: This is a security check to ensure that the user is only allowed to access their own
// workspace. it MUST match the workspace_id param as defined in the identity middleware
const WorkspaceIDParam = "workspace_id"
