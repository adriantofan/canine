package rt

import (
	"back/internal/pkg/app"
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

		// SyncSeq in the same SyncID MUST be consecutive, when not the case
		// sync state again to reset to a nominal state.
		// UserSyncState sets the baseline for SyncSeq and SyncID.
		SyncSeq app.SyncSeq `json:"sync_seq"`

		Data interface{} `json:"Data"`
	}
)

func MakeServerMessageDataLog(requestID string, syncSeq app.SyncSeq, dataUpdate []model.DataUpdate) ServerMessage {
	return ServerMessage{
		Kind:      serverMessageKindDataLog,
		RequestID: requestID,
		SyncSeq:   syncSeq,
		Data:      dataUpdate,
	}

}

func MakeServerMessageSyncState(requestID string, syncSeq app.SyncSeq, syncState model.UserSyncState) ServerMessage {
	return ServerMessage{
		Kind:      serverMessageKindSyncState,
		RequestID: requestID,
		SyncSeq:   syncSeq,
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
