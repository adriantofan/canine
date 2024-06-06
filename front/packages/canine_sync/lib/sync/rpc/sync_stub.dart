import 'dart:async';
import 'dart:isolate';

import 'package:file_selector/file_selector.dart';
import 'package:uuid/uuid.dart';

import '../../api/session.dart';
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
  Future<void> connect(Session session) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.connect(receivePort.sendPort, session));
    await for (var data in receivePort) {
      if (data == null) {
        return;
      }

      if (data is APIError) {
        throw data;
      }

      throw ArgumentError.value(
          data, "Invalid response from canine_sync on connect");
    }

    throw AssertionError("canine_sync did not respond to connect");
  }

  @override
  Future<void> disconnect() async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.disconnect(receivePort.sendPort));
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
  Future<Message> createMessage(int conversationId, String text,
      String idempotencyId, List<XFile> attachments) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(Msg.createMessage(receivePort.sendPort, conversationId, text,
        idempotencyId, attachments));
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
