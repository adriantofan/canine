import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'identity.dart';

part 'credential_set.freezed.dart';
part 'credential_set.g.dart';

@freezed
class CredentialSet with _$CredentialSet {
  CredentialSet._();

  factory CredentialSet({
    required Identity identity,
    String? token,
    DateTime? tokenExpiration,
  }) = _Credential;

  factory CredentialSet.fromJson(Map<String, dynamic> json) =>
      _$CredentialSetFromJson(json);

  factory CredentialSet.fromJWT(String jwt, String username) {
    final parts = jwt.split('.');
    if (parts.length != 3) {
      throw ArgumentError.value(jwt, 'jwt', 'Invalid JWT');
    }
    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final String decoded = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> data = json.decode(decoded);
    return CredentialSet(
      identity: Identity(
        userId: int.parse(data['id']),
        workspaceId: int.parse(data['wid']),
        username: username,
      ),
      token: jwt,
      tokenExpiration: DateTime.fromMillisecondsSinceEpoch(data['exp'] * 1000),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CredentialSet && other.identity == identity;
  }

  @override
  int get hashCode => identity.hashCode;

  bool get isAuthenticated => token != null;
  bool get authExpired =>
      token == null ||
      (isAuthenticated && tokenExpiration!.isBefore(DateTime.now()));
}
