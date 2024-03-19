import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_flow_cubit.freezed.dart';
part 'create_flow_state.dart';

class CreateFlowCubit extends Cubit<CreateFlowState> {
  final Function(Conversation?) _didSelectConversation;
  final SyncRepository _repository;

  CreateFlowCubit(this._repository, this._didSelectConversation)
      : super(const CreateFlowState.nothingSelected());

  void didSelectUser(User user) {
    emit(CreateFlowState.withUser(user));
  }

  void filePressed() {
    emit(const CreateFlowState.withDevis(CreateFlowDevisState.form()));
  }

  void devisUploaded(XFile file, DevisRecipient recipient) {
    if (state case CreateFlowStateWithDevis(:final devisFlow)) {
      emit(CreateFlowState.withDevis(devisFlow.copyWith(
        step: CreateFlowDevisStep.createDevisUser,
        file: file,
        recipient: recipient,
      )));
      return;
    }
    throw UnimplementedError('Unknown state CreateFlowBloc: $state');
  }

  void onCanceled() {
    _didSelectConversation(null);
  }

  void onPop() {
    emit(state.previous);
  }

  void userCreated(User user) {
    if (state case CreateFlowStateWithDevis(:final devisFlow)) {
      emit(CreateFlowState.withDevis(devisFlow.copyWith(user: user)));
      return;
    }
    throw UnimplementedError('Unknown state CreateFlowBloc: $state');
  }
}
