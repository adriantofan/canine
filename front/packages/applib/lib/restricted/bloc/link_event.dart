part of 'link_bloc.dart';

@freezed
class LinkEvent with _$LinkEvent {
  const factory LinkEvent.started() = LinkEventStarted;
  const factory LinkEvent.authzCheck() = LinkEventAuthzCheck;
  const factory LinkEvent.didValidate(bool success) = LinkEventDidValidate;
}
