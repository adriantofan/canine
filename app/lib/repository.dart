import 'dart:async';

import 'package:app/state/store.dart';
import 'package:app/state/sync_state.dart';
import 'package:app/state/ws.dart';

import 'fake_data.dart';

class ListUpdate<T, ID> {
  List<ID> addedItems;
  List<ID> removedItems;
  List<ID> updatedItems;
  ListUpdate(
    this.addedItems,
    this.removedItems,
    this.updatedItems,
  );
}

sealed class Update {}

class SyncStateUpdate extends Update {
  final SyncState state;
  SyncStateUpdate(this.state);
}

class ConversationsUpdate extends Update {
  final ListUpdate<Conversation, int> changes;
  ConversationsUpdate(this.changes);
}

class MessagesUpdate extends Update {
  final ListUpdate<Message, int> items;
  MessagesUpdate(this.items);
}

class UsersUpdate extends Update {
  final ListUpdate<User, int> items;
  UsersUpdate(this.items);
}

class SyncRepository {
  final Store _store;
  List<Conversation> tmpConversationList;
  SyncRepository()
      : _store = Store.shared,
        tmpConversationList = [];
  Stream<Update> updates() {
    // TODO: process stream of updates from the webservice
    // feed them in to store and produce further updates
    // here somebody might update the store and produce updates
    // Sleep for a while to simulate a delay
    return Stream.empty();
  }

  Stream<ConversationsUpdate> conversations() async* {
    await Future.delayed(const Duration(seconds: 1));
    tmpConversationList =
        fakeConversationList.sublist(0, fakeConversationList.length ~/ 2);
    yield ConversationsUpdate(ListUpdate([], [], []));
    await Future.delayed(const Duration(seconds: 5));
    tmpConversationList = fakeConversationList;
    yield ConversationsUpdate(ListUpdate([], [], []));
  }

  Stream<MessagesUpdate> messages(int conversationId) {
    return Stream.empty();
  }

  User? getUser(int id) {
    return fakeUsers[id];
  }

  Conversation? getConversation(int id) {
    return fakeConversationMap[id]; // From store
  }

  Message? getLastMessage(int conversationId) {
    return fakeMessages[conversationId]?.last; // From store
  }

  List<Conversation> getConversations() {
    return tmpConversationList; // From store
  }
}
