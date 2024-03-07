import 'dart:async';
import 'dart:isolate';

import 'package:uuid/uuid.dart';

import '../../api/main.dart';
import '../../models/api_error.dart';
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
  Stream<R> addProcRef<R>(ProcBuilder<R> proc) {
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
}
