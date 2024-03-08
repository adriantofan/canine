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
    on<MessagesEventStarted>((event, emit) async {
      _log.fine("waiting for changes");
      final changes = MergeStream([
        _repository.chatMessages(_conversationinfo.conversationId),
        _repository.conversationHistoryStream(_conversationinfo.conversationId)
      ]);
      await emit.forEach(changes, onData: (changes) {
        _log.fine("MessagesBloc: got changes ${changes}");
        switch (changes) {
          case ListChange<ChatMessage, int>():
            return state.copyWith(messages: changes.items);
          case HistoryState():
            return state.copyWith(historyState: changes);
          default:
            throw ArgumentError.value(changes, "Invalid change type");
        }
      });
    });

    on<MessagesEventHistoryChanged>((event, emit) {
      emit(state.copyWith(historyState: event.history));
    });

    on<MessagesEventChanges>((event, emit) {
      emit(state.copyWith(messages: event.messages.items));
    });
  }
}
