import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_meta.dart';

part 'paginated.freezed.dart';
part 'paginated.g.dart';

@Freezed(genericArgumentFactories: true)
class Paginated<T> with _$Paginated<T> {
  const factory Paginated({
    required List<T> data,
    required PaginationMeta meta,
  }) = _Paginated<T>;

  factory Paginated.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginatedFromJson<T>(json, fromJsonT);
}
