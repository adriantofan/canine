import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/auth/auth.dart';

part 'auth_status.freezed.dart';
part 'auth_status.g.dart';

@freezed
sealed class AuthStatus with _$AuthStatus {
  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.disconnected() = AuthStatusDisconnected;
  const factory AuthStatus.restricted() = AuthStatusRestricted;
  const factory AuthStatus.authenticated(ProjectRoles roles) =
      AuthStatusAuthenticated;

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);
}
