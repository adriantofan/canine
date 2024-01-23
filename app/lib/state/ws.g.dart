// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerMessageInvalidImpl _$$ServerMessageInvalidImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerMessageInvalidImpl(
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$$ServerMessageInvalidImplToJson(
        _$ServerMessageInvalidImpl instance) =>
    <String, dynamic>{
      'kind': instance.$type,
    };

_$ServerMessageMessagesImpl _$$ServerMessageMessagesImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerMessageMessagesImpl(
      (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$$ServerMessageMessagesImplToJson(
        _$ServerMessageMessagesImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'kind': instance.$type,
    };

_$ServerMessageConversationsImpl _$$ServerMessageConversationsImplFromJson(
        Map<String, dynamic> json) =>
    _$ServerMessageConversationsImpl(
      (json['data'] as List<dynamic>)
          .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$$ServerMessageConversationsImplToJson(
        _$ServerMessageConversationsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'kind': instance.$type,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as int,
      conversationId: json['conversationId'] as int,
      senderId: json['senderId'] as int,
      message: json['message'] as String,
      type: json['type'] as String,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'senderId': instance.senderId,
      'message': instance.message,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      id: json['id'] as int,
      externalUserId: json['externalUserId'] as int,
      name: json['name'] as String,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalUserId': instance.externalUserId,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      messagingAddress: json['messagingAddress'] as String,
      type: json['type'] as String,
      createdAt: json['createdAt'] as int,
      updatedAt: json['updatedAt'] as int,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messagingAddress': instance.messagingAddress,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
