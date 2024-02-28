import 'dart:core';

import '../api/main.dart';
import 'proc.dart';

abstract class Sync {
  Stream<R> addProcRef<R>(ProcBuilder<R> proc);
  Future<void> login(int workspaceId, String username, String password);
  Future<void> logout();
  Stream<AuthenticationStatus> get authStatus;
}
