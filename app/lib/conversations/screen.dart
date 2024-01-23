import 'package:app/conversations/conversation_row_widget.dart';
import 'package:app/state/ws.dart';
import 'package:flutter/material.dart';

import '../state/data.dart';
import 'chat_widget.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  final _selection = ValueNotifier<Conversation?>(null);
  @override
  Widget build(BuildContext context) {
    const kListViewWidth = 300.0;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: kListViewWidth,
              child: buildListView((conversation) {
                _selection.value = conversation;
              }),
            ),
            const VerticalDivider(
              width: 0,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _selection,
                builder: (context, conversation, child) {
                  if (conversation == null) {
                    return Scaffold(
                      appBar: AppBar(),
                      body: const Center(
                        child: Text('Select a conversation'),
                      ),
                    );
                  }
                  return Container(
                    child: ChatWidget(conversation),
                  );
                },
              ),
            ),
          ],
        );
      }
      // TODO: when changing layout, we should preserve the selection
      //  one solution might be in go_router ShellRoute
      //  https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
      return buildListView((selectedConversation) {
        _selection.value = selectedConversation;
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ChatWidget(selectedConversation);
        }));
      });
    });
  }

  Widget buildListView(ValueChanged<Conversation> onSelected) {
    return ValueListenableBuilder(
        valueListenable: _selection,
        builder: (context, conversation, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                const SizedBox(height: 8),
                ...List.generate(conversationList.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ConversationRowWidget(
                        conversation: conversationList[index],
                        conversationInfo: _makeConversationInfo(
                            conversationList[index], _selection.value),
                        isSelected:
                            _selection.value?.id == conversationList[index].id,
                        onSelected: () => onSelected(conversationList[index]),
                      ));
                }),
              ],
            ),
          );
        });
  }
}

ConversationInfo _makeConversationInfo(
    Conversation conversation, Conversation? selectedConversation) {
  return ConversationInfo(
    name: "John Doe",
    lastMessageTime: DateTime.now(),
    lastMessage: "lorem ipsum dolor sit amet consectetur adipiscing elit",
  );
}
