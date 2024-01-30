// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      messagingAddress: json['messagingAddress'] as String,
      type: json['type'] as String,
      createdAt: const TimestampSerializer().fromJson(json['createdAt']),
      updatedAt: const TimestampSerializer().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messagingAddress': instance.messagingAddress,
      'type': instance.type,
      'createdAt': const TimestampSerializer().toJson(instance.createdAt),
      'updatedAt': const TimestampSerializer().toJson(instance.updatedAt),
    };
