// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageRangeImpl _$$MessageRangeImplFromJson(Map<String, dynamic> json) =>
    _$MessageRangeImpl(
      conversationId: json['conversationId'] as int,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageRangeImplToJson(_$MessageRangeImpl instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'range': instance.range,
    };
