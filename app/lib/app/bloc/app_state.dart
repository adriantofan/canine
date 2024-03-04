part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState.unknown() = Unknown;
  const factory AppState.loginRegisterFlow() = LoginRegisterFlow;
  const factory AppState.login(Identity identity) = Login;
  const factory AppState.running(Identity identity) = Running;
  const factory AppState.runningRefresh(Identity identity) = RunningRefresh;
  const factory AppState.loggingOut() = LoggingOut;
}
