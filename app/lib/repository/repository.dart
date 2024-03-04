import 'dart:async';

import 'package:app/conversations/model/conversation_info.dart';
import 'package:canine_sync/canine_sync.dart';

import 'update_conversations_proc.dart';

export 'package:canine_sync/canine_sync.dart';

class SyncRepository {
  final Sync _sync;

  SyncRepository(Sync sync) : _sync = sync;

  Stream<ListChange<ConversationInfo, int>> conversations() {
    return _sync.addProcRef(UpdateConversationsProcRef());
  }

  Stream<AuthenticationStatus> get authStatus => _sync.authStatus;

  Future<void> login(int workspaceId, String username, String password) =>
      _sync.login(workspaceId, username, password);

  Future<void> logout() => _sync.logout();
}
