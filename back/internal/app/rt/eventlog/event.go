package eventlog

import (
	"time"

	"github.com/segmentio/ksuid"
)

type Event struct {
	WorkspaceID int64
	Destination Destination
	Time        time.Time
	MarkerHash  string
	Payload     []byte
}

func MakeMarkerEvent(workspaceID int64) Event {
	return Event{
		WorkspaceID: workspaceID,
		Destination: MakeDestinationMarker(),
		Time:        time.Now(),
		MarkerHash:  ksuid.New().String(),
		Payload:     nil,
	}

}
