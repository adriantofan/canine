//
// Code generated by go-jet DO NOT EDIT.
//
// WARNING: Changes to this file may cause incorrect behavior
// and will be lost if the code is regenerated
//

package model

import (
	"time"
)

type Conversation struct {
	ID             int64 `sql:"primary_key"`
	WorkspaceID    int64
	ExternalUserID int64
	Name           *string
	CreatedAt      time.Time
	UpdatedAt      time.Time
	UpdatedSeq     int64
	Archived       bool
	LastMessageID  *int64
}
