// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_user_authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EndUserAuthorizationImpl _$$EndUserAuthorizationImplFromJson(
        Map<String, dynamic> json) =>
    _$EndUserAuthorizationImpl(
      authorized: json['authorized'] as bool,
      code: $enumDecode(_$EndUserAuthorizationCodeEnumMap, json['code']),
      hint: json['hint'] as String,
    );

Map<String, dynamic> _$$EndUserAuthorizationImplToJson(
        _$EndUserAuthorizationImpl instance) =>
    <String, dynamic>{
      'authorized': instance.authorized,
      'code': instance.code,
      'hint': instance.hint,
    };

const _$EndUserAuthorizationCodeEnumMap = {
  EndUserAuthorizationCode.undefined: '',
  EndUserAuthorizationCode.private: 'private',
  EndUserAuthorizationCode.alreadyAuthorized: 'already_authorized',
  EndUserAuthorizationCode.doesNotApply: 'does_not_apply',
  EndUserAuthorizationCode.alreadyLinked: 'already_linked',
  EndUserAuthorizationCode.grantedEmail: 'granted_email',
  EndUserAuthorizationCode.grantedPhone: 'granted_phone',
  EndUserAuthorizationCode.phoneNoMatch: 'phone_no_match',
  EndUserAuthorizationCode.askPhone: 'ask_phone',
  EndUserAuthorizationCode.verifyPhone: 'verify_phone',
  EndUserAuthorizationCode.emailNoMatch: 'email_no_match',
};
