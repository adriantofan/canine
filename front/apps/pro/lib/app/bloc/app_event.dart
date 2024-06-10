part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.initial() = AppEventInitial;
  const factory AppEvent.authInfoFetched(
      List<AuthInfo> authInfo, String authId) = AppEventAuthInfoFetched;
  const factory AppEvent.logout() = AppEventLogout;
  const factory AppEvent.changeWorkspace(int workspaceId) =
      AppEventChangeWorkspace;
}
