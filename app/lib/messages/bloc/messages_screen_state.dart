part of 'messages_screen_cubit.dart';

@freezed
class MessagesScreenState with _$MessagesScreenState {
  factory MessagesScreenState.initial(
      {required ConversationContainer conversationContainer}) = _Initial;
}
