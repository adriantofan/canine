import 'dart:isolate';

import 'package:logging/logging.dart';

import '../../cache/in_memory_cache.dart';
import '../sync.dart';
import '../sync_service.dart';
import './msg.dart';
import './sync_skeleton.dart';
import './sync_stub.dart';

Future<Sync> start(String apiBase, String wsBase) async {
  var receivePortStorage = ReceivePort();

  // Needs to happen on the main isolate

  var receivePort = ReceivePort();

  await Isolate.spawn(_runner, [receivePort.sendPort, apiBase, wsBase]);
  final [sendPort, stubSendPort] = await receivePort.first as List<SendPort>;
  stubSendPort.send(receivePortStorage.sendPort);

  SyncStub stub = SyncStub(sendPort);
  return stub;
}

_runner(dynamic ags) async {
  final sendPort = ags[0] as SendPort;
  final apiBase = ags[1] as String;
  final wsBase = ags[2] as String;

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

  final cache = InMemoryCache();
  final syncService = SyncService(cache, apiBase, wsBase);

  // Communicates with SyncStub and delegates actual work to SyncService
  final syncSkeleton = SyncSkeleton(syncService);

  final cancelOnMsg = receivePort.listen((data) {
    // even if this is running async with respect to _work, it is still
    // running in the same isolate, so onMsg and onUpdate are not running
    // concurrently with each other (they are synchronized by the event loop)
    try {
      final msg = data as Msg;
      syncSkeleton.onMsg(msg);
    } catch (e) {
      logger.severe('Error in onMsg', e);
    }
  });
  try {
    await syncService.websocketListen();
  } finally {
    await cancelOnMsg.cancel();
  }
  logger.info('SyncSkeleton terminated');
}
