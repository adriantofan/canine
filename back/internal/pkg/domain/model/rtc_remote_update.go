package model

type RTCRemoteUpdate struct {
	Conversations []Conversation         `json:"conversations"`
	Messages      []ConversationMessages `json:"messages"`
	Users         []User                 `json:"users"`
	SyncToken     string                 `json:"sync_token"`
}
