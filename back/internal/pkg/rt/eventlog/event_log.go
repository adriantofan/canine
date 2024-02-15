package eventlog

/*
 Want to send to:
 1. Internal messages  - send to all internal users
 2. External message in a conversation with an external user - send to all internal users and the user
 3. A private message in a group of users (conversation with a group of users) - send to all users from the list
 4. Internal user changed - To everyone
*/

type Output interface {
	// Write is a blocking call, goroutine safe
	Write(event Event) error
}

type Input interface {
	StreamEvents(
		workspaceID, userID int64,
		broadcastMask BroadcastMask,
		startHash string,
	) (func(), chan []Event)
}
