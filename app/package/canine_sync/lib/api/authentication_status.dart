import 'package:freezed_annotation/freezed_annotation.dart';

import 'identity.dart';

part 'authentication_status.freezed.dart';
part 'authentication_status.g.dart';

@freezed
sealed class AuthenticationStatus with _$AuthenticationStatus {
  factory AuthenticationStatus.unknown() = AuthenticationStatusUnknown;
  factory AuthenticationStatus.unauthenticated(Identity? identity) =
      AuthenticationStatusUnauthenticated;
  factory AuthenticationStatus.authenticated(Identity identity) =
      AuthenticationStatusAuthenticated;

  factory AuthenticationStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationStatusFromJson(json);
}
