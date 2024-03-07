import 'dart:isolate';

import 'package:logging/logging.dart';

import '../api/main.dart';
import '../cache/in_memory_cache.dart';
import '../secure_storage/secure_storage_skeleton.dart';
import '../secure_storage/secure_storages_stub.dart';
import 'rpc/msg.dart';
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
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (record.error != null || record.stackTrace != null) {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ❗️${record.message} ${record.error} ${record.stackTrace}');
    } else {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
  final logger = Logger('runner');

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
      final msg = data as Msg;
      sync.onMsg(msg);
    } catch (e) {
      logger.severe('Error in onMsg', e);
    }
  });
  try {
    await sync.websocketListen();
  } finally {
    await cancelOnMsg.cancel();
  }
  logger.info('SyncSkeleton terminated');
}
