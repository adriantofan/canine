// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      limit: (json['limit'] as num).toInt(),
      prevId: (json['prev_id'] as num).toInt(),
      nextId: (json['next_id'] as num).toInt(),
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
        _$PaginationMetaImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'prev_id': instance.prevId,
      'next_id': instance.nextId,
      'has_more': instance.hasMore,
    };
