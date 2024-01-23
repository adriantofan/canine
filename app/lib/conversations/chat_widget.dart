import 'package:app/state/ws.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final Conversation conversation;

  ChatWidget(this.conversation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
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
