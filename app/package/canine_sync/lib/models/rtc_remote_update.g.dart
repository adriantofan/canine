// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtc_remote_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RTCRemoteUpdateImpl _$$RTCRemoteUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$RTCRemoteUpdateImpl(
      conversations: (json['conversations'] as List<dynamic>)
          .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ConversationMessages.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      syncToken: json['syncToken'] as String,
    );

Map<String, dynamic> _$$RTCRemoteUpdateImplToJson(
        _$RTCRemoteUpdateImpl instance) =>
    <String, dynamic>{
      'conversations': instance.conversations,
      'messages': instance.messages,
      'users': instance.users,
      'syncToken': instance.syncToken,
    };
