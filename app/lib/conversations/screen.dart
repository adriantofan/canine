import 'package:app/bloc/current_conversation_cubit.dart';
import 'package:app/conversations/conversation_row_widget.dart';
import 'package:app/state/ws.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/data.dart';
import 'chat_widget.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const kListViewWidth = 300.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocConsumer<CurrentConversationCubit, Conversation?>(
            listener: (context, state) {
          if (state == null || constraints.maxWidth > 600) {
            return;
          }
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return ChatWidget(state);
          }));
        }, builder: (context, state) {
          if (constraints.maxWidth > 600) {
            return Row(
              children: <Widget>[
                SizedBox(
                  width: kListViewWidth,
                  child: buildListView((conversation) {
                    context
                        .read<CurrentConversationCubit>()
                        .selectConversation(conversation);
                  }, state),
                ),
                const VerticalDivider(
                  width: 0,
                ),
                Expanded(
                    child: (state == null)
                        ? Scaffold(
                            appBar: AppBar(),
                            body: const Center(
                              child: Text('Select a conversation'),
                            ),
                          )
                        : Container(
                            child: ChatWidget(state),
                          )),
              ],
            );
          }
          // TODO: when changing layout, we should preserve the selection
          //  one solution might be in go_router ShellRoute
          //  https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
          return buildListView((selectedConversation) {
            context
                .read<CurrentConversationCubit>()
                .selectConversation(selectedConversation);
          }, state);
        });
      },
    );
  }

  Widget buildListView(ValueChanged<Conversation> onSelected,
      Conversation? selectedConversation) {
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
                      conversationList[index], selectedConversation),
                  isSelected:
                      selectedConversation?.id == conversationList[index].id,
                  onSelected: () => onSelected(conversationList[index]),
                ));
          }),
        ],
      ),
    );
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
