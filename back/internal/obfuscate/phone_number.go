package obfuscate

func PhoneNumberPartially(phoneNumber string) string {
	if len(phoneNumber) >= 6 {
		return phoneNumber[:4] + "******" + phoneNumber[len(phoneNumber)-2:]
	}

	return "******"
}
