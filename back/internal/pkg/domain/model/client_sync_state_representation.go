package model

type ClientSyncStateRepresentation struct {
	ConversationsUpdateSeq *UpdateSeqRange `json:"conversations_update_seq"`
	Messages               []MessageRange  `json:"messages"`
	LastKnownUserVersion   UserVersion     `json:"last_known_user_version"`
}

func NewClientSyncStateRepresentation() ClientSyncStateRepresentation {
	return ClientSyncStateRepresentation{
		ConversationsUpdateSeq: nil,
		Messages:               nil,
		LastKnownUserVersion:   UserVersion{},
	}
}
