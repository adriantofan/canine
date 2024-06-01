import 'package:freezed_annotation/freezed_annotation.dart';

import '../../canine_sync.dart';

part 'updates.freezed.dart';

@freezed
sealed class Update with _$Update {
  const factory Update.messagesAdded(
      int conversationId, List<Message> newMessages) = UpdateMessagesAdded;
  const factory Update.server(APIServerUpdate message) = UpdateServer;
}
