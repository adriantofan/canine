import '../api/credential_set.dart';

abstract class SecureStorage {
  Future<CredentialSet?> getCredentials();
  Future<void> setCredentials(CredentialSet? credential);
}
