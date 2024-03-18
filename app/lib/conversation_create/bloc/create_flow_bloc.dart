import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_flow_bloc.freezed.dart';
part 'create_flow_event.dart';
part 'create_flow_state.dart';

class CreateFlowBloc extends Bloc<CreateFlowEvent, CreateFlowState> {
  final Function(Conversation?) _didSelectConversation;
  final SyncRepository _repository;
  CreateFlowBloc(this._repository, this._didSelectConversation)
      : super(const CreateFlowState.nothingSelected()) {
    on<CreateFlowEventDidSelectUser>((event, emit) {
      emit(CreateFlowState.withUser(event.user));
    });
    on<CreateFlowEventFilePressed>((event, emit) {
      emit(const CreateFlowState.withDevis(CreateFlowDevisState.form()));
    });
    on<CreateFlowEventDevisUploaded>((event, emit) {
      if (state case CreateFlowStateWithDevis(:final devisFlow)) {
        emit(CreateFlowState.withDevis(devisFlow.copyWith(
          step: CreateFlowDevisStep.createDevisUser,
          file: event.file,
        )));
        return;
      }
      throw UnimplementedError('Unknown state CreateFlowBloc: $state');
    });
    on<CreateFlowEventUserCreated>((event, emit) {});
    on<CreateFlowEventCreateFlowd>((event, emit) {
      emit(const CreateFlowState.nothingSelected());
    });
    on<CreateFlowEventCancelStep>((event, emit) {
      emit(const CreateFlowState.nothingSelected());
    });
    on<CreateFlowEventCancel>((event, emit) {
      _didSelectConversation(null);
    });

    on<CreateFlowEventDidPop>((event, emit) {
      emit(state.previous);
    });
  }
}
