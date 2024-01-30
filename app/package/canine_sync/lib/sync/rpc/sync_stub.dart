import 'dart:async';
import 'dart:isolate';

import 'package:uuid/uuid.dart';

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
}
