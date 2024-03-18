import 'dart:isolate';

import '../api/credential_set.dart';
import './secure_storage.dart';
import 'msg_get_credential.dart';
import 'msg_set_credential.dart';

class SecureStoragesStub implements SecureStorage {
  final SendPort _sendPort;
  SecureStoragesStub(this._sendPort);

  @override
  Future<CredentialSet?> getCredentials() async {
    ReceivePort receivePort = ReceivePort();
    final msg = MsgGetCredential(receivePort.sendPort);
    _sendPort.send(msg);
    var result = await receivePort.first;
    if (result is Exception) {
      throw result;
    }
    if (result == null || result is CredentialSet) {
      return result;
    }
    throw Exception('Unexpected result: $result');
  }

  @override
  Future<void> setCredentials(CredentialSet? credential) async {
    ReceivePort receivePort = ReceivePort();
    final msg = MsgSetCredential(credential, receivePort.sendPort);
    _sendPort.send(msg);
    var result = receivePort.first;
    if (result is Exception) {
      throw result;
    }
  }
}
