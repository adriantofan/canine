import 'package:canine_sync/canine_sync.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/create_flow_cubit.dart';
import '../view/view.dart';

List<Page> onGeneratePages(CreateFlowState state, List<Page<dynamic>> pages) {
  switch (state) {
    case CreateFlowStateNothingSelected():
      return [_userListPage()];
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
      }
    default:
      throw UnimplementedError('Unknown state: $state');
  }
}

Page<void> _userListPage() => UserListPage.page(
    _onFlowCancelled, _userListPageFilePressed, _onUserSelected);

void _onUserSelected((BuildContext, User) result) {
  final (context, user) = result;
  context.read<CreateFlowCubit>().didSelectUser(user);
}

void _onFlowCancelled(BuildContext context) {
  context.read<CreateFlowCubit>().onCanceled();
}

void _userListPageFilePressed(BuildContext context) {
  context.read<CreateFlowCubit>().filePressed();
}

void _devisUploadPageCallback((BuildContext, XFile, DevisRecipient) result) {
  final (context, file, recipient) = result;
  context.read<CreateFlowCubit>().devisUploaded(file, recipient);
}

void _userCreatePageCallback((BuildContext, User) result) {
  final (context, user) = result;
  context.read<CreateFlowCubit>().userCreated(user);
}
