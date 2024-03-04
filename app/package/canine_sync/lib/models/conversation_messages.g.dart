// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationMessagesImpl _$$ConversationMessagesImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationMessagesImpl(
      conversationId: json['conversation_id'] as int,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ConversationMessagesImplToJson(
        _$ConversationMessagesImpl instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'messages': instance.messages,
    };
