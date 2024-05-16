import 'package:app/app/routes/app_go_route.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../repository/repository.dart';
import '../routes/app_routes.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final SyncRepository _syncRepository;
  int? workspaceId;
  AppBloc(this._syncRepository) : super(const AppState.unknown()) {
    on<StatusChanged>((event, emit) {
      final status = event.status;
      switch (status) {
        case AuthenticationStatusUnknown():
          emit(const AppState.unknown());
        case AuthenticationStatusAuthenticated(identity: Identity()):
          emit(AppState.running(status.identity));
        case AuthenticationStatusUnauthenticated(identity: var identity):
          if (identity == null) {
            if (workspaceId == null) {
              emit(const AppState.wellcome());
              return;
            }
            emit(AppState.login(workspaceId!));
            return;
          }
          if (state is Running) {
            emit(AppState.runningRefresh(identity));
          } else {
            emit(AppState.login(identity.workspaceId));
          }
      }
    });
    on<Logout>((event, emit) {
      switch (state) {
        case Login():
        case Running():
        case RunningRefresh():
          emit(const AppState.loggingOut());
        default:
      }
    });

    _syncRepository.authStatus.listen((status) {
      add(AppEvent.statusChanged(status));
    });
  }

  logout() {
    add(const AppEvent.logout());
  }

  shouldUpdateWorkspaceId(int? newWorkspaceId) {}

  String? redirect(AppGoRoute route, GoRouterState routerState) {
    var uri = routerState.uri;
    var crtState = state;
    if (AppRoutes.login.isOnSubpath(uri)) {
      // if (state.uri.host.isEmpty) {
      //   // internal redirect, but why?
      //   return null;
      // }

      // Important: this is relevant only on a single page web app using # in the url
      // otherwise a new url will request a new page
      // Maybe switch to another workspace

      // don't allow to go to login if already authenticated
      if (crtState is Running) {
        final newWorkspaceId = AppRoutes.login.workspaceId(uri);
        if (newWorkspaceId != crtState.identity.workspaceId) {
          return AppRoutes.switchWorkspace.path(crtState.identity.workspaceId);
        }

        // Not switching workspace, but already authenticated on the same workspace
        // keep him here
        return AppRoutes.home.path(crtState.identity.workspaceId);
      }

      if (crtState is Unknown) {
        return "/store/destination";
      }

      if (crtState is! Wellcome) {
        throw FormatException('Cannot go to login from ${crtState}', uri);
      }
    }

    if (route.onlyAuthenticated) {
      final newWorkspaceId =
          int.tryParse(routerState.pathParameters['workspaceId'] ?? '') ?? 0;
      if (newWorkspaceId == 0) {
        throw FormatException('Invalid workspace id', uri);
      }

      if (crtState is Running) {
        if (crtState.identity.workspaceId == newWorkspaceId) {
          return null;
        }
        return AppRoutes.switchWorkspace.path(crtState.identity.workspaceId);
      }

      return AppRoutes.login.path(newWorkspaceId);
    }
    return null;
  }
}
