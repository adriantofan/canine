import 'dart:async';

import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/messages/messages.dart';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

part 'messages_bloc.freezed.dart';
part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  SyncRepository _repository;
  ConversationInfo _conversationinfo;

  final _log = Logger('MessagesBloc');
  MessagesBloc(this._repository, this._conversationinfo)
      : super(const MessagesState([], null)) {
    on<MessagesEventStarted>(_onMessagesEventStarted);
    on<MessagesEventSyncStateChanged>((event, emit) {
      emit(state.copyWith(syncState: event.syncState));
    });
    on<MessagesEventChanges>((event, emit) {
      emit(state.copyWith(messages: event.messages.items));
    });
    on<MessagesEventLoadMore>(_onMessagesEventLoadMore);
  }

  Future<void> _onMessagesEventLoadMore(
      MessagesEventLoadMore event, Emitter<MessagesState> emit) async {
    _repository.conversationMessagesLoadPast(_conversationinfo.conversationId);
  }

  FutureOr<void> _onMessagesEventStarted(event, emit) async {
    var conversationMessagesSyncStateStream = _repository
        .conversationMessagesSyncStateStream(_conversationinfo.conversationId);
    final changes = MergeStream([
      _repository.chatMessages(_conversationinfo.conversationId),
      conversationMessagesSyncStateStream
    ]);
    var isFirst = true;
    await emit.forEach(changes, onData: (changes) {
      switch (changes) {
        case List<ChatMessage>():
          return state.copyWith(messages: changes);
        case ListSyncState():
          if (isFirst) {
            isFirst = false;
            if (changes.startStatus is! RemoteDataStatusComplete) {
              // TODO: this load more should probably be retried if it fails
              add(const MessagesEventLoadMore());
            }
          }
          return state.copyWith(syncState: changes);
        default:
          throw ArgumentError.value(changes, "Invalid change type");
      }
    });
  }
}
