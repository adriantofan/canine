package rpc

import (
	"log"
	"time"

	"github.com/gorilla/websocket"
)

const (
	// Time allowed to write a message to the peer.
	writeWait = 10 * time.Second

	// Time allowed to read the next pong message from the peer.
	pongWait = 60 * time.Second

	// Send pings to peer with this period. Must be less than pongWait.
	pingPeriod = (pongWait * 9) / 10

	// Maximum message size allowed from peer.
	maxMessageSize = 512
)

type ClientStream struct {
	conn *websocket.Conn
	done chan struct{} // signals that the connection is closed
	out  chan []byte   // msgs from websocket are written to this channel
	in   chan []byte   // msgs from this channel are written to websocket
}

func NewClientStream(conn *websocket.Conn, done chan struct{}, in chan []byte) *ClientStream {
	return &ClientStream{
		conn: conn,
		done: done,
		out:  make(chan []byte),
		in:   in,
	}
}

func (c *ClientStream) Run() {
	go c.writePump()
	go c.readPump()
}

func (c *ClientStream) writePump() {
	ticker := time.NewTicker(pingPeriod)
	defer func() {
		ticker.Stop()
		c.conn.Close()
	}()
	for {
		select {
		case message, ok := <-c.in:
			c.conn.SetWriteDeadline(time.Now().Add(writeWait))
			if !ok {
				// The hub closed the channel.
				_ = c.conn.WriteMessage(websocket.CloseMessage, []byte{})

				return
			}
			// FIXME: ASSUMPTION: after an IO failure the connection is closed which would trigger the readPump to
			// 	 fail and close the done channel
			w, _ := c.conn.NextWriter(websocket.TextMessage)
			_, _ = w.Write(message)

			// TODO: should do something about queued messages to improve throughput ?

			if err := w.Close(); err != nil {
				return
			}
		case <-ticker.C:
			c.conn.SetWriteDeadline(time.Now().Add(writeWait))
			if err := c.conn.WriteMessage(websocket.PingMessage, nil); err != nil {
				return
			}
		}
	}
}

// readPump pumps messages from the websocket connection to send chan
// In case of error,  sends struct{} to done chan and closes the connection
//
// A goroutine running readPump is started for each connection.
// The application ensures that there is at most one reader on a connection by executing all reads from this goroutine.
func (c *ClientStream) readPump() {
	defer func() {
		c.done <- struct{}{}
		_ = c.conn.Close()
	}()
	c.conn.SetReadLimit(maxMessageSize)
	// TODO: what does it mean that a error is returned here? Is it a full stop ?
	err := c.conn.SetReadDeadline(time.Now().Add(pongWait))
	if err != nil {
		return
	}
	c.conn.SetPongHandler(func(string) error { return c.conn.SetReadDeadline(time.Now().Add(pongWait)) })
	for {
		_, message, err := c.conn.ReadMessage()
		if err != nil {
			if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseAbnormalClosure) {
				log.Printf("error: %v", err)
			}

			break
		}
		c.out <- message
	}
}
