package domain

import (
	"encoding/json"
	"fmt"
	"time"
)

// db anotation is used by sqlx
// while sql anotation is used by go-jet

type MillisecondsTime struct {
	time.Time
}

func (mt *MillisecondsTime) MarshalJSON() ([]byte, error) {
	milliseconds := mt.Time.UnixNano() / int64(time.Millisecond)
	return json.Marshal(milliseconds)
}

func (mt *MillisecondsTime) UnmarshalJSON(data []byte) error {
	var milliseconds int64
	if err := json.Unmarshal(data, &milliseconds); err != nil {
		return err
	}
	mt.Time = time.Unix(0, milliseconds*int64(time.Millisecond))
	return nil
}

type User struct {
	ID        int64     `json:"id" sql:"primary_key"`
	Phone     string    `json:"phone"`
	CreatedAt time.Time `json:"created_at"`
}

type Conversation struct {
	ID            int64            `json:"id" sql:"primary_key"`
	User1ID       int64            `db:"user1_id" json:"user1_id"`
	User2ID       int64            `db:"user2_id" json:"user2_id"`
	LastMessageID int64            `db:"last_message_id" json:"last_message_id"`
	CreatedAt     MillisecondsTime `db:"created_at" json:"created_at"`
}

type Message struct {
	ID             int64            `json:"id" sql:"primary_key"`
	ConversationID int64            `db:"conversation_id" json:"conversation_id"`
	SenderID       int64            `db:"sender_id" json:"sender_id"`
	Message        string           `json:"message"`
	CreatedAt      MillisecondsTime `db:"created_at" json:"created_at"`
}

func (mt *MillisecondsTime) Scan(value interface{}) error {
	switch v := value.(type) {
	case time.Time:
		mt.Time = v
		return nil
	case []byte:
		t, err := time.Parse(time.RFC3339Nano, string(v))
		if err != nil {
			return err
		}
		mt.Time = t
		return nil
	default:
		return fmt.Errorf("Unsupported Scan type: %T", value)
	}
}
