part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState.initial({
    @Default(FormzSubmissionStatus.initial)
    FormzSubmissionStatus workspaceStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus createStatus,
    @Default(false) bool onWorkspace,
    String? loadErrorMessage,
    Workspace? workspace,
    @Default(true) bool notFound,
    // Second step of the login step
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus loginStatus,
    String? errorMessage,
  }) = _Initial;
}
