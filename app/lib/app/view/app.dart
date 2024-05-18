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
        create: (c) => AppBloc(),
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
