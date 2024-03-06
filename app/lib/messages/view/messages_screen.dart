import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/messages/bloc/messages_bloc.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'messages_list.dart';

// See following url for some ideas about improving various mobile functions
// https://github.com/Xim-ya/basic_chat_ui_Implementation/blob/main/lib/chat_screen.dart
class MessagesPage extends StatelessWidget {
  final ConversationInfo _conversationInfo;

  static MaterialPageRoute<void> page(ConversationInfo c) =>
      MaterialPageRoute(builder: (_) => MessagesPage(c));

  const MessagesPage(this._conversationInfo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizes based to include virtual keyboard
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Messages ${_conversationInfo.conversationId}'),
        ),
        body: BlocProvider(
          create: (context) =>
              MessagesBloc(context.read<SyncRepository>(), _conversationInfo)
                ..add(const MessagesEvent.started()),
          child: const MessagesList(),
        ));
  }
}
