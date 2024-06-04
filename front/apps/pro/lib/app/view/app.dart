import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/app_bloc.dart';
import '../routes/routes.dart';

class MainApp extends StatelessWidget {
  final SyncRepository _syncRepository;
  final AuthRepository _authRepository;

  const MainApp({
    required SyncRepository syncRepository,
    required AuthRepository authRepository,
    super.key,
  })  : _syncRepository = syncRepository,
        _authRepository = authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SyncRepository>.value(
          value: _syncRepository,
        ),
        RepositoryProvider<AuthRepository>.value(
          value: _authRepository,
        ),
      ],
      child: BlocProvider(
        create: (c) =>
            AppBloc(c.read<AuthRepository>())..add(AppEvent.initial()),
        // See AppRouter documentation for more information.
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            AppRouter.router.refresh();
          },
          child: MaterialApp.router(
              theme: ThemeData.light(useMaterial3: true),
              routerConfig: AppRouter.router),
        ),
      ),
    );
  }
}

class MainAppView extends StatelessWidget {
  const MainAppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData.light(useMaterial3: true),
        routerConfig: AppRouter.router);
  }
}
