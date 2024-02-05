package model

import (
	"encoding/json"
	"fmt"
	"time"
)

type MillisecondsTime struct {
	time.Time
}

func NewMillisecondsTime(t time.Time) MillisecondsTime {
	return MillisecondsTime{t}
}

func (mt MillisecondsTime) MarshalJSON() ([]byte, error) {
	milliseconds := mt.Time.UnixNano() / int64(time.Millisecond)
	return json.Marshal(milliseconds)
}

func (mt *MillisecondsTime) UnmarshalJSON(data []byte) error {
	var milliseconds int64
	if err := json.Unmarshal(data, &milliseconds); err != nil {
		return err
	}
	mt.Time = time.Unix(0, milliseconds*int64(time.Millisecond)).UTC()
	return nil
}

func (mt *MillisecondsTime) Scan(value interface{}) error {
	switch v := value.(type) {
	case time.Time:
		mt.Time = v
		return nil
	case []byte:
		t, err := time.Parse(time.RFC3339Nano, string(v))
		if err != nil {
			return err
		}
		mt.Time = t
		return nil
	default:
		return fmt.Errorf("Unsupported Scan type: %T", value)
	}
}
