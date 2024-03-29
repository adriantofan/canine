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
		Message: "Not found",
	}
	ErrorNotAuthorized = Error{
		Message: "Not authorized",
	}
)

const (
	ErrorCodeInvalidRequest = "invalid_request"
	ErrorCodePayloadExists  = "payload_exists"
	ErrorCodeUnauthorized   = "unauthorized"
	ErrorCodeForbidden      = "forbidden"
)
