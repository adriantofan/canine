part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial([
    @Default(Email.pure()) Email email,
    @Default(PasswordSubmit.pure()) PasswordSubmit password,
    @Default(WorkspaceId.pure()) WorkspaceId workspaceId,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  ]) = _Initial;
}
