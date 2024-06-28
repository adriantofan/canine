part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState.unauthenticated({
    required AuthStatus authStatus,
    // target workspaceId
  }) = AppStateUnauthenticated;

  const factory AppState.authenticated({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    // target workspace
  }) = AppStateAuthenticated;

  const factory AppState.ready({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    // actual workspace
    required Map<int, AuthInfo> workspaces,
  }) = AppStateReady;
}
