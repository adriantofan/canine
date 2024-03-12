import 'dart:core';

import '../api/main.dart';
import '../models/model.dart';
import 'proc.dart';

abstract class Sync {
  Stream<R> subscribeProcRef<R>(ProcBuilder<R> proc);
  Future<void> login(int workspaceId, String username, String password);
  Future<void> logout();
  Stream<AuthenticationStatus> get authStatus;

  Stream<ListSyncState> conversationMessagesSyncStateStream<ListSyncState>(
      int conversationId);
  Future<RemoteDataStatus> conversationMessagesLoadPast(int conversationId);
}

class LogoutException implements Exception {
  LogoutException();
}
