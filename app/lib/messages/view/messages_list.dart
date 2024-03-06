import 'package:app/messages/bloc/messages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'message_row.dart';
import 'send_field.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GestureDetector(
                onTap: () {
                  print('column tapped -> unfocuss');
                },
                child: Align(
                  alignment: Alignment.topCenter,
                  child: BlocConsumer<MessagesBloc, MessagesState>(
                    listener: (_, __) {},
                    builder: (context, state) {
                      return ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.only(top: 12, bottom: 20) +
                              const EdgeInsets.symmetric(horizontal: 12),
                          itemBuilder: (_, k) =>
                              MessageRow(chatMessage: state.messages[k]),
                          separatorBuilder: (_, __) => const SizedBox(
                                height: 0,
                              ),
                          itemCount: state.messages.length);
                    },
                  ),
                ))),
        const SendField(),
      ],
    );
  }
}
