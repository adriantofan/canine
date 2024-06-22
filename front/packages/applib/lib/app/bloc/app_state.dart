part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState.unauthenticated({
    required AuthStatus authStatus,
    // target workspaceId
    required int? workspaceId,
    required int? conversationId,
  }) = AppStateUnauthenticated;

  const factory AppState.authenticated({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    // target workspace
    required int? workspaceId,
    required int? conversationId,
  }) = AppStateAuthenticated;

  const factory AppState.ready({
    required AuthStatus authStatus,
    required String authId,
    required String token,
    // actual workspace
    required int? workspaceId,
    required Map<int, AuthInfo> workspaces,
  }) = AppStateReady;
}
