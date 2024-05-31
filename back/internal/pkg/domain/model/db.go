package model

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain/model/primitive"

	"github.com/jackc/pgx/v5/pgtype"
)

// db anotation is used by sqlx
// while sql anotation is used by go-jet

// FIXME: Ints won't work with multiplafrom reliably (int32 vs int64 vs javascript -2^53 and 2^53)
//
//	Use strings instead when converting to from json
type User struct {
	ID          int64                      `json:"id" sql:"primary_key"`
	WorkspaceID int64                      `json:"workspace_id" db:"workspace_id"`
	Email       string                     `json:"email" db:"email"`
	Type        genModel.UserType          `json:"type" db:"type"`
	CreatedAt   primitive.MillisecondsTime `json:"created_at" db:"created_at"`
	UpdatedAt   primitive.MillisecondsTime `json:"updated_at" db:"updated_at"`
	AuthID      string                     `json:"-" db:"auth_id"`
	Phone       string                     `json:"phone" db:"phone"`
}

type Conversation struct {
	ID             int64                      `json:"id" sql:"primary_key"`
	WorkspaceID    int64                      `json:"workspace_id" db:"workspace_id"`
	ExternalUserID int64                      `json:"external_user_id" db:"external_user_id"`
	Name           string                     `json:"name" db:"name"`
	CreatedAt      primitive.MillisecondsTime `json:"created_at" db:"created_at"`
	UpdatedAt      primitive.MillisecondsTime `json:"updated_at" db:"updated_at"`
	UpdateSeq      int64                      `json:"update_seq" db:"update_seq"`
	Archived       bool                       `json:"archived" db:"archived"`
	LastMessageID  int64                      `json:"last_message_id" db:"last_message_id"`
}

type Message struct {
	ID             int64                      `json:"id" sql:"primary_key"`
	ConversationID int64                      `json:"conversation_id" db:"conversation_id"`
	SenderID       int64                      `json:"sender_id" db:"sender_id"`
	Type           genModel.MessageType       `json:"type" db:"type"`
	Message        string                     `json:"message" db:"message"`
	CreatedAt      primitive.MillisecondsTime `json:"created_at" db:"created_at"`
	Attachments    pgtype.FlatArray[string]   `json:"attachments" db:"attachments"`
}
type Workspace struct {
	ID        int64                      `json:"id" sql:"primary_key"`
	Name      string                     `json:"name" db:"name"`
	CreatedAt primitive.MillisecondsTime `json:"created_at" db:"created_at"`
	UpdatedAt primitive.MillisecondsTime `json:"updated_at" db:"updated_at"`
	AuthID    string                     `json:"-" db:"auth_id"`
}
