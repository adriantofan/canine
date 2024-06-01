// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$APIErrorImpl _$$APIErrorImplFromJson(Map<String, dynamic> json) =>
    _$APIErrorImpl(
      json['code'] as String,
      json['message'] as String,
      json['reason'] as String,
      debug: json['debug'] as String?,
    );

Map<String, dynamic> _$$APIErrorImplToJson(_$APIErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'reason': instance.reason,
      'debug': instance.debug,
    };
