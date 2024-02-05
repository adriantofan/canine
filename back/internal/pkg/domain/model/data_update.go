package model

import "encoding/json"

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

func (m *Message) MarshallDataUpdate() ([]byte, error) {
	// TODO: make marshall - unmarshall test
	return json.Marshal(struct {
		Type DataUpdateType `json:"type"`
		Data Message        `json:"data"`
	}{Type: DataUpdateTypeMessage, Data: *m})
}
