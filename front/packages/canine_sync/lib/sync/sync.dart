import 'dart:core';

import 'package:file_selector/file_selector.dart';

import '../models/model.dart';
import 'proc.dart';

abstract class Sync {
  Future<Message> createMessage(int conversationId, String text,
      String idempotencyId, List<XFile> attachments);

  Future<Conversation> createConversation(
      {required String recipientMessagingAddress});

  Future<User> createUser(
      {required String messagingAddress,
      required UserType userType,
      required String password});

  Stream<R> subscribeProcRef<R>(ProcBuilder<R> proc);

  Future<void> updateToken(String token);
  Future<void> disconnect();

  Stream<ListSyncState> conversationMessagesSyncStateStream<ListSyncState>(
      int conversationId);
  Future<RemoteDataStatus> conversationMessagesLoadPast(int conversationId);
}

class LogoutException implements Exception {
  LogoutException();
}
