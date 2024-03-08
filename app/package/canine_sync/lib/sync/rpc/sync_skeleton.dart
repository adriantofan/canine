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
  final Map<String, (SendPort, StreamSubscription<dynamic>)>
      _conversationMessagesHistorySubs = {};

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
  onMsg(Msg msg) {
    switch (msg) {
      case MsgSubscribeProc():
        _subscribeProc(msg);
      case MsgUnsubscribeProc():
        _unsubscribeProc(msg);
      case MsgAuthStatusSubscribe():
        _authStatusSubscribe(msg);
      case MsgAuthStatusUnsubscribe():
        _authStatusUnsubscribe(msg);
      case MsgLogin():
        _login(msg);
      case MsgLogout():
        _logout(msg);
      case MsgConversationMessagesHistory():
        _conversationMessagesHistory(msg);
      case MsgConversationMessagesHistoryUnsubscribe():
        _conversationMessagesHistoryUnsubscribe(msg);
      case MsgConversationMessagesHistoryLoadPast():
        _conversationMessagesHistoryLoadPast(msg);
    }
  }

  // Section: Message handlers
  void _conversationMessagesHistoryLoadPast(
      MsgConversationMessagesHistoryLoadPast msg) {
    final crtHistory = _cache.conversationHistory(msg.conversationId);
    final status = crtHistory.startStatus;
    final RemoteDataStatusLoading newHistory;
    switch (status) {
      case RemoteDataStatusUndetermined():
        newHistory = status.load;
      case RemoteDataStatusComplete():
        msg.sendPort.send(null);
        return;
      case RemoteDataStatusLoading():
        _cache.conversationHistoryStream(msg.conversationId).skip(1).first.then(
            (state) => msg.sendPort.send(state.startStatus),
            onError: (error, stackTrace) =>
                msg.sendPort.send(error.toString()));
        return;
      case RemoteDataStatusFailed():
        newHistory = status.retry;
    }
    _cache.updateConversationHistory(msg.conversationId, newHistory, null);

    _apiClient.getConversationMessages(msg.conversationId).then((data) {
      if (data.data.isEmpty) {
        _cache.updateConversationHistory(
            msg.conversationId, newHistory.complete, null);
        msg.sendPort.send(newHistory.complete);
        return;
      }
      // TODO: need to update cache and make sure that it doesn't run concurrently
      //  with another update
      //  Then need to update conversation history to set the last id and
      //  status to complete

      msg.sendPort.send(newHistory.loaded);
    }).catchError((e) {
      _cache.updateConversationHistory(
          msg.conversationId, newHistory.failed, null);
      msg.sendPort.send(e);
    });
  }

  void _conversationMessagesHistory(MsgConversationMessagesHistory msg) {
    final subscription = ConcatStream([
      _cache
          .conversationHistoryStream(msg.conversationId)
          .takeUntil(_stopController.stream),
      Stream.value(null).map((event) => throw LogoutException())
    ]).listen((state) => msg.sendPort.send(state));
    _conversationMessagesHistorySubs[msg.key] = (msg.sendPort, subscription);
  }

  void _conversationMessagesHistoryUnsubscribe(
      MsgConversationMessagesHistoryUnsubscribe msg) {
    final sub = _conversationMessagesHistorySubs[msg.key]!;
    sub.$2.cancel();
    sub.$1.send(MsgOutUnsubscribeAck());
    _conversationMessagesHistorySubs.remove(msg.key);
  }

  void _logout(MsgLogout msg) {
    _stopController.add(null);
    _apiClient
        .logout()
        .then((_) => msg.sendPort.send(null))
        .catchError((e) => msg.sendPort.send(e));
  }

  void _login(MsgLogin msg) {
    _apiClient
        .login(msg.workspaceId, msg.username, msg.password)
        .then((_) => msg.sendPort.send(null))
        // I could set the user on the cache
        .catchError((e) => msg.sendPort.send(e));
  }

  void _authStatusUnsubscribe(MsgAuthStatusUnsubscribe msg) {
    final sub = _authStatusSubs[msg.key]!;
    sub.$2.cancel();
    sub.$1.send(MsgOutUnsubscribeAck());
    _authStatusSubs.remove(msg.key);
  }

  void _authStatusSubscribe(MsgAuthStatusSubscribe msg) {
    final sub = _apiClient.authStatus.listen((status) {
      msg.sendPort.send(status);
    });
    _authStatusSubs[msg.key] = (msg.sendPort, sub);
  }

  void _unsubscribeProc(MsgUnsubscribeProc msg) {
    final sub = _procMap[msg.key]!;
    sub.sendPort.send(MsgOutUnsubscribeAck());
    _procMap.remove(msg.key);
  }

  void _subscribeProc(MsgSubscribeProc msg) {
    final newSub = Subscription.fromMsg(msg, msg.sendPort);
    _procMap[msg.key] = newSub;
    final initial = newSub.proc.init(_cache); // send initial state
    if (initial != null) {
      msg.sendPort.send(initial);
    }
  }

  // End Section: Message handlers

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
