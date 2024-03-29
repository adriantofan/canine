import 'package:freezed_annotation/freezed_annotation.dart';

part 'range.freezed.dart';
part 'range.g.dart';

@freezed
class Range with _$Range {
  const factory Range({
    required int firstId,
    required int lastId,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}
