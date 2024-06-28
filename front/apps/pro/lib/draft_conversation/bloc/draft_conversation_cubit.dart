import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/draft_conversation.dart';

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
          userId: draftConversation.user.id);
      final conversationInfo = ConversationInfo(
          conversationId: conversation.id,
          workspaceId: conversation.workspaceId,
          name: draftConversation.user.email,
          userId: draftConversation.user.id,
          lastMessageTime: DateTime.now(),
          lastMessage: msg.text ?? '');
      emit(DraftConversationState.created(msg, conversationInfo));
    }
  }
}
