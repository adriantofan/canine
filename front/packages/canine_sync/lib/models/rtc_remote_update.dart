import 'package:freezed_annotation/freezed_annotation.dart';

import 'conversation.dart';
import 'conversation_messages.dart';
import 'user.dart';

part 'rtc_remote_update.freezed.dart';
part 'rtc_remote_update.g.dart';

@freezed
class RTCRemoteUpdate with _$RTCRemoteUpdate {
  const factory RTCRemoteUpdate({
    required List<Conversation> conversations,
    required List<ConversationMessages> messages,
    required List<User> users,
    required String syncToken,
  }) = _RTCRemoteUpdate;

  factory RTCRemoteUpdate.fromJson(Map<String, dynamic> json) =>
      _$RTCRemoteUpdateFromJson(json);
}
