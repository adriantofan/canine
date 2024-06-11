part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(true) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
