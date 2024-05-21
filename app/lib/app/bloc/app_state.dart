part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const AppState._();
  const factory AppState.starting() = AppStateStarting;
  const factory AppState.na() = AppStateNA;
  const factory AppState.unauthenticated() = AppStateUnauthenticated;

  const factory AppState.unauthenticatedWksp(int workspaceID) =
      AppStateUnauthenticatedWksp;
  const factory AppState.partiallyAuthenticated(int workspaceID) =
      AppStateAuthenticating;
  const factory AppState.authenticated(int workspaceID) = AppStateAuthenticated;

  int? get workspaceID {
    if (this is AppStateUnauthenticatedWksp) {
      return (this as AppStateUnauthenticatedWksp).workspaceID;
    } else if (this is AppStateAuthenticating) {
      return (this as AppStateAuthenticating).workspaceID;
    } else if (this is AppStateAuthenticated) {
      return (this as AppStateAuthenticated).workspaceID;
    }
    return null;
  }

  bool get isAuthenticated {
    return this is AppStateAuthenticated;
  }
}
