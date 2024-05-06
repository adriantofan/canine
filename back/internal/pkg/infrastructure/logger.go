package infrastructure

import (
	"fmt"
	"net"
	"net/http"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/gin-gonic/gin"

	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func SetupLogger(structuredLog bool, level string) {
	l, err := zerolog.ParseLevel(level)
	if err != nil {
		log.Fatal().Err(err).Msg("Failed to parse log level")
	}
	zerolog.SetGlobalLevel(l)
	if structuredLog {
		SetupStructuredLogger()
	} else {
		SetupTextLogger()
	}
}

func SetupStructuredLogger() {
	zerolog.LevelFieldName = "severity"
	zerolog.LevelFieldMarshalFunc = func(l zerolog.Level) string {
		return logLevelSeverity[l]
	}

	zerolog.TimestampFieldName = "time"
	zerolog.TimeFieldFormat = time.RFC3339Nano

	// default sampler
	sampler := &zerolog.BasicSampler{N: 1}

	log.Logger = zerolog.New(os.Stderr).Sample(sampler).With().Timestamp().Logger()
}

func SetupTextLogger() {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnixMs
	output := zerolog.ConsoleWriter{Out: os.Stderr} //nolint:exhaustruct
	output.FormatLevel = func(i interface{}) string {
		return strings.ToUpper(fmt.Sprintf("| %-6s|", i))
	}
	output.TimeFormat = "15:04:05.000000"

	output.FormatFieldName = func(i interface{}) string {
		return fmt.Sprintf("%s:", i)
	}
	output.FormatFieldValue = func(i interface{}) string {
		return strings.ToUpper(fmt.Sprintf("%s", i))
	}

	log.Logger = log.Output(output).With().Timestamp().Logger()
}

// HTTPPayload is the struct consists of http request related components.
// Details are in following link.
// https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry#HttpRequest
type HTTPPayload struct {
	RequestMethod                  string  `json:"requestMethod"`
	RequestURL                     string  `json:"requestUrl"`
	RequestSize                    string  `json:"requestSize"`
	Status                         int     `json:"status"`
	ResponseSize                   string  `json:"responseSize"`
	UserAgent                      string  `json:"userAgent"`
	RemoteIP                       string  `json:"remoteIp"`
	ServerIP                       string  `json:"serverIp"`
	Referer                        string  `json:"referer"`
	Latency                        Latency `json:"latency"`
	CacheLookup                    bool    `json:"cacheLookup"`
	CacheHit                       bool    `json:"cacheHit"`
	CacheValidatedWithOriginServer bool    `json:"cacheValidatedWithOriginServer"`
	CacheFillBytes                 string  `json:"cacheFillBytes"`
	Protocol                       string  `json:"protocol"`
}

func NewLogHandler(log zerolog.Logger, structuredLog bool) gin.HandlerFunc {
	if !structuredLog {
		return gin.Logger()
	}
	return func(c *gin.Context) {
		// Create a copy of the logger (including internal context slice)
		// to prevent data race when using UpdateContext.
		start := time.Now()
		l := log.With().
			Str("method", c.Request.Method).
			Str("path", c.Request.URL.Path)

		if host, _, err := net.SplitHostPort(c.Request.RemoteAddr); err == nil {
			l = l.Str("remote", host)
		}
		// See about adding most notably RequestID

		logger := l.Logger()
		ctx := logger.WithContext(c.Request.Context())
		c.Request = c.Request.WithContext(ctx)
		// see hlog/hlog.go for more about adding examples
		c.Next()

		logger = log.With().Interface("httpRequest", NewHTTPPayload(c.Request, c.Writer, start)).Logger()
		logger.Info().Msgf("%s %s", c.Request.Method, c.Request.URL.Path)

	}

}

// See: https://cloud.google.com/logging/docs/reference/v2/rest/v2/LogEntry#LogSeverity
var logLevelSeverity = map[zerolog.Level]string{
	zerolog.DebugLevel: "DEBUG",
	zerolog.InfoLevel:  "INFO",
	zerolog.WarnLevel:  "WARNING",
	zerolog.ErrorLevel: "ERROR",
	zerolog.PanicLevel: "CRITICAL",
	zerolog.FatalLevel: "CRITICAL",
}

func NewHTTPPayload(req *http.Request, res gin.ResponseWriter, start time.Time) *HTTPPayload {
	if req == nil {
		req = &http.Request{}
	}

	payload := &HTTPPayload{
		RequestMethod: req.Method,
		Status:        res.Status(),
		UserAgent:     req.UserAgent(),
		RemoteIP:      remoteIP(req),
		Referer:       req.Referer(),
		Protocol:      req.Proto,
		Latency:       MakeLatency(time.Since(start), true),
	}

	if req.URL != nil {
		payload.RequestURL = req.URL.String()
	}

	if req.Body != nil {
		payload.RequestSize = strconv.FormatInt(req.ContentLength, 10)
	}

	payload.ResponseSize = strconv.FormatInt(int64(res.Size()), 10)

	return payload
}

// Latency is the interface of the request processing latency on the server.
// The format of the Latency should differ for GKE and for GAE, Cloud Run.
type Latency interface{}

// GAELatency is the Latency for GAE and Cloud Run.
type GAELatency struct {
	Seconds int64 `json:"seconds"`
	Nanos   int32 `json:"nanos"`
}

// MakeLatency returns Latency based on passed time.Duration object.
func MakeLatency(d time.Duration, isGKE bool) Latency {
	if isGKE {
		return makeGKELatency(d)
	} else {
		return makeGAELatency(d)
	}
}

// makeGKELatency returns Latency struct for GKE based on passed time.Duration object.
func makeGKELatency(d time.Duration) Latency {
	return d.Truncate(time.Millisecond).String() // need to Trucate by millis to show latency on Cloud Logging
}

// makeGAELatency returns Latency struct for Cloud Run and GAE based on passed time.Duration object.
func makeGAELatency(d time.Duration) Latency {
	nanos := d.Nanoseconds()
	secs := nanos / 1e9
	nanos -= secs * 1e9
	return GAELatency{
		Nanos:   int32(nanos),
		Seconds: secs,
	}
}

// remoteIP makes a best effort to compute the request client IP.
func remoteIP(req *http.Request) string {
	if f := req.Header.Get("X-Forwarded-For"); f != "" {
		return f
	}

	f := req.RemoteAddr
	ip, _, err := net.SplitHostPort(f)
	if err != nil {
		return f
	}

	return ip
}
