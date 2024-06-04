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

    final onSplash = routerState.path == AppRoutes.slash.path;
    if (onSplash) {
      if (appBloc.isAuthenticated) {
        print("Login");
        return AppRoutes.home.path(appBloc.workspaceId);
      } else {
        print("Login");
        return AppRoutes.login.path;
      }
    }

    final isOnWorkspace =
        routerState.pathParameters.containsKey(WorkspacePath.pathKey);
    final workspaceId =
        isOnWorkspace ? WorkspacePath.parseWorkspaceId(routerState.uri) : null;

    if (isOnWorkspace && workspaceId == null) {
      throw GoException('Invalid workspace');
    }

    final isOnLogin = AppRoutes.login.path == routerState.path;
    if (isOnLogin && appBloc.isAuthenticated) {
      return AppRoutes.home.path(appBloc.workspaceId);
    }

    if (!isOnLogin && onlyAuthenticated) {
      if (!appBloc.isAuthenticated) {
        return onLogin(workspaceId);
      }
    }

    // final isOnAnotherWorkspace =
    //     isOnWorkspace && workspaceId != appBloc.workspaceId;
    //
    // if (isOnLogin && appBloc.isAuthenticated && !isOnAnotherWorkspace) {
    //   // Don't go on login if not necessary
    //   return AppRoutes.home.path(workspaceId);
    // }
    //
    // if (!isOnLogin && onlyAuthenticated) {
    //   if (!appBloc.isAuthenticated || isOnAnotherWorkspace) {
    //     return onLogin(workspaceId!);
    //   }
    // }
    // TODO: finish checking this , and go to the repository
    return null;
  }
}
