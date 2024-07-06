package notification

import (
	"back/internal/pkg/notification/payloads"
	"context"
	"fmt"
	"net/http"

	"github.com/twilio/twilio-go"
	twilioApi "github.com/twilio/twilio-go/rest/api/v2010"

	"github.com/rs/zerolog/log"

	"github.com/rs/zerolog"

	"github.com/sendgrid/sendgrid-go"
	"github.com/sendgrid/sendgrid-go/helpers/mail"
)

const templateV1ID = "d-b45195f667de44e48bf5b56f6de7f8e7"
const templateV1UserName = "user_name"
const templateV1DoctorName = "doctor_name"
const templateV1MessageURL = "message_url"

type NotificationProcessor struct {
	sendgridAPIKey       string
	notificationMailFrom mail.Email
	twilioClient         *twilio.RestClient
	twilioFromNumber     string
}

func NewNotificationProcessor(
	sendgridAPIKey, senderEmail, senderName string,
	twilioSid, twilioAuthToken, twilioFromNumber string,
) (*NotificationProcessor, error) {

	return &NotificationProcessor{
		sendgridAPIKey: sendgridAPIKey,
		notificationMailFrom: mail.Email{
			Name:    senderName,
			Address: senderEmail,
		},
		twilioClient: twilio.NewRestClientWithParams(twilio.ClientParams{ //nolint:exhaustruct
			Username: twilioSid,
			Password: twilioAuthToken,
		}),
		twilioFromNumber: twilioFromNumber,
	}, nil
}

var errFailSendEmail = fmt.Errorf("failed to send email")

func (ep *NotificationProcessor) Send(ctx context.Context, notification payloads.NotificationMessage) error {
	if notification.Email != nil {
		// this might be a mechanism to avoid sending emails to users that opted out
		return ep.sendMailNotification(ctx, notification.Email)
	}
	if notification.SMS != nil {
		return ep.sendTwilioSMS(ctx, notification.SMS)
	}

	return nil
}

func (ep *NotificationProcessor) sendTwilioSMS(_ context.Context, data *payloads.SMSMessageTemplateValues) error {
	params := &twilioApi.CreateMessageParams{} //nolint:exhaustruct
	params.SetBody(fmt.Sprintf("Please read your message from %s at %s", data.DoctorName, data.MessageURL))
	params.SetFrom(ep.twilioFromNumber)
	params.SetTo(data.UserPhone)

	_, err := ep.twilioClient.Api.CreateMessage(params)
	if err != nil {
		return fmt.Errorf("failed to send sms %w", err)
	}

	return nil
}

func (ep *NotificationProcessor) sendMailNotification(
	ctx context.Context,
	data *payloads.EmailMessageTemplateValues,
) error {
	// TODO: Implement throttling mechanism
	body := ep.newRequestBodyTemplateV1(data)
	request := sendgrid.GetRequest(ep.sendgridAPIKey, "/v3/mail/send", "https://api.sendgrid.com")
	request.Method = "POST"
	request.Body = body
	response, err := sendgrid.MakeRequestWithContext(ctx, request)
	if err != nil {
		return fmt.Errorf("failed to send email %w", err)
	}

	if response.StatusCode != http.StatusAccepted {
		zerolog.Ctx(ctx).Error().Msgf("failed to send email %s", response.Body)

		return errFailSendEmail
	}
	log.Ctx(ctx).Debug().Msgf("email sent to %s", data.UserEmail)

	return nil
}

func (ep *NotificationProcessor) newRequestBodyTemplateV1(data *payloads.EmailMessageTemplateValues) []byte {
	v3Mail := mail.NewV3Mail()

	v3Mail.SetFrom(&ep.notificationMailFrom)

	v3Mail.SetTemplateID(templateV1ID)

	personalization := mail.NewPersonalization()
	tos := []*mail.Email{
		mail.NewEmail(data.UserName, data.UserEmail),
	}
	personalization.AddTos(tos...)

	personalization.SetDynamicTemplateData(templateV1UserName, data.UserName)
	personalization.SetDynamicTemplateData(templateV1DoctorName, data.DoctorName)
	personalization.SetDynamicTemplateData(templateV1MessageURL, data.MessageURL)
	v3Mail.AddPersonalizations(personalization)

	return mail.GetRequestBody(v3Mail)
}
