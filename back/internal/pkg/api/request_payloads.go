package api

import (
	"back/internal/pkg/app"
	"fmt"
	"math"
	"net/url"
	"strconv"
)

type CreateUserPayload = app.CreateUserData

type CreateConversationPayload struct {
	RecipientMessagingAddress string `json:"recipient_messaging_address"`
}

type CreateMessagePayload = app.CreateMessageData

type GetConversationMessagesParams struct {
	LastID    int
	Ascending bool
	Limit     int
}

type PaginationInfo struct {
	Limit  int   `json:"limit"`
	PrevID int64 `json:"prev_id"`
	NextID int64 `json:"next_id"`
}

func ParseGetConversationMessagesParams(values url.Values) (GetConversationMessagesParams, error) {
	p := GetConversationMessagesParams{}
	// Access individual query parameters by key
	lastIDStr := values.Get("last_id")
	AscendingStr := values.Get("ascending")
	limitStr := values.Get("limit")

	if len(limitStr) > 0 {
		l, err := strconv.Atoi(limitStr)
		if err != nil {
			return p, fmt.Errorf("invalid limit: %s %w", limitStr, err)
		}
		if l > 100 {
			p.Limit = 100
		} else {
			p.Limit = l
		}
	} else {
		p.Limit = 25
	}

	if len(AscendingStr) > 0 {
		a, err := strconv.ParseBool(AscendingStr)
		if err != nil {
			return p, fmt.Errorf("invalid ascending: %s %w", AscendingStr, err)
		}
		p.Ascending = a
	} else {
		p.Ascending = false
	}

	if len(lastIDStr) > 0 {
		lastID, err := strconv.Atoi(lastIDStr)
		if err != nil {
			return p, fmt.Errorf("invalid last_id: %s %w", lastIDStr, err)
		}
		p.LastID = lastID
	} else {
		p.LastID = math.MaxInt32
		p.Ascending = false
	}

	return p, nil
}
