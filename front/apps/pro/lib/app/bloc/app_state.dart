part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required AuthStatus authStatus,
    required int? workspaceId,
    required bool isAuthorized,
  }) = _AppState;
}
