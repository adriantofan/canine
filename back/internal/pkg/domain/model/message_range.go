package model

type MessageRange struct {
	ConversationID int64 `json:"conversation_id"`
	Range          Range `json:"range"`
}
