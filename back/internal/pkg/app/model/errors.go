package model

import (
	"errors"
	"fmt"
)

// InvalidRequestError represents an error for an invalid request with a user-friendly message
// This should be avoided in favor of more specific errors. At the moment it does not support translation.
// The initial use case was for underlying grpc errors.
type InvalidRequestError struct {
	UserMessage string
	err         error
}

func NewInvalidRequestError(userMessage string, cause error) *InvalidRequestError {
	return &InvalidRequestError{
		UserMessage: userMessage,
		err:         cause,
	}
}

// Error implements the error interface for InvalidRequestError
func (e *InvalidRequestError) Error() string {
	return fmt.Sprintf("%s: %v", e.UserMessage, e.err)
}

func (e *InvalidRequestError) Is(target error) bool {
	var invalidRequestError *InvalidRequestError
	ok := errors.As(target, &invalidRequestError)
	if !ok {
		return false
	}
	if invalidRequestError == nil || invalidRequestError.err == nil {
		return true
	}

	return errors.Is(e.err, invalidRequestError.err)
}

// Unwrap returns the cause of the error, if any
func (e *InvalidRequestError) Unwrap() error {
	return e.err
}
