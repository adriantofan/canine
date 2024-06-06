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
    switch (changes) {
      case UpdateMessagesAdded():
        return null;
      case UpdateServer():
        return _prev = _handelUpdateServer(_prev!, changes, cache);
    }
  }

  List<User> _handelUpdateServer(
      List<User> prev, UpdateServer changes, Cache cache) {
    final message = changes.message;
    switch (message) {
      case APIServerUpdateInvalid():
      case APIServerUpdateMessage():
      case APIServerUpdateConversation():
        return prev;
      case APIServerUpdateUsers():
        if (message.kind == APIServerUpdateKind.create) {
          final user = message.data;
          return [...prev, user]..sort((a, b) => a.email.compareTo(b.email));
        } else {
          _log.warning(
              "UsersProc._handelUpdateServer: 🟡UNIMPLEMENTED $message");
          return prev;
        }
    }
  }

  List<User> bootstrap(Cache cache) {
    return cache.users.toList()..sort((a, b) => a.email.compareTo(b.email));
  }
}
