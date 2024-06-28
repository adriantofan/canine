import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.loginStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Authentication Failure'),
            ),
          );
        }
        if (state.workspaceStatus.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(state.loadErrorMessage ?? 'Failed to load workspace'),
            ),
          );
        }
      },
      child: Column(
        children: [
          if (context.read<LoginCubit>().state.onWorkspace) WorkspaceWidget(),
          const SizedBox(height: 8),
          Align(
            alignment: const Alignment(0, -1 / 3),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  _LoginButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkspaceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(children: content(context, state));
      },
    );
  }

  List<Widget> content(BuildContext context, LoginState state) {
    switch (state.workspaceStatus) {
      case FormzSubmissionStatus.initial:
      case FormzSubmissionStatus.inProgress:
        return [
          const Text('Wellcome on Clemia!'),
          const Text(
              'If you don\'t have an account please wait for the workspace to load.'),
          const SizedBox(height: 8),
          const Text('Loading workspace...'),
          const CircularProgressIndicator(),
        ];
      case FormzSubmissionStatus.success:
        return [
          Text('Wellcome to ${state.workspace!.name} on Clemia!'),
          const Text(
              'If you were invited and first time here please create your account, otherwise login.'),
          const SizedBox(height: 8),
          if (!state.loginStatus.isInProgress)
            state.createStatus.isInProgress
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => context.read<LoginCubit>().create(),
                    child: const Text('Create Account'),
                  ),
        ];

      case FormzSubmissionStatus.failure when state.notFound:
        return [
          const Text('Wellcome on Clemia!'),
          const Text('Your doctor workspace was not found.'),
        ];
      case FormzSubmissionStatus.failure:
      case FormzSubmissionStatus.canceled:
        return [
          const Text('Wellcome on Clemia!'),
          const Text(
              'If you don\'t have an account please retry loading workspace to continue.'),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => context.read<LoginCubit>().loadWorkspace(),
            child: const Text('Retry'),
          ),
        ];
      // show retry button
    }
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: const Color(0xFFFFD600),
          ),
          onPressed: () => context.read<LoginCubit>().logIn(),
          child: const Text('LOGIN'),
        );
      },
    );
  }
}
