import '../models/model.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/api_server_message.dart';
import 'cache.dart';

// package internal
class InMemoryCache implements Cache {
  User? _user;

  @override
  List<Conversation> conversations = [];
  Map<int, User> _usersById = {};
  Map<int, List<Message>> conversationMessages = {};

  @override
  void reset() {
    _user = null;
    conversations = [];
    _usersById = {};
    conversationMessages = {};
  }

  @override
  void init(RTCRemoteUpdate updates) {
    conversations = updates.conversations;
    _usersById = Map.fromEntries(updates.users.map((u) => MapEntry(u.id, u)));
    conversationMessages = Map.fromEntries(
        updates.messages.map((m) => MapEntry(m.conversationId, m.messages)));
  }

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
  Update? doUpdate(APIServerMessage message) {
    return null;
  }
}
