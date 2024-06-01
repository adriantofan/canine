part of 'create_cubit.dart';

@freezed
class CreateState with _$CreateState {
  const factory CreateState.initial({
    @Default(Email.pure()) Email email,
    @Default(PasswordSubmit.pure()) PasswordSubmit password,
    @Default(WorkspaceId.pure()) WorkspaceId workspaceId,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool isValid,
    String? errorMessage,
  }) = _Initial;
}
