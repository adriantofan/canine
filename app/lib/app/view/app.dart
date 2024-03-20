import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/app_bloc.dart';
import '../routes/routes.dart';

class MainApp extends StatelessWidget {
  final SyncRepository _repository;

  const MainApp({
    required SyncRepository repository,
    super.key,
  }) : _repository = repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _repository,
      child: BlocProvider(
        create: (c) => AppBloc(c.read()),
        child: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            final path = switch (state) {
              Unknown() => '/',
              LoginRegisterFlow() => '/login',
              Login() => '/confirm-password',
              Running() => '/home',
              RunningRefresh() =>
                '/login', // TODO: see how to trigger modal confirm password
              LoggingOut() => '/logout',
            };
            AppRouter.router.go(path);
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
