import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/conversation_loader_cubit.dart';

class ConversationLoaderPage extends StatelessWidget {
  final int workspaceId;

  ConversationLoaderPage({required this.workspaceId})
      : super(key: ValueKey('conversation-loader-page-$workspaceId'));

  @override
  Widget build(BuildContext context) {
    return SyncSessionContainer(
        child: ConversationLoader(workspaceId: workspaceId));
  }
}

class ConversationLoader extends StatelessWidget {
  final int workspaceId;

  ConversationLoader({required this.workspaceId})
      : super(key: ValueKey('conversation-loader-$workspaceId'));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ConversationLoaderCubit(
              workspaceId: workspaceId,
              syncRepository: context.read<SyncRepository>(),
            ),
        child: const ConversationLoaderWidget());
  }
}

class ConversationLoaderWidget extends StatelessWidget {
  const ConversationLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConversationLoaderCubit, ConversationLoaderState>(
      listener: (context, state) {},
      builder: (context, state) {
        final conversationInfo = state.conversationInfo;
        if (conversationInfo == null) {
          return const Center(
              child: Text('Waiting for messages from your doctor...'));
        }
        return MessagesPage(conversationInfo: conversationInfo);
      },
    );
  }
}
