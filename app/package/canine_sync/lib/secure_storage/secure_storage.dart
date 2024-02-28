import '../api/credential.dart';

abstract class SecureStorage {
  Future<Credential?> getCredentials();
  Future<void> setCredentials(Credential? credential);
}
