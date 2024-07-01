import 'dart:async';
import 'dart:math';

import 'package:canine_sync/canine_sync.dart';
import 'package:file_selector/file_selector.dart';
import 'package:logging/logging.dart';

import '../conversations/model/conversation_info.dart';
import '../messages/messages.dart';
import './update_messages_proc.dart';
import './users_proc.dart';
import 'update_conversations_proc.dart';

export 'package:canine_sync/canine_sync.dart';

class SyncRepository {
  final Sync _sync;
  final _logger = Logger('SyncRepository');

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

  Future<Conversation> createConversation({required int userId}) async {
    return _sync.createConversation(userId: userId);
  }

  Future<DevisRecipient> analyseDevis(XFile file) async {
    var random = Random();

    // Generate a random integer between 1 and 1000
    int randomNumber = random.nextInt(1000) + 1;
    await Future.delayed(const Duration(milliseconds: 200));
    _logger.warning('FAKE analyseDevis $file');
    return DevisRecipient(
        firstName: 'John',
        lastName: 'Doe',
        email: 'adrian+doe$randomNumber@clemia.fr',
        phone: '+33688550315');
  }

  Future<User> createUser({
    required String email,
    required String firstName,
    required String lastName,
    String phone = '',
    UserType userType = UserType.external,
  }) async {
    return await _sync.createUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        userType: userType);
  }
}
