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

func MakeServerMessageSyncState(requestID string, syncState model.RTCRemoteUpdate) ServerMessage {
	return ServerMessage{
		Kind:      serverMessageKindSyncState,
		RequestID: requestID,
		Data:      syncState,
	}
}

func (m *ServerMessage) MustGetSyncState() model.RTCRemoteUpdate {
	syncState, ok := m.Data.(model.RTCRemoteUpdate)
	if !ok {
		panic("invalid RTCRemoteUpdate inside ServerMessage")
	}

	return syncState
}
