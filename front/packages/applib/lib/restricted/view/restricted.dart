import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/app.dart';
import '../../private/config.dart';
import 'link_widget.dart';

class RestrictedWidget extends StatelessWidget {
  const RestrictedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restricted'),
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: getRestricted,
      ),
    );
  }

  Widget getRestricted(BuildContext context, AppState state) {
    final workspaceId = context.read<AppBloc>().workspaceId;
    final conversationId = context.read<AppBloc>().conversationId;
    switch (state) {
      case AppStateUnauthenticated():
        return const Center(
          child: Text('Please login to access Clemia'),
        );
      case AppStateAuthenticated():
        if (AppLibConfig.instance.appType == AppType.pro) {
          return const Center(
            child: Text('This workspace is restricted to its personnel only'),
          );
        }
        return showLink(workspaceId, conversationId, state.token);
      case AppStateReady():
        if (AppLibConfig.instance.appType == AppType.pro) {
          return const Center(
            child: Text('This workspace is restricted to its personnel only'),
          );
        }
        return showLink(workspaceId, conversationId, state.token);
    }
  }

  Widget showLink(int? workspaceId, int? conversationId, String token) {
    if (workspaceId == null || conversationId == null) {
      return const Center(
        child: Text(
            'You need to be invited by your doctor to access Clemia. Open the invitation link in your email'),
      );
    }
    return LinkWidget(
        workspaceId: workspaceId, conversationId: conversationId, token: token);
  }
}
