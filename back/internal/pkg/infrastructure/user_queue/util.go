package user_queue

import "fmt"

func userQueueName(userID int64) string {
	return fmt.Sprintf("user:%d", userID)
}
