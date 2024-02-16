import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_serializer.dart';

part 'user_version.freezed.dart';
part 'user_version.g.dart';

@freezed
class UserVersion with _$UserVersion {
  const factory UserVersion({
    @TimestampSerializer() required DateTime maxUpdateTime,
  }) = _UserVersion;

  factory UserVersion.fromJson(Map<String, dynamic> json) =>
      _$UserVersionFromJson(json);
}
