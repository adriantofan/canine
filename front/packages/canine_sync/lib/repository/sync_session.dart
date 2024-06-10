import 'package:freezed_annotation/freezed_annotation.dart';

import '../api/session.dart';
import '../sync/sync.dart';

part 'sync_session.freezed.dart';

@freezed
class SyncSession with _$SyncSession {
  const SyncSession._();
  const factory SyncSession({
    required int workspaceId,
    required String authId,
    required int userId,
    required Sync service,
  }) = _SyncSession;

  Session sessionNoToken() => Session(
        workspaceId: workspaceId,
        authId: authId,
        userId: userId,
        token: '',
      );
}
