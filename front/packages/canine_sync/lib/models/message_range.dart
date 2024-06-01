import 'package:freezed_annotation/freezed_annotation.dart';

import 'range.dart';

part 'message_range.freezed.dart';
part 'message_range.g.dart';

@freezed
class MessageRange with _$MessageRange {
  const factory MessageRange({
    required int conversationId,
    required Range range,
  }) = _MessageRange;

  factory MessageRange.fromJson(Map<String, dynamic> json) =>
      _$MessageRangeFromJson(json);
}
