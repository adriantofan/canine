import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../repository/repository.dart';
import '../cubit/verify_phone_cubit.dart';

class VerifyPhonePage extends StatelessWidget {
  final DateTime sentAt;
  final String token;
  final String phone;
  VerifyPhonePage({
    required this.sentAt,
    required this.token,
    required this.phone,
  }) : super(
            key: ValueKey('verify-phone-${token.substring(token.length - 5)}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone'),
      ),
      body: BlocProvider(
        create: (context) => VerifyPhoneCubit(
          apiClient: context.read<APIClientBase>(),
          token: token,
          sentAt: DateTime.now(),
        ),
        child: VerifyPhoneWidget(
          phone: phone,
        ),
      ),
    );
  }
}

class VerifyPhoneWidget extends StatelessWidget {
  final String phone;
  VerifyPhoneWidget({required this.phone})
      : super(key: ValueKey('verify-phone-$phone'));
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
      listener: (context, state) {
        if (state.sendStatus.isSuccess) {
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
        return Column(
          children: [
            const Text(
              'Enter the code sent to your phone',
            ),
            const SizedBox(height: 8),
            Text(phone),
            const SizedBox(height: 8),
            _CodeInput(),
            const SizedBox(height: 8),
            _VerifyButton(),
            if (!state.sendStatus.isInProgressOrSuccess) ...[
              const SizedBox(height: 8),
              Text('Resend code every ${resendDelay.inSeconds} seconds'),
              _ResendCode(),
            ]
          ],
        );
      },
    );
  }
}

class _CodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyPhoneCubit, VerifyPhoneState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<VerifyPhoneCubit>().codeChanged(value);
          },
          readOnly: state.sendStatus.isInProgress,
          decoration: InputDecoration(
            labelText: 'Code',
            errorText: state.code.isPure
                ? null
                : state.code.isValid
                    ? null
                    : 'Incomplete code',
          ),
        );
      },
    );
  }
}

class _VerifyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyPhoneCubit, VerifyPhoneState>(
      builder: (context, state) {
        return state.sendStatus.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('verify_form_verify_button'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.isValid
                    ? () => context.read<VerifyPhoneCubit>().verify()
                    : null,
                child: const Text('VERIFY PHONE'),
              );
      },
    );
  }
}

class _ResendCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyPhoneCubit, VerifyPhoneState>(
      builder: (context, state) {
        return state.resendCodeStatus.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('verify_form_resend_button'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFFFD600),
                ),
                onPressed: state.canResend
                    ? () => context.read<VerifyPhoneCubit>().resend()
                    : null,
                child: const Text('RESEND CODE'),
              );
      },
    );
  }
}
