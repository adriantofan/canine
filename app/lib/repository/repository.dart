import 'dart:async';

import 'package:app/conversations/model/conversation_info.dart';
import 'package:canine_sync/canine_sync.dart';

import 'update_conversations_proc.dart';

class SyncRepository {
  final Sync _sync;

  SyncRepository(Sync sync) : _sync = sync;

  Stream<ListChange<ConversationInfo, int>> conversations() {
    return _sync.addProcRef(UpdateConversationsProcRef());
  }
}
