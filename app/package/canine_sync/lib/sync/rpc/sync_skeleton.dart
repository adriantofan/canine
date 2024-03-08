import 'dart:async';
import 'dart:isolate';

import 'package:logging/logging.dart';

import '../../models/model.dart';
import '../sync.dart';
import 'msg.dart';

class SyncSkeleton {
  final Sync _service;
  final _log = Logger('SyncSkeleton');

  SyncSkeleton(this._service);

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
    _service.conversationHistoryLoadPast(msg.conversationId).then(
        (RemoteDataStatus s) => msg.sendPort.send(s),
        onError: (error, stackTrace) => msg.sendPort.send(error.toString()));
  }

  final Map<String, (StreamSubscription, SendPort)>
      _conversationMessagesHistorySubscriptions = {};

  void _conversationMessagesHistory(MsgConversationMessagesHistory msg) {
    if (_conversationMessagesHistorySubscriptions.containsKey(msg.key)) {
      _log.severe('Already subscribed to $msg');
      return;
    }
    final subscription =
        _service.conversationHistoryStream(msg.conversationId).listen((state) {
      msg.sendPort.send(state);
    });
    _conversationMessagesHistorySubscriptions[msg.key] =
        (subscription, msg.sendPort);
  }

  void _conversationMessagesHistoryUnsubscribe(
      MsgConversationMessagesHistoryUnsubscribe msg) {
    if (_conversationMessagesHistorySubscriptions.remove(msg.key)
        case (final subscription, final sendPort)) {
      subscription.cancel();
      sendPort.send(MsgOutUnsubscribeAck());
      return;
    }
    _log.severe('Not subscribed $msg');
  }

  void _logout(MsgLogout msg) {
    _service.logout().then((_) => msg.sendPort.send(null),
        onError: (error, stackTrace) => msg.sendPort.send(error.toString()));
  }

  void _login(MsgLogin msg) {
    _service.login(msg.workspaceId, msg.username, msg.password).then(
        (_) => msg.sendPort.send(null),
        onError: (error, stackTrace) => msg.sendPort.send(error.toString()));
  }

  final Map<String, (StreamSubscription, SendPort)> _authStatusSubscriptions =
      {};
  void _authStatusSubscribe(MsgAuthStatusSubscribe msg) {
    if (_authStatusSubscriptions.containsKey(msg.key)) {
      _log.severe('Already subscribed to ${msg.key} in _authStatusSubscribe');
      return;
    }
    final subscription = _service.authStatus.listen((status) {
      msg.sendPort.send(status);
    });
    _authStatusSubscriptions[msg.key] = (subscription, msg.sendPort);
  }

  void _authStatusUnsubscribe(MsgAuthStatusUnsubscribe msg) {
    if (_authStatusSubscriptions.remove(msg.key)
        case (final subscription, final sendPort)) {
      subscription.cancel();
      sendPort.send(MsgOutUnsubscribeAck());
      return;
    }
    _log.severe('Not subscribed $msg');
  }

  final Map<String, (StreamSubscription, SendPort)> _procSubscriptions = {};
  void _subscribeProc(MsgSubscribeProc msg) {
    if (_procSubscriptions.containsKey(msg.key)) {
      _log.severe('Already subscribed to ${msg.key} in _subscribeProc');
      return;
    }
    final subscription =
        _service.subscribeProcRef(msg.procBuilder).listen((state) {
      msg.sendPort.send(state);
    });
    _procSubscriptions[msg.key] = (subscription, msg.sendPort);
  }

  void _unsubscribeProc(MsgUnsubscribeProc msg) {
    if (_procSubscriptions.remove(msg.key)
        case (final subscription, final sendPort)) {
      subscription.cancel();
      sendPort.send(MsgOutUnsubscribeAck());
      return;
    }
    _log.severe('Not subscribed $msg');
  }
}
