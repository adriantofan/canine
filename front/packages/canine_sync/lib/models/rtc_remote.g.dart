// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtc_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RtcRemoteImpl _$$RtcRemoteImplFromJson(Map<String, dynamic> json) =>
    _$RtcRemoteImpl(
      conversationsUpdateSeq: json['conversations_update_seq'] == null
          ? null
          : Range.fromJson(
              json['conversations_update_seq'] as Map<String, dynamic>),
      messageRange: (json['message_range'] as List<dynamic>?)
          ?.map((e) => MessageRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastKnownUserVersion: json['last_known_user_version'] == null
          ? null
          : UserVersion.fromJson(
              json['last_known_user_version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RtcRemoteImplToJson(_$RtcRemoteImpl instance) =>
    <String, dynamic>{
      'conversations_update_seq': instance.conversationsUpdateSeq,
      'message_range': instance.messageRange,
      'last_known_user_version': instance.lastKnownUserVersion,
    };
