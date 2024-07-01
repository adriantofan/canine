import 'package:applib/applib.dart';
import 'package:applib/validate/view/verify_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../validate/validate.dart';

class LinkWidget extends StatelessWidget {
  final int workspaceId;
  final int conversationId;
  final String token;
  // TODO: if token changes it will create a new widget, potentially forgetting the old in progress requests
  LinkWidget(
      {required this.workspaceId,
      required this.conversationId,
      required this.token})
      : super(
            key: ValueKey(
                'link-widget-$workspaceId-$conversationId-${token.substring(token.length - 5)}'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LinkBloc(
          context.read<APIClientBase>(), workspaceId, conversationId, token)
        ..add(const LinkEvent.started()),
      child: _LinkWidget(
        token: token,
        workspaceId: workspaceId,
        conversationId: conversationId,
      ),
    );
  }
}

class _LinkWidget extends StatelessWidget {
  final int workspaceId;
  final int conversationId;
  final String token;
  _LinkWidget(
      {required this.workspaceId,
      required this.conversationId,
      required this.token})
      : super(
            key: ValueKey(
                '_link-widget-$workspaceId-$conversationId-${token.substring(token.length - 5)}'));

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LinkBloc, LinkState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('${state.errorMessage}'),
              ),
            );
        }
        if (state.didValidate == false && state.authorization != null) {
          if (state.authorization!.code ==
              EndUserAuthorizationCode.verifyPhone) {
            showDialog(
              context: context,
              builder: (innerContext) => RepositoryProvider.value(
                value: context.read<APIClientBase>(),
                child: Dialog(
                    child: VerifyPhonePage(
                  token: token,
                  sentAt: DateTime.now(),
                  phone: state.authorization!.hint,
                )),
              ),
            ).then((value) => context
                .read<LinkBloc>()
                .add(LinkEvent.didValidate(value is bool ? value : false)));
            // should verify phone
          }
          if (state.authorization!.code == EndUserAuthorizationCode.askPhone) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            showDialog(
              context: context,
              builder: (innerContext) => RepositoryProvider.value(
                value: context.read<APIClientBase>(),
                child: Dialog(
                    child: ConfirmPhonePage(
                  token: token,
                  workspaceId: workspaceId,
                  conversationId: conversationId,
                  phoneHint: state.authorization!.hint,
                )),
              ),
            ).then((value) => context
                .read<LinkBloc>()
                .add(LinkEvent.didValidate(value is bool ? value : false)));
          }
        }
        if (state.didValidate) {
          if (Navigator.of(context).canPop() == true) {
            Navigator.pop(context);
          }
        }
        if (state.authorization?.authorized ?? false) {
          context.read<AppBloc>().add(const AppEvent.refreshAuthorization());
        }
      },
      builder: (BuildContext context, LinkState state) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text("Granting access to your doctor workspace..."),
                const SizedBox(height: 8),
                if (state.authorization != null && state.didValidate == false)
                  switch (state.authorization!.code) {
                    EndUserAuthorizationCode.undefined ||
                    EndUserAuthorizationCode.private ||
                    EndUserAuthorizationCode.alreadyAuthorized ||
                    EndUserAuthorizationCode.doesNotApply ||
                    EndUserAuthorizationCode.alreadyLinked ||
                    EndUserAuthorizationCode.grantedEmail ||
                    EndUserAuthorizationCode.grantedPhone ||
                    EndUserAuthorizationCode.phoneNoMatch ||
                    EndUserAuthorizationCode.emailNoMatch =>
                      Text(authorizationCodeMessages[
                          state.authorization!.code]!),
                    EndUserAuthorizationCode.askPhone ||
                    EndUserAuthorizationCode.verifyPhone =>
                      const CircularProgressIndicator()
                    // TODO: Handle this case.
                  },
                if (state.authorizationCheckStatus ==
                    FormzSubmissionStatus.inProgress)
                  const CircularProgressIndicator(),
                if (state.authorizationCheckStatus ==
                    FormzSubmissionStatus.failure)
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<LinkBloc>()
                          .add(const LinkEvent.authzCheck());
                    },
                    child: const Text('Retry'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const Map<EndUserAuthorizationCode, String> authorizationCodeMessages = {
  EndUserAuthorizationCode.undefined:
      'Please retry later. If the problem persists, contact support.',
  EndUserAuthorizationCode.private: 'This conversation is restricted',
  EndUserAuthorizationCode.alreadyAuthorized: 'Access is granted',
  EndUserAuthorizationCode.doesNotApply:
      'Organization users such as you, already have access to authorized conversations',
  EndUserAuthorizationCode.alreadyLinked: 'Access was already gr  anted',
  EndUserAuthorizationCode.grantedEmail: 'Access granted via verified email',
  EndUserAuthorizationCode.grantedPhone: 'Access granted via verified phone',
  EndUserAuthorizationCode.phoneNoMatch:
      'Your Clemia phone number does not match. Please contact your doctor to update your records.',
  EndUserAuthorizationCode.askPhone: '', // Handled in a dialog
  EndUserAuthorizationCode.verifyPhone: '', // Handled in a dialog
  EndUserAuthorizationCode.emailNoMatch:
      'Your Clemia email does not match. Please contact your doctor to update your records.',
};
