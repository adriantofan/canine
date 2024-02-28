import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../api/main.dart';
import '../../cache/cache.dart';
import '../../models/rtc_remote.dart';
import '../../ws/model/api_server_message.dart';
import '../proc.dart';
import '../sync_worker.dart';
import 'msg.dart';

class SyncSkeleton implements SyncWorker {
  final Cache _cache;
  final APIClient _apiClient;
  Map<String, Subscription> _procMap = {};
  final Map<String, (SendPort, StreamSubscription<AuthenticationStatus>)>
      _authStatusSubs = {};

  StreamController<void> _stopController = StreamController<void>();

  SyncSkeleton(this._cache, this._apiClient);
  websocketListen() async {
    for (;;) {
      try {
        await for (var authStatus in _apiClient.authStatus) {
          if (authStatus == AuthenticationStatus.authenticated) {
            break;
          }
        }

        var update = await _apiClient.rtcSession(const RtcRemote());
        var channel = WebSocketChannel.connect(
            _apiClient.rtcConnectionUri(update.syncToken));

        await channel.ready;

        await for (var data
            in channel.stream.takeUntil(_stopController.stream)) {
          var msg = APIServerMessage.fromJson(jsonDecode(data));
          if (msg is APIServerMessageSyncCompleted) {
          } else {
            onUpdate(msg);
          }
        }
      } on Object catch (e) {
        await Future.delayed(Duration(seconds: 3));
        print(e);

        // Todo: add exponential backoff
        // TODO: what is going to happen with ongoing procs ?
      }
    }
  }

  @override
  onMsg(List<dynamic> parts) {
    switch (parts) {
      case [SendPort sendPort, MsgSubscribeProc subscribe]:
        final newSub = Subscription.fromMsg(subscribe, sendPort);
        _procMap[subscribe.key] = newSub;
        final initial = newSub.proc.update(null, _cache); // send initial state
        if (initial != null) {
          sendPort.send(initial);
        }
        break;
      case [MsgUnsubscribeProc unsubscribe]:
        final sub = _procMap[unsubscribe.key]!;
        sub.sendPort.send(MsgUnsubscribeProcAck(unsubscribe.key));
        _procMap.remove(unsubscribe.key);
        break;
      case [SendPort sendPort, MsgAuthStatusSubscribe subscribe]:
        final sub = _apiClient.authStatus.listen((status) {
          sendPort.send(MsgAuthStatusUpdate(status));
        });
        _authStatusSubs[subscribe.key] = (sendPort, sub);
        break;
      case [MsgAuthStatusUnsubscribe unsubscribe]:
        final sub = _authStatusSubs[unsubscribe.key]!;
        sub.$2.cancel();
        sub.$1.send(MsgAuthStatusUnsubscribeAck());
        _authStatusSubs.remove(unsubscribe.key);
        break;
      case [SendPort sendPort, MsgLogin login]:
        _apiClient
            .login(login.workspaceId, login.username, login.password)
            .then((_) => sendPort.send(null))
            // I could set the user on the cache
            .catchError((e) => sendPort.send(e));
        break;
      default:
        throw Exception('Unknown message type $parts');
    }
  }

  @override
  onUpdate(APIServerMessage message) {
    final update = _cache.doUpdate(message);
    if (update == null) {
      return;
    }
    _procMap.forEach((key, sub) {
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
