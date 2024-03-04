// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageRangeImpl _$$MessageRangeImplFromJson(Map<String, dynamic> json) =>
    _$MessageRangeImpl(
      conversationId: json['conversation_id'] as int,
      range: Range.fromJson(json['range'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageRangeImplToJson(_$MessageRangeImpl instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'range': instance.range,
    };
