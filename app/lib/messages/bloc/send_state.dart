part of 'send_bloc.dart';

@freezed
class SendState with _$SendState {
  const SendState._();

  const factory SendState(String idempotencyId,
      [@Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(MessageInput.pure()) MessageInput message,
      @Default([]) List<XFile> attachments,
      @Default(false) bool isValid]) = _SendState;

  static SendState fromMessage(DraftMessage? message) {
    if (message == null) {
      return SendState(const Uuid().v4());
    }
    final textInput = message.text != null
        ? MessageInput.dirty(message.text!)
        : const MessageInput.pure();
    final isValid = textInput.isValid;
    final status = message.sending && isValid
        ? FormzSubmissionStatus.inProgress
        : FormzSubmissionStatus.initial;
    return SendState(
      message.idempotencyId ?? const Uuid().v4(),
      status,
      textInput,
      message.attachments,
      isValid,
    );
  }
}
