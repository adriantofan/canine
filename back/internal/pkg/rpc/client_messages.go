package rpc

import (
	"back/internal/pkg/domain/model"
	"encoding/json"
	"fmt"
)

type (
	clientMessageKind string
	ClientMessage     struct {
		Kind      clientMessageKind `json:"kind"`
		RequestID string            `json:"request_id"`
		Data      interface{}       `json:"Data"`
	}
)

const (
	ClientMessageKindSyncState clientMessageKind = "sync_state_req"
)

// objectives :
// 1. messages are heterogeneous
// 2. need to marshal/unmarshal messages client and server side
// 3. need to determine be able to easily access Data

func (m *ClientMessage) MustGetClientSyncStateRepresentation() model.ClientSyncStateRepresentation {
	syncState, ok := m.Data.(model.ClientSyncStateRepresentation)
	if !ok {
		panic("invalid ClientSyncStateRepresentation inside ClientMessage")
	}

	return syncState
}

func (m *ClientMessage) UnmarshallJSON(data []byte) error {
	var tmp struct {
		Kind clientMessageKind `json:"kind"`
	}
	if err := json.Unmarshal(data, &tmp); err != nil {
		return fmt.Errorf("unmarshal ClientMessage kind: %w", err)
	}

	switch tmp.Kind {
	case ClientMessageKindSyncState:
		var syncState model.ClientSyncStateRepresentation
		if err := json.Unmarshal(data, &syncState); err != nil {
			return fmt.Errorf("unmarshal ClientMessage ClientSyncStateRepresentation: %w", err)
		}
		m.Kind = tmp.Kind
		m.Data = syncState
		return nil
	default:
		return fmt.Errorf("unmarshal ClientMessage: unknown kind %s", tmp.Kind)
	}
}
