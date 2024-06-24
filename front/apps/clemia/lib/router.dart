import 'package:applib/applib.dart';
import 'package:clemia/conversation_loader/conversation_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login/login.dart';
import 'logout/logout.dart';
import 'skaffold/skaffold.dart';

class ClemiaRoutes {
  static final ConversationPath homeConversation =
      ConversationPath(WorkspacePath(subPath: '/conversation'));
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
  static final GlobalKey<NavigatorState> _contentNavigatorKey =
      GlobalKey<NavigatorState>();

  AppRouter._internal() {
    final routes = [
      ShellRoute(
        parentNavigatorKey: _parentNavigatorKey,
        builder: (context, state, child) {
          return SkaffoldView(
            child: child,
          );
        },
        routes: [
          AppGoRoute(
            onlyAuthenticated: true,
            workspaceNamespaced: true,
            path: AppRoutes.home.pattern,
            pageBuilder: (context, state) {
              return getPage(
                child: ConversationLoaderPage(
                    workspaceId: context.read<AppBloc>().workspaceId!),
                state: state,
              );
            },
          ),
        ],
      ),
      AppGoRoute(
        onlyAuthenticated: true,
        workspaceNamespaced: true,
        path: ClemiaRoutes.homeConversation.pattern,
        parentNavigatorKey: _parentNavigatorKey,
        pageBuilder: (context, state) {
          // TODO: this needs fixing because there is no conversationInfo
          return getPage(
            child: MessagesPage(
              conversationInfo: state.extra! as ConversationInfo,
            ),
            state: state,
          );
        },
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
        path: AppRoutes.restricted.pattern,
        pageBuilder: (context, state) =>
            getPage(child: const RestrictedWidget(), state: state),
      ),
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
            final workspaceIdStr =
                state.uri.queryParameters[LoginWorkspaceIdQueryParam];
            final workspaceId =
                workspaceIdStr != null ? int.tryParse(workspaceIdStr) : null;
            return getPage(
              child: LoginPage(loginHint: loginHint, workspaceId: workspaceId),
              state: state,
            );
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
const LoginWorkspaceIdQueryParam = 'workspaceId';
