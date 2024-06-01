import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/conversation.dart';
import '../../models/message.dart';
import '../../models/user.dart';
import 'api_server_update_kind.dart';

part 'api_server_update.freezed.dart';
part 'api_server_update.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
sealed class APIServerUpdate with _$APIServerUpdate {
  const factory APIServerUpdate() = APIServerUpdateInvalid;

  @FreezedUnionValue('user')
  const factory APIServerUpdate.users(
          @APIServerUpdateKindConverter() APIServerUpdateKind kind, User data) =
      APIServerUpdateUsers;

  @FreezedUnionValue('message')
  const factory APIServerUpdate.message(
      @APIServerUpdateKindConverter() APIServerUpdateKind kind,
      Message data) = APIServerUpdateMessage;

  @FreezedUnionValue('conversation')
  const factory APIServerUpdate.conversations(
      @APIServerUpdateKindConverter() APIServerUpdateKind kind,
      Conversation data) = APIServerUpdateConversation;

  factory APIServerUpdate.fromJson(Map<String, dynamic> json) =>
      _$APIServerUpdateFromJson(json);
}

//TODO: IMPORTANT write tests for all cases to not break the contract
