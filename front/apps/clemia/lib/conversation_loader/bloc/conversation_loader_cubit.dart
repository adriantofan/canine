import 'dart:async';

import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'conversation_loader_cubit.freezed.dart';
part 'conversation_loader_state.dart';

class ConversationLoaderCubit extends Cubit<ConversationLoaderState> {
  final SyncRepository syncRepository;
  final int workspaceId;
  late final StreamSubscription<List<ConversationInfo>>? subscription;

  ConversationLoaderCubit({
    required this.workspaceId,
    required this.syncRepository,
  }) : super(ConversationLoaderState.initial(
          workspaceId: workspaceId,
        )) {
    subscription = syncRepository
        .conversations()
        .doOnData((conversations) {
          print('conversations: $conversations');
        })
        .where((changes) => changes.isNotEmpty)
        .take(1)
        .listen((changes) {
          // TODO: maybe deal with situations where there are more than one conversation
          emit(state.copyWith(
            workspaceId: workspaceId,
            conversationInfo: changes.first,
          ));
        });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
