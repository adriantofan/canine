import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/model.dart';
import 'list_update.dart';

part 'updates.freezed.dart';

@freezed
sealed class Update with _$Update {
  const factory Update.conversations(ListUpdate<Conversation> update) =
      ConversationsUpdate;
  const factory Update.messages(
      int conversationId, ListUpdate<Message> update) = MessagesUpdate;
  const factory Update.users(ListUpdate<User> update) = UsersUpdate;
}
