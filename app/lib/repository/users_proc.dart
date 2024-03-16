import 'package:canine_sync/canine_sync.dart';
import 'package:logging/logging.dart';

class UsersProcRef implements ProcBuilder<List<User>> {
  @override
  Proc<List<User>> build() {
    return UsersProc();
  }
}

class UsersProc implements Proc<List<User>> {
  final _log = Logger('UpdateUsersProc');
  List<User>? _prev;

  @override
  List<User>? init(Cache cache) {
    return _prev = bootstrap(cache);
  }

  @override
  List<User>? update(Update changes, Cache cache) {
    if (_prev == null) {
      return _prev = bootstrap(cache);
    }
    _log.warning("UpdateUsersProc.update: 🟡UNIMPLEMENTED $changes");
    return _prev;
  }

  List<User> bootstrap(Cache cache) {
    return cache.users.toList()
      ..sort((a, b) => a.messagingAddress.compareTo(b.messagingAddress));
  }
}
