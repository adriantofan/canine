import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final String? loginHint;
  const LoginPage({super.key, this.loginHint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) =>
              LoginCubit(context.read<AuthRepository>(), loginHint: loginHint),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
