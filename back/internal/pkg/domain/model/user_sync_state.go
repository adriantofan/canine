package model

type UserSyncState struct {
	ChangedConversations []Conversation         `json:"conversations"`
	Messages             []ConversationMessages `json:"messages"`
	Users                []User                 `json:"users"`
}
