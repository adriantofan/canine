import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../conversations/conversations.dart';
import '../../login/login.dart';
import '../../logout/logout.dart';
import '../../messages/messages.dart';
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
  static const String homePathNew = '$homePath/new';
  static const String settingsPath = '/settings';
  static const String logoutPath = '/logout';

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> conversationsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> messagesTabNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: conversationsTabNavigatorKey,
            routes: [
              ShellRoute(
                  parentNavigatorKey: conversationsTabNavigatorKey,
                  navigatorKey: messagesTabNavigatorKey,
                  routes: [
                    GoRoute(
                        path: homePath,
                        parentNavigatorKey: messagesTabNavigatorKey,
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
                    GoRoute(
                      path: homePathNew,
                      parentNavigatorKey: messagesTabNavigatorKey,
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
                    GoRoute(
                      path: '$homePath/:id',
                      parentNavigatorKey: messagesTabNavigatorKey,
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

  static get onConversations =>
      router.routeInformationProvider.value.uri.path.startsWith(homePath);
  static get crtConversationRouteId =>
      router.routeInformationProvider.value.uri.pathSegments.last;

  static goConversationWithInfo(ConversationInfo conversationInfo) {
    final newPath = '$homePath/${conversationInfo.conversationId}';
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
    router.replace('$homePath/${conversationInfo.conversationId}',
        extra: (conversationInfo, draftMessage));
  }

  static goConversationWithUser(DraftConversation draftConversation) {
    router.go(homePathNew, extra: draftConversation);
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
