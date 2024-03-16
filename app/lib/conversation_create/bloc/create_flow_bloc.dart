import 'package:bloc/bloc.dart';
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
      emit(CreateFlowState.creatingWithUser(event.user));
    });
    on<CreateFlowEventFilePressed>((event, emit) {
      emit(const CreateFlowState.uploadDevis());
    });
    on<CreateFlowEventDevisUploaded>((event, emit) {
      emit(const CreateFlowState.createDevisUser());
    });
    on<CreateFlowEventUserCreated>((event, emit) {
      emit(const CreateFlowState.creatingWithDevis());
    });
    on<CreateFlowEventCreateFlowd>((event, emit) {
      emit(const CreateFlowState.nothingSelected());
    });
    on<CreateFlowEventCancelStep>((event, emit) {
      emit(const CreateFlowState.nothingSelected());
    });
    on<CreateFlowEventCancel>((event, emit) {
      _didSelectConversation(null);
    });
  }
}
