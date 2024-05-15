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

// see https://croxx5f.hashnode.dev/adding-modal-routes-to-your-gorouter
//  about making a modal route and dealing with transiations
//  This model ws explained here https://github.com/flutter/flutter/issues/116651#issuecomment-1956528322
class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static late final GoRouter router;
  static AppRouter get instance => _instance;

  static String path(AppState state) {
    return switch (state) {
      Unknown() => _slashPath,
      LoginRegisterFlow() => _loginPath,
      Login() => _confirmPasswordPath,
      Running() => _homePath,
      RunningRefresh() =>
        _loginPath, // TODO: see how to trigger modal confirm password
      LoggingOut() => _logoutPath,
    };
  }

  static const String _slashPath = '/';
  static const String _loginPath = '/login';
  static const String _confirmPasswordPath = '/confirm-password';
  static const String _homePath = '/home';
  static const String _homePathConversation = '$_homePath/:id';
  static const String _homePathNew = '$_homePath/new';
  static const String _settingsPath = '/settings';
  static const String _logoutPath = '/logout';

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
              ShellRoute(
                  parentNavigatorKey: _conversationsTabNavigatorKey,
                  navigatorKey: _messagesTabNavigatorKey,
                  routes: [
                    GoAuthRoute(
                        path: _homePath,
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
                    GoAuthRoute(
                      path: _homePathNew,
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
                    GoAuthRoute(
                      path: _homePathConversation,
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
              GoAuthRoute(
                path: _settingsPath,
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
      GoRoute(
        parentNavigatorKey: _parentNavigatorKey,
        path: _slashPath,
        pageBuilder: (context, state) =>
            getPage(child: const SplashPage(), state: state),
      ),
      GoRoute(
          parentNavigatorKey: _parentNavigatorKey,
          path: _loginPath,
          pageBuilder: (context, state) =>
              getPage(child: const LoginPage(), state: state)),
      GoRoute(
        parentNavigatorKey: _parentNavigatorKey,
        path: _confirmPasswordPath,
        pageBuilder: (context, state) =>
            getPage(child: const ReLoginPage(), state: state),
      ),
      // GoRoute(
      //   parentNavigatorKey: parentNavigatorKey,
      //   path: homePath,
      //   pageBuilder: (context, state) =>
      //       getPage(child: const TabHome(), state: state),
      // ),
      GoRoute(
        parentNavigatorKey: _parentNavigatorKey,
        path: _logoutPath,
        pageBuilder: (context, state) =>
            getPage(child: const LogoutPage(), state: state),
      ),
    ];

    router = GoRouter(
      navigatorKey: _parentNavigatorKey,
      routes: routes,
    );
  }

  static get onConversations =>
      router.routeInformationProvider.value.uri.path.startsWith(_homePath);
  static get crtConversationRouteId =>
      router.routeInformationProvider.value.uri.pathSegments.last;

  static goConversationWithInfo(ConversationInfo conversationInfo) {
    final newPath = '$_homePath/${conversationInfo.conversationId}';
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
    if (router.routeInformationProvider.value.uri.path == newPath) {
      // assumes conversationInfo irelevant
      return;
    }
    router.go(newPath, extra: conversationInfo);
  }

  static replaceConversationWithInfo(
      ConversationInfo conversationInfo, DraftMessage draftMessage) {
    router.replace('$_homePath/${conversationInfo.conversationId}',
        extra: (conversationInfo, draftMessage));
  }

  static goConversationWithUser(DraftConversation draftConversation) {
    router.go(_homePathNew, extra: draftConversation);
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
  if (appBloc.state is! Running) {
    return AppRouter._loginPath;
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

class GoAuthRoute extends GoRoute {
  GoAuthRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.onExit,
    super.redirect = redirectIfNotAuth,
  }) : super();
}
