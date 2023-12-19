package domain_test

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"encoding/json"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"time"
)

var _ = Describe("Json", func() {
	It("Encodes and Decodes MillisecondsTime", func() {
		txt, err := json.Marshal(domain.NewMillisecondsTime(time.UnixMilli(2)))
		Expect(err).ToNot(HaveOccurred())
		Expect(txt).To(Equal([]byte("2")))
		var mt domain.MillisecondsTime
		err = json.Unmarshal(txt, &mt)
		Expect(err).ToNot(HaveOccurred())
		Expect(mt.Time).To(Equal(time.UnixMilli(2)))

	})
	It("Encode Message update", func() {
		msg := domain.Message{
			ID:             1,
			ConversationID: 2,
			SenderID:       3,
			Type:           genModel.MessageType_Msg,
			Message:        "content",
			CreatedAt:      domain.NewMillisecondsTime(time.UnixMilli(2)),
		}
		_, err := msg.MarshallDataUpdate()
		Expect(err).ToNot(HaveOccurred())

	})
})
