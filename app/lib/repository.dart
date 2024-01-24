import 'package:app/state/store.dart';

class SyncRepository {
  final Store _store;
  SyncRepository() : _store = Store.shared;
}
