import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';
part 'search.g.dart';

@freezed
class SearchQuery with _$SearchQuery {
  const factory SearchQuery({String? query, WithTag? withTag}) = _SearchQuery;

  factory SearchQuery.fromJson(Map<String, dynamic> json) =>
      _$SearchQueryFromJson(json);
}

@freezed
class WithTag with _$WithTag {
  const factory WithTag({
    required int id,
    DateTime? since,
  }) = _WithTag;

  factory WithTag.fromJson(Map<String, dynamic> json) =>
      _$WithTagFromJson(json);
}
