// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: (json['id'] as num).toInt(),
      externalUserId: (json['external_user_id'] as num).toInt(),
      name: json['name'] as String,
      workspaceId: (json['workspace_id'] as num).toInt(),
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      updatedAt: const TimestampSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_user_id': instance.externalUserId,
      'name': instance.name,
      'workspace_id': instance.workspaceId,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'updated_at': const TimestampSerializer().toJson(instance.updatedAt),
    };
