import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/api_server_message.dart';
import 'cache.dart';

// package internal
class InMemoryCache implements Cache {
  @override
  List<Conversation> conversations = [];
  Map<int, User> _usersById = {};
  Map<int, List<Message>> conversationMessages = {};

  @override
  List<Message> getConversationMessages(int conversationId) {
    return conversationMessages[conversationId] ?? [];
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
    conversationMessages = Map.fromEntries(
        updates.messages.map((m) => MapEntry(m.conversationId, m.messages)));
  }

  @override
  void reset() {
    conversations = [];
    _usersById = {};
    conversationMessages = {};
  }

  @override
  Update? conversationMessagesLoaded(
      int conversationId, List<Message> newMessages) {
    // Assumes newMessages are sorted
    if (conversationMessages.containsKey(conversationId)) {
      conversationMessages[conversationId]!.insertAll(0, newMessages);
    } else {
      conversationMessages[conversationId] = newMessages;
    }
    throw UnimplementedError();
  }
}
