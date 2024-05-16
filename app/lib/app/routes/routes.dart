import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../conversations/conversations.dart';
import '../../login/login.dart';
import '../../logout/logout.dart';
import '../../messages/messages.dart';
import '../../re_login/re_login.dart';
import '../../settings/screen.dart';
import '../../splash/splash.dart';
import '../../tab_home/tab_home.dart';
import '../bloc/app_bloc.dart';

// List<Page> onGenerateAppViewPages(
//     AppState appState, List<Page<dynamic>> pages) {
//   switch (appState) {
//     case Unknown():
//       return [SplashPage.page()];
//     case LoginRegisterFlow():
//       return [LoginPage.page()];
//
//     case Login():
//       return [ReLoginPage.page()];
//     case Running():
//       return [TabHome.page()];
//     case RunningRefresh():
//       // TODO:
//       return [TabHome.page(), ReLoginPage.page()]; // try to add refresh
//     case LoggingOut():
//       return [LogoutPage.page()];
//   }
// }

abstract class RouterPath {
  String get pattern;
}

class RootPath implements RouterPath {
  final String path;
  const RootPath({
    required this.path,
  });
  @override
  // TODO: implement pattern
  String get pattern => path;
}

class WorkspacePath implements RouterPath {
  @override
  final String pattern;
  final String subPath;
  const WorkspacePath({required this.subPath})
      : pattern = '/:workspaceId$subPath';

  String path(int workspaceId) {
    return '/$workspaceId$subPath';
  }

  bool isOnSubpath(Uri path) {
    if (path.pathSegments.length < 2) {
      return false;
    }
    if (int.tryParse(path.pathSegments[0]) == null) {
      return false;
    }

    final rest = path.pathSegments.sublist(1).join('/');
    return '/$rest'.startsWith(subPath);
  }

  int? workspaceId(Uri path) {
    return int.tryParse(path.pathSegments[0]);
  }
}

class ConversationPath implements RouterPath {
  @override
  final String pattern;
  final WorkspacePath _homePath;
  ConversationPath(this._homePath)
      : pattern = '${_homePath.pattern}/:conversationId' {
    assert(_homePath.pattern.split('/').length == 3);
  }

  String path(int workspaceId, int conversationId) {
    return '${_homePath.path(workspaceId)}/$conversationId';
  }

  isOn(Uri path) {
    if (!_homePath.isOnSubpath(path)) {
      return false;
    }
    if (path.pathSegments.length == 2) {
      return true;
    }

    if (path.pathSegments.length == 3) {
      return true;
    }
    return false;
  }

  int? workspaceId(Uri path) {
    return _homePath.workspaceId(path);
  }

  int? conversationId(Uri path) {
    if (path.pathSegments.length != 3) {
      return null;
    }
    return int.tryParse(path.pathSegments[2]);
  }
}

// see https://croxx5f.hashnode.dev/adding-modal-routes-to-your-gorouter
//  about making a modal route and dealing with transiations
//  This model ws explained here https://github.com/flutter/flutter/issues/116651#issuecomment-1956528322
class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static late final GoRouter router;
  static AppRouter get instance => _instance;

  static String path(AppState state) {
    switch (state) {
      case Unknown():
        return _slashPath.path;
      case LoginRegisterFlow():
        return _loginPath.path(1714116660140);
      case Login():
        return _confirmPasswordPath.path(1714116660140);
      case Running(identity: var identity):
        return _homePath.path(identity.workspaceId);
      case RunningRefresh():
        return _loginPath.path(1714116660140);
        ; // TODO: see how to trigger modal confirm password
      case LoggingOut():
        return _logoutPath.path;
    }
  }

  static const RootPath _slashPath = RootPath(path: '/');
  static const WorkspacePath _loginPath = WorkspacePath(subPath: '/login');
  static const WorkspacePath _confirmPasswordPath =
      WorkspacePath(subPath: '/confirm-password');

  static const WorkspacePath _homePath = WorkspacePath(subPath: '/home');
  static final ConversationPath _homePathConversation =
      ConversationPath(_homePath);
  static const WorkspacePath _homePathNew = WorkspacePath(subPath: '/new');
  static const WorkspacePath _settingsPath =
      WorkspacePath(subPath: '/settings');
  static const RootPath _logoutPath = RootPath(path: '/logout');

  GoRouterState? authState; // holds the path to redirect to after login

  static final GlobalKey<NavigatorState> _parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _conversationsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _messagesTabNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: _conversationsTabNavigatorKey,
            routes: [
              // IT requires a non parametrized root route
              noPatternRoute('/home/conversations-na', _homePath),
              ShellRoute(
                  parentNavigatorKey: _conversationsTabNavigatorKey,
                  navigatorKey: _messagesTabNavigatorKey,
                  routes: [
                    AppRoute(
                        authenticated: true,
                        workspaceNamespace: true,
                        path: _homePath.pattern,
                        parentNavigatorKey: _messagesTabNavigatorKey,
                        pageBuilder: (context, state) {
                          return getPage(
                            child: Scaffold(
                              appBar: AppBar(),
                              body: const Center(
                                child: Text('Select a conversation'),
                              ),
                            ),
                            state: state,
                          );
                        }),
                    AppRoute(
                      authenticated: true,
                      workspaceNamespace: true,
                      path: _homePathNew.pattern,
                      parentNavigatorKey: _messagesTabNavigatorKey,
                      pageBuilder: (context, state) {
                        return getPage(
                          child: DraftConversationPage(
                            draftConversation:
                                state.extra! as DraftConversation,
                          ),
                          state: state,
                        );
                      },
                    ),
                    AppRoute(
                      authenticated: true,
                      workspaceNamespace: true,
                      path: _homePathConversation.pattern,
                      parentNavigatorKey: _messagesTabNavigatorKey,
                      pageBuilder: (context, state) {
                        switch (state.extra) {
                          case ConversationInfo():
                            return getPage(
                              child: MessagesPage(
                                conversationInfo:
                                    state.extra! as ConversationInfo,
                              ),
                              state: state,
                            );
                          case (
                              ConversationInfo conversationInfo,
                              DraftMessage draftMessage
                            ):
                            return getPage(
                              child: MessagesPage(
                                conversationInfo: conversationInfo,
                                draftMessage: draftMessage,
                              ),
                              state: state,
                            );
                        }
                        return getPage(
                          child: MessagesPage(
                            conversationInfo: state.extra! as ConversationInfo,
                          ),
                          state: state,
                        );
                      },
                    ),
                  ],
                  pageBuilder: (context, state, child) {
                    return getPage(
                        child: ConversationsScreen(child: child), state: state);
                  }),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsTabNavigatorKey,
            routes: [
              noPatternRoute('/home/settings-na', _settingsPath),
              AppRoute(
                authenticated: true,
                workspaceNamespace: true,
                path: _settingsPath.pattern,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const SettingsScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: TabHome(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      AppRoute(
        authenticated: false,
        workspaceNamespace: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: _slashPath.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const SplashPage(), state: state),
      ),
      AppRoute(
          authenticated: false,
          workspaceNamespace: true,
          parentNavigatorKey: _parentNavigatorKey,
          path: _loginPath.pattern,
          pageBuilder: (context, state) =>
              getPage(child: const LoginPage(), state: state)),
      AppRoute(
        authenticated: false, // TODO: ??
        workspaceNamespace: true,
        parentNavigatorKey: _parentNavigatorKey,
        path: _confirmPasswordPath.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const ReLoginPage(), state: state),
      ),
      // GoRoute(
      //   parentNavigatorKey: parentNavigatorKey,
      //   path: homePath,
      //   pageBuilder: (context, state) =>
      //       getPage(child: const TabHome(), state: state),
      // ),
      AppRoute(
        authenticated: false,
        workspaceNamespace: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: _logoutPath.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const LogoutPage(), state: state),
      ),
    ];

    router = GoRouter(
        navigatorKey: _parentNavigatorKey,
        routes: routes,
        debugLogDiagnostics: true,
        redirect: (BuildContext context, GoRouterState state) {
          print('main redirect ${state.fullPath}');
          return null;
        });
  }

  GoRoute noPatternRoute(String path, WorkspacePath workspacePath) {
    return GoRoute(
        path: path,
        redirect: (BuildContext context, GoRouterState state) {
          final appState = context.read<AppBloc>().state;
          if (appState is! Running) {
            throw FormatException(
                'Cannot go to conversations without workspace', state.fullPath);
          }

          return workspacePath.path(appState.identity.workspaceId);
        });
  }

  static bool get onConversations =>
      _homePathConversation.isOn(router.routeInformationProvider.value.uri);

  static int? get crtConversationRouteId => _homePathConversation
      .conversationId(router.routeInformationProvider.value.uri);

  static goConversationWithInfo(ConversationInfo conversationInfo) {
    final crtUri = router.routeInformationProvider.value.uri;
    if (_homePathConversation.isOn(crtUri) &&
        _homePathConversation.conversationId(crtUri) ==
            conversationInfo.conversationId) {
      // assumes conversationInfo is not relevant
      return;
    }

    final workspaceId = _homePathConversation.workspaceId(crtUri);
    if (workspaceId == null) {
      throw FormatException(
          'Cannot go on a conversation only from a workspaced resource',
          crtUri.path);
    }

    // Seems like if go is called after a replace with the same uri
    // it will still result in a double push because it not only checks
    // the uri but also the type in go definition:
    //   void go(String location, {Object? extra}) {
    //     _setValue(
    //       location,
    //       RouteInformationState<void>(
    //         extra: extra,
    //         type: NavigatingType.go,
    //       ),
    //     );
    //   }

    router.go(
        _homePathConversation.path(
            workspaceId, conversationInfo.conversationId),
        extra: conversationInfo);
  }

  static replaceConversationWithInfo(
      ConversationInfo conversationInfo, DraftMessage draftMessage) {
    final crtUri = router.routeInformationProvider.value.uri;

    if (!_homePath.isOnSubpath(crtUri) ||
        _homePath.workspaceId(crtUri) == null) {
      throw FormatException(
          'Cannot create draft conversation only from a workspaced resource',
          crtUri.path);
    }
    router.replace(_homePathNew.path(conversationInfo.conversationId),
        extra: (conversationInfo, draftMessage));
  }

  static goConversationWithUser(DraftConversation draftConversation) {
    final crtUri = router.routeInformationProvider.value.uri;
    if (!_homePath.isOnSubpath(crtUri) ||
        _homePath.workspaceId(crtUri) == null) {
      throw FormatException(
          'Cannot create draft conversation only from a workspaced resource',
          crtUri.path);
    }
    final newPath = _homePathNew.path(_homePath.workspaceId(crtUri)!);
    router.go(newPath, extra: draftConversation);
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}

String? redirectIfNotAuth(BuildContext context, GoRouterState state) {
  final appBloc = context.read<AppBloc>();
  print('redirectIfNotAuth ${state.path} ${appBloc.state}');
  if (appBloc.state is! Running) {
    return AppRouter._loginPath.path(1714116660140);
  }
  return null;
  // TODO: implement variations here when final auth in place

  final newWorkspaceIdStr = state.pathParameters['workspaceId'];
  int newWorkspaceId = int.tryParse(newWorkspaceIdStr ?? '') ?? 0;

  switch (appBloc.state) {
    case Unknown():
    case LoginRegisterFlow(): // Does not exist
    case LoggingOut():
      break;
    case Login(identity: var identity): // It might be submitting
      if (newWorkspaceId != 0 && identity.workspaceId == newWorkspaceId) {
        // this is a switch to a new workspace
        // should return another page
      }
    case Running(): // has identity
    case RunningRefresh(): // has identity
  }
}

class AppRoute extends GoRoute {
  final bool authenticated;
  final bool workspaceNamespace;
  // GoRouterRedirect? redirect;

  AppRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.onExit,
    this.authenticated = false,
    this.workspaceNamespace = false,
  }) : super();

  @override
  get redirect => redirectIfNotAuth;

  String? redirectIfNotAuth(BuildContext context, GoRouterState state) {
    final appBloc = context.read<AppBloc>();
    print('redirectIfNotAuth ${state.path} ${appBloc.state}');
    if (appBloc.state is! Running) {
      return AppRouter._loginPath.path(1714116660140);
    }
    return null;
    // TODO: implement variations here when final auth in place

    final newWorkspaceIdStr = state.pathParameters['workspaceId'];
    int newWorkspaceId = int.tryParse(newWorkspaceIdStr ?? '') ?? 0;

    switch (appBloc.state) {
      case Unknown():
      case LoginRegisterFlow(): // Does not exist
      case LoggingOut():
        break;
      case Login(identity: var identity): // It might be submitting
        if (newWorkspaceId != 0 && identity.workspaceId == newWorkspaceId) {
          // this is a switch to a new workspace
          // should return another page
        }
      case Running(): // has identity
      case RunningRefresh(): // has identity
    }
  }
}
