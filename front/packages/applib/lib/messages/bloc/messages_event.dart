part of 'messages_bloc.dart';

@freezed
class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started() = MessagesEventStarted;
  const factory MessagesEvent.changes(ListUpdate<ChatMessage> messages) =
      MessagesEventChanges;

  const factory MessagesEvent.syncStateChanged(ListSyncState syncState) =
      MessagesEventSyncStateChanged;
  const factory MessagesEvent.loadPast() = MessagesEventLoadMore;
}
