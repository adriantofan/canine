import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthRepository from the context
    final repo = RepositoryProvider.of<SyncRepository>(context);

    return FutureBuilder<void>(
      future: repo.disconnect(), // Initiate the logout process
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Logging out'),
          ),
          body: Center(
            child: switch (snapshot.connectionState) {
              ConnectionState.done => const Text('You have been logged out'),
              ConnectionState.waiting => const CircularProgressIndicator(),
              // FIXME: Not supposed to happen, but if it does, we should handle it
              _ => const Text('Something went wrong'),
            },
          ),
        );
      },
    );
  }
}
