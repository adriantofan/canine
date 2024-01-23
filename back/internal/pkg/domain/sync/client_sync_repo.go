package sync

import (
	"context"
	"fmt"

	"back/internal/pkg/domain/sync/domain"

	mainDomain "back/internal/pkg/domain"
)

const (
	itemsPerPage = 100 // TODO expose this to constants
)

type syncRange struct {
	done        bool
	clientRange domain.IDRange
}

type ClientSyncRepo struct {
	conversationSyncRange syncRange
	conversationIds       []int64

	initialMessagesSent bool
	messageSyncIndex    int
	messageRanges       map[int64]*syncRange

	repo mainDomain.ChatRepository
}

func MakeSyncState(initialState domain.InitialSyncState) ClientSyncRepo {
	return ClientSyncRepo{}
}

func (s *ClientSyncRepo) GetMissingMessages(ctx context.Context) ([]domain.ConversationMessages, error) {
	if s.initialMessagesSent {
		return nil, nil
	}

	if s.messageSyncIndex >= len(s.conversationIds) {
		s.initialMessagesSent = true

		return nil, nil
	}

	conversationsMessages := make([]domain.ConversationMessages, 0)
	count := 0
	for i := s.messageSyncIndex; i < len(s.conversationIds); i++ {
		conversationID := s.conversationIds[i]
		messageRange := s.messageRanges[conversationID]
		s.messageSyncIndex = i
		if !messageRange.done {
			messages, err := s.repo.GetMessages(
				ctx,
				conversationID,
				messageRange.clientRange.LastID,
				itemsPerPage,
				mainDomain.Forward,
			)
			if err != nil {
				return nil, fmt.Errorf("failed to get messages: %w", err)
			}

			if len(messages) == 0 {
				messageRange.done = true
				s.messageSyncIndex++

				continue
			}

			if messageRange.clientRange.FirstID == nil {
				messageRange.clientRange.FirstID = &messages[0].ID
			}

			messageRange.clientRange.LastID = &messages[len(messages)-1].ID
			// TODO: add conversation to messages if needed
			conversationsMessages = append(conversationsMessages, domain.ConversationMessages{
				ConversationID: conversationID,
				Messages:       messages,
			})

			count += len(messages)
			if count >= itemsPerPage {
				return conversationsMessages, nil
			}
		}
	}
	if len(conversationsMessages) == 0 {
		s.initialMessagesSent = true
	}

	return conversationsMessages, nil
}

func (s *ClientSyncRepo) GetMissingConversations(ctx context.Context) ([]mainDomain.Conversation, error) {
	if !s.conversationSyncRange.done {
		// needs some retry logic
		conversations, err := s.repo.GetConversations(
			ctx,
			s.conversationSyncRange.clientRange.LastID,
			itemsPerPage,
			mainDomain.Forward,
		)
		if err != nil {
			return nil, fmt.Errorf("failed to get conversations: %w", err)
		}

		if len(conversations) == 0 {
			s.conversationSyncRange.done = true

			return nil, nil
		}

		if s.conversationSyncRange.clientRange.FirstID == nil {
			s.conversationSyncRange.clientRange.FirstID = &conversations[0].ID
		}

		// Prepare message sync based on conversation ids
		s.conversationSyncRange.clientRange.LastID = &conversations[len(conversations)-1].ID
		for _, conversation := range conversations {
			s.conversationIds = append(s.conversationIds, conversation.ID)
			if _, ok := s.messageRanges[conversation.ID]; !ok {
				s.messageRanges[conversation.ID] = &syncRange{}
			}
		}

		return conversations, nil
	}

	return nil, nil
}
