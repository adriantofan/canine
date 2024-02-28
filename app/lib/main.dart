import 'package:app/repository/repository.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sync = await start();
  final repository = SyncRepository(sync);
  runApp(MainApp(
    repository: repository,
  ));
}
