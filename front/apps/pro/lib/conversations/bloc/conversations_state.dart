import 'package:app/conversations/bloc/selection.dart';
import 'package:applib/applib.dart';

import '../../util/logger.dart';

final class ConversationsState {
  final List<ConversationInfo> conversations;
  final Selection? currentSelection;

  const ConversationsState(this.conversations, this.currentSelection);
  static empty() => const ConversationsState([], null);

  withConversationId(String conversationId) {
    try {
      final targetConversationId = int.parse(conversationId);
      return replaceSelection(targetConversationId);
    } catch (e) {
      globalLogger.warning(
          'ConversationsState Invalid conversation id: $conversationId');
      return ConversationsState(conversations, null);
    }
  }

  withSelection(ConversationInfo? conversation) {
    if (conversation == null) {
      return ConversationsState(conversations, null);
    }
    final targetConversationId = conversation.conversationId;
    return replaceSelection(targetConversationId);
  }

  ConversationsState replaceSelection(int targetConversationId) {
    final conversationIndex = conversations.indexWhere(
        (element) => element.conversationId == targetConversationId);
    if (conversationIndex == -1) {
      return ConversationsState(conversations, null);
    }
    return ConversationsState(
        conversations,
        Selection(
            listIndex: conversationIndex,
            conversationId: targetConversationId));
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
