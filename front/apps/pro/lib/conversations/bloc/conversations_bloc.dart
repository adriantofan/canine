import 'dart:ui';

import 'package:app/conversations/bloc/conversations_state.dart';
import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import '../../router.dart';

part 'conversations_bloc.freezed.dart';
part 'conversations_event.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  SyncRepository _repository;
  late final VoidCallback routeListener;

  final _log = Logger('ConversationsBloc');
  ConversationsBloc(SyncRepository repository)
      : _repository = repository,
        super(ConversationsState.empty()) {
    routeListener = () {
      if (!AppRouter.onConversations) {
        return;
      }
      final maybeConversationId = AppRouter.crtConversationRouteId;

      if (maybeConversationId != null) {
        add(ConversationsEvent.routeChanged('$maybeConversationId'));
      } else {
        add(const ConversationsEvent.deselect());
      }
    };

    AppRouter.router.routeInformationProvider.addListener(routeListener);
    on<ConversationsEventInitial>((event, emit) async {
      await emit.forEach(_repository.conversations(), onData: (changes) {
        return state.withChanges(changes, _repository);
      });
    });

    on<ConversationsEventSelect>((event, emit) {
      emit(state.withSelection(event.conversation));
    });

    on<ConversationsEventRouteChanged>((event, emit) {
      emit(state.withConversationId(event.id));
    });

    on<ConversationsEventDeselect>((event, emit) {
      emit(state.withSelection(null));
    });
  }
  @override
  Future<void> close() {
    AppRouter.router.routeInformationProvider.removeListener(routeListener);
    return super.close();
  }
}
