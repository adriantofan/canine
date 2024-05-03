package env

import (
	"back/internal/pkg/infrastructure"
	"encoding/base64"
	"fmt"
	"os"
	"strings"

	flag "github.com/spf13/pflag"
)

//nolint:nakedret
func SetFlagsFromEnvironment(fs *flag.FlagSet) (err error) { //nolint:nonamedreturns
	fs.VisitAll(func(crtFlag *flag.Flag) {
		// TODO: kind of weird that the closure is modifying the outer scope err
		name := strings.ToUpper(strings.ReplaceAll(crtFlag.Name, "-", "_"))
		value, foundInEnv := os.LookupEnv(name)
		if foundInEnv {
			err2 := fs.Set(crtFlag.Name, value)
			if err2 != nil {
				err = fmt.Errorf("failed setting flag from environment: %w", err2)
			}

			return
		}
		if value, foundSecretPathInEnv := os.LookupEnv(name + "_SM_NAME"); foundSecretPathInEnv {
			secretBytes, err2 := infrastructure.AccessSecretVersion(value)
			if err2 != nil {
				err = fmt.Errorf("failed to access secret manager secret: %w", err2)
				return
			}
			secretBase64 := base64.StdEncoding.EncodeToString(secretBytes)
			err2 = fs.Set(crtFlag.Name, secretBase64) // whatever ...
			if err2 != nil {
				err = fmt.Errorf("failed setting flag from secret manager secret: %w", err2)

				return
			}
		}
	})

	return
}
