import 'package:flutter/material.dart';

import '../bloc/create_flow_bloc.dart';
import '../view/view.dart';

List<Page> onGeneratePages(CreateFlowState state, List<Page<dynamic>> pages) {
  switch (state) {
    case CreateFlowStateNothingSelected():
      return [UserListPage.page()];
    case CreateFlowStateWithUser():
      return [];
    case CreateFlowStateWithDevis(:final devisFlow):
      switch (devisFlow.step) {
        case CreateFlowDevisStep.uploadDevis:
          return [UserListPage.page(), DevisUploadPage.page()];
        case CreateFlowDevisStep.createDevisUser:
          return [
            UserListPage.page(),
            DevisUploadPage.page(),
            UserCreatePage.page()
          ];
        case CreateFlowDevisStep.creatingWithDevis:
          return [];
      }
    default:
      throw UnimplementedError('Unknown state: $state');
  }
}
