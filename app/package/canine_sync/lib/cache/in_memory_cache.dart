import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/api_server_message.dart';
import 'cache.dart';

// package internal
class InMemoryCache implements Cache {
  @override
  List<Conversation> conversations = [];
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
  Update? serverDidUpdate(APIServerMessage message) {
    return null;
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

    return Update.messages(conversationId,
        ListUpdate(conversationMessages[conversationId]!.items));
  }
}
