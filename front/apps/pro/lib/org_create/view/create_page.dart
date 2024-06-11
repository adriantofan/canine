import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/org_create_cubit.dart';
import 'org_create_form.dart';

class CreateOrgPage extends StatelessWidget {
  const CreateOrgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => OrgCreateCubit(context.read<APIClientBase>()),
          child: const CreateForm(),
        ),
      ),
    );
  }
}
