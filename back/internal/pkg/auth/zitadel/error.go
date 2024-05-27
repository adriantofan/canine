package zitadel

import (
	"errors"
)

// UnauthorizedError is used to provide the information to the caller, that the provided authorization
// is invalid (missing, wrong format, expired, ...).
type UnauthorizedError struct {
	err error
}

func NewErrorUnauthorized(err error) *UnauthorizedError {
	return &UnauthorizedError{
		err: err,
	}
}

func (e *UnauthorizedError) Error() string {
	if e.err == nil {
		return "unauthorized"
	}

	return e.err.Error()
}

func (e *UnauthorizedError) Is(target error) bool {
	var unauthorizedError *UnauthorizedError
	ok := errors.As(target, &unauthorizedError)
	if !ok {
		return false
	}
	if unauthorizedError.err == nil {
		return true
	}

	return errors.Is(e.err, unauthorizedError.err)
}

func (e *UnauthorizedError) Unwrap() error {
	return e.err
}

// PermissionDeniedError is used to provide the information to the caller, that the provided authorization
// was valid but not sufficient (missing role).
type PermissionDeniedError struct {
	err error
}

func NewErrorPermissionDenied(err error) *PermissionDeniedError {
	return &PermissionDeniedError{
		err: err,
	}
}

func (e *PermissionDeniedError) Error() string {
	if e.err == nil {
		return "permission denied"
	}

	return e.err.Error()
}

func (e *PermissionDeniedError) Is(target error) bool {
	var permissionDeniedError *PermissionDeniedError
	ok := errors.As(target, &permissionDeniedError)
	if !ok {
		return false
	}
	if permissionDeniedError.err == nil {
		return true
	}

	return errors.Is(e.err, permissionDeniedError.err)
}

func (e *PermissionDeniedError) Unwrap() error {
	return e.err
}
