part of 'app_bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.initial() = AppEventInitial;
  const factory AppEvent.authInfoFetched(
      List<AuthInfo> authInfo, String authId) = AppEventAuthInfoFetched;
  const factory AppEvent.logout() = AppEventLogout;
  // Assumptions:
  // - triggered from the router, before redirecting to some form of authentication / authorization
  // - the target route, will stay on the same place before and after the  changeWorkspace event
  const factory AppEvent.changeWorkspace(int workspaceId, int? conversationId) =
      AppEventChangeWorkspace;
  const factory AppEvent.refreshAuthorization() = AppEventRefresh;
}
