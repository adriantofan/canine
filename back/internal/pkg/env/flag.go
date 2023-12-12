package env

import (
	"flag"
	"fmt"
	"os"
	"strings"
)

func SetFlagsFromEnvironment(fs *flag.FlagSet) (err error) {
	fs.VisitAll(func(f *flag.Flag) {
		name := strings.ToUpper(strings.Replace(f.Name, "-", "_", -1))
		if value, ok := os.LookupEnv(name); ok {
			err2 := fs.Set(f.Name, value)
			if err2 != nil {
				err = fmt.Errorf("failed setting flag from environment: %w", err2)
			}
		}
	})

	return
}
