part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.initial() = AppEventInitial;
  const factory AppEvent.logout() = AppEventLogout;
}
