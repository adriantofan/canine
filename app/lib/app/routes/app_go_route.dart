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
    onLogin(workspaceId) =>
        "${AppRoutes.login.path(workspaceId)}?ref=${routerState.uri}";
    final isOnWorkspace =
        routerState.pathParameters.containsKey(WorkspacePath.pathKey);
    final workspaceId =
        isOnWorkspace ? WorkspacePath.parseWorkspaceId(routerState.uri) : null;

    if (isOnWorkspace && workspaceId == null) {
      throw GoException('Invalid workspace');
    }

    final isOnLogin =
        isOnWorkspace && AppRoutes.login.path(workspaceId!) == routerState.path;

    final isOnAnotherWorkspace =
        isOnWorkspace && workspaceId != appBloc.workspaceId;

    if (isOnLogin && appBloc.state.isAuthenticated && !isOnAnotherWorkspace) {
      // Don't go on login if not necessary
      return AppRoutes.home.path(workspaceId);
    }

    if (!isOnLogin && onlyAuthenticated) {
      if (!appBloc.state.isAuthenticated || isOnAnotherWorkspace) {
        return onLogin(workspaceId!);
      }
    }
    // TODO: finish checking this , and go to the repository
    return null;
  }
}
