import 'dart:isolate';

class MsgGetCredential {
  SendPort sendPort;

  MsgGetCredential(this.sendPort);
}
