import 'package:logging/logging.dart';

import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/ws.dart';
import 'cache.dart';

// package internal
class InMemoryCache implements Cache {
  final _log = Logger('InMemoryCache');

  @override
  List<Conversation> conversations = []; // sorted by id
  Map<int, User> _usersById = {};
  Map<int, ListState<Message>> conversationMessages = {};

  @override
  ListState<Message> getConversationMessagesState(int conversationId) {
    return conversationMessages[conversationId] ??
        const ListStateUnknown<Message>();
  }

  @override
  List<Message> getConversationMessages(int conversationId) {
    return getConversationMessagesState(conversationId).items;
  }

  @override
  Conversation? getConversation(int conversationId) {
    return conversations.firstWhere((c) => c.id == conversationId);
  }

  @override
  User? getUser(int userId) {
    return _usersById[userId];
  }

  @override
  Update? serverDidUpdate(APIServerUpdate message) {
    // TODO: Either create granular updates  or make a update that holds a APIServerMessage
    //
    switch (message) {
      case APIServerUpdateInvalid():
        return null;
      case APIServerUpdateUsers():
        _log.warning("InMemoryCache.serverDidUpdate: 🟡UNIMPLEMENTED $message");
        return null;
      case APIServerUpdateMessage():
        return _handleAPIServerUpdateMessage(message);
      case APIServerUpdateConversation():
        _log.warning("InMemoryCache.serverDidUpdate: 🟡UNIMPLEMENTED $message");
        return null;
    }
  }

  Update? _handleAPIServerUpdateMessage(APIServerUpdateMessage message) {
    final update = Update.server(message);
    if (message.kind != APIServerUpdateKind.create) {
      _log.warning(
          "InMemoryCache._handleAPIServerUpdateMessage: ${message.kind} not supposed to be sent by server $message");
      return update;
    }
    // Create case
    final conversationId = message.data.conversationId;
    final conversationMessagesState = conversationMessages[conversationId];
    if (conversationMessagesState == null) {
      _log.warning(
          "InMemoryCache._handleAPIServerUpdateMessage: conversationMessagesState not found for $conversationId."
          " Message sent without sending it's corresponding conversation?");
      return update;
    }
    conversationMessages[conversationId] =
        conversationMessagesState.addRight([message.data], (m) => m.id);
    return update;
  }

  // Changes

  @override
  void init(RTCRemoteUpdate updates) {
    conversations = updates.conversations;
    _usersById = Map.fromEntries(updates.users.map((u) => MapEntry(u.id, u)));
    conversationMessages = Map.fromEntries(updates.messages.map((m) => MapEntry(
        m.conversationId, ListState.fromItems(m.messages, (m) => m.id, true))));
  }

  @override
  void reset() {
    conversations = [];
    _usersById = {};
    conversationMessages = {};
  }

  @override
  Update? conversationMessagesLoaded(
      int conversationId, List<Message> newMessages, bool moreBeforeStart) {
    if (newMessages.isEmpty) {
      return null;
    }
    // Assumes newMessages are sorted
    if (conversationMessages.containsKey(conversationId)) {
      conversationMessages[conversationId] =
          conversationMessages[conversationId]!
              .addLeft(newMessages, (m) => m.id, moreBeforeStart);
    } else {
      conversationMessages[conversationId] =
          ListState.fromItems(newMessages, (m) => m.id, moreBeforeStart);
    }

    return Update.messagesAdded(conversationId, newMessages);
  }
}
