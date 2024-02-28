import 'dart:isolate';

import '../api/credential.dart';

class MsgSetCredential {
  final Credential? credential;
  final SendPort sendPort;
  MsgSetCredential(this.credential, this.sendPort);
}
