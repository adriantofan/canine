import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final String? loginHint;
  final int? workspaceId;
  LoginPage({this.loginHint, this.workspaceId})
      : super(key: ValueKey('login-page-$workspaceId'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(
              context.read<AuthRepository>(), context.read<APIClientBase>(),
              loginHint: loginHint, workspaceId: workspaceId),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
