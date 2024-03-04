import 'package:app/conversations/bloc/conversations_state.dart';
import 'package:app/conversations/model/conversation_info.dart';
import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'conversations_event.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  SyncRepository _repository;
  final _log = Logger('ConversationsBloc');
  ConversationsBloc(SyncRepository repository)
      : _repository = repository,
        super(ConversationsState.empty()) {
    on<ConversationsInitial>((event, emit) async {
      await emit.forEach(_repository.conversations(), onData: (changes) {
        _log.fine("ConversationsBloc: got changes ${changes}");
        return state.withChanges(changes, _repository);
      });
    });
    on<ConversationsSelect>((event, emit) {
      emit(state.withSelection(event.conversation));
    });
  }
}
