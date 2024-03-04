// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      workspaceId: json['workspace_id'] as int,
      messagingAddress: json['messaging_address'] as String,
      type: json['type'] as String,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      updatedAt: const TimestampSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workspace_id': instance.workspaceId,
      'messaging_address': instance.messagingAddress,
      'type': instance.type,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'updated_at': const TimestampSerializer().toJson(instance.updatedAt),
    };
