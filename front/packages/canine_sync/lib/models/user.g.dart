// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      workspaceId: (json['workspace_id'] as num).toInt(),
      email: json['email'] as String,
      phone: json['phone'] as String? ?? '',
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      updatedAt: const TimestampSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workspace_id': instance.workspaceId,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'updated_at': const TimestampSerializer().toJson(instance.updatedAt),
    };

const _$UserTypeEnumMap = {
  UserType.external: 'external',
  UserType.internal: 'internal',
  UserType.bot: 'bot',
};
