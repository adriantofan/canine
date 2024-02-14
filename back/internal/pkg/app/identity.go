package app

// Identity is a struct that holds the user and workspace IDs of the user accessing an app function.
type Identity struct {
	UserID      int64
	WorkspaceID int64
}
