import 'package:freezed_annotation/freezed_annotation.dart';

import '../../conversations/model/conversation_info.dart';
import '../../repository/repository.dart';

part 'conversation_container.freezed.dart';

@freezed
sealed class ConversationContainer with _$ConversationContainer {
  const factory ConversationContainer.withConversation(
          {required ConversationInfo conversationInfo}) =
      ConversationContainerWithConversation;
  const factory ConversationContainer.withUser({required User user}) =
      ConversationContainerWithUser;
}
