import 'package:rxdart/rxdart.dart';

import '../api/session.dart';
import '../sync/main.dart';
import 'sync_session.dart';

class SyncSessionRepository {
  SyncSessionRepository(this.apiBase, this.wsBase) {
    _sessionQueue.switchMap(_updateSession).listen((event) {});
  }

  String apiBase;
  String wsBase;

  BehaviorSubject<SyncSession?> syncSessionChanges =
      BehaviorSubject<SyncSession?>();
  final BehaviorSubject<Session> _sessionQueue = BehaviorSubject<Session>();

  connect(Session session) {
    _sessionQueue.add(session);
  }

  disconnect() async {
    await syncSessionChanges.valueOrNull?.service.disconnect();
    syncSessionChanges.value = null;
  }

  update(Session session) {
    final crtSyncSession = syncSessionChanges.valueOrNull;
    if (crtSyncSession == null) {
      return;
    }
    if (!crtSyncSession.sessionNoToken().sameAs(session)) {
      return;
    }
    crtSyncSession.service.updateToken(session.token);
  }

  Stream<void> _updateSession(Session session) async* {
    final crtSyncSession = syncSessionChanges.valueOrNull;
    if (crtSyncSession?.sessionNoToken().sameAs(session) ?? false) {
      return;
    }

    await crtSyncSession?.service.disconnect();

    syncSessionChanges.value = SyncSession(
      workspaceId: session.workspaceId,
      authId: session.authId,
      userId: session.userId,
      service: await start(apiBase, wsBase, session),
    );
  }
}
