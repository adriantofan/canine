import 'package:app/repository.dart';
import 'package:app/tab_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // final store = Store();
  final repository = SyncRepository();
  runApp(MainApp(
    repository: repository,
  ));
}

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
      child: const MainAppView(),
    );
  }
}

class MainAppView extends StatelessWidget {
  const MainAppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: const TabHome(),
    );
  }
}
