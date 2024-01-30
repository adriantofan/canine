// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as int,
      conversationId: json['conversationId'] as int,
      senderId: json['senderId'] as int,
      message: json['message'] as String,
      type: json['type'] as String,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'message': instance.message,
      'type': instance.type,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
    };
