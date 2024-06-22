part of 'verify_phone_cubit.dart';

@freezed
class VerifyPhoneState with _$VerifyPhoneState {
  factory VerifyPhoneState.initial({
    required DateTime sentAt,
    @Default(Code.pure()) Code code,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus sendStatus,
    @Default(false) bool isValid,
    @Default(false) bool canResend,
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus resendCodeStatus,
    String? errorMessage,
  }) = VerifyPhoneStateInitial;
}
