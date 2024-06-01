import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/create_cubit.dart';
import 'create_form.dart';

class CreatePage extends StatelessWidget {
  final int workspaceId;
  CreatePage({required this.workspaceId})
      : super(key: ValueKey('create_page_$workspaceId'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) =>
              CreateCubit(context.read<AuthRepository>(), workspaceId),
          child: CreateForm(workspaceId: workspaceId),
        ),
      ),
    );
  }
}
