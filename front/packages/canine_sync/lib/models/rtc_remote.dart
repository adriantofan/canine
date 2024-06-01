import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_range.dart';
import 'range.dart';
import 'user_version.dart';

part 'rtc_remote.freezed.dart';
part 'rtc_remote.g.dart';

@freezed
class RtcRemote with _$RtcRemote {
  const factory RtcRemote({
    Range? conversationsUpdateSeq,
    List<MessageRange>? messageRange,
    UserVersion? lastKnownUserVersion,
  }) = _RtcRemote;

  factory RtcRemote.fromJson(Map<String, dynamic> json) =>
      _$RtcRemoteFromJson(json);
}
