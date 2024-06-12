import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthRepository from the context
    // TODO: this should be done differently such that it is not run at each build
    context.read<AppBloc>().add(const AppEvent.logout());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logging out'),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
