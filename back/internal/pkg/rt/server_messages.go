package rt

import (
	"back/internal/pkg/domain/model"
)

const (
	serverMessageKindSyncState serverMessageKind = "sync_state_resp"
	serverMessageKindDataLog   serverMessageKind = "data_log"
)

type (
	serverMessageKind string
	ServerMessage     struct {
		Kind      serverMessageKind `json:"kind"`
		RequestID string            `json:"request_id"`

		Data interface{} `json:"data"`
	}
)

func MakeServerMessageDataLog(requestID string, dataUpdate []model.DataUpdate) ServerMessage {
	return ServerMessage{
		Kind:      serverMessageKindDataLog,
		RequestID: requestID,
		Data:      dataUpdate,
	}
}

func MakeServerMessageSyncState(requestID string, syncState model.UserSyncState) ServerMessage {
	return ServerMessage{
		Kind:      serverMessageKindSyncState,
		RequestID: requestID,
		Data:      syncState,
	}
}

func (m *ServerMessage) MustGetSyncState() model.UserSyncState {
	syncState, ok := m.Data.(model.UserSyncState)
	if !ok {
		panic("invalid UserSyncState inside ServerMessage")
	}

	return syncState
}
