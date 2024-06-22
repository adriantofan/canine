import 'package:freezed_annotation/freezed_annotation.dart';

part 'end_user_authorization.freezed.dart';
part 'end_user_authorization.g.dart';

enum EndUserAuthorizationCode {
  @JsonValue('')
  undefined,
  @JsonValue('private')
  private,
  @JsonValue('already_authorized')
  alreadyAuthorized,
  @JsonValue('does_not_apply')
  doesNotApply,
  @JsonValue('already_linked')
  alreadyLinked,
  @JsonValue('granted_email')
  grantedEmail,
  @JsonValue('granted_phone')
  grantedPhone,
  @JsonValue('phone_no_match')
  phoneNoMatch,
  @JsonValue('ask_phone')
  askPhone,
  @JsonValue('verify_phone')
  verifyPhone,
  @JsonValue('email_no_match')
  emailNoMatch;

  Object toJson() {
    switch (this) {
      case EndUserAuthorizationCode.undefined:
        return '';
      case EndUserAuthorizationCode.private:
        return 'private';
      case EndUserAuthorizationCode.alreadyAuthorized:
        return 'already_authorized';
      case EndUserAuthorizationCode.doesNotApply:
        return 'does_not_apply';
      case EndUserAuthorizationCode.alreadyLinked:
        return 'already_linked';
      case EndUserAuthorizationCode.grantedEmail:
        return 'granted_email';
      case EndUserAuthorizationCode.grantedPhone:
        return 'granted_phone';
      case EndUserAuthorizationCode.phoneNoMatch:
        return 'phone_no_match';
      case EndUserAuthorizationCode.askPhone:
        return 'ask_phone';
      case EndUserAuthorizationCode.verifyPhone:
        return 'verify_phone';
      case EndUserAuthorizationCode.emailNoMatch:
        return 'email_no_match';
    }
  }

  static EndUserAuthorizationCode fromJson(String code) {
    switch (code) {
      case '':
        return EndUserAuthorizationCode.undefined;
      case 'private':
        return EndUserAuthorizationCode.private;
      case 'already_authorized':
        return EndUserAuthorizationCode.alreadyAuthorized;
      case 'does_not_apply':
        return EndUserAuthorizationCode.doesNotApply;
      case 'already_linked':
        return EndUserAuthorizationCode.alreadyLinked;
      case 'granted_email':
        return EndUserAuthorizationCode.grantedEmail;
      case 'granted_phone':
        return EndUserAuthorizationCode.grantedPhone;
      case 'phone_no_match':
        return EndUserAuthorizationCode.phoneNoMatch;
      case 'ask_phone':
        return EndUserAuthorizationCode.askPhone;
      case 'email_no_match':
        return EndUserAuthorizationCode.emailNoMatch;
      default:
        throw Exception('Unknown EndUserAuthorizationCode: $code');
    }
  }
}

@freezed
class EndUserAuthorization with _$EndUserAuthorization {
  const factory EndUserAuthorization({
    required bool authorized,
    required EndUserAuthorizationCode code,
    required String hint,
  }) = _EndUserAuthorization;

  factory EndUserAuthorization.fromJson(Map<String, dynamic> json) =>
      _$EndUserAuthorizationFromJson(json);
}
