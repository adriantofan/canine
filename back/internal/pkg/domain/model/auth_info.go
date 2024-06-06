package model

type AuthInfo struct {
	User      User      `json:"user"`
	Workspace Workspace `json:"workspace"`
}
