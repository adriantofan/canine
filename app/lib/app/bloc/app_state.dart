part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState.unknown() = Unknown;
  const factory AppState.wellcome() =
      Wellcome; // when the workspace is not known
  const factory AppState.loginRegisterFlow() = LoginRegisterFlow;
  const factory AppState.login(int workspaceId) = Login;
  const factory AppState.running(Identity identity) = Running;
  const factory AppState.runningRefresh(Identity identity) = RunningRefresh;
  const factory AppState.loggingOut() = LoggingOut;
}
