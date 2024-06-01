import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../app/app.dart';
import '../cubit/re_login_cubit.dart';

class ReLoginForm extends StatelessWidget {
  const ReLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReLoginCubit, ReLoginState>(
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
              const SizedBox(height: 8),
              _WorkspaceIdInput(),
              const SizedBox(height: 8),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 8),
              _LogoutButton(),
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
    return BlocBuilder<ReLoginCubit, ReLoginState>(
      buildWhen: (previous, current) => previous.identity != current.identity,
      builder: (context, state) {
        return TextFormField(
          key: Key(
              'ReLoginForm_workspaceIdInput_${state.identity?.workspaceId.toString()}textField'),
          keyboardType: TextInputType.number,
          initialValue: state.identity?.workspaceId.toString() ?? '',
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'workspace ID',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReLoginCubit, ReLoginState>(
      buildWhen: (previous, current) => current.identity != previous.identity,
      builder: (context, state) {
        return TextFormField(
          key: Key(
              'ReLoginForm_${state.identity?.username}_emailInput_textField'),
          initialValue: state.identity?.username ?? '',
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'email',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReLoginCubit, ReLoginState>(
      buildWhen: (previous, current) => current.identity != previous.identity,
      builder: (context, state) {
        return TextFormField(
          key: const Key('reLoginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<ReLoginCubit>().passwordChanged(password),
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
    return BlocBuilder<ReLoginCubit, ReLoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('reLoginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.identity != null && state.isValid
                    ? () => context.read<ReLoginCubit>().logInWithCredentials()
                    : null,
                child: const Text('LOGIN'),
              );
      },
    );
  }
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('reLoginForm_logout_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color(0xFFFFD600),
      ),
      onPressed: () => context.read<AppBloc>().logout(),
      child: const Text('LOGOUT'),
    );
  }
}
