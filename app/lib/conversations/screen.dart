import 'package:app/conversations/bloc/conversations_bloc.dart';
import 'package:app/conversations/bloc/conversations_state.dart';
import 'package:app/conversations/conversation_row_widget.dart';
import 'package:app/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../fake_data.dart';
import 'chat_widget.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const kListViewWidth = 300.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocProvider(
          create: (context) => ConversationsBloc(context.read<SyncRepository>())
            ..add(ConversationsInitial()),
          child: BlocConsumer<ConversationsBloc, ConversationsState>(
              listenWhen: (previous, current) =>
                  previous.currentSelection != current.currentSelection,
              listener: (context, state) {
                if (state.currentSelection == null ||
                    constraints.maxWidth > 600) {
                  return;
                }

                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return ChatWidget(
                      state.conversations[state.currentSelection!.listIndex]);
                }));
              },
              builder: (context, state) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    children: <Widget>[
                      SizedBox(
                        width: kListViewWidth,
                        child: ConversationList(
                            state.currentSelection?.conversationId),
                      ),
                      const VerticalDivider(
                        width: 0,
                      ),
                      Expanded(
                          child: (state.currentSelection == null)
                              ? Scaffold(
                                  appBar: AppBar(),
                                  body: const Center(
                                    child: Text('Select a conversation'),
                                  ),
                                )
                              : ChatWidget(state.conversations[
                                  state.currentSelection!.listIndex])),
                    ],
                  );
                }
                // TODO: when changing layout, we should preserve the selection
                //  one solution might be in go_router ShellRoute
                //  https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
                return ConversationList(state.currentSelection?.conversationId);
              }),
        );
      },
    );
  }
}

class ConversationList extends StatelessWidget {
  final int? selectedConversationId;

  ConversationList(this.selectedConversationId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<ConversationsBloc, ConversationsState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.conversations.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ConversationRowWidget(
                      conversationID: state.conversations[index].conversationId,
                      conversationInfo: state.conversations[index],
                      isSelected: selectedConversationId ==
                          fakeConversationList[index].id,
                      onSelected: () {
                        final bloc = context.read<ConversationsBloc>();
                        bloc.add(ConversationsSelect(
                            bloc.state.conversations[index]));
                      }));
            },
          );
        },
        listener: (BuildContext context, ConversationsState state) {},
      ),
    );
  }
}
