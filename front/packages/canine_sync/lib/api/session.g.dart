// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      workspaceId: (json['workspace_id'] as num).toInt(),
      authId: json['auth_id'] as String,
      token: json['token'] as String,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'workspace_id': instance.workspaceId,
      'auth_id': instance.authId,
      'token': instance.token,
      'user_id': instance.userId,
    };
