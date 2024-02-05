package app

import (
	"sync"

	"github.com/segmentio/ksuid"
)

// Scope is a simple mutex to be used as a scope for serializing access to a resource.
// It is used in the context of a gin request to ensure that only one requests in the context
// of a workspace are executed serially.
type Scope struct {
	mt          sync.RWMutex
	seqByUserId map[int64]int64
	id          string
}

func NewScope() *Scope {
	return &Scope{
		mt:          sync.RWMutex{},
		seqByUserId: make(map[int64]int64),
		id:          ksuid.New().String(),
	}
}
