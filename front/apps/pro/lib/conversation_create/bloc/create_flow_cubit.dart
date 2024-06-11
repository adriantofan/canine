import 'package:applib/applib.dart';
import 'package:bloc/bloc.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/create_result.dart';

part 'create_flow_cubit.freezed.dart';
part 'create_flow_state.dart';

class CreateFlowCubit extends Cubit<CreateFlowState> {
  final ValueSetter<CreateFlowResult> _didCreate;
  final SyncRepository _repository;
  CreateFlowCubit(this._didCreate, this._repository)
      : super(const CreateFlowState.nothingSelected());

  void didSelectUser(User user) {
    _repository.conversations().first.then((conversations) {
      try {
        final ConversationInfo conversation = conversations.firstWhere(
          (element) => element.userId == user.id,
        );
        _didCreate(CreateFlowResult.conversation(conversation));
      } on StateError {
        _didCreate(CreateFlowResult.user(user));
      }
    });
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
    _didCreate(CreateFlowResult.cancel());
  }

  void onPop() {
    emit(state.previous);
  }

  void userCreated(User user) {
    if (state case CreateFlowStateWithDevis(:final devisFlow)) {
      if (devisFlow.file != null) {
        _didCreate(CreateFlowResult.devis(devisFlow.file!, user));
      } else {
        _didCreate(CreateFlowResult.user(user));
      }
      return;
    }
    throw UnimplementedError('Unknown state CreateFlowBloc: $state');
  }
}
