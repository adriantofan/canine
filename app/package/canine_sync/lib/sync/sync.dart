import 'dart:core';

import 'proc.dart';

abstract class Sync {
  Stream<R> addProcRef<R>(ProcBuilder<R> proc);
}
