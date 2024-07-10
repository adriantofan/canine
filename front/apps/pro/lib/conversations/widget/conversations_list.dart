import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/conversations_bloc.dart';
import '../bloc/conversations_state.dart';
import 'conversation_row_widget.dart';

class ConversationList extends StatelessWidget {
  final int? selectedConversationId;

  const ConversationList(this.selectedConversationId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<ConversationsBloc, ConversationsState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: state.conversations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ConversationRowWidget(
                            conversationID:
                                state.conversations[index].conversationId,
                            conversationInfo: state.conversations[index],
                            isSelected: selectedConversationId ==
                                state.conversations[index].conversationId,
                            onSelected: () {
                              final bloc = context.read<ConversationsBloc>();
                              bloc.add(ConversationsEvent.select(
                                  bloc.state.conversations[index]));
                            }));
                  },
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, ConversationsState state) {},
      ),
    );
  }
}
