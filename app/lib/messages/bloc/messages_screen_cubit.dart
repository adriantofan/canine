import 'package:app/messages/model/new_message.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';
import '../model/conversation_container.dart';

part 'messages_screen_cubit.freezed.dart';
part 'messages_screen_state.dart';

class MessagesScreenCubit extends Cubit<MessagesScreenState> {
  final SyncRepository repository;

  MessagesScreenCubit(
      {required this.repository,
      required ConversationContainer conversationContainer})
      : super(MessagesScreenState.initial(
            conversationContainer: conversationContainer));

  Future<void> sendMessage(NewMessage msg) async {
    if (state.conversationContainer
        case ConversationContainerWithConversation(:final conversationInfo)) {
      await repository.createMessage(
          conversationInfo.conversationId, msg.text, msg.idempotencyId);
    }
  }
}
