package hash

import (
	"fmt"

	"github.com/alexedwards/argon2id"
)

// References:
// https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html#maximum-password-lengths
// https://github.com/alexedwards/argon2id
// https://snyk.io/blog/secure-password-hashing-in-go/
func CreateHash(password string) (string, error) {
	hash, err := argon2id.CreateHash(password, argon2id.DefaultParams)
	if err != nil {
		return "", fmt.Errorf("failed to hash password: %w", err)
	}

	return hash, nil
}

func ComparePasswordAndHash(submittedPassword string, passwordHash string) (bool, error) {
	return argon2id.ComparePasswordAndHash(submittedPassword, passwordHash) //nolint:wrapcheck
}
