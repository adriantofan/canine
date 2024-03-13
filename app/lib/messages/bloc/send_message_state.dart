part of 'send_message_bloc.dart';

@freezed
class SendMessageState with _$SendMessageState {
  const SendMessageState._();

  const factory SendMessageState(int conversationId, String idempotencyId,
      [@Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(MessageInput.pure()) MessageInput message,
      @Default(false) bool isValid]) = _SendMessageState;
}
