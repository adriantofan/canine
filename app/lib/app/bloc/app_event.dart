part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.statusChanged(AuthenticationStatus status) =
      StatusChanged;
  const factory AppEvent.logout() = Logout;
}
