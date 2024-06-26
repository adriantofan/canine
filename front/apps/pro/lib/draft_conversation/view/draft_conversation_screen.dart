import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import '../bloc/draft_conversation_cubit.dart';
import '../model/draft_conversation.dart';
import './empty_messages_list.dart';

// See following url for some ideas about improving various mobile functions
// https://github.com/Xim-ya/basic_chat_ui_Implementation/blob/main/lib/chat_screen.dart
class DraftConversationPage extends StatelessWidget {
  final DraftConversation draftConversation;

  DraftConversationPage({required this.draftConversation})
      : super(key: ValueKey(draftConversation.user.id));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return DraftConversationCubit(
            repository: RepositoryProvider.of(context),
            newConversation: draftConversation,
          );
        },
        child: const MessagesWidget());
  }
}

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizes based to include virtual keyboard
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const TitleWidget(),
      ),
      body: BlocConsumer<DraftConversationCubit, DraftConversationState>(
        listener: (BuildContext context, DraftConversationState state) {
          if (state
              case DraftConversationStateCreated(
                :final conversationInfo,
                :final draftMessage,
              )) {
            AppRouter.replaceConversationWithInfo(
                conversationInfo, draftMessage);
          }
        },
        builder: (context, state) {
          switch (state) {
            case DraftConversationStateInitial(
                :final draftConversation,
              ):
              return buildBody(context, draftConversation.message);
            case DraftConversationStateCreated():
              // This is not expected to be reached, but it is here for completeness
              return const Text('...');
          }
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, DraftMessage draftMessage) {
    return EmptyMessagesList(
        sendBar: SendWidget(
            draftMessage, context.read<DraftConversationCubit>().sendMessage));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DraftConversationCubit, DraftConversationState>(
      builder: (context, state) {
        return Text(buildTitle(state));
      },
    );
  }

  String buildTitle(DraftConversationState s) => switch (s) {
        DraftConversationStateInitial(:final draftConversation) =>
          'New with ${draftConversation.user.email}',
        DraftConversationStateCreated(
          :final conversationInfo,
          :final draftMessage,
        ) =>
          'waiting ${conversationInfo.name}',
      };
}
