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
    MsgSubscribeProc msg = MsgSubscribeProc(procBuilder, uuid.v4());
    ReceivePort receivePort = ReceivePort();
    StreamSubscription? streamSubscription;

    controller.onListen = () {
      streamSubscription = receivePort.listen((data) {
        if (data is MsgUnsubscribeProcAck) {
          controller.close();
          streamSubscription!.cancel();
        }
        if (data is R) {
          controller.add(data);
        }
      });
      _sendPort.send([receivePort.sendPort, msg]);
    };
    controller.onCancel = () {
      _sendPort.send(msg.unsubscribe());
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
    MsgAuthStatusSubscribe msg = MsgAuthStatusSubscribe(uuid.v4());
    ReceivePort receivePort = ReceivePort();
    StreamSubscription? streamSubscription;
    controller.onListen = () {
      streamSubscription = receivePort.listen((data) {
        if (data is MsgAuthStatusUnsubscribeAck) {
          controller.close();
          streamSubscription!.cancel();
        }
        if (data is MsgAuthStatusUpdate) {
          controller.add(data.status);
        }
      });
      _sendPort.send([receivePort.sendPort, msg]);
    };

    controller.onCancel = () {
      _sendPort.send(msg.unsubscribe());
    };

    return controller.stream;
  }

  @override
  Future<void> login(int workspaceId, String username, String password) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort.send(
        [receivePort.sendPort, MsgLogin(workspaceId, username, password)]);
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
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
