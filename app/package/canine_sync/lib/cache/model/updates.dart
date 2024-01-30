import '../../models/model.dart';

sealed class Update {}

class ListChange<T, ID> {
  List<ID> addedItems;
  List<ID> removedItems;
  List<ID> updatedItems;
  List<T> items;
  ListChange(
    this.addedItems,
    this.removedItems,
    this.updatedItems,
    this.items,
  );
  static empty<T, ID>() => ListChange<T, ID>([], [], [], []);
}

class ConversationsUpdate extends Update {
  final ListChange<Conversation, int> changes;
  ConversationsUpdate(this.changes);
}

class MessagesUpdate extends Update {
  final ListChange<({int conversationID, Message message}), int> change;
  MessagesUpdate(this.change);
}

class UsersUpdate extends Update {
  final ListChange<User, int> items;
  UsersUpdate(this.items);
}
