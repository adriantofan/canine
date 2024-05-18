import 'package:app/start/start.dart';
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
import 'app_go_route.dart';
import 'app_routes.dart';
import 'path.dart';

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
        return AppRoutes.slash.path;
      case Wellcome():
        return AppRoutes.wellcome.path;
      case LoginRegisterFlow():
        return AppRoutes.login.path(1714116660140);
      case Login():
        return AppRoutes.confirmPassword.path(1714116660140);
      case Running(identity: var identity):
        return AppRoutes.home.path(identity.workspaceId);
      case RunningRefresh():
        return AppRoutes.login.path(1714116660140);
        ; // TODO: see how to trigger modal confirm password
      case LoggingOut():
        return AppRoutes.logout.path;
    }
  }

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
              noPatternRoute('/home/conversations-na', AppRoutes.home),
              ShellRoute(
                  parentNavigatorKey: _conversationsTabNavigatorKey,
                  navigatorKey: _messagesTabNavigatorKey,
                  routes: [
                    AppGoRoute(
                        onlyAuthenticated: true,
                        workspaceNamespaced: true,
                        path: AppRoutes.home.pattern,
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
                    AppGoRoute(
                      onlyAuthenticated: true,
                      workspaceNamespaced: true,
                      path: AppRoutes.homeNew.pattern,
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
                    AppGoRoute(
                      onlyAuthenticated: true,
                      workspaceNamespaced: true,
                      path: AppRoutes.homeConversation.pattern,
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
              noPatternRoute('/home/settings-na', AppRoutes.settings),
              AppGoRoute(
                onlyAuthenticated: true,
                workspaceNamespaced: true,
                path: AppRoutes.settings.pattern,
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
      AppGoRoute(
        onlyAuthenticated: false,
        workspaceNamespaced: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: AppRoutes.wellcome.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const WellcomePage(), state: state),
      ),
      AppGoRoute(
        onlyAuthenticated: false,
        workspaceNamespaced: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: AppRoutes.slash.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const SplashPage(), state: state),
      ),
      AppGoRoute(
          onlyAuthenticated: false,
          workspaceNamespaced: true,
          parentNavigatorKey: _parentNavigatorKey,
          path: AppRoutes.login.pattern,
          pageBuilder: (context, state) =>
              getPage(child: const LoginPage(), state: state)),
      AppGoRoute(
        onlyAuthenticated: false, // TODO: ??
        workspaceNamespaced: true,
        parentNavigatorKey: _parentNavigatorKey,
        path: AppRoutes.confirmPassword.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const ReLoginPage(), state: state),
      ),
      AppGoRoute(
        onlyAuthenticated: false,
        workspaceNamespaced: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: AppRoutes.logout.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const LogoutPage(), state: state),
      ),
    ];

    router = GoRouter(
      navigatorKey: _parentNavigatorKey,
      routes: routes,
      routerNeglect: true, // TODO: see if this is a good idea
      debugLogDiagnostics: true,
    );
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

  static bool get onConversations => AppRoutes.homeConversation
      .isOn(router.routeInformationProvider.value.uri);

  static int? get crtConversationRouteId => AppRoutes.homeConversation
      .conversationId(router.routeInformationProvider.value.uri);

  static goConversationWithInfo(ConversationInfo conversationInfo) {
    final crtUri = router.routeInformationProvider.value.uri;
    if (AppRoutes.homeConversation.isOn(crtUri) &&
        AppRoutes.homeConversation.conversationId(crtUri) ==
            conversationInfo.conversationId) {
      // assumes conversationInfo is not relevant
      return;
    }

    final workspaceId = AppRoutes.homeConversation.workspaceId(crtUri);
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
        AppRoutes.homeConversation
            .path(workspaceId, conversationInfo.conversationId),
        extra: conversationInfo);
  }

  static replaceConversationWithInfo(
      ConversationInfo conversationInfo, DraftMessage draftMessage) {
    final crtUri = router.routeInformationProvider.value.uri;

    if (!AppRoutes.home.isOnSubpath(crtUri) ||
        AppRoutes.home.workspaceId(crtUri) == null) {
      throw FormatException(
          'Cannot create draft conversation only from a workspaced resource',
          crtUri.path);
    }
    router.replace(AppRoutes.homeNew.path(conversationInfo.conversationId),
        extra: (conversationInfo, draftMessage));
  }

  static goConversationWithUser(DraftConversation draftConversation) {
    final crtUri = router.routeInformationProvider.value.uri;
    if (!AppRoutes.home.isOnSubpath(crtUri) ||
        AppRoutes.home.workspaceId(crtUri) == null) {
      throw FormatException(
          'Cannot create draft conversation only from a workspaced resource',
          crtUri.path);
    }
    final newPath = AppRoutes.homeNew.path(AppRoutes.home.workspaceId(crtUri)!);
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
