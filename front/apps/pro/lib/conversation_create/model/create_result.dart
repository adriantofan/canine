import 'package:app/conversations/conversations.dart';
import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_result.freezed.dart';

@freezed
sealed class CreateFlowResult with _$CreateFlowResult {
  factory CreateFlowResult.cancel() = CreateFlowResultCancel;
  factory CreateFlowResult.devis(XFile file, User user) = CreateFlowResultDevis;
  factory CreateFlowResult.user(User user) = CreateFlowResultUser;
  factory CreateFlowResult.conversation(ConversationInfo conversation) =
      CreateFlowResultConversation;
}
