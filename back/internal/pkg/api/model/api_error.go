package model

type Error struct {
	Code    string `json:"code"`
	Message string `json:"message"`
	Reason  string `json:"reason"`
}

func MakeError(code string, message string, reason string) Error {
	return Error{code, message, reason}
}

var (
	ErrorInternalServer = Error{
		Message: "Internal server error",
	}
	ErrorNotFound = Error{
		Code:    ErrorCodeNotFound,
		Message: "Not found",
		Reason:  "",
	}
	ErrorNotAuthorized = Error{
		Message: "Not authorized",
	}

	ErrorBadRequest = Error{
		Code:    ErrorCodeInvalidRequest,
		Message: "Invalid request",
	}
)

const (
	ErrorCodeInvalidRequest            = "invalid_request"
	ErrorCodePayloadExists             = "payload_exists"
	ErrorCodeAuthWorkspaceOrUserExists = "auth_workspace_or_user_exists"
	ErrorCodeNotFound                  = "not_found"
	ErrorCodeUnauthorized              = "unauthorized"
	ErrorCodeForbidden                 = "forbidden"

	ErrorCodeAuthNoWorkspaceUserFound = "auth_no_workspace_user_found"
)
