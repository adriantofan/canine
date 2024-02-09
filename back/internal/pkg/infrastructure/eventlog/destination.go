package eventlog

type maskType int

const (
	MaskBroadcastUserIDsOnly = 0
	MaskBroadcastInternal    = iota << 1
	MaskBroadcastExternal
	MaskBroadcastMarker
)

type Destination struct {
	Mask    maskType
	UserIDs []int64
}

func MakeDestinationMarker() Destination {
	return Destination{Mask: MaskBroadcastMarker, UserIDs: nil}
}
func MakeDestinationInternalMessage() Destination {
	return Destination{Mask: MaskBroadcastInternal, UserIDs: nil}
}

func MakeDestinationExternalMessage(userID int64) Destination {
	return Destination{Mask: MaskBroadcastInternal, UserIDs: []int64{userID}}
}

func MakeDestinationPrivateGroupMessage(userIDs []int64) Destination {
	return Destination{Mask: MaskBroadcastUserIDsOnly, UserIDs: userIDs}
}
func MakeDestinationBroadcastAll() Destination {
	return Destination{Mask: MaskBroadcastInternal & MaskBroadcastExternal, UserIDs: nil}
}

func (d *Destination) Match(userID int64, broadcast maskType) bool {
	if d.Mask&broadcast&MaskBroadcastMarker != 0 {
		return true
	}
	if d.Mask&broadcast&MaskBroadcastExternal != 0 {
		return true
	}
	if d.Mask&broadcast&MaskBroadcastInternal != 0 {
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
