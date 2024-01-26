import 'package:app/conversations/model/conversation_info.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final ConversationInfo conversation;

  ChatWidget(this.conversation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages ${conversation.conversationId}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => Container(),
        itemCount: 10,
      ),
    );
  }
}
