// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as int,
      externalUserId: json['external_user_id'] as int,
      name: json['name'] as String,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      updatedAt: const TimestampSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'external_user_id': instance.externalUserId,
      'name': instance.name,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'updated_at': const TimestampSerializer().toJson(instance.updatedAt),
    };
