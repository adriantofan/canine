import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/conversation.dart';
import '../../models/message.dart';

part 'api_server_message.freezed.dart';
part 'api_server_message.g.dart';

@Freezed(unionKey: 'kind', unionValueCase: FreezedUnionCase.pascal)
sealed class APIServerMessage with _$APIServerMessage {
  const factory APIServerMessage() = APIServerMessageInvalid;

  @FreezedUnionValue('messages')
  const factory APIServerMessage.messages(List<Message> data) =
      APIServerMessageMessages;

  @FreezedUnionValue('conversations')
  const factory APIServerMessage.conversations(List<Conversation> data) =
      APIServerMessageConversations;

  @FreezedUnionValue('syncCompleted')
  const factory APIServerMessage.syncCompleted() =
      APIServerMessageSyncCompleted;

  factory APIServerMessage.fromJson(Map<String, dynamic> json) =>
      _$APIServerMessageFromJson(json);
}

//TODO: write tests for all cases to not break the contract
