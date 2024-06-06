import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

enum AppType { pro, consumer }

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  final APIClientBase _apiClient;
  final appType = AppType.pro;
  final _logger = Logger('MainApp');

  int? get workspaceId =>
      (state is AppStateReady) ? (state as AppStateReady).workspaceId : null;

  bool get isAuthenticated => state is! AppStateUnauthenticated;
  bool get isReady => state is AppStateReady;

  AppBloc(this._authRepository, this._apiClient)
      : super(
            const AppState.unauthenticated(authStatus: AuthStatus.unknown())) {
    on<AppEventInitial>((event, emit) async {
      await emit.forEach(_authRepository.authStatusChanges,
          onData: _authStatusChanges);
    });
    on<AppEventAuthInfoFetched>((event, emit) {
      final crtState = state;
      switch (crtState) {
        case AppStateUnauthenticated():
          return;
        case AppStateAuthenticated():
          if (event.authId != crtState.authId) {
            return;
          }
          final newAuthInfoByWorkspace = _authInfoByWorkspace(event.authInfo);
          final firstWorkspaceID = newAuthInfoByWorkspace.keys.first;
          emit(AppState.ready(
              authStatus: crtState.authStatus,
              authId: crtState.authId,
              token: crtState.token,
              workspaceId: firstWorkspaceID,
              workspaceUsers: newAuthInfoByWorkspace));
        case AppStateReady():
          if (event.authId != crtState.authId) {
            return;
          }
          final authInfoByWorkspace = _authInfoByWorkspace(event.authInfo);
          if (crtState.workspaceId != null &&
              authInfoByWorkspace[crtState.workspaceId] == null) {
            final firstWorkspaceID = authInfoByWorkspace.keys.first;
            emit(crtState.copyWith(
                workspaceId: firstWorkspaceID,
                workspaceUsers: authInfoByWorkspace));
            return;
          }
          emit(crtState.copyWith(workspaceUsers: authInfoByWorkspace));
      }
      // Deal with it -> update state with new auth info
    });
  }

  AppState _authStatusChanges(AuthStatus status) {
    switch (status) {
      case AuthStatusUnknown() ||
            AuthStatusDisconnected() ||
            AuthStatusRestricted():
        return AppState.unauthenticated(authStatus: status);
      case AuthStatusAuthenticated():
        return _authStatusAuthenticated(status);
    }
  }

  AppState _authStatusAuthenticated(AuthStatusAuthenticated authStatus) {
    final crtState = state;
    // always fetch user info, even in case of token refresh
    _fetchAuthInfo(authStatus.token, authStatus.authId);
    switch (crtState) {
      case AppStateUnauthenticated():
        return AppState.authenticated(
          authStatus: authStatus,
          authId: authStatus.authId,
          token: authStatus.token,
        );
      // TODO: trigger fetch of user info
      case AppStateAuthenticated():
        return AppState.authenticated(
          authStatus: authStatus,
          authId: authStatus.authId,
          token: authStatus.token,
        );
      case AppStateReady():
        if (authStatus.authId != authStatus.authId) {
          // Normally this won't happen, as a logout will trigger a change to
          // unauthenticated state.
          return AppState.authenticated(
            authStatus: authStatus,
            authId: authStatus.authId,
            token: authStatus.token,
          );
        }
        return crtState.copyWith(
            token: authStatus.token, authStatus: authStatus);
    }
  }

  StreamSubscription<List<AuthInfo>>? fetchAuthInfoSubscription;
  void _fetchAuthInfo(String token, String authId) {
    int retryCount = 0;
    waitDuration() {
      if (retryCount > 7) {
        return const Duration(seconds: 10);
      }
      return Duration(milliseconds: 100 * (2 ^ retryCount++));
    }

    fetchAuthInfoSubscription?.cancel();
    fetchAuthInfoSubscription = Rx.retryWhen(
        () => Rx.fromCallable(() => _apiClient.userInfo(token)),
        (_, __) => TimerStream(0, waitDuration())).take(1).listen((authInfo) {
      fetchAuthInfoSubscription = null;
      // switch on state and re-emit with updated state
      // this is async 🤯
      add(AppEvent.authInfoFetched(authInfo, authId));
    });
  }

  Map<int, AuthInfo> _authInfoByWorkspace(List<AuthInfo> authInfo) {
    final authInfoByWorkspace = <int, AuthInfo>{};
    for (var info in authInfo) {
      if (appType == AppType.pro && info.user.type != UserType.internal) {
        continue;
      }
      if (appType == AppType.consumer && info.user.type != UserType.external) {
        continue;
      }

      authInfoByWorkspace[info.workspace.id] = info;
    }
    return authInfoByWorkspace;
  }

  logout() async {
    await _authRepository.logout();
  }

  @override
  void onChange(Change<AppState> change) {
    _logger.finer('AppState change: $change');
    super.onChange(change);
  }
}
