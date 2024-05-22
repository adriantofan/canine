package auth

import (
	"back/internal/pkg/domain"
	"context"
	"errors"
	"fmt"

	firebaseAuth "firebase.google.com/go/v4/auth"
)

type Service interface {
	// Login authenticates a user and returns a JWT token. Returns LoginError if the token is not linked to user.
	Login(ctx context.Context, tokenStr string, workspaceID int64) (string, error)
}

func NewService(authClient *firebaseAuth.Client, transaction domain.Transaction) *service {
	return &service{
		authClient:  authClient,
		transaction: transaction,
	}
}

type service struct {
	authClient  *firebaseAuth.Client
	transaction domain.Transaction
}

var (
	ErrLoginNoWorkspaceUserFound = errors.New("no workspace user found")
)

// Login authenticates a user and returns a new JWT token or error.
func (s service) Login(ctx context.Context, tokenStr string, workspaceID int64) (string, error) {
	token, err := s.authClient.VerifyIDToken(ctx, tokenStr)

	if err != nil {
		return "", fmt.Errorf("failed to verify token: %w", err)
	}

	// TODO: check if it is the case
	if token == nil {
		return "", nil
	}

	repo, err := s.transaction.WithoutTransaction()
	if err != nil {
		return "", fmt.Errorf("failed to get repository: %w", err)
	}

	user, err := repo.GetUserByFBUID(ctx, workspaceID, token.UID)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			return "", ErrLoginNoWorkspaceUserFound
		}

		return "", fmt.Errorf("failed to get user by fb uid: %w", err)
	}

	claims := map[string]interface{}{
		"workspace_id": workspaceID,
		"user_id":      user.ID,
	}
	newTokenStr, err := s.authClient.CustomTokenWithClaims(ctx, token.UID, claims)
	if err != nil {
		return "", fmt.Errorf("failed to create custom token: %w", err)
	}

	return newTokenStr, nil
}
