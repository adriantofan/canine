part of 'create_flow_bloc.dart';

@freezed
class CreateFlowEvent with _$CreateFlowEvent {
  const factory CreateFlowEvent.didSelectUser(User user) =
      CreateFlowEventDidSelectUser;
  const factory CreateFlowEvent.filePressed() = CreateFlowEventFilePressed;
  const factory CreateFlowEvent.devisUploaded() = CreateFlowEventDevisUploaded;
  const factory CreateFlowEvent.userCreated() = CreateFlowEventUserCreated;
  const factory CreateFlowEvent.CreateFlowd() = CreateFlowEventCreateFlowd;
  const factory CreateFlowEvent.cancelStep() = CreateFlowEventCancelStep;
  const factory CreateFlowEvent.cancel() = CreateFlowEventCancel;
}
