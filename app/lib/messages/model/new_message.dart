import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_message.freezed.dart';

@freezed
class NewMessage with _$NewMessage {
  const factory NewMessage(
      {required String text,
      required XFile? attachment,
      required String idempotencyId}) = _NewMessage;
}
