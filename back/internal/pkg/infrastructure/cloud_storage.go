package infrastructure

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"

	"cloud.google.com/go/storage"
	"google.golang.org/api/option"
)

// NewCloudStorageClient returns either a real *storage.Cient, or else a *storage.Client that routes
// to a local emulator if a `GCS_EMULATOR_HOST` environment variable is configured.
// Taken from here https://github.com/fullstorydev/emulators/blob/master/storage/gcsemu/client.go
func NewCloudStorageClient(ctx context.Context, devBuckets []string) (*storage.Client, error) {
	if host := os.Getenv("GCS_EMULATOR_HOST"); host != "" {
		csHost := "http://" + host
		log.Printf("Using GCS emulator at %s", csHost)

		client, err := NewCloudStorageClientWithHost(ctx, csHost)
		if err != nil {
			return nil, fmt.Errorf("failed to create storage client: %w", err)
		}
		err = initBucket(client, devBuckets)
		if err != nil {
			return nil, fmt.Errorf("failed to create bucket: %w", err)
		}

		return client, nil
	}

	return storage.NewClient(ctx) //nolint:wrapcheck
}

func initBucket(storageClient *storage.Client, devBuckets []string) error {
	for _, bucketName := range devBuckets {
		log.Printf("Creating bucket if it doesn't exit %s", bucketName)
		if err := storageClient.Bucket(bucketName).Create(context.Background(), "", nil); err != nil {
			return fmt.Errorf("failed to create bucket %s: %w", bucketName, err)
		}
	}

	return nil
}

// NewCloudStorageClientWithHost returns a new Google storage client that connects to the given host:port address.
func NewCloudStorageClientWithHost(ctx context.Context, hostUrl string) (*storage.Client, error) {
	delegate := http.DefaultTransport
	httpClient := &http.Client{ //nolint:exhaustruct
		Transport: tripperFunc(func(r *http.Request) (*http.Response, error) {
			r = r.Clone(r.Context())
			r.URL.Host = strings.TrimPrefix(hostUrl, "http://")
			r.URL.Scheme = "http"

			return delegate.RoundTrip(r) //nolint:wrapcheck
		}),
	}

	return storage.NewClient(ctx, option.WithHTTPClient(httpClient)) //nolint:wrapcheck
}

type tripperFunc func(*http.Request) (*http.Response, error)

func (f tripperFunc) RoundTrip(r *http.Request) (*http.Response, error) {
	return f(r)
}
