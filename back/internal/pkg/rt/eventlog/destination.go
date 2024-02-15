package eventlog

import "fmt"

type BroadcastMask int

const (
	MaskBroadcastUserIDsOnly BroadcastMask = 0
	MaskBroadcastInternal    BroadcastMask = iota << 1
	MaskBroadcastExternal
	MaskBroadcastMarker
)

type Destination struct {
	BroadcastMask BroadcastMask
	UserIDs       []int64
}

func (d Destination) String() string {
	return fmt.Sprintf("Destination{BroadcastMask: %b, UserIDs: %v}", d.BroadcastMask, d.UserIDs)
}
func MakeDestinationMarker() Destination {
	return Destination{BroadcastMask: MaskBroadcastMarker, UserIDs: nil}
}
func MakeDestinationInternalMessage() Destination {
	return Destination{BroadcastMask: MaskBroadcastInternal, UserIDs: nil}
}

func MakeDestinationExternalMessage(userID int64) Destination {
	return Destination{BroadcastMask: MaskBroadcastInternal, UserIDs: []int64{userID}}
}

func MakeDestinationPrivateGroupMessage(userIDs []int64) Destination {
	return Destination{BroadcastMask: MaskBroadcastUserIDsOnly, UserIDs: userIDs}
}
func MakeDestinationBroadcastAll() Destination {
	return Destination{BroadcastMask: MaskBroadcastInternal & MaskBroadcastExternal, UserIDs: nil}
}

func (d *Destination) Match(userID int64, broadcast BroadcastMask) bool {
	if d.BroadcastMask&broadcast&MaskBroadcastMarker != 0 {
		return true
	}
	if d.BroadcastMask&broadcast&MaskBroadcastExternal != 0 {
		return true
	}
	if d.BroadcastMask&broadcast&MaskBroadcastInternal != 0 {
		return true
	}
	// TODO: binary search
	for _, v := range d.UserIDs {
		if v == userID {
			return true
		}
	}

	return false
}
