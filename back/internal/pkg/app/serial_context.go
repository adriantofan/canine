package app

import (
	"context"

	"github.com/segmentio/ksuid"

	"github.com/gin-gonic/gin"
)

// SerialContextRelaxedRead is a context that is used to serialize read access to a resource.
type SerialContextRelaxedRead interface {
	SyncSeq(userID int64) SyncSeq
	context.Context
}

type serialContextRelaxedRead struct {
	context.Context
	seqByUserId map[int64]int64
	id          string
}

func (s *serialContextRelaxedRead) SyncSeq(userID int64) SyncSeq {
	return SyncSeq{
		Seq: s.seqByUserId[userID],
		ID:  s.id,
	}
}

func NewSerialContextRelaxedReadGin(ctx *gin.Context) (func(), SerialContextRelaxedRead) {
	scope := ctx.MustGet("scope").(*Scope)
	scope.mt.Lock()
	return func() {
			scope.mt.Unlock()
		}, &serialContextRelaxedRead{
			Context:     ctx,
			seqByUserId: scope.seqByUserId,
			id:          ksuid.New().String(),
		}
}

// SerialContextStrict is a context that is used to serialize read and write access to a resource.
type SerialContextStrict interface {
	NextSyncSeq(userID int64) SyncSeq
	SerialContextRelaxedRead
}

type serialContextStrict struct {
	serialContextRelaxedRead
}

func (s *serialContextStrict) NextSyncSeq(userID int64) SyncSeq {
	s.seqByUserId[userID]++
	return SyncSeq{
		Seq: s.seqByUserId[userID],
		ID:  s.id,
	}
}
func NewSerialContextStrictGin(ctx *gin.Context) (func(), SerialContextStrict) {
	scope := ctx.MustGet("scope").(*Scope)
	scope.mt.Lock()
	return func() {
			scope.mt.Unlock()
		}, &serialContextStrict{serialContextRelaxedRead: serialContextRelaxedRead{
			Context:     ctx,
			seqByUserId: scope.seqByUserId,
			id:          ksuid.New().String(),
		}}
}
