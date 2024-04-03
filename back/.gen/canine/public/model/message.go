//
// Code generated by go-jet DO NOT EDIT.
//
// WARNING: Changes to this file may cause incorrect behavior
// and will be lost if the code is regenerated
//

package model

import (
	"github.com/lib/pq"
	"time"
)

type Message struct {
	ID             int64 `sql:"primary_key"`
	ConversationID int64
	SenderID       int64
	Type           MessageType
	Message        string
	CreatedAt      time.Time
	Attachments    pq.StringArray
}
