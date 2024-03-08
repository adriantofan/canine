part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started() = MessagesEventStarted;
  const factory MessagesEvent.changes(ListChange<ChatMessage, int> messages) =
      MessagesEventChanges;

  const factory MessagesEvent.historyChanged(HistoryState history) =
      MessagesEventHistoryChanged;
  const factory MessagesEvent.loadPast() = MessagesEventLoadMore;
}
