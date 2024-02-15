package buffer

import (
	"back/internal/pkg/rt/eventlog"
	"log"

	"github.com/gammazero/deque"
)

const kWarnBufferSize = 200

// Buffer sits between a producer and a consumer buffering data from the producer to the consumer.
// The producer writes to the buffer and the consumer reads from the buffer.
// Producer is never blocked even if the consumer stops reading from the buffer.

func Buffer(events <-chan []eventlog.Event) <-chan []byte {
	out := make(chan []byte)
	d := deque.New[eventlog.Event]()
	// TODO: add instrumentation to monitor channel d size
	go func() {
		defer close(out)

		for {
			if d.Len() == 0 {
				if eventBatch, ok := <-events; true {
					if !ok {
						return
					}
					for _, event := range eventBatch {
						d.PushFront(event)
					}
				}
			} else {
				select { // even if out never read still appends
				case eventBatch, ok := <-events:
					if !ok {
						return
					}
					for _, event := range eventBatch {
						d.PushFront(event)
					}
					if d.Len() > kWarnBufferSize {
						log.Printf("Buffer size > %d last event %s", kWarnBufferSize, d.Back())
					}
				case out <- d.Back().Payload:
					d.PopBack()
				}
			}
		}
	}()

	return out
}
