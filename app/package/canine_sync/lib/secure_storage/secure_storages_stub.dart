import 'dart:isolate';

import '../api/credential.dart';
import './secure_storage.dart';
import 'msg_get_credential.dart';
import 'msg_set_credential.dart';

class SecureStoragesStub implements SecureStorage {
  SendPort _sendPort;
  SecureStoragesStub(this._sendPort);

  @override
  Future<Credential?> getCredentials() async {
    ReceivePort receivePort = ReceivePort();
    final msg = MsgGetCredential(receivePort.sendPort);
    _sendPort.send(msg);
    var result = await receivePort.first;
    if (result is Exception) {
      throw result;
    }
    if (result == null || result is Credential) {
      return result;
    }
    throw Exception('Unexpected result: $result');
  }

  @override
  Future<void> setCredentials(Credential? credential) async {
    ReceivePort receivePort = ReceivePort();
    final msg = MsgSetCredential(credential, receivePort.sendPort);
    _sendPort.send(msg);
    var result = receivePort.first;
    if (result is Exception) {
      throw result;
    }
  }
}
