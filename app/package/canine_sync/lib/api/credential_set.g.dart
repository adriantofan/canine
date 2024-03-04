// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialImpl _$$CredentialImplFromJson(Map<String, dynamic> json) =>
    _$CredentialImpl(
      identity: Identity.fromJson(json['identity'] as Map<String, dynamic>),
      token: json['token'] as String?,
      tokenExpiration: json['token_expiration'] == null
          ? null
          : DateTime.parse(json['token_expiration'] as String),
    );

Map<String, dynamic> _$$CredentialImplToJson(_$CredentialImpl instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'token': instance.token,
      'token_expiration': instance.tokenExpiration?.toIso8601String(),
    };
