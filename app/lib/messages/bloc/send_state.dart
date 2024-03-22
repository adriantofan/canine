part of 'send_bloc.dart';

@freezed
class SendState with _$SendState {
  const SendState._();

  const factory SendState(String idempotencyId,
      [@Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(MessageInput.pure()) MessageInput message,
      @Default([]) List<XFile> attachments,
      @Default(false) bool isValid]) = _SendState;
}
