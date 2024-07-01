import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:canine_sync/canine_sync.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../../preferences/preferences.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

enum AppType { pro, clemia }

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  final SyncSessionRepository _syncSessionRepository;
  final APIClientBase _apiClient;
  final AppType appType;
  final _logger = Logger('MainApp');
  final PersistentPreferences preferences;

  int? workspaceId;
  int? conversationId;

  bool get isAuthenticated => state is! AppStateUnauthenticated;
  bool get isReady => state is AppStateReady;
  Map<int, AuthInfo> get workspaces =>
      (state is AppStateReady) ? (state as AppStateReady).workspaces : {};

  AppBloc(this._authRepository, this._apiClient, this._syncSessionRepository,
      this.appType, this.preferences, this.workspaceId, this.conversationId)
      : super(
            const AppState.unauthenticated(authStatus: AuthStatus.unknown())) {
    on<AppEventInitial>((event, emit) async {
      await emit.forEach(_authRepository.authStatusChanges,
          onData: _authStatusChanges);
    });

    on<AppEventLogout>((event, emit) async {
      try {
        await _syncSessionRepository.disconnect();
        await _authRepository.logout();
      } catch (e) {
        _logger.warning('Error during logout: $e');
      }
    });

    on<AppEventChangeWorkspace>((event, emit) async {
      // await Future.delayed(const Duration(seconds: 2));
      if (workspaceId == event.workspaceId &&
          event.conversationId == conversationId) {
        return;
      }
      _logger.finer('Change workspace ${event.workspaceId}');
      if (state is AppStateReady) {
        _logger.severe("❗️Change workspace reset sync session not implemented");
      }
      preferences.setLastWorkspace(event.workspaceId, event.conversationId);
      workspaceId = event.workspaceId;
      conversationId = event.conversationId;
    });

    on<AppEventRefresh>((event, emit) async {
      final authStatus = state.authStatus;
      if (authStatus is AuthStatusAuthenticated) {
        _fetchAuthInfo(authStatus.token, authStatus.authId);
      }
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
          final targetWorkspaceID =
              workspaceId ?? newAuthInfoByWorkspace.keys.firstOrNull;
          if (targetWorkspaceID != null) {
            if (newAuthInfoByWorkspace[targetWorkspaceID] == null) {
              _logger.severe(
                  '❗️No workspace info for $targetWorkspaceID authId: ${crtState.authId}');
              // throw ArgumentError.value(
              //     targetWorkspaceID, 'Invalid workspace ID');
              // We are on login, and it is going to be stuck on it even if we
              // are logged in. We should end up on /restricted but imp
              updateWorkspaceId(targetWorkspaceID);
              emit(AppState.ready(
                  authStatus: crtState.authStatus,
                  authId: crtState.authId,
                  token: crtState.token,
                  workspaces: newAuthInfoByWorkspace));
              return;
            }
            _syncSessionRepository.connect(Session(
              workspaceId: targetWorkspaceID,
              authId: crtState.authId,
              token: crtState.token,
              userId: newAuthInfoByWorkspace[targetWorkspaceID]!.user.id,
            ));
          }
          updateWorkspaceId(targetWorkspaceID);
          emit(AppState.ready(
              authStatus: crtState.authStatus,
              authId: crtState.authId,
              token: crtState.token,
              workspaces: newAuthInfoByWorkspace));
        case AppStateReady():
          if (event.authId != crtState.authId) {
            return;
          }
          final authInfoByWorkspace = _authInfoByWorkspace(event.authInfo);
          if (workspaceId != null && authInfoByWorkspace[workspaceId] == null) {
            final firstWorkspaceID = authInfoByWorkspace.keys.first;
            updateWorkspaceId(firstWorkspaceID);
            emit(crtState.copyWith(workspaces: authInfoByWorkspace));
            return;
          }
          emit(crtState.copyWith(workspaces: authInfoByWorkspace));
      }
      // Deal with it -> update state with new auth info
    });
  }

  void updateWorkspaceId(int? targetWorkspaceID) {
    if (workspaceId != targetWorkspaceID) {
      conversationId = null;
    }
    workspaceId = targetWorkspaceID;
  }

  AppState _authStatusChanges(AuthStatus status) {
    switch (status) {
      case AuthStatusUnknown() || AuthStatusDisconnected():
        return AppState.unauthenticated(authStatus: status);
      case AuthStatusAuthenticated():
        return _authStatusAuthenticated(status);
    }
  }

  AppState _authStatusAuthenticated(AuthStatusAuthenticated authStatus) {
    final crtState = state;
    if (authStatus.roles.isNotEmpty) {
      // always fetch user info, even in case of token refresh
      _fetchAuthInfo(authStatus.token, authStatus.authId);
    }
    switch (crtState) {
      case AppStateUnauthenticated() || AppStateAuthenticated():
        return AppState.authenticated(
            authStatus: authStatus,
            authId: authStatus.authId,
            token: authStatus.token);
      // TODO: trigger fetch of user info
      case AppStateReady():
        if (authStatus.authId != authStatus.authId ||
            authStatus.roles.isEmpty) {
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
      if (appType == AppType.clemia && info.user.type != UserType.external) {
        continue;
      }

      authInfoByWorkspace[info.workspace.id] = info;
    }
    return authInfoByWorkspace;
  }

  @override
  void onChange(Change<AppState> change) {
    _logger.finer(
        'AppState change: $change on workspace $workspaceId with conversation $conversationId');
    super.onChange(change);
  }

  @override
  void onEvent(AppEvent event) {
    if (event is AppEventChangeWorkspace) {
      _logger.finer('AppEvent: $event');
    }
    super.onEvent(event);
  }

  bool hasAccessToWorkspace(int? workspaceId, ProjectRoles roles) {
    if (workspaceId == null) {
      return false;
    }

    switch (appType) {
      case AppType.pro:
        return RoleExtension.proRoles
            .any((role) => roles[role]?.contains(workspaceId) ?? false);
      case AppType.clemia:
        return RoleExtension.endUserRoles
            .any((role) => roles[role]?.contains(workspaceId) ?? false);
    }
  }
}
