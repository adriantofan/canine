import 'package:flutter/foundation.dart';

import 'rpc/main.dart' as rpc;
import 'sync.dart';
import 'web/main.dart' as web;

Future<Sync> start() async {
  if (kIsWeb) {
    return web.start();
  }
  return rpc.start();
}
