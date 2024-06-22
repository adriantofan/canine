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
        if (state.workspaceId == null || state.conversationId == null) {
          return const Center(
            child: Text(
                'You need to be invited by your doctor to access Clemia. Open the invitation link in your email'),
          );
        }
        return LinkWidget(
            workspaceId: state.workspaceId!,
            conversationId: state.conversationId!,
            token: state.token);
      case AppStateReady():
        if (AppLibConfig.instance.appType == AppType.pro) {
          return const Center(
            child: Text('This workspace is restricted to its personnel only'),
          );
        }
        //TODO: implement this case
        return Center(
          child:
              Text('Grant access to workspace ${state.workspaceId} to switch'),
        );
    }
  }
}
