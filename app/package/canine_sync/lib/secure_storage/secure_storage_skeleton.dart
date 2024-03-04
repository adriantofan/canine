import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/credential_set.dart';
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
            await setCredentialSets(msg.credential);
            msg.sendPort.send(null);
          } catch (e) {
            // TODO:  does this work?
            msg.sendPort.send(Exception(e.toString()));
          }

        case MsgGetCredential():
          try {
            final credential = await getCredentialSet();
            msg.sendPort.send(credential);
          } catch (e) {
            msg.sendPort.send(Exception(e.toString()));
          }
        default:
          print('SecureStorageSkeleton: unknown message: $msg');
      }
    });
  }

  Future<void> setCredentialSets(CredentialSet? credential) async {
    // TODO: handle PlatformException
    if (credential != null) {
      // TODO: unclear why is this necessary
      await _storage.delete(key: kSecureStorageCredentialKey);
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

  Future<CredentialSet?> getCredentialSet() async {
    // TODO: handle PlatformException
    final credentialStr = await _storage.read(key: kSecureStorageCredentialKey);

    if (credentialStr != null) {
      try {
        return CredentialSet.fromJson(jsonDecode(credentialStr));
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
