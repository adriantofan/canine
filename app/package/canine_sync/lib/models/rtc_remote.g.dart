// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtc_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RtcRemoteImpl _$$RtcRemoteImplFromJson(Map<String, dynamic> json) =>
    _$RtcRemoteImpl(
      conversationsUpdateSeq: json['conversationsUpdateSeq'] == null
          ? null
          : Range.fromJson(
              json['conversationsUpdateSeq'] as Map<String, dynamic>),
      messageRange: (json['messageRange'] as List<dynamic>?)
          ?.map((e) => MessageRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastKnownUserVersion: json['lastKnownUserVersion'] == null
          ? null
          : UserVersion.fromJson(
              json['lastKnownUserVersion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RtcRemoteImplToJson(_$RtcRemoteImpl instance) =>
    <String, dynamic>{
      'conversationsUpdateSeq': instance.conversationsUpdateSeq,
      'messageRange': instance.messageRange,
      'lastKnownUserVersion': instance.lastKnownUserVersion,
    };
