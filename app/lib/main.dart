import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app/app.dart';

void main() async {
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
  WidgetsFlutterBinding.ensureInitialized();
  final sync = await start();
  final repository = SyncRepository(sync);
  runApp(MainApp(
    repository: repository,
  ));
}
