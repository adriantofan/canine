// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserVersionImpl _$$UserVersionImplFromJson(Map<String, dynamic> json) =>
    _$UserVersionImpl(
      maxUpdateTime:
          const TimestampSerializer().fromJson(json['max_update_time']),
    );

Map<String, dynamic> _$$UserVersionImplToJson(_$UserVersionImpl instance) =>
    <String, dynamic>{
      'max_update_time':
          const TimestampSerializer().toJson(instance.maxUpdateTime),
    };
