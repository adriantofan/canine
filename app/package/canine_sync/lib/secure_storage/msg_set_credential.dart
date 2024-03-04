import 'dart:isolate';

import '../api/credential_set.dart';

class MsgSetCredential {
  final CredentialSet? credential;
  final SendPort sendPort;
  MsgSetCredential(this.credential, this.sendPort);
}
