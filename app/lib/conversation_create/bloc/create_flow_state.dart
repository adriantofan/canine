part of 'create_flow_bloc.dart';

typedef FileInfo = ({
  String firstName,
  String lastName,
  String telephone,
  String email
});

@freezed
sealed class CreateFlowState with _$CreateFlowState {
  const factory CreateFlowState.nothingSelected() =
      CreateFlowStateNothingSelected;
  const factory CreateFlowState.creatingWithUser(User user) =
      CreateFlowStateCreatingWithUser;
  const factory CreateFlowState.uploadDevis() = CreateFlowStateUploadDevis;
  const factory CreateFlowState.createDevisUser() =
      CreateFlowStateCreateDevisUser;
  const factory CreateFlowState.creatingWithDevis() =
      CreateFlowStateCreatingWithDevis;
}
