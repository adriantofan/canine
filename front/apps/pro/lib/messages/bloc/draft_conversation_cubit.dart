import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/messages/model/draft_conversation.dart';
import 'package:app/messages/model/draft_message.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'draft_conversation_cubit.freezed.dart';
part 'draft_conversation_state.dart';

class DraftConversationCubit extends Cubit<DraftConversationState> {
  final SyncRepository repository;

  DraftConversationCubit(
      {required this.repository, required DraftConversation newConversation})
      : super(DraftConversationState.initial(newConversation));

  Future<void> sendMessage(DraftMessage msg) async {
    if (state case DraftConversationStateInitial(:final draftConversation)) {
      emit(DraftConversationState.initial(
          draftConversation.copyWith(message: msg)));

      final conversation = await repository.createConversation(
          recipientMessagingAddress: draftConversation.user.email);
      final conversationInfo = ConversationInfo(
          conversationId: conversation.id,
          name: draftConversation.user.email,
          userId: draftConversation.user.id,
          lastMessageTime: DateTime.now(),
          lastMessage: msg.text ?? '');
      emit(DraftConversationState.created(msg, conversationInfo));
    }
  }
}
