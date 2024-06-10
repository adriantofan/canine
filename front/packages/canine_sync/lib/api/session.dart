import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  const Session._();
  const factory Session({
    required int workspaceId,
    required String authId,
    required String token,
    required int userId,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  bool sameAs(Session? other) {
    if (other == null) {
      return false;
    }
    return workspaceId == other.workspaceId &&
        authId == other.authId &&
        userId == other.userId;
  }
}
