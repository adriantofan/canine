import 'package:flutter/foundation.dart';

import 'rpc/main.dart' as rpc;
import 'sync.dart';
import 'web/main.dart' as web;

Future<Sync> start(String apiBase, String wsBase) async {
  if (kIsWeb) {
    return web.start(apiBase, wsBase);
  }
  return rpc.start(apiBase, wsBase);
}
