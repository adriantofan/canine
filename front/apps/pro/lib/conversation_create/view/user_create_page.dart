import 'package:app/conversation_create/bloc/user_create_cubit.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class UserCreatePage extends StatelessWidget {
  final ValueSetter<(BuildContext, User)> _userCreated;

  const UserCreatePage(this._userCreated, {super.key});

  static Page<void> page(DevisRecipient recipient,
          ValueSetter<(BuildContext, User)> userCreated) =>
      MaterialPage<void>(
        child: BlocProvider(
          create: (context) => UserCreateCubit(context.read(), recipient),
          child: UserCreatePage(userCreated, key: ObjectKey(recipient)),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: BlocConsumer<UserCreateCubit, UserCreateState>(
        listener: (context, state) {
          switch (state.status) {
            case FormzSubmissionStatus.failure:
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'User create failure'),
                  ),
                );
            case FormzSubmissionStatus.success:
              _userCreated((context, state.user!));
              return;
            default:
          }
        },
        builder: (context, state) {
          return PopScope(
              canPop: !state.status.isInProgress,
              child: Align(
                alignment: const Alignment(0, -1 / 3),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      _FirstNameInput(),
                      const SizedBox(height: 8),
                      _LastNameInput(),
                      const SizedBox(height: 8),
                      _MobileInputButton(),
                      const SizedBox(height: 8),
                      _EmailInputButton(),
                      const SizedBox(height: 4),
                      _CreateButton(),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCreateCubit, UserCreateState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextFormField(
          key: const Key('userCreateForm_firstNameInput_textField'),
          initialValue: state.firstName.value,
          onChanged: (firstName) =>
              context.read<UserCreateCubit>().firstNameChanged(firstName),
          decoration: InputDecoration(
            labelText: 'First Name',
            errorText: state.firstName.displayError != null
                ? 'invalid first name'
                : null,
          ),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCreateCubit, UserCreateState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return TextFormField(
          key: const Key('userCreateForm_lastNameInput_textField'),
          initialValue: state.lastName.value,
          onChanged: (lastName) =>
              context.read<UserCreateCubit>().lastNameChanged(lastName),
          decoration: InputDecoration(
            labelText: 'Last Name',
            errorText: state.lastName.displayError != null
                ? 'invalid last name'
                : null,
          ),
        );
      },
    );
  }
}

class _MobileInputButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCreateCubit, UserCreateState>(
      buildWhen: (previous, current) => previous.mobile != current.mobile,
      builder: (context, state) {
        return TextFormField(
          key: const Key('userCreateForm_mobileInput_textField'),
          initialValue: state.mobile.value,
          onChanged: (mobile) =>
              context.read<UserCreateCubit>().mobileChanged(mobile),
          decoration: InputDecoration(
            labelText: 'Mobile',
            errorText:
                state.mobile.displayError != null ? 'invalid mobile' : null,
          ),
        );
      },
    );
  }
}

class _EmailInputButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCreateCubit, UserCreateState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('userCreateForm_emailInput_textField'),
          initialValue: state.email.value,
          onChanged: (email) =>
              context.read<UserCreateCubit>().emailChanged(email),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText:
                state.email.displayError != null ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCreateCubit, UserCreateState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const SizedBox(
                width: 20, height: 20, child: CircularProgressIndicator())
            : ElevatedButton(
                key: const Key('userCreateForm_createButton_elevatedButton'),
                onPressed: state.isValid
                    ? () {
                        context.read<UserCreateCubit>().createUser();
                      }
                    : null,
                child: const Text('Create user'),
              );
      },
    );
  }
}
