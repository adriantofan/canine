import 'package:app/re_login/view/re_login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../conversations/screen.dart';
import '../../login/login.dart';
import '../../logout/logout.dart';
import '../../re_login/re_login.dart';
import '../../settings/screen.dart';
import '../../splash/splash.dart';
import '../../tab_home/tab_home.dart';

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

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static late final GoRouter router;
  static AppRouter get instance => _instance;

  static const String slashPath = '/';
  static const String loginPath = '/login';
  static const String confirmPasswordPath = '/confirm-password';
  static const String homePath = '/home';
  static const String settingsPath = '/settings';
  static const String logoutPath = '/logout';

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> conversationsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: conversationsTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const ConversationsScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: settingsPath,
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
        parentNavigatorKey: parentNavigatorKey,
        path: slashPath,
        pageBuilder: (context, state) =>
            getPage(child: const SplashPage(), state: state),
      ),
      GoRoute(
          parentNavigatorKey: parentNavigatorKey,
          path: loginPath,
          pageBuilder: (context, state) =>
              getPage(child: const LoginPage(), state: state)),
      GoRoute(
        parentNavigatorKey: parentNavigatorKey,
        path: confirmPasswordPath,
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
        parentNavigatorKey: parentNavigatorKey,
        path: logoutPath,
        pageBuilder: (context, state) =>
            getPage(child: const LogoutPage(), state: state),
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      routes: routes,
    );
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
