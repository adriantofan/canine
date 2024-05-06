package chat

import (
	"back/internal/app/chat/api"
	"os"
)

func Run(args []string) {
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
