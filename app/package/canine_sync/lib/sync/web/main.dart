import 'package:logging/logging.dart';

import '../../api/api_client.dart';
import '../../api/credential_set.dart';
import '../../cache/in_memory_cache.dart';
import '../../secure_storage/secure_storage.dart';
import '../sync.dart';
import '../sync_service.dart';

class DummySecureStorage implements SecureStorage {
  final Logger _logger = Logger('DummySecureStorage');
  @override
  Future<CredentialSet?> getCredentials() {
    _logger.warning('DummySecureStorage.getCredentials not implemented on web');
    return Future.value(null);
  }

  @override
  Future<void> setCredentials(CredentialSet? credential) {
    _logger.warning('DummySecureStorage.setCredentials not implemented on web');
    return Future.value(null);
  }
}

Future<Sync> start(String apiBase, String wsBase) async {
  final cache = InMemoryCache();
  APIClient apiClient = APIClient(DummySecureStorage(), apiBase, wsBase);
  await apiClient.init(); // loads credentials from disk

  final syncService = SyncService(cache, apiClient);
  syncService.websocketListen();
  return syncService;
}
