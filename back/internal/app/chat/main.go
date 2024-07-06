package chat

import (
	"back/internal/app/chat/api"
	"back/internal/app/chat/worker"
	"os"
)

func Run(args []string) {
	if len(args) < 2 {
		exitWithHelp()
	}
	switch args[1] {
	case "api":
		api.Run(args[2:])
	case "notification":
		worker.Run(args[2:])
	default:
		exitWithHelp()
	}
}

func exitWithHelp() {
	println("Valid arguments: api")
	os.Exit(-1)
}
