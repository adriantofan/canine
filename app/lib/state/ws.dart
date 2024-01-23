import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws.freezed.dart';
part 'ws.g.dart';

@Freezed(unionKey: 'kind', unionValueCase: FreezedUnionCase.pascal)
sealed class ServerMessage with _$ServerMessage {
  const factory ServerMessage() = ServerMessageInvalid;

  @FreezedUnionValue('messages')
  const factory ServerMessage.messages(List<Message> data) =
      ServerMessageMessages;

  @FreezedUnionValue('conversations')
  const factory ServerMessage.conversations(List<Conversation> data) =
      ServerMessageConversations;

  factory ServerMessage.fromJson(Map<String, dynamic> json) =>
      _$ServerMessageFromJson(json);
}

class ClientMessage {}

class SyncMessage extends ClientMessage {
  SyncMessage();
}

class SyncCompleted extends ClientMessage {}
// Domain model

@freezed
class Message with _$Message {
  const factory Message({
    required int id,
    required int conversationId,
    required int senderId,
    required String message,
    required String type,
    required int createdAt, // TODO: use DateTime, requires converter
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class Conversation with _$Conversation {
  const factory Conversation({
    required int id,
    required int externalUserId,
    required String name,
    required int createdAt,
    required int updatedAt,
    // required int lastMessageId,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String messagingAddress,
    required String type,
    required int createdAt,
    required int updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
