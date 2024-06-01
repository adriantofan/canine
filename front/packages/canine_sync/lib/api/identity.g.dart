// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdentityImpl _$$IdentityImplFromJson(Map<String, dynamic> json) =>
    _$IdentityImpl(
      userId: (json['user_id'] as num).toInt(),
      workspaceId: (json['workspace_id'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$$IdentityImplToJson(_$IdentityImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'workspace_id': instance.workspaceId,
      'username': instance.username,
    };
