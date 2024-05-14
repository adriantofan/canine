import '../../api/api_client.dart';
import '../../cache/in_memory_cache.dart';
import '../sync.dart';
import '../sync_service.dart';

Future<Sync> start(String apiBase, String wsBase) async {
  final cache = InMemoryCache();
  APIClient apiClient = APIClient(apiBase, wsBase);
  await apiClient.init(); // loads credentials from disk

  final syncService = SyncService(cache, apiClient);
  syncService.websocketListen();
  return syncService;
}
