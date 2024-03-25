import 'dart:async';
import 'dart:isolate';

import 'package:uuid/uuid.dart';

import '../../api/main.dart';
import '../../models/model.dart';
import '../proc.dart';
import '../sync.dart';
import 'msg.dart';

class SyncStub extends Sync {
  final SendPort _sendPort;
  final uuid = const Uuid();

  SyncStub(SendPort sendPort) : _sendPort = sendPort;

  Stream<R> addProc<R>(ProcBuilder<R> procBuilder) {
    StreamController<R> controller = StreamController();
    ReceivePort receivePort = ReceivePort();
    String msgKey = uuid.v4();
    StreamSubscription? streamSubscription;

    controller.onListen = () {
      streamSubscription = receivePort.listen((data) {
        if (data is MsgOutUnsubscribeAck) {
          controller.close();
          streamSubscription!.cancel();
        }
        if (data is R) {
          controller.add(data);
        }
      });
      _sendPort
          .send(Msg.subscribeProc(receivePort.sendPort, procBuilder, msgKey));
    };
    controller.onCancel = () {
      _sendPort.send(Msg.unsubscribeProc(msgKey));
    };

    return controller.stream;
  }

  @override
  Stream<R> subscribeProcRef<R>(ProcBuilder<R> proc) {
    return addProc(proc);
  }

  @override
  Stream<AuthenticationStatus> get authStatus {
    StreamController<AuthenticationStatus> controller = StreamController();
    final key = uuid.v4();
    ReceivePort receivePort = ReceivePort();
    StreamSubscription? streamSubscription;
    controller.onListen = () {
      streamSubscription = receivePort.listen((data) {
        if (data is MsgOutUnsubscribeAck) {
          controller.close();
          streamSubscription!.cancel();
          return;
        }
        if (data is AuthenticationStatus) {
          controller.add(data);
          return;
        }
        throw ArgumentError.value(
            data, "Invalid response from canine_sync on authStatus");
      });
      _sendPort.send(Msg.authStatusSubscribe(receivePort.sendPort, key));
    };

    controller.onCancel = () {
      _sendPort.send(Msg.authStatusUnsubscribe(key));
    };

    return controller.stream;
  }

  @override
  Future<void> login(int workspaceId, String username, String password) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort
        .send(Msg.login(receivePort.sendPort, workspaceId, username, password));
    await for (var data in receivePort) {
      if (data == null) {
        return;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on login");
    }

    throw AssertionError("canine_sync did not respond to login");
  }

  @override
  Future<void> logout() async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.logout(receivePort.sendPort));
    await for (var data in receivePort) {
      if (data == null) {
        return;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on logout");
    }
    throw UnimplementedError();
  }

  @override
  Future<RemoteDataStatus> conversationMessagesLoadPast(
      int conversationId) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(
        Msg.conversationMessagesLoadPast(receivePort.sendPort, conversationId));
    await for (var data in receivePort) {
      if (data is RemoteDataStatus) {
        return data;
      }

      // Unclear what to do with API error ... should it be thrown? displayed?
      throw ArgumentError.value(data,
          "Invalid response from canine_sync on conversationMessagesLoadPast");
    }

    throw AssertionError(
        "canine_sync did not respond to conversationMessagesLoadPast");
  }

  @override
  Stream<ListSyncState> conversationMessagesSyncStateStream<ListSyncState>(
      int conversationId) {
    StreamController<ListSyncState> controller = StreamController();
    final key = uuid.v4();
    ReceivePort receivePort = ReceivePort();
    StreamSubscription? streamSubscription;
    controller.onListen = () {
      streamSubscription = receivePort.listen((data) {
        if (data is ListSyncState) {
          controller.add(data);
          return;
        }
        if (data is MsgOutUnsubscribeAck) {
          controller.close();
          streamSubscription!.cancel();
          return;
        }
        throw ArgumentError.value(data,
            "Invalid response from canine_sync on conversationMessagesSyncStateStream");
      });
      _sendPort.send(Msg.conversationMessagesSyncStateSubscribe(
          receivePort.sendPort, conversationId, key));
    };
    controller.onCancel = () {
      _sendPort.send(Msg.conversationMessagesSyncStateUnsubscribe(key));
    };
    return controller.stream;
  }

  @override
  Future<Message> createMessage(
      int conversationId, String text, String idempotencyId) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.createMessage(
        receivePort.sendPort, conversationId, text, idempotencyId));
    await for (var data in receivePort) {
      if (data is Message) {
        return data;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on createMessage");
    }

    throw AssertionError("canine_sync did not respond to createMessage");
  }

  @override
  Future<Conversation> createConversation(
      {required String recipientMessagingAddress}) {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.createConversation(receivePort.sendPort,
        recipientMessagingAddress: recipientMessagingAddress));
    return receivePort.first.then((data) {
      if (data is Conversation) {
        return data;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on createConversation");
    });
  }

  @override
  Future<User> createUser(
      {required String messagingAddress,
      required userType,
      required password}) {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.createUser(receivePort.sendPort,
        messagingAddress: messagingAddress,
        userType: userType,
        password: password));
    return receivePort.first.then((data) {
      if (data is User) {
        return data;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on createUser");
    });
  }
}
