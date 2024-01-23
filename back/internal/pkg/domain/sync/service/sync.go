package service

import (
	"encoding/json"
	"fmt"

	"back/internal/pkg/domain/sync/domain"
	"back/internal/pkg/domain/sync/service/sm"
)

var (
	errPoolDataStoppedSync       = fmt.Errorf("pool stoped sync")
	errFailSendClientInitSync    = fmt.Errorf("failed to send sync")
	errNotificationChannelClosed = fmt.Errorf("failed on closed notification channel")
	errStopOnChangeNotification  = fmt.Errorf("failed to process notification") // FIXME: maybe propagate underlying error
	errWebsocketClosed           = fmt.Errorf("failed to read from websocket")
	errStopOnClientMessage       = fmt.Errorf("failed to process client message") // FIXME: maybe propagate underlying error
)

func sync(q Notification, s *ClientStream) error {
	s.Run()
	defer func() {
		close(s.in)
		<-s.done
	}()
	syncSentChan := q.SendSyncProducer()
	state := sm.NewStateMachine()

	for {
		for {
			// drain all messages from state on to the websocket
			// FIXME: depends on all input channels to be buffered
			// 	otherwise we will block here, and will not be able to read from websocket (possible to use some timer
			//  instead)
			update := state.PoolData()
			if !update.Sane {
				close(s.in)
				<-s.done

				return errPoolDataStoppedSync
			}

			state = update.NewState
			if len(update.Messages) == 0 {
				break
			}

			bytes, err := json.Marshal(update.Messages)
			if err != nil {
				close(s.in)
				<-s.done

				return fmt.Errorf("failed to marshal messages: %w", err)
			}
			s.in <- bytes
			update.Messages = nil
		}

		select {
		case ok := <-syncSentChan:
			if !ok {
				close(s.in)
				<-s.done

				return errFailSendClientInitSync
			}
			syncSentChan = nil

		case notification, ok := <-q.Notifications():
			if !ok {
				// Here we could try to resync instead of ungracefully closing connection
				close(s.in)
				<-s.done

				return errNotificationChannelClosed
			}
			newState, ok := state.OnChangeNotification(notification)

			if !ok {
				if !ok {
					close(s.in)
					<-s.done

					return errStopOnChangeNotification
				}
			}
			state = newState

		case clientMessageStr, ok := <-s.out:
			if !ok {
				// Here we could try to resync instead of ungracefully closing connection
				close(s.in)
				<-s.done
				// TODO: in which circumstances this could happen?
				return errWebsocketClosed
			}
			var clientMessage domain.ServerMessage
			if err := clientMessage.UnmarshalJSON(clientMessageStr); err != nil {
				close(s.in)
				<-s.done

				return fmt.Errorf("failed to unmarshal client message: %w", err)
			}

			newState, ok := state.OnClientMessage(clientMessage)
			if !ok {
				close(s.in)
				<-s.done

				return errStopOnClientMessage
			}
			state = newState

		case <-s.done:
			return errWebsocketClosed
		}
	}
}
