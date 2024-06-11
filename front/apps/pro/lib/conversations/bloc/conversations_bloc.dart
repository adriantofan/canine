import 'dart:ui';

import 'package:app/app/routes/routes.dart';
import 'package:app/conversations/bloc/conversations_state.dart';
import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'conversations_event.dart';

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  SyncRepository _repository;
  late final VoidCallback listener;

  final _log = Logger('ConversationsBloc');
  ConversationsBloc(SyncRepository repository)
      : _repository = repository,
        super(ConversationsState.empty()) {
    listener = () {
      if (!AppRouter.onConversations) {
        return;
      }
      final maybeConversationId = AppRouter.crtConversationRouteId;

      if (maybeConversationId != null) {
        add(ConversationsRouteChanged('$maybeConversationId'));
      } else {
        add(ConversationsDeselect());
      }
    };

    AppRouter.router.routeInformationProvider.addListener(listener);
    on<ConversationsInitial>((event, emit) async {
      await emit.forEach(_repository.conversations(), onData: (changes) {
        return state.withChanges(changes, _repository);
      });
    });

    on<ConversationsSelect>((event, emit) {
      emit(state.withSelection(event.conversation));
    });

    on<ConversationsRouteChanged>((event, emit) {
      emit(state.withConversationId(event.id));
    });

    on<ConversationsDeselect>((event, emit) {
      emit(state.withSelection(null));
    });
  }
  @override
  Future<void> close() {
    AppRouter.router.routeInformationProvider.removeListener(listener);
    return super.close();
  }
}
