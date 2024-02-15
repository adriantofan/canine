package model

type RTCRemote struct {
	ConversationsUpdateSeq *UpdateSeqRange `json:"conversations_update_seq"`
	Messages               []MessageRange  `json:"messages"`
	LastKnownUserVersion   UserVersion     `json:"last_known_user_version"`
}

func NewRTCSessionStart() RTCRemote {
	return RTCRemote{
		ConversationsUpdateSeq: nil,
		Messages:               nil,
		LastKnownUserVersion:   UserVersion{},
	}
}
