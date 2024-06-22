import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../preferences/preferences.dart';
import '../../repository/repository.dart';
import '../bloc/app_bloc.dart';

class MainApp extends StatelessWidget {
  final SyncSessionRepository syncSessionRepository;
  final AuthRepository authRepository;
  final APIClientBase apiClient;
  final GoRouter router;
  final AppType appType;
  final PersistentPreferences preferences;
  final int? lastWorkspaceId;
  final int? lastConversationId;

  const MainApp({
    super.key,
    required this.syncSessionRepository,
    required this.authRepository,
    required this.apiClient,
    required this.router,
    required this.appType,
    required this.preferences,
    this.lastWorkspaceId,
    this.lastConversationId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<APIClientBase>.value(
          value: apiClient,
        ),
        RepositoryProvider<SyncSessionRepository>.value(
          value: syncSessionRepository,
        ),
        RepositoryProvider<AuthRepository>.value(
          value: authRepository,
        ),
      ],
      child: BlocProvider(
        create: (c) => AppBloc(
            c.read<AuthRepository>(),
            c.read<APIClientBase>(),
            syncSessionRepository,
            appType,
            preferences,
            lastWorkspaceId,
            lastConversationId)
          ..add(const AppEvent.initial()),
        // See AppRouter documentation for more information.
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) async {
            router.refresh();
          },
          child: MaterialApp.router(
              theme: ThemeData.light(useMaterial3: true), routerConfig: router),
        ),
      ),
    );
  }
}

class MainAppView extends StatelessWidget {
  final GoRouter router;

  const MainAppView({
    super.key,
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData.light(useMaterial3: true), routerConfig: router);
  }
}
