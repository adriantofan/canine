import 'package:app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../cubit/org_create_cubit.dart';

class CreateForm extends StatelessWidget {
  const CreateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrgCreateCubit, OrgCreateState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
          return;
        }
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Workspace created. Please login'),
              ),
            );
          Future.delayed(const Duration(seconds: 0), () {
            AppRouter.goLogin(loginHint: state.email.value);
          });
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
              const SizedBox(height: 8),
              _OrgNameInput(),
              const SizedBox(height: 8),
              _EmailInput(),
              const SizedBox(height: 8),
              _PhoneInput(),
              const SizedBox(height: 8),
              _FirstNameInput(),
              const SizedBox(height: 8),
              _LastNameInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _ConfirmPasswordInput(),
              const SizedBox(height: 8),
              _CreateOrgButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrgNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.orgName != current.orgName ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_orgName_textField'),
          onChanged: (orgName) =>
              context.read<OrgCreateCubit>().orgNameChanged(orgName),
          keyboardType: TextInputType.name,
          readOnly: state.status.isInProgress,
          initialValue: state.orgName.value,
          decoration: InputDecoration(
              labelText: 'organisation name',
              helperText: '',
              errorText: state.orgName.displayError),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.email != current.email || previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_emailInput_textField'),
          onChanged: (email) =>
              context.read<OrgCreateCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          initialValue: state.email.value,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText: state.email.displayError,
          ),
        );
      },
    );
  }
}

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.mobile != current.mobile ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_mobileInput_textField'),
          onChanged: (phone) =>
              context.read<OrgCreateCubit>().mobileChanged(phone),
          keyboardType: TextInputType.phone,
          initialValue: state.mobile.value,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
              labelText: 'mobile',
              helperText: '',
              errorText: state.mobile.displayError),
        );
      },
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.firstName != current.firstName ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_firstNameInput_textField'),
          onChanged: (firstName) =>
              context.read<OrgCreateCubit>().firstNameChanged(firstName),
          keyboardType: TextInputType.name,
          initialValue: state.firstName.value,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
            labelText: 'first name',
            helperText: '',
            errorText: state.firstName.displayError,
          ),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.lastName != current.lastName ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_lastNameInput_textField'),
          onChanged: (lastName) =>
              context.read<OrgCreateCubit>().lastNameChanged(lastName),
          keyboardType: TextInputType.name,
          initialValue: state.lastName.value,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
            labelText: 'last name',
            helperText: '',
            errorText: state.lastName.displayError,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<OrgCreateCubit>().passwordChanged(password),
          initialValue: state.password.value,
          obscureText: true,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText: state.password.displayError,
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      buildWhen: (previous, current) =>
          previous.confirmedPassword != current.confirmedPassword ||
          previous.password != current.password ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_confirmPasswordInput_textField'),
          onChanged: (confirmPassword) => context
              .read<OrgCreateCubit>()
              .confirmPasswordChanged(confirmPassword),
          initialValue: state.confirmedPassword.value,
          obscureText: true,
          readOnly: state.status.isInProgress,
          decoration: InputDecoration(
            labelText: 'confirm password',
            helperText: '',
            errorText: state.confirmedPassword.displayError != null
                ? 'passwords do not match'
                : null,
          ),
        );
      },
    );
  }
}

class _CreateOrgButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCreateCubit, OrgCreateState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('createOrgForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.isValid
                    ? () => context.read<OrgCreateCubit>().createOrg()
                    : null,
                child: const Text('CREATE ACCOUNT'),
              );
      },
    );
  }
}
