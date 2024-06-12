import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../repository/repository.dart';
import '../bloc/app_bloc.dart';

class MainApp extends StatelessWidget {
  final SyncSessionRepository _syncSessionRepository;
  final AuthRepository _authRepository;
  final APIClientBase _apiClient;
  final GoRouter router;
  final AppType appType;

  const MainApp({
    required SyncSessionRepository syncSessionRepository,
    required AuthRepository authRepository,
    required APIClientBase apiClient,
    required this.router,
    required this.appType,
    super.key,
  })  : _syncSessionRepository = syncSessionRepository,
        _authRepository = authRepository,
        _apiClient = apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<APIClientBase>.value(
          value: _apiClient,
        ),
        RepositoryProvider<SyncSessionRepository>.value(
          value: _syncSessionRepository,
        ),
        RepositoryProvider<AuthRepository>.value(
          value: _authRepository,
        ),
      ],
      child: BlocProvider(
        create: (c) => AppBloc(c.read<AuthRepository>(),
            c.read<APIClientBase>(), _syncSessionRepository, appType)
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
