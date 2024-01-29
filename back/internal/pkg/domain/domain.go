package domain

import (
	"encoding/json"
	"fmt"
	"time"

	genModel "back/.gen/canine/public/model"
)

// db anotation is used by sqlx
// while sql anotation is used by go-jet

type MillisecondsTime struct {
	time.Time
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
	mt.Time = time.Unix(0, milliseconds*int64(time.Millisecond)).UTC()
	return nil
}

type (
	DataUpdateType string
	DataUpdateKind string
)

const (
	DataUpdateKindCreate DataUpdateKind = "create"
	DataUpdateKindUpdate DataUpdateKind = "update"
	DataUpdateKindDelete DataUpdateKind = "delete"
)

const (
	DataUpdateTypeMessage DataUpdateType = "message_update"
	// DataUpdateTypeUser         DataUpdateType = "user"
	DataUpdateTypeConversation DataUpdateType = "conversation_update"
)

type DataUpdate struct {
	Kind DataUpdateKind `json:"kind"`
	Type DataUpdateType `json:"type"`
	Data interface{}    `json:"data"`
}

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
