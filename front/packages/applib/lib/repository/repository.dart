import 'dart:async';

import 'package:canine_sync/canine_sync.dart';
import 'package:file_selector/file_selector.dart';

import '../conversations/model/conversation_info.dart';
import '../messages/messages.dart';
import './update_messages_proc.dart';
import './users_proc.dart';
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

  Stream<ListSyncState> conversationMessagesSyncStateStream(
      int conversationId) {
    return _sync.conversationMessagesSyncStateStream(conversationId);
  }

  Future<RemoteDataStatus> conversationMessagesLoadPast(int conversationId) {
    return _sync.conversationMessagesLoadPast(conversationId);
  }

  Future<Message> createMessage(int conversationId, String text,
      String idempotencyId, List<XFile> attachments) {
    return _sync.createMessage(
        conversationId, text, idempotencyId, attachments);
  }

  Future<Conversation> createConversation(
      {required String recipientMessagingAddress}) async {
    return _sync.createConversation(
        recipientMessagingAddress: recipientMessagingAddress);
  }

  Future<DevisRecipient> analyseDevis(XFile file) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return DevisRecipient(
        firstName: 'John',
        lastName: 'Doe',
        email: 'email@example.com',
        phone: '06');
  }

  Future<User> createUser(
      {required String messagingAddress,
      UserType userType = UserType.external,
      String password = ''}) async {
    return _sync.createUser(
        messagingAddress: messagingAddress,
        userType: userType,
        password: password);
  }
}
