package api_test

import (
	"back/internal/pkg/api"
	"math"
	"net/url"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var _ = Describe("Payloads", func() {
	Describe("ParseGetConversationMessagesParams", func() {
		It("should parse valid values correctly", func() {
			values := url.Values{}
			values.Set("last_id", "123")
			values.Set("ascending", "false")
			values.Set("limit", "50")

			params, err := api.ParseGetConversationMessagesParams(values)
			Expect(err).To(BeNil())
			Expect(params.LastID).To(Equal(123))
			Expect(params.Limit).To(Equal(50))
			Expect(params.Ascending).To(BeFalse())
		})

		It("should handle empty values", func() {
			values := url.Values{}

			params, err := api.ParseGetConversationMessagesParams(values)
			Expect(err).To(BeNil())
			Expect(params.LastID).To(Equal(math.MaxInt32))
			Expect(params.Limit).To(Equal(25))
			Expect(params.Ascending).To(BeFalse())
		})

		It("should handle over the limit value", func() {
			values := url.Values{}
			values.Set("limit", "1000")

			params, err := api.ParseGetConversationMessagesParams(values)
			Expect(err).To(BeNil())
			Expect(params.Limit).To(Equal(100))
		})

		It("should handle invalid limit value", func() {
			values := url.Values{}
			values.Set("limit", "abc")

			_, err := api.ParseGetConversationMessagesParams(values)
			Expect(err).To(HaveOccurred())
			Expect(err).To(MatchError(ContainSubstring("invalid limit")))
		})

		It("should handle invalid last_id value", func() {
			values := url.Values{}
			values.Set("last_id", "invalid_id")

			_, err := api.ParseGetConversationMessagesParams(values)
			Expect(err).To(HaveOccurred())
			Expect(err).To(MatchError(ContainSubstring("invalid last_id")))
		})

	})
})
