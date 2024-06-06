import '../../cache/in_memory_cache.dart';
import '../sync.dart';
import '../sync_service.dart';

Future<Sync> start(String apiBase, String wsBase) async {
  final cache = InMemoryCache();

  final syncService = SyncService(cache, apiBase, wsBase);
  syncService.websocketListen();
  return syncService;
}
