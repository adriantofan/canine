import 'package:canine_sync/canine_sync.dart';
import 'package:logging/logging.dart';

import '../conversations/model/conversation_info.dart';

class UpdateConversationsProcRef
    implements ProcBuilder<List<ConversationInfo>> {
  @override
  Proc<List<ConversationInfo>> build() {
    return UpdateConversationsProc();
  }
}

class UpdateConversationsProc extends Proc<List<ConversationInfo>> {
  final _log = Logger('UpdateConversationsProc');

  @override
  List<ConversationInfo>? init(Cache cache) {
    return _prev = bootstrap(cache);
  }

  @override
  List<ConversationInfo>? update(Update changes, Cache cache) {
    if (_prev == null) {
      return _prev = bootstrap(cache);
    }
    switch (changes) {
      case UpdateMessagesAdded():
        // TODO: maybe deal with empty conversations ? (should not exist in principle)
        return null;
      case UpdateServer():
        final message = changes.message;
        switch (message) {
          case APIServerUpdateInvalid():
          case APIServerUpdateUsers():
            _log.warning(
                "UpdateConversationsProc.handleUpdateServer: 🟡UNIMPLEMENTED $message");
            return null;
          case APIServerUpdateConversation():
            return _prev =
                _handleServerUpdateConversation(_prev!, message, cache);
          case APIServerUpdateMessage():
            // new message added
            return _prev = _handleServerUpdateMessage(_prev!, message, cache);
        }
    }
  }

  List<ConversationInfo> _handleServerUpdateConversation(
      List<ConversationInfo> prev,
      APIServerUpdateConversation message,
      Cache cache) {
    final conversationId = message.data.id;
    final conversationItem = conversationItemBuilder(cache)(conversationId);
    if (conversationItem == null) {
      return prev;
    }
    final index = prev.indexWhere((c) => c.conversationId == conversationId);
    if (index == -1) {
      prev.add(conversationItem);
    } else {
      prev[index] = conversationItem;
    }
    prev.sort(ConversationInfo.compareByLastMessageTime);
    return prev;
  }

  List<ConversationInfo> _handleServerUpdateMessage(List<ConversationInfo> prev,
      APIServerUpdateMessage message, Cache cache) {
    final conversationId = message.data.conversationId;
    final conversationItem = conversationItemBuilder(cache)(conversationId);
    if (conversationItem == null) {
      return prev;
    }
    final index = prev.indexWhere((c) => c.conversationId == conversationId);
    if (index == -1) {
      // new conversation <- should not happen, new conversations should be added by the server before
      // a message is added to it
      _log.warning(
          "UpdateConversationsProc._handleServerUpdateMessage: conversation not found for message $message. "
          "Server should have added the conversation before adding a message to it.");
      prev.add(conversationItem);
    } else {
      prev[index] = conversationItem;
    }
    prev.sort(ConversationInfo.compareByLastMessageTime);
    return prev;
  }

  List<ConversationInfo>? _prev;

  // List<ConversationInfo> updateConversationInfo(
  //     Update changes, Cache cache) {
  //   switch (changes) {
  //     case ConversationsUpdate conversationsUpdate:
  //       return _prev =
  //           conversationUpdate(_prev!.items, conversationsUpdate, cache);
  //     case MessagesUpdate messagesUpdate:
  //       return _prev = messageUpdate(_prev!.items, messagesUpdate, cache);
  //     case UsersUpdate():
  //       return _prev = List(_prev!.items);
  //     // TODO: Handle this case.
  //   }
  // }

  List<ConversationInfo> bootstrap(Cache cache) {
    final conversations = cache.conversations;
    final conversationItems = conversations
        .map((c) => makeConversationItem(c.id, cache))
        .nonNulls
        .toList()
      ..sort(ConversationInfo.compareByLastMessageTime);
    return conversationItems;
  }
}

// List<ConversationInfo> userUpdate(
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
//   return List([], [], changedConversationIDs, prev);
// }
//
// List<ConversationInfo> messageUpdate(
//     List<ConversationInfo> prev, MessagesUpdate update, Cache cache) {
//   final conversationIDs =
//       update.change.items.map((e) => e.conversationID).toList();
//   return conversationUpdate(prev,
//       ConversationsUpdate(List([], [], conversationIDs, [])), cache);
// }
//
// List<ConversationInfo> conversationUpdate(
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
//   return List(update.changes.addedItems, update.changes.removedItems,
//       update.changes.updatedItems, items);
// }

ConversationInfo? Function(int) conversationItemBuilder(Cache cache) =>
    (int conversationId) => makeConversationItem(conversationId, cache);

ConversationInfo? makeConversationItem(int conversationId, Cache cache) {
  // TODO: can have conversation without messages ? at sync start, depends on implementation
  final conversation = cache.getConversation(conversationId)!;
  final user = cache.getUser(conversation.externalUserId)!;
  final messages = cache.getConversationMessages(conversationId);
  if (messages.isEmpty) {
    return null;
  }
  final lastMessage = messages.first;
  // Fixme: assumes consistent db. All required info is there.
  // How to deal with inconsistencies?

  return ConversationInfo(
      conversationId: conversationId,
      name: user.email,
      userId: user.id,
      lastMessageTime: lastMessage.createdAt,
      lastMessage: lastMessage.message);
}
