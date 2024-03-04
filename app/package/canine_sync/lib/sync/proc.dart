import '../cache/cache.dart';

abstract class Proc<R> {
  R? update(Update changes, Cache cache);
  R? init(Cache cache);
}

// ProcRef is passed over an isolate boundary to the Sync service where it is
// used to build a Proc. This makes easier to design a Proc without having to
// worry about isolate boundaries.
abstract class ProcBuilder<R> {
  Proc<R> build();
}
