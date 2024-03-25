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
      case MsgConversationMessagesSyncStateSubscribe():
        _conversationMessagesSyncStateSubscribe(msg);
      case MsgConversationMessagesSyncStateUnsubscribe():
        _conversationMessagesSyncStateUnsubscribe(msg);
      case MsgConversationMessagesLoadPast():
        _conversationMessagesLoadPast(msg);
      case MsgCreateMessage():
        _createMessage(msg);
      case MsgCreateConversation():
        _createConversation(msg);
      case MsgCreateUser():
        _createUser(msg);
    }
  }

  // Section: Message handlers

  void _createConversation(MsgCreateConversation msg) {
    _service
        .createConversation(
            recipientMessagingAddress: msg.recipientMessagingAddress)
        .then((c) => msg.sendPort.send(c),
            onError: (error, stackTrace) => (error is APIError)
                ? msg.sendPort.send(error)
                : msg.sendPort.send(error.toString()));
  }

  void _createUser(MsgCreateUser msg) {
    _service
        .createUser(
            messagingAddress: msg.messagingAddress,
            userType: msg.userType,
            password: msg.password)
        .then((u) => msg.sendPort.send(u),
            onError: (error, stackTrace) => (error is APIError)
                ? msg.sendPort.send(error)
                : msg.sendPort.send(error.toString()));
  }

  void _createMessage(MsgCreateMessage msg) {
    _service
        .createMessage(msg.conversationId, msg.text, msg.idempotencyId)
        .then((m) => msg.sendPort.send(m),
            onError: (error, stackTrace) => (error is APIError)
                ? msg.sendPort.send(error)
                : msg.sendPort.send(error.toString()));
  }

  void _conversationMessagesLoadPast(MsgConversationMessagesLoadPast msg) {
    _service.conversationMessagesLoadPast(msg.conversationId).then(
        (RemoteDataStatus s) => msg.sendPort.send(s),
        onError: (error, stackTrace) => (error is APIError)
            ? msg.sendPort.send(error)
            : msg.sendPort.send(error.toString()));
  }

  final Map<String, (StreamSubscription, SendPort)>
      _conversationMessagesSyncStateSubscriptions = {};

  void _conversationMessagesSyncStateSubscribe(
      MsgConversationMessagesSyncStateSubscribe msg) {
    if (_conversationMessagesSyncStateSubscriptions.containsKey(msg.key)) {
      _log.severe('Already subscribed to $msg');
      return;
    }
    final subscription = _service
        .conversationMessagesSyncStateStream(msg.conversationId)
        .listen((state) {
      msg.sendPort.send(state);
    });
    _conversationMessagesSyncStateSubscriptions[msg.key] =
        (subscription, msg.sendPort);
  }

  void _conversationMessagesSyncStateUnsubscribe(
      MsgConversationMessagesSyncStateUnsubscribe msg) {
    if (_conversationMessagesSyncStateSubscriptions.remove(msg.key)
        case (final subscription, final sendPort)) {
      subscription.cancel();
      sendPort.send(MsgOutUnsubscribeAck());
      return;
    }
    _log.severe('Not subscribed $msg');
  }

  void _logout(MsgLogout msg) {
    _service.logout().then((_) => msg.sendPort.send(null),
        onError: (error, stackTrace) => (error is APIError)
            ? msg.sendPort.send(error)
            : msg.sendPort.send(error.toString()));
  }

  void _login(MsgLogin msg) {
    _service.login(msg.workspaceId, msg.username, msg.password).then(
        (_) => msg.sendPort.send(null),
        onError: (error, stackTrace) => (error is APIError)
            ? msg.sendPort.send(error)
            : msg.sendPort.send(error.toString()));
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
