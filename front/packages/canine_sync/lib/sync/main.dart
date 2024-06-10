import 'package:flutter/foundation.dart';

import '../api/session.dart';
import 'rpc/main.dart' as rpc;
import 'sync.dart';
import 'web/main.dart' as web;

Future<Sync> start(String apiBase, String wsBase, Session session) async {
  if (kIsWeb) {
    return web.start(apiBase, wsBase, session);
  }
  return rpc.start(apiBase, wsBase, session);
}
