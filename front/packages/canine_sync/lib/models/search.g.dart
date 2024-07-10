// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchQueryImpl _$$SearchQueryImplFromJson(Map<String, dynamic> json) =>
    _$SearchQueryImpl(
      query: json['query'] as String?,
      withTag: json['with_tag'] == null
          ? null
          : WithTag.fromJson(json['with_tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchQueryImplToJson(_$SearchQueryImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'with_tag': instance.withTag,
    };

_$WithTagImpl _$$WithTagImplFromJson(Map<String, dynamic> json) =>
    _$WithTagImpl(
      id: (json['id'] as num).toInt(),
      since: json['since'] == null
          ? null
          : DateTime.parse(json['since'] as String),
    );

Map<String, dynamic> _$$WithTagImplToJson(_$WithTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'since': instance.since?.toIso8601String(),
    };
