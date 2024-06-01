import 'package:app/messages/model/draft_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'draft_conversation.freezed.dart';

@freezed
class DraftConversation with _$DraftConversation {
  const factory DraftConversation({
    required User user,
    required DraftMessage message,
  }) = _NewConversation;
}
