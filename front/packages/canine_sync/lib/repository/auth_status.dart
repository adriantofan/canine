import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';
part 'auth_status.g.dart';

enum AuthStatusLoginState {
  disconnected,
  connecting,
  link,
  rejected,
}

@freezed
sealed class AuthStatus with _$AuthStatus {
  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.disconnected() = AuthStatusDisconnected;
  const factory AuthStatus.login(AuthStatusLoginState state) = AuthStatusLogin;
  const factory AuthStatus.authenticated() = AuthStatusAuthenticated;

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);
}
