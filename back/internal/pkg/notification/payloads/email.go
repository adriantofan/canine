package payloads

import "back/.gen/canine/public/model"

type NotificationMessage struct {
	WorkspaceID    int64             `json:"workspace_id"`
	ConversationID int64             `json:"conversation_id"`
	MessageID      int64             `json:"message_id"`
	MessageType    model.MessageType `json:"message_type"`
}
