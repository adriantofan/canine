package payloads

type NotificationMessage struct {
	WorkspaceID    int64                       `json:"workspace_id"`
	ConversationID int64                       `json:"conversation_id"`
	Email          *EmailMessageTemplateValues `json:"email,omitempty"`
	SMS            *SMSMessageTemplateValues   `json:"sms,omitempty"`
}

// EmailMessageTemplateValues is the payload for the email message for the templateV1 sendgrid mail.
type EmailMessageTemplateValues struct {
	UserEmail  string `json:"user_email"`
	UserName   string `json:"user_name"`
	DoctorName string `json:"doctor_name"`
	MessageURL string `json:"message_url"`
}

type SMSMessageTemplateValues struct {
	UserPhone  string `json:"user_phone"`
	UserName   string `json:"user_name"`
	DoctorName string `json:"doctor_name"`
	MessageURL string `json:"message_url"`
}
