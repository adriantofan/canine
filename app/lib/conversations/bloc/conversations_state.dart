import 'package:app/conversations/bloc/selection.dart';
import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/repository.dart';

final class ConversationsState {
  final List<ConversationInfo> conversations;
  final Selection? currentSelection;

  const ConversationsState(this.conversations, this.currentSelection);

  static fromRepository(SyncRepository repository) {
    List<ConversationInfo> items = loadConversationItems(repository);
    return ConversationsState(items, null);
  }

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

  withUpdate(Update update, SyncRepository repository) {
    switch (update) {
      case UsersUpdate(): // FIXME: should not rebuild the list, could just map and update concerned user
      case MessagesUpdate():
      case ConversationsUpdate():
        // FIXME: could keep a update count on the repo and only rebuild if it changed
        // to avoid rebuilding on consecutive updates that don't change anything
        List<ConversationInfo> items = loadConversationItems(repository);

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
      default:
        return this;
    }
  }

  static List<ConversationInfo> loadConversationItems(
      SyncRepository repository) {
    final items = repository.getConversations().map((item) {
      final user = repository
          .getUser(item.externalUserId)!; // FIXME assumes consistent db
      final lastMessage =
          repository.getLastMessage(item.id)!; // FIXME assumes consistent db

      var dt =
          DateTime.fromMillisecondsSinceEpoch(lastMessage.createdAt * 1000);

      return ConversationInfo(
        conversationId: item.id,
        name: user.messagingAddress,
        lastMessage: lastMessage.message,
        lastMessageTime: dt,
      );
    }).toList()
      ..sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
    return items;
  }
}
