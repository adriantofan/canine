import 'package:app/messages/model/draft_message.dart';
import 'package:flutter/material.dart';

import '../../conversations/model/conversation_info.dart';
import 'messages_list.dart';
import 'send_widget.dart';

// See following url for some ideas about improving various mobile functions
// https://github.com/Xim-ya/basic_chat_ui_Implementation/blob/main/lib/chat_screen.dart
class MessagesPage extends StatelessWidget {
  final DraftMessage? draftMessage;
  final ConversationInfo conversationInfo;

  MessagesPage({required this.conversationInfo, this.draftMessage})
      : super(key: ValueKey(draftMessage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizes based to include virtual keyboard
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(conversationInfo.name),
      ),
      body: MessagesList(conversationInfo, SendWidget(draftMessage)),
    );
  }
}
