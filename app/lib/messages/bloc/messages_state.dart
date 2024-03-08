part of 'messages_bloc.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState(
      List<ChatMessage> messages, HistoryState? historyState) = _MessageState;
}
