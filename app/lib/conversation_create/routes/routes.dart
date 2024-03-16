import 'package:app/conversation_create/view/users_list.dart';
import 'package:flutter/material.dart';

import '../bloc/create_flow_bloc.dart';
import '../view/view.dart';

List<Page> onGeneratePages(CreateFlowState state, List<Page<dynamic>> pages) {
  switch (state) {
    case CreateFlowStateNothingSelected():
      return [UserListPage.page()];
    case CreateFlowStateCreatingWithUser():
      return [];
    case CreateFlowStateUploadDevis():
      return [];
    case CreateFlowStateCreateDevisUser():
      return [];
    case CreateFlowStateCreatingWithDevis():
      return [];
  }
}
