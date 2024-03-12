import 'package:app/conversations/bloc/selection.dart';
import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/repository/repository.dart';

final class ConversationsState {
  final List<ConversationInfo> conversations;
  final Selection? currentSelection;

  const ConversationsState(this.conversations, this.currentSelection);
  static empty() => const ConversationsState([], null);

  withSelection(ConversationInfo conversation) {
    final conversationIndex = conversations.indexWhere(
        (element) => element.conversationId == conversation.conversationId);
    if (conversationIndex == -1) {
      print(
          'Conversation not found in list - FIXME'); // FIXME: should not happen
      return ConversationsState(conversations, null);
    }
    return ConversationsState(
        conversations,
        Selection(
            listIndex: conversationIndex,
            conversationId: conversation.conversationId));
  }

  withChanges(List<ConversationInfo> items, SyncRepository repository) {
    Selection? newSelection = currentSelection;
    if (currentSelection != null) {
      final conversationIndex = items.indexWhere((element) =>
          element.conversationId == currentSelection!.conversationId);

      newSelection = conversationIndex != -1
          ? Selection(
              listIndex: conversationIndex,
              conversationId: items[conversationIndex].conversationId)
          : null; // FIXME: would be weird to end up on messages on a deleted conversation
    }
    return ConversationsState(items, newSelection);
  }
}
