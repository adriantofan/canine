import '../ws/ws.dart';
import 'rpc/msg.dart';

// This interface must remain synchronous otherwise onMsg might be called
// concurrently with onUpdate, which would lead to data races.
mixin SyncWorker {
  onMsg(Msg msg) {}
  onUpdate(APIServerMessage message) {}
}
