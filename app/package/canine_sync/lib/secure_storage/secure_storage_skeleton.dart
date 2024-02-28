import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/credential.dart';
import 'msg_get_credential.dart';
import 'msg_set_credential.dart';

const kSecureStorageCredentialKey = 'canine_credential';

class SecureStorageSkeleton {
  // TODO: deal with WEB
  final _storage =
      const FlutterSecureStorage(); // TODO: maybe we can remove the package requirement here
  StreamSubscription<dynamic>? _subscription;

  listen(ReceivePort receivePort) {
    if (_subscription != null) {
      throw Exception('Already started SecureStorageSkeleton.');
    }

    _subscription = receivePort.listen((msg) async {
      switch (msg) {
        case MsgSetCredential():
          try {
            await setCredentials(msg.credential);
            msg.sendPort.send(null);
          } catch (e) {
            // TODO:  does this work?
            msg.sendPort.send(Exception(e.toString()));
          }

        case MsgGetCredential():
          try {
            final credential = await getCredential();
            msg.sendPort.send(credential);
          } catch (e) {
            msg.sendPort.send(Exception(e.toString()));
          }
        default:
          print('SecureStorageSkeleton: unknown message: $msg');
      }
    });
  }

  Future<void> setCredentials(Credential? credential) async {
    // TODO: handle PlatformException
    if (credential != null) {
      const options =
          IOSOptions(accessibility: KeychainAccessibility.first_unlock);
      await _storage.write(
          key: kSecureStorageCredentialKey,
          value: jsonEncode(credential),
          iOptions: options);
    } else {
      await _storage.delete(key: kSecureStorageCredentialKey);
    }
  }

  Future<Credential?> getCredential() async {
    // TODO: handle PlatformException
    final credentialStr = await _storage.read(key: kSecureStorageCredentialKey);

    if (credentialStr != null) {
      try {
        return Credential.fromJson(jsonDecode(credentialStr));
      } catch (e) {
        print('Error reading credential from storage: $e. Deleted.');
        await _storage.delete(key: kSecureStorageCredentialKey);
      }
    }
    return null;
  }

  void dispose() {
    _subscription?.cancel();
  }
}
