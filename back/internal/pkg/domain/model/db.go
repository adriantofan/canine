package model

import (
	genModel "back/.gen/canine/public/model"
)

// db anotation is used by sqlx
// while sql anotation is used by go-jet

// FIXME: Ints won't work with multiplafrom reliably (int32 vs int64 vs javascript -2^53 and 2^53)
//
//	Use strings instead when converting to from json
type User struct {
	ID               int64             `json:"id" sql:"primary_key"`
	MessagingAddress string            `json:"messaging_address" db:"messaging_address"`
	Type             genModel.UserType `json:"type" db:"type"`
	CreatedAt        MillisecondsTime  `json:"created_at" db:"created_at"`
	UpdatedAt        MillisecondsTime  `json:"updated_at" db:"updated_at"`
}

type Conversation struct {
	ID             int64            `json:"id" sql:"primary_key"`
	ExternalUserID int64            `json:"external_user_id" db:"external_user_id"`
	Name           string           `json:"name" db:"name"`
	CreatedAt      MillisecondsTime `json:"created_at" db:"created_at"`
	UpdatedAt      MillisecondsTime `json:"updated_at" db:"updated_at"`
	UpdateSeq      int64            `json:"update_seq" db:"update_seq"`
	Archived       bool             `json:"archived" db:"archived"`
	LastMessageID  int64            `json:"last_message_id" db:"last_message_id"`
}

type Message struct {
	ID             int64                `json:"id" sql:"primary_key"`
	ConversationID int64                `json:"conversation_id" db:"conversation_id"`
	SenderID       int64                `json:"sender_id" db:"sender_id"`
	Type           genModel.MessageType `json:"type" db:"type"`
	Message        string               `json:"message" db:"message"`
	CreatedAt      MillisecondsTime     `json:"created_at" db:"created_at"`
}
