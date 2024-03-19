import 'dart:async';

import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/repository/update_messages_proc.dart';
import 'package:app/repository/users_proc.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:file_selector/file_selector.dart';

import '../messages/messages.dart';
import 'update_conversations_proc.dart';

export 'package:canine_sync/canine_sync.dart';

class SyncRepository {
  final Sync _sync;

  SyncRepository(Sync sync) : _sync = sync;
  Stream<List<User>> users() {
    return _sync.subscribeProcRef(UsersProcRef());
  }

  Stream<List<ConversationInfo>> conversations() {
    return _sync.subscribeProcRef(UpdateConversationsProcRef());
  }

  Stream<List<ChatMessage>> chatMessages(int conversationId) {
    return _sync.subscribeProcRef(UpdateMessagesProcRef(conversationId));
  }

  Stream<AuthenticationStatus> get authStatus => _sync.authStatus;

  Future<void> login(int workspaceId, String username, String password) =>
      _sync.login(workspaceId, username, password);

  Future<void> logout() => _sync.logout();

  Stream<ListSyncState> conversationMessagesSyncStateStream(
      int conversationId) {
    return _sync.conversationMessagesSyncStateStream(conversationId);
  }

  Future<RemoteDataStatus> conversationMessagesLoadPast(int conversationId) {
    return _sync.conversationMessagesLoadPast(conversationId);
  }

  Future<Message> createMessage(
      int conversationId, String text, String idempotencyId) {
    return _sync.createMessage(conversationId, text, idempotencyId);
  }

  Future<Conversation> createConversation(int externalUserId) {
    throw UnimplementedError();
  }

  Future<DevisRecipient> analyseDevis(XFile file) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return DevisRecipient(
        firstName: 'John',
        lastName: 'Doe',
        email: 'email@example.com',
        phone: '06');
  }

  Future<User> createUser() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return User(
        id: 1,
        workspaceId: 1,
        messagingAddress: 'messagingAddress',
        type: 'internal',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
  }
}
