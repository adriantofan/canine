import 'package:rxdart/rxdart.dart';

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

  final _conversationHistory = <int, BehaviorSubject<HistoryState>>{};

  updateConversationHistory(
      int conversationId, RemoteDataStatus startStatus, final int? startId) {
    final subject = _conversationHistorySubject(conversationId);
    subject.value = subject.value.copyWith(
        startStatus: startStatus, startId: startId ?? subject.value.startId);
  }

  @override
  Stream<HistoryState> conversationHistoryStream<HistoryState>(
      int conversationId) {
    return _conversationHistorySubject(conversationId).stream
        as Stream<HistoryState>;
  }

  @override
  HistoryState conversationHistory(int conversationId) {
    return _conversationHistorySubject(conversationId).value;
  }

  BehaviorSubject<HistoryState> _conversationHistorySubject(
      int conversationId) {
    if (_conversationHistory.containsKey(conversationId)) {
      return _conversationHistory[conversationId]!;
    }
    final messages = conversationMessages[conversationId];
    final initialState = messages == null || messages.isEmpty
        ? const HistoryState(0, RemoteDataStatus.undetermined())
        : HistoryState(messages[0].id, const RemoteDataStatus.undetermined());

    final controller = BehaviorSubject<HistoryState>.seeded(initialState);
    _conversationHistory[conversationId] = controller;
    return controller;
  }

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
