import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_serializer.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserType {
  @JsonValue('external')
  external,
  @JsonValue('internal')
  internal,
  @JsonValue('bot')
  bot;

  Object toJson() {
    switch (this) {
      case UserType.external:
        return 'external';
      case UserType.internal:
        return 'internal';
      case UserType.bot:
        return 'bot';
    }
  }

  static UserType fromJson(String type) {
    switch (type) {
      case 'external':
        return UserType.external;
      case 'internal':
        return UserType.internal;
      case 'bot':
        return UserType.bot;
      default:
        throw Exception('Unknown UserType: $type');
    }
  }
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required int workspaceId,
    required String messagingAddress,
    required UserType type,
    @TimestampSerializer() required DateTime createdAt,
    @TimestampSerializer() required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
