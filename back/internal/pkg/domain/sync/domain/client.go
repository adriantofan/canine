package domain

import (
	"encoding/json"
	"errors"
	"fmt"

	mainDomain "back/internal/pkg/domain"
)

type clientMessageKind int

const (
	ClientMessageKindNA clientMessageKind = iota
	ClientMessageKindSyncState
	ClientMessageKindConversations
	ClientMessageKindMessages
)

type ClientMessage struct {
	Kind clientMessageKind
	data interface{}
}

type InitialSyncState struct {
	ConversationRange IDRange        `json:"conversation_range"`
	Messages          []MessageRange `json:"messages"`
}

type MessageRange struct {
	ConversationID int64   `json:"conversation_id"`
	Range          IDRange `json:"range"`
}

type IDRange struct {
	FirstID *int64 `json:"first_id"`
	LastID  *int64 `json:"last_id"`
}

type ConversationMessages struct {
	ConversationID int64                `json:"conversation_id"`
	Messages       []mainDomain.Message `json:"messages"`
}

var ErrInvalidClientPayload = errors.New("invalid client payload")

func MakeClientMessageConversations(conversations []mainDomain.Conversation) ClientMessage {
	return ClientMessage{
		Kind: ClientMessageKindConversations,
		data: conversations,
	}
}

func MakeClientMessageMessages(messages []ConversationMessages) ClientMessage {
	return ClientMessage{
		Kind: ClientMessageKindMessages,
		data: messages,
	}
}

func (cm *ClientMessage) UnmarshalJSON(data []byte) error {
	var tmp struct {
		Kind clientMessageKind `json:"kind"`
	}

	if err := json.Unmarshal(data, &tmp); err != nil {
		return err
	}

	switch tmp.Kind {
	case ClientMessageKindSyncState:
		var state InitialSyncState
		if err := json.Unmarshal(data, &state); err != nil {
			return fmt.Errorf("failed to unmarshal InitialSyncState: %w", err)
		}

		cm.Kind = tmp.Kind
		cm.data = state
	}

	return fmt.Errorf("unknown ClientMessageKind %d: %w", tmp.Kind, ErrInvalidClientPayload)
}

func (c *ClientMessage) MustGetInitialSyncState() InitialSyncState {
	state, ok := c.data.(InitialSyncState)
	if !ok {
		panic("invalid InitialSyncState inside ClientMessage")
	}

	return state
}
