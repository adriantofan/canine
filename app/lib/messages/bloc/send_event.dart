part of 'send_bloc.dart';

enum AttachmentActionType { add, remove }

@freezed
sealed class SendEvent with _$SendEvent {
  const factory SendEvent.textChanged(String text) = SendEventTextChanged;
  const factory SendEvent.send(
      Future<void> Function(DraftMessage msg) sendMessage) = SendEventSend;
  const factory SendEvent.attachmentAdded(XFile attachment) =
      SendEventAttachmentAdded;
  const factory SendEvent.attachmentRemoved(int index) =
      SendEventAttachmentRemoved;
}
