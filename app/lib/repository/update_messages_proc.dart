import 'package:app/messages/messages.dart';
import 'package:app/messages/model/chat_message.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:logging/logging.dart';

class UpdateMessagesProcRef implements ProcBuilder<List<ChatMessage>> {
  final int _conversationId;

  const UpdateMessagesProcRef(this._conversationId);

  @override
  Proc<List<ChatMessage>> build() {
    return UpdateMessagesProc(_conversationId);
  }
}

class UpdateMessagesProc implements Proc<List<ChatMessage>> {
  final _log = Logger('UpdateMessagesProc');
  final int _conversationId;

  UpdateMessagesProc(this._conversationId);

  @override
  List<ChatMessage>? init(Cache cache) {
    return _prev = bootstrap(cache);
  }

  @override
  List<ChatMessage>? update(Update changes, Cache cache) {
    if (_prev == null) {
      return _prev = bootstrap(cache);
    }
    switch (changes) {
      case MessagesUpdate():
        return _prev = _handleMessagesUpdate(changes, cache);
      case UsersUpdate():
        _log.warning(
            "UpdateMessagesProc.update UsersUpdate: 🟡UNIMPLEMENTED $changes");
        return _prev = _prev!;
      case ConversationsUpdate():
    }

    _log.warning("UpdateMessagesProc.update: 🟡UNIMPLEMENTED $changes");
    return null;
  }

  List<ChatMessage> _handleMessagesUpdate(MessagesUpdate changes, Cache cache) {
    final messages = cache.getConversationMessages(_conversationId);
    _log.warning(
        "UpdateMessagesProc._handleMessagesUpdate: 🟡handle messages update efficiently $changes");
    final conversationItems = messages
        .map((c) => makeChatMessage(c, cache))
        .nonNulls
        .toList()
      ..sort(ChatMessage.compareByTimeThenId);
    return conversationItems;
  }

  List<ChatMessage>? _prev;

  // List<ChatMessage> updateConversationInfo(
  //     Update changes, Cache cache) {
  //   switch (changes) {
  //     case ConversationsUpdate conversationsUpdate:
  //       return _prev =
  //           conversationUpdate(_prev!.items, conversationsUpdate, cache);
  //     case MessagesUpdate messagesUpdate:
  //       return _prev = messageUpdate(_prev!.items, messagesUpdate, cache);
  //     case UsersUpdate():
  //       return _prev = ListChange([], [], [], _prev!.items);
  //     // TODO: Handle this case.
  //   }
  // }

  List<ChatMessage> bootstrap(Cache cache) {
    final messages = cache.getConversationMessages(_conversationId);
    final conversationItems = messages
        .map((c) => makeChatMessage(c, cache))
        .nonNulls
        .toList()
      ..sort(ChatMessage.compareByTimeThenId);
    return conversationItems;
  }
}

ChatMessage? makeChatMessage(Message message, Cache cache) {
  // TODO: can have conversation without messages ? at sync start, depends on implementation
  final user = cache.getUser(message.senderId)!;

  return ChatMessage(
      id: message.id,
      name: user.messagingAddress,
      type: message.type,
      message: message.message,
      time: message.createdAt,
      userId: user.id);
}

// ListChange<ConversationInfo, int> userUpdate(
//     List<ConversationInfo> prev, UsersUpdate update, Cache cache) {
//   // determine which conversations have changed and update accordingly
//   final changedUserIds = Set.from(update.items.updatedItems);
//   List<int> changedConversationIDs = [];
//   for (var i = 0; i < prev.length; i++) {
//     if (changedUserIds.contains(prev[i].userId)) {
//       final newConversationItem =
//           conversationItemBuilder(cache)(prev[i].conversationId);
//       if (newConversationItem == null) {
//         print(
//             "userUpdate: conversationItemBuilder returned null for conversationId ${prev[i].conversationId}");
//         continue;
//       }
//       prev[i] = newConversationItem;
//       changedConversationIDs.add(prev[i].conversationId);
//     }
//   }
//   return ListChange([], [], changedConversationIDs, prev);
// }
//
// ListChange<ConversationInfo, int> messageUpdate(
//     List<ConversationInfo> prev, MessagesUpdate update, Cache cache) {
//   final conversationIDs =
//       update.change.items.map((e) => e.conversationID).toList();
//   return conversationUpdate(prev,
//       ConversationsUpdate(ListChange([], [], conversationIDs, [])), cache);
// }
//
// ListChange<ConversationInfo, int> conversationUpdate(
//     List<ConversationInfo> prev, ConversationsUpdate update, Cache cache) {
//   var addedOrUpdated = [
//     ...update.changes.addedItems,
//     ...update.changes.updatedItems
//   ].map(conversationItemBuilder(cache)).nonNulls.toList()
//     ..sort(ConversationInfo.compareByLastMessageTime);
//
//   var deletedIDs = Set.from(update.changes.removedItems);
//   var changedIDs = Set.from(update.changes.updatedItems);
//
//   List<ConversationInfo> items = [];
//   var i = 0, j = 0;
//
//   while (i < prev.length && j < addedOrUpdated.length) {
//     if (deletedIDs.contains(prev[i].conversationId) ||
//         changedIDs.contains(prev[i].conversationId)) {
//       i++;
//       continue;
//     }
//
//     var cmp =
//         ConversationInfo.compareByLastMessageTime(prev[i], addedOrUpdated[j]);
//     if (cmp < 0) {
//       items.add(prev[i]);
//       i++;
//     } else if (cmp > 0) {
//       items.add(addedOrUpdated[j]);
//       j++;
//     } else {
//       items.add(addedOrUpdated[j]);
//       i++;
//       j++;
//     }
//   }
//   while (i < prev.length) {
//     if (deletedIDs.contains(prev[i].conversationId) ||
//         changedIDs.contains(prev[i].conversationId)) {
//       i++;
//       continue;
//     }
//     items.add(prev[i]);
//     i++;
//   }
//   while (j < addedOrUpdated.length) {
//     items.add(addedOrUpdated[j]);
//     j++;
//   }
//
//   return ListChange(update.changes.addedItems, update.changes.removedItems,
//       update.changes.updatedItems, items);
// }
//
// ConversationInfo? Function(int) conversationItemBuilder(Cache cache) =>
//     (int conversationId) => makeConversationItem(conversationId, cache);
//
