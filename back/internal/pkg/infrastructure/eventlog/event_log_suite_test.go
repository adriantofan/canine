package eventlog_test

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestEventLog(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "EventLog Suite")
}
