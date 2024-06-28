import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_serializer.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required int id,
    required int externalUserId,
    required String name,
    required int workspaceId,
    @TimestampSerializer() required DateTime createdAt,
    @TimestampSerializer() required DateTime updatedAt,
    // required int lastMessageId,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
