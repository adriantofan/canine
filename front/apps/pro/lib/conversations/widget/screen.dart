import 'package:app/conversations/bloc/conversations_bloc.dart';
import 'package:app/conversations/bloc/conversations_state.dart';
import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'conversations_list.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key, required this.child});
  final Widget child;

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  Widget build(BuildContext context) {
    const kListViewWidth = 300.0;
    return SyncSessionContainer(
        child: LayoutBuilder(builder: (context, constraints) {
      return BlocProvider(
        create: (context) => ConversationsBloc(context.read<SyncRepository>())
          ..add(ConversationsInitial()),
        child: BlocConsumer<ConversationsBloc, ConversationsState>(
            listenWhen: (previous, current) =>
                previous.currentSelection != current.currentSelection,
            listener: (context, state) {
              if (state.currentSelection == null) {
                return;
              }
              final conversationInfo =
                  state.conversations[state.currentSelection!.listIndex];
              AppRouter.goConversationWithInfo(conversationInfo);
            },
            builder: (context, state) {
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
                  Expanded(child: widget.child),
                ],
              );
            }),
      );
    }));
  }
}
