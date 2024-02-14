import '../models/model.dart';
import '../ws/ws.dart';
import 'cache.dart';
import 'fake_data.dart';

// package internal
class InMemoryCache implements Cache {
  @override
  List<Conversation> conversations = fakeConversationList;
  final Map<int, User> _usersById = fakeUsers;

  Map<int, List<Message>> conversationMessages = fakeMessages;

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