import 'package:bloc/bloc.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;

  int? get workspaceId => state.workspaceId;
  bool get isAuthenticated => state.isAuthorized;

  AppBloc(this._authRepository)
      : super(const AppState(
          authStatus: AuthStatus.unknown(),
          workspaceId: null,
          isAuthorized: false,
        )) {
    on<AppEventInitial>((event, emit) async {
      await emit.forEach(_authRepository.authStatusChanges,
          onData: _authStatusChanges);
    });
  }

  AppState _authStatusChanges(AuthStatus status) {
    switch (status) {
      case AuthStatusUnknown() ||
            AuthStatusDisconnected() ||
            AuthStatusRestricted():
        return AppState(
          authStatus: status,
          workspaceId: null,
          isAuthorized: false,
        );
      case AuthStatusAuthenticated(roles: var roles):
        return _appStateAuthenticated(roles);
    }
  }

  AppState _appStateAuthenticated(ProjectRoles roles) {
    // TODO: This won't work for end-users
    for (final role in RoleExtension.adminRoles) {
      if (roles[role] != null && roles[role]!.isNotEmpty) {
        return AppState(
          authStatus: AuthStatus.authenticated(roles),
          workspaceId: roles[role]!.first,
          isAuthorized: true,
        );
      }
    }
    return const AppState(
      authStatus: AuthStatus.restricted(),
      workspaceId: null,
      isAuthorized: false,
    );
  }

  logout() async {
    await _authRepository.logout();
  }
}
