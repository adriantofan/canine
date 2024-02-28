// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialImpl _$$CredentialImplFromJson(Map<String, dynamic> json) =>
    _$CredentialImpl(
      userId: json['userId'] as int,
      workspaceId: json['workspaceId'] as int,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$CredentialImplToJson(_$CredentialImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'workspaceId': instance.workspaceId,
      'token': instance.token,
    };
