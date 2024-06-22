part of 'confirm_phone_cubit.dart';

@freezed
class ConfirmPhoneState with _$ConfirmPhoneState {
  const factory ConfirmPhoneState.initial({
    @Default(FrenchMobile.pure()) FrenchMobile mobile,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
