import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';
part 'api_error.g.dart';

// they correspond to the error codes from the server in
// back/internal/pkg/api/api_error.go

// Objective:
// 1. be able to differentiate between different types of errors when relevant
// 2. be able to display a message to the user
@freezed
class APIError with _$APIError {
  const APIError._();

  const factory APIError(String code, String message, String reason,
      {String? debug}) = _APIError;

  factory APIError.unableToMakeRequest(Object e) {
    return APIError(kClientUnableToMakeRequest, '', '', debug: e.toString());
  }

  factory APIError.serverError(Map<String, dynamic> json) {
    try {
      return APIError.fromJson(json);
    } catch (e) {
      return APIError.invalidResponse(e.toString());
    }
  }

  factory APIError.invalidResponse(String e) {
    return APIError(kClientInvalidResponse, '', '', debug: e);
  }

  factory APIError.fromJson(Map<String, dynamic> json) =>
      _$APIErrorFromJson(json);

  String get userMessage {
    if (code == kServerInvalidRequest && message.isNotEmpty) {
      return message;
    }
    if (code == kServerUnauthorized && message.isNotEmpty) {
      return message;
    }

    if (messagesByCode.containsKey(code)) {
      return messagesByCode[code]!;
    }
    return 'An error occurred. Please try again later.';
  }
}

// Client error codes
const kClientUnableToMakeRequest = 'client_unable_to_make_request';
const kClientInvalidResponse = 'client_invalid_response';

// Server error codes
const kServerUnauthorized = 'unauthorized';
const kServerForbidden = 'forbidden';
const kServerInvalidRequest = 'invalid_request';
const kServerPayloadExists = 'payload_exists';

const messagesByCode = {
  // Client codes
  kClientUnableToMakeRequest: 'Unable to make request. Please try again.',
  kClientInvalidResponse: 'Unable to parse response. Please retry again later.',

  // Server codes
  kServerInvalidRequest: 'Invalid request',
  kServerPayloadExists:
      'Payload exists', // this should not be shown to the user
  kServerUnauthorized:
      'Unauthorized. Please check your credentials and try again.',
  kServerForbidden: 'Forbidden',
};
