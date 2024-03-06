import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/messages/messages.dart';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'messages_bloc.freezed.dart';
part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  SyncRepository _repository;
  ConversationInfo _conversationinfo;

  final _log = Logger('MessagesBloc');
  MessagesBloc(this._repository, this._conversationinfo)
      : super(const MessagesState([])) {
    on<MessagesEventStarted>((event, emit) async {
      _log.fine("waiting for changes");
      await emit
          .forEach(_repository.chatMessages(_conversationinfo.conversationId),
              onData: (changes) {
        _log.fine("MessagesBloc: got changes ${changes}");
        return MessagesState(changes.items);
      });
    });

    on<MessagesEventChanges>((event, emit) {
      emit(MessagesState(event.messages.items));
    });
  }
}
