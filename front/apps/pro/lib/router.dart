import 'package:app/start/start.dart';
import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'conversations/conversations.dart';
import 'draft_conversation/draft_conversation.dart';
import 'login/login.dart';
import 'logout/logout.dart';
import 'org_create/org_create.dart';
import 'settings/screen.dart';
import 'tab_home/tab_home.dart';

class ProRoutes {
  static const WorkspacePath switchWorkspace =
      WorkspacePath(subPath: '/switch-workspace');
  static const WorkspacePath confirmPassword =
      WorkspacePath(subPath: '/confirm-password');

  static final ConversationPath homeConversation =
      ConversationPath(AppRoutes.home);
  static const WorkspacePath homeNew = WorkspacePath(subPath: '/new');
  static const WorkspacePath settings = WorkspacePath(subPath: '/settings');
}

// see https://croxx5f.hashnode.dev/adding-modal-routes-to-your-gorouter
//  about making a modal route and dealing with transiations
//  This model ws explained here https://github.com/flutter/flutter/issues/116651#issuecomment-1956528322
class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  static late final GoRouter router;
  static AppRouter get instance => _instance;

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
          // Conversations branch
          StatefulShellBranch(
            navigatorKey: _conversationsTabNavigatorKey,
            routes: [
              // IT requires a non parametrized root route
              noPatternRoute('/home/conversations-na', AppRoutes.home),
              ShellRoute(
                  parentNavigatorKey: _conversationsTabNavigatorKey,
                  navigatorKey: _messagesTabNavigatorKey,
                  routes: [
                    // Empty conversation page
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
                    // Draft conversation page
                    AppGoRoute(
                      onlyAuthenticated: true,
                      workspaceNamespaced: true,
                      path: ProRoutes.homeNew.pattern,
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
                    // Conversation page
                    AppGoRoute(
                      onlyAuthenticated: true,
                      workspaceNamespaced: true,
                      path: ProRoutes.homeConversation.pattern,
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
                    // TODO: this needs a workspace based key
                    return getPage(
                        child: ConversationsScreen(child: child), state: state);
                  }),
            ],
          ),
          // Settings branch
          StatefulShellBranch(
            navigatorKey: _settingsTabNavigatorKey,
            routes: [
              noPatternRoute('/home/settings-na', ProRoutes.settings),
              AppGoRoute(
                onlyAuthenticated: true,
                workspaceNamespaced: true,
                path: ProRoutes.settings.pattern,
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
        // Build the shell
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          // TODO: give it the works so it can coordinate authorization
          AppBloc appBloc = context.read<AppBloc>();
          final page = getPage(
            child: InWorkspace(
              workspaceId: appBloc.workspaceId!,
              child: navigationShell,
            ),
            state: state,
          );
          return page;
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
          workspaceNamespaced: false,
          parentNavigatorKey: _parentNavigatorKey,
          path: AppRoutes.createOrg.pattern,
          pageBuilder: (context, state) {
            return getPage(child: CreateOrgPage(), state: state);
          }),
      AppGoRoute(
        onlyAuthenticated: false,
        workspaceNamespaced: false,
        parentNavigatorKey: _parentNavigatorKey,
        path: AppRoutes.logout.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const LogoutPage(), state: state),
      ),
      AppGoRoute(
          onlyAuthenticated: false,
          workspaceNamespaced: false,
          parentNavigatorKey: _parentNavigatorKey,
          path: AppRoutes.login.pattern,
          pageBuilder: (context, state) {
            // this is passed as extra to make it invisible to the user
            final loginHint = state.extra != null
                ? (state.extra as Map)[loginHintExtraKey] as String?
                : null;
            return getPage(
                child: LoginPage(loginHint: loginHint), state: state);
          }),
    ];

    router = GoRouter(
      navigatorKey: _parentNavigatorKey,
      routes: routes,
      // routerNeglect: true, // TODO: ~~see if this is a good idea~~ probably not
      // If enabled , go router adds a listner to logger and outputs the logs to console
      // debugLogDiagnostics: true,
    );
    // router.routerDelegate.addListener(() {
    //   final config = router.routerDelegate.currentConfiguration;
    //   print('Router config: ${config.pathParameters}');
    // });
  }

  GoRoute noPatternRoute(String path, WorkspacePath workspacePath) {
    return GoRoute(
        path: path,
        redirect: (BuildContext context, GoRouterState state) {
          final workspaceID = context.read<AppBloc>().workspaceId;

          if (workspaceID == null) {
            throw FormatException(
                'Cannot go to conversations without workspace', state.fullPath);
          }

          return workspacePath.path(workspaceID);
        });
  }

  static bool get onConversations => ProRoutes.homeConversation
      .isOn(router.routeInformationProvider.value.uri);

  static int? get crtConversationRouteId => ProRoutes.homeConversation
      .conversationId(router.routeInformationProvider.value.uri);

  static goConversationWithInfo(ConversationInfo conversationInfo) {
    final crtUri = router.routeInformationProvider.value.uri;
    if (ProRoutes.homeConversation.isOn(crtUri) &&
        ProRoutes.homeConversation.conversationId(crtUri) ==
            conversationInfo.conversationId) {
      // assumes conversationInfo is not relevant
      return;
    }

    final workspaceId = ProRoutes.homeConversation.workspaceId(crtUri);
    if (workspaceId == null) {
      throw FormatException(
          'Cannot go on a conversation only from a workspaced resource',
          crtUri.path);
    }

    router.go(
        ProRoutes.homeConversation
            .path(workspaceId, conversationInfo.conversationId),
        extra: conversationInfo);
  }

  static replaceConversationWithInfo(
      ConversationInfo conversationInfo, DraftMessage draftMessage) {
    final crtUri = router.routeInformationProvider.value.uri;

    if (!ProRoutes.homeNew.isOnSubpath(crtUri) ||
        ProRoutes.homeNew.workspaceId(crtUri) == null) {
      throw FormatException(
          'Cannot create draft conversation only from a workspaced resource',
          crtUri.path);
    }
    final workspaceId = ProRoutes.homeConversation.workspaceId(crtUri)!;
    router.replace(
        ProRoutes.homeConversation
            .path(workspaceId, conversationInfo.conversationId),
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
    final newPath = ProRoutes.homeNew.path(AppRoutes.home.workspaceId(crtUri)!);
    router.go(newPath, extra: draftConversation);
  }

  static goLogin({String? loginHint}) {
    router.go(AppRoutes.login.path,
        extra: {if (loginHint != null) loginHintExtraKey: loginHint});
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
    LocalKey? key,
  }) {
    return MaterialPage(
      key: key ?? state.pageKey,
      child: child,
    );
  }
}

const loginHintExtraKey = 'loginHint';
