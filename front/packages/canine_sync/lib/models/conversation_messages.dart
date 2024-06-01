import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'conversation_messages.freezed.dart';
part 'conversation_messages.g.dart';

@freezed
class ConversationMessages with _$ConversationMessages {
  const factory ConversationMessages({
    required int conversationId,
    required List<Message> messages,
  }) = _ConversationMessages;

  factory ConversationMessages.fromJson(Map<String, dynamic> json) =>
      _$ConversationMessagesFromJson(json);
}
