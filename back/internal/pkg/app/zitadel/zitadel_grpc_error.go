package zitadel

import (
	appModel "back/internal/pkg/app/model"
	"strings"

	"github.com/pkg/errors"

	"github.com/zitadel/zitadel-go/v2/pkg/client/zitadel/message"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func NewInvalidRequestError(statusErr *status.Status) error {
	var userMessages []string
	if statusErr.Code() == codes.InvalidArgument {
		for _, detail := range statusErr.Details() {
			if errorDetail, ok := detail.(*message.ErrorDetail); ok {
				userMessages = append(userMessages, errorDetail.GetMessage())
			}
		}
		if len(userMessages) > 0 {
			return appModel.NewInvalidRequestError(strings.Join(userMessages, ". "), nil)
		}

		return appModel.NewInvalidRequestError("Invalid form data", nil)
	}

	return errors.Errorf("grpc invalid status expected on codepath: %v", statusErr.Err())
}
