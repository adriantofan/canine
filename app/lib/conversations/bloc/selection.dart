import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection.freezed.dart';

@freezed
class Selection with _$Selection {
  const factory Selection(
      {required int listIndex, required int conversationId}) = _Selection;
}
