package domain_test

import (
	genModel "back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"encoding/json"
	"time"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
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

	It("Encodes time.Now", func() {
		now := time.Now().UTC()
		txt, err := json.Marshal(domain.NewMillisecondsTime(now))
		Expect(err).ToNot(HaveOccurred())
		Expect(txt).ToNot(Equal([]byte("")))
		var mt domain.MillisecondsTime
		err = json.Unmarshal(txt, &mt)
		Expect(err).ToNot(HaveOccurred())
		Expect(mt.Time).To(Equal(now.Truncate(time.Millisecond)))
		txt1, err := json.Marshal(mt)
		Expect(err).ToNot(HaveOccurred())
		Expect(txt1).To(Equal(txt))
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
