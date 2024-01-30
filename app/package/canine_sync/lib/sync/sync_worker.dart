import '../ws/ws.dart';

// This interface must remain synchronous otherwise onMsg might be called
// concurrently with onUpdate, which would lead to data races.
mixin SyncWorker {
  onMsg(List<dynamic> parts) {}
  onUpdate(APIServerMessage message) {}
}
