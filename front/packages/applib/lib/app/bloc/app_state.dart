part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState.unauthenticated({
    required AuthStatus authStatus,
    required int? workspaceId, // wanted workspaceId
  }) = AppStateUnauthenticated;

  const factory AppState.authenticated({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    required int? workspaceId, // wanted workspaceId
  }) = AppStateAuthenticated;

  const factory AppState.ready({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    required int? workspaceId,
    required Map<int, AuthInfo> workspaces,
  }) = AppStateReady;
}
