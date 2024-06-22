import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../repository/repository.dart';
import '../cubit/confirm_phone_cubit.dart';

class ConfirmPhonePage extends StatelessWidget {
  final String phoneHint;
  final String token;
  final int workspaceId, conversationId;

  ConfirmPhonePage({
    required this.token,
    required this.workspaceId,
    required this.conversationId,
    required this.phoneHint,
  }) : super(key: ValueKey('confirm-phone $phoneHint'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Phone'),
      ),
      body: BlocProvider(
        create: (context) => ConfirmPhoneCubit(
          apiClient: context.read<APIClientBase>(),
          token: token,
          workspaceId: workspaceId,
          conversationId: conversationId,
          phoneHint: phoneHint,
        ),
        child: ConfirmPhoneWidget(phoneHint: phoneHint),
      ),
    );
  }
}

class ConfirmPhoneWidget extends StatelessWidget {
  const ConfirmPhoneWidget({
    super.key,
    required this.phoneHint,
  });

  final String phoneHint;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmPhoneCubit, ConfirmPhoneState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop(true);
        }

        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('${state.errorMessage}'),
              ),
            );
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(children: [
            const Text(
                'Clemia needs to verify that you own the phone number registered with your doctor.'),
            const SizedBox(height: 8),
            Text(phoneHint),
            const SizedBox(height: 8),
            const Text(
                'First, please enter your matching mobile number to add to your Clemia account:'),
            const SizedBox(height: 8),
            const SizedBox(height: 8),
            _PhoneInput(),
            const SizedBox(height: 8),
            _ConfirmPhoneButton(),
          ]),
        );
      },
    );
  }
}
// @Default(FrenchMobile.pure()) FrenchMobile mobile,

class _PhoneInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmPhoneCubit, ConfirmPhoneState>(
      buildWhen: (previous, current) =>
          previous.mobile != current.mobile ||
          previous.status != current.status,
      builder: (context, state) {
        return TextFormField(
          key: const Key('createForm_mobileInput_textField'),
          onChanged: (phone) =>
              context.read<ConfirmPhoneCubit>().mobileChanged(phone),
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

class _ConfirmPhoneButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmPhoneCubit, ConfirmPhoneState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('confirmForm_confirm_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.isValid
                    ? () => context.read<ConfirmPhoneCubit>().updateMobile()
                    : null,
                child: const Text('CONFIRM PHONE'),
              );
      },
    );
  }
}
