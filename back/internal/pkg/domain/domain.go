package domain

import (
	"time"
)

type User struct {
	ID        int64     `json:"id" sql:"primary_key"`
	Phone     string    `json:"phone"`
	CreatedAt time.Time `json:"created_at"`
}

type Conversation struct {
	ID        int64     `json:"id"`
	User1ID   int64     `db:"user1_id" json:"user1_id"`
	User2ID   int64     `db:"user2_id" json:"user2_id"`
	CreatedAt time.Time `db:"created_at" json:"created_at"`
}

type Message struct {
	ID             int64     `json:"id"`
	ConversationID int64     `db:"conversation_id" json:"conversation_id"`
	SenderID       int64     `db:"sender_id" json:"sender_id"`
	Message        string    `json:"message"`
	CreatedAt      time.Time `db:"created_at" json:"created_at"`
}
