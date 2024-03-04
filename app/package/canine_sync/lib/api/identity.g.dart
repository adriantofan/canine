// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityImpl _$$IdentityImplFromJson(Map<String, dynamic> json) =>
    _$IdentityImpl(
      userId: json['userId'] as int,
      workspaceId: json['workspaceId'] as int,
      username: json['username'] as String,
    );

Map<String, dynamic> _$$IdentityImplToJson(_$IdentityImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'workspaceId': instance.workspaceId,
      'username': instance.username,
    };
