import 'dart:isolate';

import '../../cache/cache.dart';
import '../../ws/model/api_server_message.dart';
import '../proc.dart';
import '../sync_worker.dart';
import 'msg.dart';

class SyncSkeleton implements SyncWorker {
  final Cache _cache;

  Map<String, Subscription> procMap = {};

  SyncSkeleton(this._cache);

  @override
  onMsg(List<dynamic> parts) {
    switch (parts) {
      case [SendPort sendPort, MsgSubscribeProc subscribe]:
        final newSub = Subscription.fromMsg(subscribe, sendPort);
        procMap[subscribe.key] = newSub;
        final initial = newSub.proc.update(null, _cache); // send initial state
        if (initial != null) {
          sendPort.send(initial);
        }
        break;
      case MsgUnsubscribeProcAck ack:
        final sub = procMap[ack.key]!;
        sub.sendPort.send(MsgUnsubscribeProcAck(ack.key));
        procMap.remove(ack.key);
        break;
    }
  }

  @override
  onUpdate(APIServerMessage message) {
    final update = _cache.doUpdate(message);
    if (update == null) {
      return;
    }
    procMap.forEach((key, sub) {
      final result = sub.proc.update(update, _cache);
      if (result != null) {
        sub.sendPort.send(result);
      }
    });
  }

  onStateChange(int state) {}
}

class Subscription {
  final String id;
  final SendPort sendPort;
  final Proc<dynamic> proc;
  Subscription(this.id, this.sendPort, this.proc);

  static Subscription fromMsg(MsgSubscribeProc msg, SendPort sendPort) {
    return Subscription(msg.key, sendPort, msg.procBuilder.build());
  }
}
