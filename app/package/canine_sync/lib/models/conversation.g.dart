// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as int,
      externalUserId: json['externalUserId'] as int,
      name: json['name'] as String,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      updatedAt: const TimestampSerializer().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalUserId': instance.externalUserId,
      'name': instance.name,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'updatedAt': const TimestampSerializer().toJson(instance.updatedAt),
    };
