import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draft_message.freezed.dart';

@freezed
class DraftMessage with _$DraftMessage {
  const factory DraftMessage(
      {String? text,
      @Default([]) List<XFile> attachment,
      String? idempotencyId,
      // Internal for SendBloc
      @Default(false) bool sending}) = _DraftMessage;
}
