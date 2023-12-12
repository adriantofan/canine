package chat

import (
	"back/internal/app/chat/api"
	"log"
	"os"
)

func Run(args []string) {
	log.Printf("Running chat with args: %v", args)
	if len(args) < 2 {
		exitWithHelp()
	}
	switch args[1] {
	case "api":
		api.Run(args[2:])
	default:
		exitWithHelp()
	}
}

func exitWithHelp() {
	println("Valid arguments: api")
	os.Exit(-1)
}
