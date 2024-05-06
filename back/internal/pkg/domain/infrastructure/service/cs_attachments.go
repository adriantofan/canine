package service

import (
	"context"
	"fmt"
	"io"
	"mime/multipart"
	"time"

	"github.com/rs/zerolog"

	"github.com/segmentio/ksuid"

	"cloud.google.com/go/storage"
)

const kFileUploadTimeout = time.Second * 50
const kStorageFolder = "attachments"

type CloudStorageAttachments struct {
	storageClient *storage.Client
	folder        string
	bucketName    string
}

func NewCloudStorageAttachments(storageClient *storage.Client, bucketName string) *CloudStorageAttachments {
	return &CloudStorageAttachments{
		storageClient: storageClient,
		folder:        kStorageFolder,
		bucketName:    bucketName,
	}
}

// UploadMultipart implements the Attachments interface.
func (s *CloudStorageAttachments) UploadMultipart(
	ctx context.Context,
	conversationID int64,
	files []multipart.FileHeader) ([]string, error) {
	var fileNames = make([]string, 0, len(files))
	var batchID = ksuid.New().String()
	var prefix = fmt.Sprintf("%s/%d/%s", s.folder, conversationID, batchID)
	for _, file := range files {
		uploadPath, err := s.uploadFile(ctx, prefix, file)
		if err != nil {
			// FIXME: at least try to cleanup the uploaded files
			zerolog.Ctx(ctx).Error().Err(err).Msgf("CloudStorageAttachments.UploadMultipart failed to upload file %v", fileNames)

			return nil, fmt.Errorf("CloudStorageAttachments.UploadMultipart %s s.uploadFile: %w", file.Filename, err)
		}

		fileNames = append(fileNames, uploadPath)
	}
	zerolog.Ctx(ctx).Debug().Msgf("CloudStorageAttachments.UploadMultipart uploaded files %v", fileNames)
	return fileNames, nil
}

func (s *CloudStorageAttachments) uploadFile(
	ctx context.Context,
	prefix string,
	file multipart.FileHeader) (string, error) {
	fileUniqueID := ksuid.New().String()
	fileName := file.Filename
	if fileName == "" {
		fileName = "unnamed"
	}
	path := fmt.Sprintf("%s/%s/%s", prefix, fileUniqueID, fileName)
	object := s.storageClient.Bucket(s.bucketName).Object(path)
	object = object.If(storage.Conditions{DoesNotExist: true}) //nolint:exhaustruct

	ctx, cancel := context.WithTimeout(ctx, kFileUploadTimeout)
	defer cancel()

	fileReader, err := file.Open()
	if err != nil {
		return "", fmt.Errorf("CloudStorageAttachments.UploadMultipart file.Open: %w", err)
	}

	defer func(reader multipart.File) {
		err := reader.Close()
		if err != nil {
			zerolog.Ctx(ctx).Error().Err(err).Msg("CloudStorageAttachments.UploadMultipart failed to close input file")
		}
	}(fileReader)

	objectWriter := object.NewWriter(ctx)

	if _, err := io.Copy(objectWriter, fileReader); err != nil {
		return "", fmt.Errorf("CloudStorageAttachments.UploadMultipart io.Copy: %w", err)
	}

	if err := objectWriter.Close(); err != nil {
		return "", fmt.Errorf("CloudStorageAttachments.UploadMultipart Writer.Close: %w", err)
	}

	return path, nil
}
