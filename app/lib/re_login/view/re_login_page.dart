import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../cubit/re_login_cubit.dart';
import 're_login_form.dart';

class ReLoginPage extends StatelessWidget {
  const ReLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm password')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => ReLoginCubit(context.read<SyncRepository>()),
          child: const ReLoginForm(),
        ),
      ),
    );
  }
}
