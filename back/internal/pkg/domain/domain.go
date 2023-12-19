package domain

import (
	genModel "back/.gen/canine/public/model"
	"context"
	"encoding/json"
	"fmt"
	"time"
)

// db anotation is used by sqlx
// while sql anotation is used by go-jet

type MillisecondsTime struct {
	time.Time
}

type MarshallerDataUpdate interface {
	MarshallDataUpdate() ([]byte, error)
}

type FailedUpdate struct {
	Inner error
}

func (f FailedUpdate) Error() string {
	return fmt.Sprintf("failed to update: %v", f.Inner)
}

func (f FailedUpdate) Unwrap() error {
	return f.Inner
}
func MakeFailedUpdate(err error) FailedUpdate {
	return FailedUpdate{Inner: err}
}

type UpdateNotifier interface {
	// NotifyUpdateMessage returns FailedUpdate if failed to notify
	NotifyUpdateMessage(ctx context.Context, message Message) error
}

func NewMillisecondsTime(t time.Time) MillisecondsTime {
	return MillisecondsTime{t}
}

func (mt MillisecondsTime) MarshalJSON() ([]byte, error) {
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

type DataUpdateType string

const (
	DataUpdateTypeMessage DataUpdateType = "message_update"
	//DataUpdateTypeUser         DataUpdateType = "user"
	DataUpdateTypeConversation DataUpdateType = "conversation_update"
)

type DataUpdate struct {
	Type DataUpdateType `json:"type"`
	Data string         `json:"data"`
}

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

func (m *Message) MarshallDataUpdate() ([]byte, error) {
	// TODO: make marshall - unmarshall test
	return json.Marshal(struct {
		Type DataUpdateType `json:"type"`
		Data Message        `json:"data"`
	}{Type: DataUpdateTypeMessage, Data: *m})
}
