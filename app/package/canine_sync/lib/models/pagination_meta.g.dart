// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      limit: json['limit'] as int,
      prevId: json['prev_id'] as int,
      nextId: json['next_id'] as int,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'prev_id': instance.prevId,
      'next_id': instance.nextId,
    };
