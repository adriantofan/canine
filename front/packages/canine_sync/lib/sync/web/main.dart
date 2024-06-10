import '../../api/api.dart';
import '../../cache/in_memory_cache.dart';
import '../sync.dart';
import '../sync_service.dart';

Future<Sync> start(String apiBase, String wsBase, Session session) async {
  final cache = InMemoryCache();

  final syncService = SyncService(cache, apiBase, wsBase, session);
  syncService.websocketListen();
  return syncService;
}
