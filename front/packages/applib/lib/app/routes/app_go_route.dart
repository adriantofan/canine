import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import '../../repository/repository.dart';
import '../../routes/path.dart';
import '../bloc/app_bloc.dart';
import 'app_routes.dart';

class AppGoRoute extends GoRoute {
  final bool onlyAuthenticated;
  final bool workspaceNamespaced;
  final bool isLogin;
  final AppType? appType;
  static final Logger _logger = Logger('AppGoRoute');
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
    this.appType,
  }) : super();

  @override
  get redirect => _guard;
  Future<String?> _guard(
      BuildContext context, GoRouterState routerState) async {
    final result = await _guard1(context, routerState);

    if (result != null) {
      _logger.fine('redirect: $result');
    }
    return result;
  }

  Future<String?> _guard1(
      BuildContext context, GoRouterState routerState) async {
    final appBloc = context.read<AppBloc>();
    _logger.finer('refresh ${routerState.uri}');

    maybeOnHome(AppStateReady appState) {
      if (appState.workspaceId == null) {
        // This can happen when the user doens not have roles at all
        // ot when there are no roles returned from the backend despite
        // having a roles in zitadel
        _logger.warning('No workspaceId in AppStateReady');

        return AppRoutes.error.path;
      }
      return AppRoutes.home.path(appState.workspaceId);
    }

    final isOnWorkspace =
        routerState.pathParameters.containsKey(WorkspacePath.pathKey);
    final workspaceId =
        isOnWorkspace ? WorkspacePath.parseWorkspaceId(routerState.uri) : null;

    final conversationId = ConversationPath.getConversationId(routerState);
    final isOnConversation = conversationId != null;

    onLogin() {
      if (workspaceId != null &&
          (appBloc.workspaceId != workspaceId ||
              appBloc.conversationId != conversationId)) {
        Future.microtask(() =>
            appBloc.add(AppEventChangeWorkspace(workspaceId!, conversationId)));
      }
      final targetWorkspaceId =
          (workspaceId == null && appBloc.workspaceId != null)
              ? appBloc.workspaceId
              : workspaceId;
      return "${AppRoutes.login.path}?ref=${routerState.uri}&workspaceId=$targetWorkspaceId";
    }

    onRestricted() {
      return '${AppRoutes.restricted.path}';
    }

    final isOnLogout = routerState.path == AppRoutes.logout.path;
    if (isOnLogout) {
      final crtState = appBloc.state;
      if (crtState is AppStateUnauthenticated) {
        return onLogin();
      }
    }

    final isOnSplash = routerState.path == AppRoutes.slash.path;

    if (isOnSplash) {
      appBloc.state.authStatus;
      final crtState = appBloc.state;
      final crtAuthStatus = crtState.authStatus;
      switch (crtState) {
        case AppStateUnauthenticated():
          switch (crtState.authStatus) {
            case AuthStatusDisconnected():
              return onLogin();
            case AuthStatusUnknown() || AuthStatusAuthenticated():
              break;
          }
        case AppStateAuthenticated():
          if (crtAuthStatus.doesNotHaveGrants) {
            return onRestricted(); // ok, no wksp/conv changes with respect to app state
          }
        case AppStateReady():
          return maybeOnHome(crtState);
      }
      return null; // stay on splash
    }

    if (isOnWorkspace && workspaceId == null) {
      throw GoException('Invalid workspace');
    }

    final isOnLogin = AppRoutes.login.path == routerState.path;

    if (isOnLogin) {
      appBloc.state.authStatus;
      final crtState = appBloc.state;
      final crtAuthStatus = crtState.authStatus;
      switch (crtState) {
        case AppStateAuthenticated():
          if (crtAuthStatus.doesNotHaveGrants) {
            return onRestricted(); // ok, no wksp/conv changes with respect to app state
          }
        case AppStateReady():
          return maybeOnHome(appBloc.state as AppStateReady);
        case AppStateUnauthenticated():
          break;
      }
      return null; // stay onLogin
    }

    final isOnCreateOrg = AppRoutes.createOrg.path == routerState.path;
    if (isOnCreateOrg) {
      final crtState = appBloc.state;

      if (crtState is AppStateReady) {
        return maybeOnHome(appBloc.state as AppStateReady);
      }

      if (crtState is AppStateAuthenticated) {
        // it will get redirected to the home page
        return onLogin();
      }
    }
    final crtState = appBloc.state;

    if (isOnConversation && isOnWorkspace && appType == AppType.clemia) {
      // this is used only on the clemia app, to deal with the inapp links to
      // conversations
      if (crtState.workspaceId != workspaceId ||
          crtState.conversationId != conversationId) {
        // workspace changed
        Future.microtask(() =>
            appBloc.add(AppEventChangeWorkspace(workspaceId!, conversationId)));
      }
      return AppRoutes.home.path(workspaceId);
    }

    if (!isOnLogin && onlyAuthenticated) {
      if (crtState.authStatus is AuthStatusUnknown) {
        // this is probably the first route the user visits at load
        // so we don't know the auth status yet
        if (workspaceId != null) {
          Future.microtask(() => appBloc
              .add(AppEventChangeWorkspace(workspaceId!, conversationId)));
        }
        return AppRoutes.slash.path;
      }

      if (crtState is! AppStateReady) {
        return onLogin();
      }
      // From here on we are in state Ready

      if (isOnWorkspace) {
        // if (crtState.workspaceId == null) {
        //   // TODO: unclear what to do here
        // }

        if (crtState.workspaceId != workspaceId && workspaceId != null) {
          // workspace changed
          Future.microtask(() => appBloc
              .add(AppEventChangeWorkspace(workspaceId!, conversationId)));
          // TODO: workspace that we stay are on is different from the one in the state

          if (crtState.workspaces[workspaceId] == null) {
            // TODO: this breaks the contract of the AppEventChangeWorkspace
            //     because the workspace is not yet in the state
            return onRestricted();
          }
        }
      }
    }

    return null;
  }
}
