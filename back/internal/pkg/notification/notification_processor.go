package notification

import (
	"back/.gen/canine/public/model"
	"back/internal/pkg/domain"
	"back/internal/pkg/notification/payloads"
	"context"
	"errors"
	"fmt"
	"net/http"

	"github.com/twilio/twilio-go"
	twilioApi "github.com/twilio/twilio-go/rest/api/v2010"

	"github.com/rs/zerolog/log"

	"github.com/rs/zerolog"

	"github.com/sendgrid/sendgrid-go"
	"github.com/sendgrid/sendgrid-go/helpers/mail"
)

// EmailMessageTemplateValues is the payload for the email message for the templateV1 sendgrid mail.
type EmailMessageTemplateValues struct {
	UserEmail  string `json:"user_email"`
	UserName   string `json:"user_name"`
	DoctorName string `json:"doctor_name"`
	MessageURL string `json:"message_url"`
}

type PhoneMessageTemplateValues struct {
	UserPhone  string `json:"user_phone"`
	UserName   string `json:"user_name"`
	DoctorName string `json:"doctor_name"`
	MessageURL string `json:"message_url"`
}

const templateV1ID = "d-b45195f667de44e48bf5b56f6de7f8e7"
const templateV1UserName = "user_name"
const templateV1DoctorName = "doctor_name"
const templateV1MessageURL = "message_url"

type NotificationProcessor struct {
	sendgridAPIKey       string
	appURL               string
	repository           domain.ChatRepository
	notificationMailFrom mail.Email
	twilioClient         *twilio.RestClient
	twilioFromNumber     string
}

func NewNotificationProcessor(
	sendgridAPIKey, appURL, senderEmail, senderName string,
	twilioSid, twilioAuthToken, twilioFromNumber string,
	repository domain.Transaction,
) (*NotificationProcessor, error) {
	repo, err := repository.WithoutTransaction()
	if err != nil {
		return nil, fmt.Errorf("failed to create repository %w", err)
	}

	return &NotificationProcessor{
		sendgridAPIKey: sendgridAPIKey,
		appURL:         appURL,
		repository:     repo,
		notificationMailFrom: mail.Email{
			Name:    senderName,
			Address: senderEmail,
		},
		twilioClient: twilio.NewRestClientWithParams(twilio.ClientParams{
			Username: twilioSid,
			Password: twilioAuthToken,
		}),
		twilioFromNumber: twilioFromNumber,
	}, nil
}

var errFailSendEmail = fmt.Errorf("failed to send email")
var errDontSendEmail = fmt.Errorf("don't send email")

func (ep *NotificationProcessor) Send(ctx context.Context, notification payloads.NotificationMessage) error {
	if notification.MessageType != model.MessageType_Msg {
		return nil
	}
	emailNot, smsNot, err := ep.loadData(ctx, notification)
	if err != nil && !errors.Is(err, errDontSendEmail) {
		return fmt.Errorf("failed to load data %w", err)
	}
	if emailNot != nil {
		// this might be a mechanism to avoid sending emails to users that opted out
		return ep.sendMailNotification(ctx, emailNot)
	}
	if smsNot != nil {
		return ep.sendTwilioSMS(ctx, smsNot)
	}

	return nil
}
func (ep *NotificationProcessor) sendTwilioSMS(_ context.Context, data *PhoneMessageTemplateValues) error {
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

func (ep *NotificationProcessor) sendMailNotification(ctx context.Context, data *EmailMessageTemplateValues) error {
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

func (ep *NotificationProcessor) loadData(
	ctx context.Context,
	notification payloads.NotificationMessage,
) (*EmailMessageTemplateValues, *PhoneMessageTemplateValues, error) {
	// TODO: might want do something else when unable to get workspace or conversation
	// TODO: Implement RLU cache to avoid multiple calls
	workspace, err := ep.repository.GetWorkspace(ctx, notification.WorkspaceID)
	if err != nil {
		if errors.Is(err, domain.ErrConversationNotFound) {
			zerolog.Ctx(ctx).Error().Msgf("workspace not found for notification %+v", notification)

			return nil, nil, errDontSendEmail
		}

		return nil, nil, fmt.Errorf("failed to get workspace %w", err)
	}
	conversation, err := ep.repository.GetConversation(ctx, notification.ConversationID)
	if err != nil {
		if errors.Is(err, domain.ErrConversationNotFound) {
			zerolog.Ctx(ctx).Error().Msgf("conversation not found for notification %+v", notification)

			return nil, nil, errDontSendEmail
		}

		return nil, nil, fmt.Errorf("failed to get conversation %w", err)
	}
	if conversation.ExternalUserID == 0 {
		return nil, nil, errDontSendEmail
	}

	user, err := ep.repository.GetUserByID(ctx, conversation.ExternalUserID)
	if err != nil {
		if errors.Is(err, domain.ErrUserNotFound) {
			zerolog.Ctx(ctx).Error().Msgf("user not found for conversation %+v", conversation)

			return nil, nil, errDontSendEmail
		}

		return nil, nil, fmt.Errorf("failed to get user %w", err)
	}

	if user.Phone != "" {
		return nil, &PhoneMessageTemplateValues{
			UserPhone: user.Phone,
			// TODO: Implement user name
			UserName:   "TODO",
			DoctorName: workspace.Name,
			MessageURL: fmt.Sprintf(
				"%s#/workspace/%d/conversation/%d",
				ep.appURL,
				notification.WorkspaceID,
				notification.ConversationID,
			),
		}, nil
	}

	if user.Email != "" {
		return &EmailMessageTemplateValues{
			UserEmail: user.Email,
			// TODO: Implement user name
			UserName:   "TODO",
			DoctorName: workspace.Name,
			MessageURL: fmt.Sprintf(
				"%s#/workspace/%d/conversation/%d",
				ep.appURL,
				notification.WorkspaceID,
				notification.ConversationID,
			),
		}, nil, nil
	}

	return nil, nil, errDontSendEmail
}

func (ep *NotificationProcessor) newRequestBodyTemplateV1(data *EmailMessageTemplateValues) []byte {
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
