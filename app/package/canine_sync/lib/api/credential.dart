import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';
part 'credential.g.dart';

@freezed
class Credential with _$Credential {
  Credential._();

  factory Credential({
    required int userId,
    required int workspaceId,
    String? token,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);

  factory Credential.fromJWT(String jwt) {
    final parts = jwt.split('.');
    if (parts.length != 3) {
      throw ArgumentError.value(jwt, 'jwt', 'Invalid JWT');
    }
    final payload = parts[1];
    final normalized = base64Url.normalize(payload);
    final String decoded = utf8.decode(base64Url.decode(normalized));
    final Map<String, dynamic> data = json.decode(decoded);
    return Credential(
      userId: int.parse(data['id']),
      workspaceId: int.parse(data['wid']),
      token: jwt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Credential &&
        other.userId == userId &&
        other.workspaceId == workspaceId;
  }

  @override
  int get hashCode => userId.hashCode ^ workspaceId.hashCode;
}
