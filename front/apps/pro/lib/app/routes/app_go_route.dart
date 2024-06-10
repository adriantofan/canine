import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/app_bloc.dart';
import 'app_routes.dart';
import 'path.dart';

class AppGoRoute extends GoRoute {
  final bool onlyAuthenticated;
  final bool workspaceNamespaced;
  final bool isLogin;
  // GoRouterRedirect? redirect;

  AppGoRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.onExit,
    this.onlyAuthenticated = false,
    this.workspaceNamespaced = false,
    this.isLogin = false,
  }) : super();

  @override
  get redirect => _guard;

  Future<String?> _guard(
      BuildContext context, GoRouterState routerState) async {
    final appBloc = context.read<AppBloc>();

    onLogin(workspaceId) {
      return "${AppRoutes.login.path}?ref=${routerState.uri}";
    }

    onHome(AppStateReady appState) {
      if (appState.workspaceId == null) {
        throw GoException('Empty workspaceId not implemented');
      }
      return AppRoutes.home.path(appState.workspaceId);
    }

    final onSplash = routerState.path == AppRoutes.slash.path;
    if (onSplash) {
      appBloc.state.authStatus;
      final crtState = appBloc.state;
      switch (crtState) {
        case AppStateUnauthenticated():
          switch (crtState.authStatus) {
            case AuthStatusDisconnected():
              return onLogin(null);
            case AuthStatusRestricted():
              return AppRoutes.restricted.path;
            default:
          }
        case AppStateReady():
          return onHome(appBloc.state as AppStateReady);
        default:
      }
      return null; // stay on splash
    }

    final isOnWorkspace =
        routerState.pathParameters.containsKey(WorkspacePath.pathKey);
    final workspaceId =
        isOnWorkspace ? WorkspacePath.parseWorkspaceId(routerState.uri) : null;

    if (isOnWorkspace && workspaceId == null) {
      throw GoException('Invalid workspace');
    }

    final isOnLogin = AppRoutes.login.path == routerState.path;

    if (isOnLogin) {
      appBloc.state.authStatus;
      final crtState = appBloc.state;
      switch (crtState) {
        case AppStateUnauthenticated():
          switch (crtState.authStatus) {
            case AuthStatusRestricted():
              return AppRoutes.restricted.path;
            default:
          }
        case AppStateReady():
          return onHome(appBloc.state as AppStateReady);
        default:
      }
      return null; // stay onLogin
    }

    if (!isOnLogin && onlyAuthenticated) {
      final crtState = appBloc.state;

      if (crtState is! AppStateReady) {
        return onLogin(workspaceId);
      }

      if (isOnWorkspace) {
        if (crtState.workspaceId == null) {
          // TODO: unclear what to do here
        }

        if (crtState.workspaces[workspaceId] == null) {
          return AppRoutes.restricted.path;
        }

        if (crtState.workspaceId != workspaceId) {
          appBloc.add(AppEventChangeWorkspace(workspaceId!));
        }
      }
    }

    return null;
  }
}
