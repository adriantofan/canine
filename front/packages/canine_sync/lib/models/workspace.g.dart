// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkspaceImpl _$$WorkspaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkspaceImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      createdAt: const TimestampSerializer().fromJson(json['created_at']),
      updatedAt: const TimestampSerializer().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$$WorkspaceImplToJson(_$WorkspaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': const TimestampSerializer().toJson(instance.createdAt),
      'updated_at': const TimestampSerializer().toJson(instance.updatedAt),
    };
