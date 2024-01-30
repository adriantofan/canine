// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_server_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$APIServerMessageInvalidImpl _$$APIServerMessageInvalidImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerMessageInvalidImpl(
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$$APIServerMessageInvalidImplToJson(
        _$APIServerMessageInvalidImpl instance) =>
    <String, dynamic>{
      'kind': instance.$type,
    };

_$APIServerMessageMessagesImpl _$$APIServerMessageMessagesImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerMessageMessagesImpl(
      (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['kind'] as String?,
    );

Map<String, dynamic> _$$APIServerMessageMessagesImplToJson(
        _$APIServerMessageMessagesImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'kind': instance.$type,
    };

_$APIServerMessageConversationsImpl
    _$$APIServerMessageConversationsImplFromJson(Map<String, dynamic> json) =>
        _$APIServerMessageConversationsImpl(
          (json['data'] as List<dynamic>)
              .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
              .toList(),
          $type: json['kind'] as String?,
        );

Map<String, dynamic> _$$APIServerMessageConversationsImplToJson(
        _$APIServerMessageConversationsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'kind': instance.$type,
    };

_$APIServerMessageSyncCompletedImpl
    _$$APIServerMessageSyncCompletedImplFromJson(Map<String, dynamic> json) =>
        _$APIServerMessageSyncCompletedImpl(
          $type: json['kind'] as String?,
        );

Map<String, dynamic> _$$APIServerMessageSyncCompletedImplToJson(
        _$APIServerMessageSyncCompletedImpl instance) =>
    <String, dynamic>{
      'kind': instance.$type,
    };
