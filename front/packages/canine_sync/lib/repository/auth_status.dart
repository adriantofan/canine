import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/auth/auth.dart';

part 'auth_status.freezed.dart';
part 'auth_status.g.dart';

@freezed
sealed class AuthStatus with _$AuthStatus {
  const AuthStatus._();
  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.disconnected() = AuthStatusDisconnected;
  const factory AuthStatus.authenticated(
          ProjectRoles roles, String authId, String token) =
      AuthStatusAuthenticated;

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);

  bool get hasGrants =>
      this is AuthStatusAuthenticated &&
      (this as AuthStatusAuthenticated).roles.isNotEmpty;
  bool get doesNotHaveGrants => !hasGrants;
}
