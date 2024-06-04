import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../app/routes/routes.dart';
import '../cubit/create_cubit.dart';

class CreateForm extends StatelessWidget {
  final int workspaceId;
  CreateForm({required this.workspaceId})
      : super(key: ValueKey('createForm_form_$workspaceId'));

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateCubit, CreateState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset(
              //   'assets/bloc_logo_small.png',
              //   height: 120,
              // ),
              const SizedBox(height: 16),
              _WorkspaceIdInput(),
              const SizedBox(height: 8),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 4),
              _SignInButton(workspaceId: workspaceId),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkspaceIdInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCubit, CreateState>(
      buildWhen: (previous, current) =>
          previous.workspaceId != current.workspaceId,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_workspaceIdInput_textField'),
          readOnly: true,
          keyboardType: TextInputType.number,
          initialValue: state.workspaceId.value,
          decoration: InputDecoration(
            labelText: 'workspace ID',
            helperText: '',
            errorText: state.workspaceId.displayError != null
                ? 'invalid workspace ID'
                : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCubit, CreateState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_emailInput_textField'),
          onChanged: (email) => context.read<CreateCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          initialValue: state.email.value,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCubit, CreateState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<CreateCubit>().passwordChanged(password),
          initialValue: state.password.value,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText:
                state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCubit, CreateState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('createForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.isValid
                    ? () =>
                        context.read<CreateCubit>().createUserWithCredentials()
                    : null,
                child: const Text('CREATE ACCOUNT'),
              );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  final int workspaceId;
  _SignInButton({required this.workspaceId})
      : super(key: ValueKey('createForm_signIn_flatButton_$workspaceId'));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      key: Key('loginForm_createAccount_signIn_$workspaceId'),
      onPressed: () => AppRouter.goLoginInWorkspace(),
      child: Text(
        'LOGIN',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
