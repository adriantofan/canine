part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent._statusChanged(AuthenticationStatus status) =
      _StatusChanged;
}
