package model

type UserSyncState struct {
	Conversations []Conversation         `json:"conversations"`
	Messages      []ConversationMessages `json:"messages"`
	Users         []User                 `json:"users"`
	Token         string                 `json:"token"`
}
