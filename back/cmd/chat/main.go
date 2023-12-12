package main

import (
	"back/internal/app/chat"
	"os"
)

func main() {
	chat.Run(os.Args)
}
