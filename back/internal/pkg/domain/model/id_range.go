package model

type IDRange = Range
type UpdateSeqRange = Range

type Range struct {
	First int64 `json:"first_id"`
	Last  int64 `json:"last_id"`
}

func (r *Range) Len() int {
	// FIXME: can it overflow?
	//  Length of an array is always `int` but the range here is theoretically `int64`
	return int(r.Last - r.First + 1)
}
