part of 'create_flow_cubit.dart';

@freezed
sealed class CreateFlowState with _$CreateFlowState {
  const CreateFlowState._();

  const factory CreateFlowState.nothingSelected() =
      CreateFlowStateNothingSelected;
  const factory CreateFlowState.withDevis(CreateFlowDevisState devisFlow) =
      CreateFlowStateWithDevis;

  CreateFlowState get previous {
    switch (this) {
      case CreateFlowStateNothingSelected():
        return const CreateFlowState.nothingSelected();

      case CreateFlowStateWithDevis(:final devisFlow):
        switch (devisFlow.step) {
          case CreateFlowDevisStep.uploadDevis:
            return const CreateFlowState.nothingSelected();
          case CreateFlowDevisStep.createDevisUser:
            return CreateFlowState.withDevis(
                devisFlow.copyWith(step: CreateFlowDevisStep.uploadDevis));
        }
    }
  }
}

enum CreateFlowDevisStep {
  uploadDevis,
  createDevisUser,
}

@freezed
class CreateFlowDevisState with _$CreateFlowDevisState {
  const factory CreateFlowDevisState.form(
      [@Default(CreateFlowDevisStep.uploadDevis) CreateFlowDevisStep step,
      @Default(null) XFile? file,
      @Default(null) DevisRecipient? recipient]) = CreateFlowDevisStateForm;
}
