package websocket

import (
	"time"

	"github.com/rs/zerolog/log"

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
	done chan<- struct{} // signals that the connection is closed
	out  chan []byte     // msgs from websocket are written to this channel
	in   <-chan []byte   // msgs from this channel are written to websocket
	stop <-chan struct{}
}

func NewClientStream(conn *websocket.Conn, stop <-chan struct{}, done chan<- struct{}, in <-chan []byte) *ClientStream {
	return &ClientStream{
		conn: conn,
		done: done,
		out:  make(chan []byte),
		in:   in,
		stop: stop,
	}
}

func (c *ClientStream) Run() {
	readClosed := make(chan struct{}, 1)
	go c.writePump(readClosed)
	go c.readPump(readClosed)
}

func (c *ClientStream) writePump(readClosed <-chan struct{}) {
	ticker := time.NewTicker(pingPeriod)
	var shutdownAsked bool
	defer func() {
		ticker.Stop()
		if shutdownAsked {
			log.Info().Msg("ClientStream.writePump: shutdown asked")
			clientClosedTimer := time.NewTimer(10 * time.Second)
			select { // wait for the client to close or timeout
			case <-readClosed:
			case <-clientClosedTimer.C:
			}
		}
		// even if the client does not close we eventually close the connection to interrupt the readPump
		_ = c.conn.Close()
	}()
	for {
		select {
		case <-c.stop:
			_ = c.conn.SetWriteDeadline(time.Now().Add(writeWait)) // seems like it never returns nil
			err := c.conn.WriteMessage(websocket.CloseMessage,
				websocket.FormatCloseMessage(websocket.CloseGoingAway, "a"))
			if err != nil {
				shutdownAsked = true
			}
			// could wait here for the server to close the connection
			return

		case message, ok := <-c.in:
			_ = c.conn.SetWriteDeadline(time.Now().Add(writeWait)) // seems like it never returns nil
			if !ok {
				// The hub closed the channel.
				err := c.conn.WriteMessage(websocket.CloseMessage,
					websocket.FormatCloseMessage(websocket.CloseGoingAway, "b"))
				if err != nil {
					shutdownAsked = true
				}
				// could wait here for the server to close the connection
				return
			}
			// FIXME: ASSUMPTION: after an IO failure the connection is closed which would trigger the readPump to
			// 	 fail and close the done channel
			writer, err := c.conn.NextWriter(websocket.TextMessage)
			if err != nil {
				return
			}
			_, err = writer.Write(message)
			if err != nil {

				return
			}

			if err := writer.Close(); err != nil {
				return
			}
		case <-ticker.C:
			_ = c.conn.SetWriteDeadline(time.Now().Add(writeWait)) // seems like it never returns nil
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
func (c *ClientStream) readPump(readClosed chan<- struct{}) {
	defer func() {
		readClosed <- struct{}{}
		_ = c.conn.Close()
		c.done <- struct{}{}
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
				log.Error().Err(err).Msg("ClientStream.readPump: unexpected close error")
			}

			break
		}
		c.out <- message
	}
}
