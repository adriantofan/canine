import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repository/repository.dart';

part 'create_flow_cubit.freezed.dart';
part 'create_flow_state.dart';

class CreateFlowCubit extends Cubit<CreateFlowState> {
  final ValueSetter<(User?, XFile?)> _endWithCreate;
  CreateFlowCubit(this._endWithCreate)
      : super(const CreateFlowState.nothingSelected());

  void didSelectUser(User user) {
    _endWithCreate((user, null));
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
    _endWithCreate((null, null));
  }

  void onPop() {
    emit(state.previous);
  }

  void userCreated(User user) {
    if (state case CreateFlowStateWithDevis(:final devisFlow)) {
      _endWithCreate((user, devisFlow.file));
      return;
    }
    throw UnimplementedError('Unknown state CreateFlowBloc: $state');
  }
}
