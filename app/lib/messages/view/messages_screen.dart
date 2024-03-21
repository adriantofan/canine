import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/messages_screen_cubit.dart';
import '../model/conversation_container.dart';
import 'empty_messages_list.dart';
import 'messages_list.dart';
import 'send_widget.dart';

// See following url for some ideas about improving various mobile functions
// https://github.com/Xim-ya/basic_chat_ui_Implementation/blob/main/lib/chat_screen.dart
class MessagesPage extends StatelessWidget {
  final ConversationContainer _conversationContainer;

  MessagesPage(this._conversationContainer)
      : super(key: ValueKey(_conversationContainer));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return MessagesScreenCubit(
            repository: RepositoryProvider.of(context),
            conversationContainer: _conversationContainer,
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
      body: BlocBuilder<MessagesScreenCubit, MessagesScreenState>(
        builder: (context, state) {
          return buildBody(context, state.conversationContainer);
        },
      ),
    );
  }

  Widget buildBody(
      BuildContext context, ConversationContainer conversationContainer) {
    return conversationContainer.when(
      withConversation: (conversationInfo) =>
          MessagesList(conversationInfo, const SendWidget()),
      withUser: (user) => const EmptyMessagesList(sendBar: SendWidget()),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesScreenCubit, MessagesScreenState>(
      builder: (context, state) {
        return Text(buildTitle(state.conversationContainer));
      },
    );
  }

  String buildTitle(ConversationContainer conversationContainer) =>
      switch (conversationContainer) {
        ConversationContainerWithConversation() =>
          'Messages ${conversationContainer.conversationInfo.conversationId}',
        ConversationContainerWithUser() =>
          'New with ${conversationContainer.user.messagingAddress}',
      };
}
