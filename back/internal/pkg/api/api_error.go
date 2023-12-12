package api

type Error struct {
	Code    string
	Message string
	Reason  string
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
)
