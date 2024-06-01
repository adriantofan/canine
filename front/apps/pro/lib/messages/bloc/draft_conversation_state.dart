part of 'draft_conversation_cubit.dart';

@freezed
sealed class DraftConversationState with _$DraftConversationState {
  factory DraftConversationState.initial(DraftConversation draftConversation) =
      DraftConversationStateInitial;
  factory DraftConversationState.created(
          DraftMessage draftMessage, ConversationInfo conversationInfo) =
      DraftConversationStateCreated;
}
