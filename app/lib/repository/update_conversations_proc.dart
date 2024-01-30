import 'package:canine_sync/canine_sync.dart';

import '../conversations/model/conversation_info.dart';

class UpdateConversationsProcRef
    extends ProcBuilder<ListChange<ConversationInfo, int>> {
  @override
  Proc<ListChange<ConversationInfo, int>> build() {
    return UpdateConversationsProc();
  }
}

class UpdateConversationsProc extends Proc<ListChange<ConversationInfo, int>> {
  @override
  ListChange<ConversationInfo, int>? update(Update? changes, Cache cache) {
    if (_prev == null) {
      return _prev = bootstrap(cache);
    }
    return null;
  }

  ListChange<ConversationInfo, int>? _prev;

  ListChange<ConversationInfo, int> updateConversationInfo(
      Update changes, Cache cache) {
    switch (changes) {
      case ConversationsUpdate conversationsUpdate:
        return _prev =
            conversationUpdate(_prev!.items, conversationsUpdate, cache);
      case MessagesUpdate messagesUpdate:
        return _prev = messageUpdate(_prev!.items, messagesUpdate, cache);
      case UsersUpdate():
        return _prev = ListChange([], [], [], _prev!.items);
      // TODO: Handle this case.
    }
  }

  ListChange<ConversationInfo, int> bootstrap(Cache cache) {
    final conversations = cache.conversations;
    final conversationItems = conversations
        .map((c) => makeConversationItem(c.id, cache))
        .toList()
      ..sort(ConversationInfo.compareByLastMessageTime);
    return ListChange([], [], [], conversationItems);
  }
}

ListChange<ConversationInfo, int> userUpdate(
    List<ConversationInfo> prev, UsersUpdate update, Cache cache) {
  // determine which conversations have changed and update accordingly
  final changedUserIds = Set.from(update.items.updatedItems);
  List<int> changedConversationIDs = [];
  for (var i = 0; i < prev.length; i++) {
    if (changedUserIds.contains(prev[i].userId)) {
      prev[i] = conversationItemBuilder(cache)(prev[i].conversationId);
      changedConversationIDs.add(prev[i].conversationId);
    }
  }
  return ListChange([], [], changedConversationIDs, prev);
}

ListChange<ConversationInfo, int> messageUpdate(
    List<ConversationInfo> prev, MessagesUpdate update, Cache cache) {
  final conversationIDs =
      update.change.items.map((e) => e.conversationID).toList();
  return conversationUpdate(prev,
      ConversationsUpdate(ListChange([], [], conversationIDs, [])), cache);
}

ListChange<ConversationInfo, int> conversationUpdate(
    List<ConversationInfo> prev, ConversationsUpdate update, Cache cache) {
  var addedOrUpdated = [
    ...update.changes.addedItems,
    ...update.changes.updatedItems
  ].map(conversationItemBuilder(cache)).toList()
    ..sort(ConversationInfo.compareByLastMessageTime);

  var deletedIDs = Set.from(update.changes.removedItems);
  var changedIDs = Set.from(update.changes.updatedItems);

  List<ConversationInfo> items = [];
  var i = 0, j = 0;

  while (i < prev.length && j < addedOrUpdated.length) {
    if (deletedIDs.contains(prev[i].conversationId) ||
        changedIDs.contains(prev[i].conversationId)) {
      i++;
      continue;
    }

    var cmp =
        ConversationInfo.compareByLastMessageTime(prev[i], addedOrUpdated[j]);
    if (cmp < 0) {
      items.add(prev[i]);
      i++;
    } else if (cmp > 0) {
      items.add(addedOrUpdated[j]);
      j++;
    } else {
      items.add(addedOrUpdated[j]);
      i++;
      j++;
    }
  }
  while (i < prev.length) {
    if (deletedIDs.contains(prev[i].conversationId) ||
        changedIDs.contains(prev[i].conversationId)) {
      i++;
      continue;
    }
    items.add(prev[i]);
    i++;
  }
  while (j < addedOrUpdated.length) {
    items.add(addedOrUpdated[j]);
    j++;
  }

  return ListChange(update.changes.addedItems, update.changes.removedItems,
      update.changes.updatedItems, items);
}

ConversationInfo Function(int) conversationItemBuilder(Cache cache) =>
    (int conversationId) => makeConversationItem(conversationId, cache);

ConversationInfo makeConversationItem(int conversationId, Cache cache) {
  // TODO: can have conversation without messages ? at sync start, depends on implementation
  final conversation = cache.getConversation(conversationId)!;
  final user = cache.getUser(conversation.externalUserId)!;
  final lastMessage = cache.getConversationMessages(conversationId).last;
  // Fixme: assumes consistent db. All required info is there.
  // How to deal with inconsistencies?

  return ConversationInfo(
      conversationId: conversationId,
      name: user.messagingAddress,
      userId: user.id,
      lastMessageTime: lastMessage.createdAt,
      lastMessage: lastMessage.message);
}
