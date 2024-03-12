import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_change.freezed.dart';

// All indexes are in to the new items list
@freezed
sealed class ListChange with _$ListChange {
  const factory ListChange.addedLeft(int index, int count) =
      ListChangeAddedLeft;
}
