import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';
import '../bloc/create_flow_bloc.dart';
import '../view/view.dart';

List<Page> onGeneratePages(CreateFlowState state, List<Page<dynamic>> pages) {
  switch (state) {
    case CreateFlowStateNothingSelected():
      return [_userListPage()];
    case CreateFlowStateWithUser():
      return [];
    case CreateFlowStateWithDevis(:final devisFlow):
      switch (devisFlow.step) {
        case CreateFlowDevisStep.uploadDevis:
          return [
            _userListPage(),
            DevisUploadPage.page(_devisUploadPageCallback)
          ];
        case CreateFlowDevisStep.createDevisUser:
          return [
            _userListPage(),
            DevisUploadPage.page(_devisUploadPageCallback),
            UserCreatePage.page(
              devisFlow.recipient!,
              _userCreatePageCallback,
            )
          ];
        case CreateFlowDevisStep.creatingWithDevis:
          return [];
      }
    default:
      throw UnimplementedError('Unknown state: $state');
  }
}

Page<void> _userListPage() =>
    UserListPage.page(_onFlowCancelled, _userListPageFilePressed);

void _onFlowCancelled(BuildContext context) {
  context.read<CreateFlowBloc>().add(const CreateFlowEvent.cancel());
}

void _userListPageFilePressed(BuildContext context) {
  context.read<CreateFlowBloc>().add(const CreateFlowEvent.filePressed());
}

void _devisUploadPageCallback((BuildContext, XFile, DevisRecipient) result) {
  final (context, file, recipient) = result;
  context
      .read<CreateFlowBloc>()
      .add(CreateFlowEvent.devisUploaded(file, recipient));
}

void _userCreatePageCallback((BuildContext, User) result) {
  final (context, user) = result;
  context.read<CreateFlowBloc>().add(CreateFlowEvent.userCreated(user));
}
