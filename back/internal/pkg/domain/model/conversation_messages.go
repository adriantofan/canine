package model

type ConversationMessages struct {
	ConversationID int64     `json:"conversation_id"`
	Messages       []Message `json:"messages"`
}
