import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../canine_sync.dart';
import '../../models/rtc_remote.dart';
import '../../models/rtc_remote_update.dart';
import '../sync_worker.dart';
import 'msg.dart';

class SyncSkeleton implements SyncWorker {
  final Cache _cache;
  final Logger _logger = Logger('SyncSkeleton');
  final APIClient _apiClient;
  final Map<String, Subscription> _procMap = {};
  final Map<String, (SendPort, StreamSubscription<AuthenticationStatus>)>
      _authStatusSubs = {};

  final StreamController<void> _stopController =
      StreamController<void>.broadcast();

  SyncSkeleton(this._cache, this._apiClient);
  websocketListen() async {
    for (;;) {
      try {
        await for (var authStatus in _apiClient.authStatus) {
          if (authStatus is AuthenticationStatusAuthenticated) {
            break;
          }
        }

        var update = await _apiClient.rtcSession(const RtcRemote());
        _logger.fine('Got rtc session ${update.syncToken}');

        initCache(update);

        var channel = WebSocketChannel.connect(
            _apiClient.rtcConnectionUri(update.syncToken));

        await channel.ready;
        _logger.fine('Connected to websocket');

        await for (var data
            in channel.stream.takeUntil(_stopController.stream)) {
          var msg = APIServerMessage.fromJson(jsonDecode(data));
          onUpdate(msg);
        }

        resetCache(); // clear cache on logout
      } on APIError catch (e) {
        _logger.severe('API error', e);
      } on Object catch (e) {
        _logger.fine('Retrying websocket connection in 3s', e);
        await Future.delayed(Duration(seconds: 3));

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
        final initial = newSub.proc.init(_cache); // send initial state
        if (initial != null) {
          sendPort.send(initial);
        }
      case [MsgUnsubscribeProc unsubscribe]:
        final sub = _procMap[unsubscribe.key]!;
        sub.sendPort.send(MsgUnsubscribeProcAck(unsubscribe.key));
        _procMap.remove(unsubscribe.key);
      case [SendPort sendPort, MsgAuthStatusSubscribe subscribe]:
        final sub = _apiClient.authStatus.listen((status) {
          sendPort.send(MsgAuthStatusUpdate(status));
        });
        _authStatusSubs[subscribe.key] = (sendPort, sub);
      case [MsgAuthStatusUnsubscribe unsubscribe]:
        final sub = _authStatusSubs[unsubscribe.key]!;
        sub.$2.cancel();
        sub.$1.send(MsgAuthStatusUnsubscribeAck());
        _authStatusSubs.remove(unsubscribe.key);
      case [SendPort sendPort, MsgLogin login]:
        _apiClient
            .login(login.workspaceId, login.username, login.password)
            .then((_) => sendPort.send(null))
            // I could set the user on the cache
            .catchError((e) => sendPort.send(e));
      case [SendPort sendPort, MsgLogout _]:
        _stopController.add(null);
        _apiClient
            .logout()
            .then((_) => sendPort.send(null))
            .catchError((e) => sendPort.send(e));

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

  initCache(RTCRemoteUpdate message) {
    _cache.init(message);
    _procMap.forEach((key, sub) {
      final result = sub.proc.init(_cache);
      if (result != null) {
        sub.sendPort.send(result);
      }
    });
  }

  resetCache() {
    _cache.reset();
    _procMap.forEach((key, sub) {
      final result = sub.proc.init(_cache);
      if (result != null) {
        sub.sendPort.send(result);
      }
    });
  }
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
