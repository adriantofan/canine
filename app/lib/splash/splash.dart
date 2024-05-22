import 'package:app/app/app.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AppBloc, AuthStatus>(
        listener: (context, state) {
          switch (state) {
            case AuthStatus.authenticated:
              Navigator.of(context).pushReplacementNamed('/home');
              break;
            case AuthStatus.unauthenticated:
              Navigator.of(context).pushReplacementNamed('/login');
              break;
            default:
              break;
          }
        },
        child: Center(
          child: Text('Starting up...'),
        ),
      ),
    );
  }
}
