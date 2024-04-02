package service

import (
	"context"
	"mime/multipart"
)

type Attachments interface {
	UploadMultipart(ctx context.Context, conversationID int64, files []multipart.FileHeader) ([]string, error)
}
