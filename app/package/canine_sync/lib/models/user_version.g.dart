// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVersionImpl _$$UserVersionImplFromJson(Map<String, dynamic> json) =>
    _$UserVersionImpl(
      maxUpdateTime:
          const TimestampSerializer().fromJson(json['maxUpdateTime']),
    );

Map<String, dynamic> _$$UserVersionImplToJson(_$UserVersionImpl instance) =>
    <String, dynamic>{
      'maxUpdateTime':
          const TimestampSerializer().toJson(instance.maxUpdateTime),
    };
