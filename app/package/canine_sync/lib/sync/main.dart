import 'dart:convert';
import 'dart:isolate';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../cache/in_memory_cache.dart';
import '../ws/model/models.dart';
import 'rpc/sync_skeleton.dart';
import 'rpc/sync_stub.dart';
import 'sync.dart';
import 'sync_worker.dart';

Future<Sync> start() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(_runner, receivePort.sendPort);
  final sendPort = await receivePort.first as SendPort;
  SyncStub stub = SyncStub(sendPort);
  return stub;
}

_runner(SendPort sendPort) async {
  ReceivePort receivePort = ReceivePort();
  final cache = InMemoryCache();
  final sync = SyncSkeleton(cache);
  sendPort.send(receivePort.sendPort);
  final cancelOnMsg = receivePort.listen((data) {
    // even if this is running async with respect to _work, it is still
    // running in the same isolate, so onMsg and onUpdate are not running
    // concurrently with each other (they are synchronized by the event loop)
    sync.onMsg(data);
  });
  try {
    await _work(sync, receivePort);
  } finally {
    await cancelOnMsg.cancel();
  }
}

// It would be nice to split websocket connection and sync logic
_work(SyncWorker worker, ReceivePort receivePort) async {
  while (true) {
    try {
      var channel =
          WebSocketChannel.connect(Uri.parse('ws://localhost:8080/echo'));
      await channel.ready;
      channel.sink.add("Initial State");
      await for (var data in channel.stream) {
        var msg = APIServerMessage.fromJson(jsonDecode(data));
        if (msg is APIServerMessageSyncCompleted) {
        } else {
          worker.onUpdate(msg);
        }
      }
    } on Exception catch (e) {
      // print(e);
      await Future.delayed(Duration(seconds: 1));
      // Todo: add exponential backoff
      // TODO: what is going to happen with ongoing procs ?
    }
  }
}
