import 'dart:isolate';

import '../api/main.dart';
import '../cache/in_memory_cache.dart';
import '../secure_storage/secure_storage_skeleton.dart';
import '../secure_storage/secure_storages_stub.dart';
import 'rpc/sync_skeleton.dart';
import 'rpc/sync_stub.dart';
import 'sync.dart';

Future<Sync> start() async {
  var receivePortStorage = ReceivePort();

  // Needs to happen on the main isolate
  await SecureStorageSkeleton().listen(receivePortStorage);

  var receivePort = ReceivePort();

  await Isolate.spawn(_runner, receivePort.sendPort);
  final [sendPort, stubSendPort] = await receivePort.first as List<SendPort>;
  stubSendPort.send(receivePortStorage.sendPort);

  SyncStub stub = SyncStub(sendPort);
  return stub;
}

_runner(SendPort sendPort) async {
  ReceivePort receivePort = ReceivePort();
  final tmpReceivePort = ReceivePort();

  sendPort.send([receivePort.sendPort, tmpReceivePort.sendPort]);

  SendPort sendPortStorage = await tmpReceivePort.first as SendPort;
  SecureStoragesStub stub = SecureStoragesStub(sendPortStorage);

  final cache = InMemoryCache();
  APIClient apiClient = APIClient(stub);
  await apiClient.init(); // loads credentials from disk

  final sync = SyncSkeleton(cache, apiClient);

  final cancelOnMsg = receivePort.listen((data) {
    // even if this is running async with respect to _work, it is still
    // running in the same isolate, so onMsg and onUpdate are not running
    // concurrently with each other (they are synchronized by the event loop)
    try {
      sync.onMsg(data);
    } catch (e) {
      print('Error in onMsg: $e');
      // TODO: should we crash the isolate here?
    }
  });
  try {
    await sync.websocketListen();
  } finally {
    await cancelOnMsg.cancel();
  }
  print("SyncSkeleton stopped");
}
