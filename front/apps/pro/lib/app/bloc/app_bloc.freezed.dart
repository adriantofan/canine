// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<AuthInfo> authInfo, String authId)
        authInfoFetched,
    required TResult Function() logout,
    required TResult Function(int workspaceId) changeWorkspace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult? Function()? logout,
    TResult? Function(int workspaceId)? changeWorkspace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult Function()? logout,
    TResult Function(int workspaceId)? changeWorkspace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventAuthInfoFetched value) authInfoFetched,
    required TResult Function(AppEventLogout value) logout,
    required TResult Function(AppEventChangeWorkspace value) changeWorkspace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult? Function(AppEventLogout value)? logout,
    TResult? Function(AppEventChangeWorkspace value)? changeWorkspace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult Function(AppEventLogout value)? logout,
    TResult Function(AppEventChangeWorkspace value)? changeWorkspace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppEventInitialImplCopyWith<$Res> {
  factory _$$AppEventInitialImplCopyWith(_$AppEventInitialImpl value,
          $Res Function(_$AppEventInitialImpl) then) =
      __$$AppEventInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventInitialImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventInitialImpl>
    implements _$$AppEventInitialImplCopyWith<$Res> {
  __$$AppEventInitialImplCopyWithImpl(
      _$AppEventInitialImpl _value, $Res Function(_$AppEventInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppEventInitialImpl implements AppEventInitial {
  const _$AppEventInitialImpl();

  @override
  String toString() {
    return 'AppEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppEventInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<AuthInfo> authInfo, String authId)
        authInfoFetched,
    required TResult Function() logout,
    required TResult Function(int workspaceId) changeWorkspace,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult? Function()? logout,
    TResult? Function(int workspaceId)? changeWorkspace,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult Function()? logout,
    TResult Function(int workspaceId)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventAuthInfoFetched value) authInfoFetched,
    required TResult Function(AppEventLogout value) logout,
    required TResult Function(AppEventChangeWorkspace value) changeWorkspace,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult? Function(AppEventLogout value)? logout,
    TResult? Function(AppEventChangeWorkspace value)? changeWorkspace,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult Function(AppEventLogout value)? logout,
    TResult Function(AppEventChangeWorkspace value)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AppEventInitial implements AppEvent {
  const factory AppEventInitial() = _$AppEventInitialImpl;
}

/// @nodoc
abstract class _$$AppEventAuthInfoFetchedImplCopyWith<$Res> {
  factory _$$AppEventAuthInfoFetchedImplCopyWith(
          _$AppEventAuthInfoFetchedImpl value,
          $Res Function(_$AppEventAuthInfoFetchedImpl) then) =
      __$$AppEventAuthInfoFetchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<AuthInfo> authInfo, String authId});
}

/// @nodoc
class __$$AppEventAuthInfoFetchedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventAuthInfoFetchedImpl>
    implements _$$AppEventAuthInfoFetchedImplCopyWith<$Res> {
  __$$AppEventAuthInfoFetchedImplCopyWithImpl(
      _$AppEventAuthInfoFetchedImpl _value,
      $Res Function(_$AppEventAuthInfoFetchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authInfo = null,
    Object? authId = null,
  }) {
    return _then(_$AppEventAuthInfoFetchedImpl(
      null == authInfo
          ? _value._authInfo
          : authInfo // ignore: cast_nullable_to_non_nullable
              as List<AuthInfo>,
      null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppEventAuthInfoFetchedImpl implements AppEventAuthInfoFetched {
  const _$AppEventAuthInfoFetchedImpl(
      final List<AuthInfo> authInfo, this.authId)
      : _authInfo = authInfo;

  final List<AuthInfo> _authInfo;
  @override
  List<AuthInfo> get authInfo {
    if (_authInfo is EqualUnmodifiableListView) return _authInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authInfo);
  }

  @override
  final String authId;

  @override
  String toString() {
    return 'AppEvent.authInfoFetched(authInfo: $authInfo, authId: $authId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventAuthInfoFetchedImpl &&
            const DeepCollectionEquality().equals(other._authInfo, _authInfo) &&
            (identical(other.authId, authId) || other.authId == authId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_authInfo), authId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventAuthInfoFetchedImplCopyWith<_$AppEventAuthInfoFetchedImpl>
      get copyWith => __$$AppEventAuthInfoFetchedImplCopyWithImpl<
          _$AppEventAuthInfoFetchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<AuthInfo> authInfo, String authId)
        authInfoFetched,
    required TResult Function() logout,
    required TResult Function(int workspaceId) changeWorkspace,
  }) {
    return authInfoFetched(authInfo, authId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult? Function()? logout,
    TResult? Function(int workspaceId)? changeWorkspace,
  }) {
    return authInfoFetched?.call(authInfo, authId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult Function()? logout,
    TResult Function(int workspaceId)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (authInfoFetched != null) {
      return authInfoFetched(authInfo, authId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventAuthInfoFetched value) authInfoFetched,
    required TResult Function(AppEventLogout value) logout,
    required TResult Function(AppEventChangeWorkspace value) changeWorkspace,
  }) {
    return authInfoFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult? Function(AppEventLogout value)? logout,
    TResult? Function(AppEventChangeWorkspace value)? changeWorkspace,
  }) {
    return authInfoFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult Function(AppEventLogout value)? logout,
    TResult Function(AppEventChangeWorkspace value)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (authInfoFetched != null) {
      return authInfoFetched(this);
    }
    return orElse();
  }
}

abstract class AppEventAuthInfoFetched implements AppEvent {
  const factory AppEventAuthInfoFetched(
          final List<AuthInfo> authInfo, final String authId) =
      _$AppEventAuthInfoFetchedImpl;

  List<AuthInfo> get authInfo;
  String get authId;
  @JsonKey(ignore: true)
  _$$AppEventAuthInfoFetchedImplCopyWith<_$AppEventAuthInfoFetchedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppEventLogoutImplCopyWith<$Res> {
  factory _$$AppEventLogoutImplCopyWith(_$AppEventLogoutImpl value,
          $Res Function(_$AppEventLogoutImpl) then) =
      __$$AppEventLogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppEventLogoutImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventLogoutImpl>
    implements _$$AppEventLogoutImplCopyWith<$Res> {
  __$$AppEventLogoutImplCopyWithImpl(
      _$AppEventLogoutImpl _value, $Res Function(_$AppEventLogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppEventLogoutImpl implements AppEventLogout {
  const _$AppEventLogoutImpl();

  @override
  String toString() {
    return 'AppEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppEventLogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<AuthInfo> authInfo, String authId)
        authInfoFetched,
    required TResult Function() logout,
    required TResult Function(int workspaceId) changeWorkspace,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult? Function()? logout,
    TResult? Function(int workspaceId)? changeWorkspace,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult Function()? logout,
    TResult Function(int workspaceId)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventAuthInfoFetched value) authInfoFetched,
    required TResult Function(AppEventLogout value) logout,
    required TResult Function(AppEventChangeWorkspace value) changeWorkspace,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult? Function(AppEventLogout value)? logout,
    TResult? Function(AppEventChangeWorkspace value)? changeWorkspace,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult Function(AppEventLogout value)? logout,
    TResult Function(AppEventChangeWorkspace value)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class AppEventLogout implements AppEvent {
  const factory AppEventLogout() = _$AppEventLogoutImpl;
}

/// @nodoc
abstract class _$$AppEventChangeWorkspaceImplCopyWith<$Res> {
  factory _$$AppEventChangeWorkspaceImplCopyWith(
          _$AppEventChangeWorkspaceImpl value,
          $Res Function(_$AppEventChangeWorkspaceImpl) then) =
      __$$AppEventChangeWorkspaceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int workspaceId});
}

/// @nodoc
class __$$AppEventChangeWorkspaceImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$AppEventChangeWorkspaceImpl>
    implements _$$AppEventChangeWorkspaceImplCopyWith<$Res> {
  __$$AppEventChangeWorkspaceImplCopyWithImpl(
      _$AppEventChangeWorkspaceImpl _value,
      $Res Function(_$AppEventChangeWorkspaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
  }) {
    return _then(_$AppEventChangeWorkspaceImpl(
      null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppEventChangeWorkspaceImpl implements AppEventChangeWorkspace {
  const _$AppEventChangeWorkspaceImpl(this.workspaceId);

  @override
  final int workspaceId;

  @override
  String toString() {
    return 'AppEvent.changeWorkspace(workspaceId: $workspaceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppEventChangeWorkspaceImpl &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppEventChangeWorkspaceImplCopyWith<_$AppEventChangeWorkspaceImpl>
      get copyWith => __$$AppEventChangeWorkspaceImplCopyWithImpl<
          _$AppEventChangeWorkspaceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<AuthInfo> authInfo, String authId)
        authInfoFetched,
    required TResult Function() logout,
    required TResult Function(int workspaceId) changeWorkspace,
  }) {
    return changeWorkspace(workspaceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult? Function()? logout,
    TResult? Function(int workspaceId)? changeWorkspace,
  }) {
    return changeWorkspace?.call(workspaceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<AuthInfo> authInfo, String authId)? authInfoFetched,
    TResult Function()? logout,
    TResult Function(int workspaceId)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (changeWorkspace != null) {
      return changeWorkspace(workspaceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppEventInitial value) initial,
    required TResult Function(AppEventAuthInfoFetched value) authInfoFetched,
    required TResult Function(AppEventLogout value) logout,
    required TResult Function(AppEventChangeWorkspace value) changeWorkspace,
  }) {
    return changeWorkspace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppEventInitial value)? initial,
    TResult? Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult? Function(AppEventLogout value)? logout,
    TResult? Function(AppEventChangeWorkspace value)? changeWorkspace,
  }) {
    return changeWorkspace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppEventInitial value)? initial,
    TResult Function(AppEventAuthInfoFetched value)? authInfoFetched,
    TResult Function(AppEventLogout value)? logout,
    TResult Function(AppEventChangeWorkspace value)? changeWorkspace,
    required TResult orElse(),
  }) {
    if (changeWorkspace != null) {
      return changeWorkspace(this);
    }
    return orElse();
  }
}

abstract class AppEventChangeWorkspace implements AppEvent {
  const factory AppEventChangeWorkspace(final int workspaceId) =
      _$AppEventChangeWorkspaceImpl;

  int get workspaceId;
  @JsonKey(ignore: true)
  _$$AppEventChangeWorkspaceImplCopyWith<_$AppEventChangeWorkspaceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  AuthStatus get authStatus => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus authStatus) unauthenticated,
    required TResult Function(
            AuthStatus authStatus, String authId, String token)
        authenticated,
    required TResult Function(AuthStatus authStatus, String authId,
            String token, int? workspaceId, Map<int, AuthInfo> workspaces)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus authStatus)? unauthenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus authStatus)? unauthenticated,
    TResult Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
    required TResult Function(AppStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
    TResult? Function(AppStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    TResult Function(AppStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({AuthStatus authStatus});

  $AuthStatusCopyWith<$Res> get authStatus;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
  }) {
    return _then(_value.copyWith(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthStatusCopyWith<$Res> get authStatus {
    return $AuthStatusCopyWith<$Res>(_value.authStatus, (value) {
      return _then(_value.copyWith(authStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateUnauthenticatedImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateUnauthenticatedImplCopyWith(
          _$AppStateUnauthenticatedImpl value,
          $Res Function(_$AppStateUnauthenticatedImpl) then) =
      __$$AppStateUnauthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus authStatus});

  @override
  $AuthStatusCopyWith<$Res> get authStatus;
}

/// @nodoc
class __$$AppStateUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateUnauthenticatedImpl>
    implements _$$AppStateUnauthenticatedImplCopyWith<$Res> {
  __$$AppStateUnauthenticatedImplCopyWithImpl(
      _$AppStateUnauthenticatedImpl _value,
      $Res Function(_$AppStateUnauthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
  }) {
    return _then(_$AppStateUnauthenticatedImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$AppStateUnauthenticatedImpl extends AppStateUnauthenticated {
  const _$AppStateUnauthenticatedImpl({required this.authStatus}) : super._();

  @override
  final AuthStatus authStatus;

  @override
  String toString() {
    return 'AppState.unauthenticated(authStatus: $authStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateUnauthenticatedImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateUnauthenticatedImplCopyWith<_$AppStateUnauthenticatedImpl>
      get copyWith => __$$AppStateUnauthenticatedImplCopyWithImpl<
          _$AppStateUnauthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus authStatus) unauthenticated,
    required TResult Function(
            AuthStatus authStatus, String authId, String token)
        authenticated,
    required TResult Function(AuthStatus authStatus, String authId,
            String token, int? workspaceId, Map<int, AuthInfo> workspaces)
        ready,
  }) {
    return unauthenticated(authStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus authStatus)? unauthenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
  }) {
    return unauthenticated?.call(authStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus authStatus)? unauthenticated,
    TResult Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(authStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
    required TResult Function(AppStateReady value) ready,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
    TResult? Function(AppStateReady value)? ready,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    TResult Function(AppStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AppStateUnauthenticated extends AppState {
  const factory AppStateUnauthenticated(
      {required final AuthStatus authStatus}) = _$AppStateUnauthenticatedImpl;
  const AppStateUnauthenticated._() : super._();

  @override
  AuthStatus get authStatus;
  @override
  @JsonKey(ignore: true)
  _$$AppStateUnauthenticatedImplCopyWith<_$AppStateUnauthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppStateAuthenticatedImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateAuthenticatedImplCopyWith(
          _$AppStateAuthenticatedImpl value,
          $Res Function(_$AppStateAuthenticatedImpl) then) =
      __$$AppStateAuthenticatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus authStatus, String authId, String token});

  @override
  $AuthStatusCopyWith<$Res> get authStatus;
}

/// @nodoc
class __$$AppStateAuthenticatedImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateAuthenticatedImpl>
    implements _$$AppStateAuthenticatedImplCopyWith<$Res> {
  __$$AppStateAuthenticatedImplCopyWithImpl(_$AppStateAuthenticatedImpl _value,
      $Res Function(_$AppStateAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? authId = null,
    Object? token = null,
  }) {
    return _then(_$AppStateAuthenticatedImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppStateAuthenticatedImpl extends AppStateAuthenticated {
  const _$AppStateAuthenticatedImpl(
      {required this.authStatus, required this.authId, required this.token})
      : super._();

  @override
  final AuthStatus authStatus;
  @override
  final String authId;
  @override
  final String token;

  @override
  String toString() {
    return 'AppState.authenticated(authStatus: $authStatus, authId: $authId, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateAuthenticatedImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authStatus, authId, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateAuthenticatedImplCopyWith<_$AppStateAuthenticatedImpl>
      get copyWith => __$$AppStateAuthenticatedImplCopyWithImpl<
          _$AppStateAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus authStatus) unauthenticated,
    required TResult Function(
            AuthStatus authStatus, String authId, String token)
        authenticated,
    required TResult Function(AuthStatus authStatus, String authId,
            String token, int? workspaceId, Map<int, AuthInfo> workspaces)
        ready,
  }) {
    return authenticated(authStatus, authId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus authStatus)? unauthenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
  }) {
    return authenticated?.call(authStatus, authId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus authStatus)? unauthenticated,
    TResult Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(authStatus, authId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
    required TResult Function(AppStateReady value) ready,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
    TResult? Function(AppStateReady value)? ready,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    TResult Function(AppStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AppStateAuthenticated extends AppState {
  const factory AppStateAuthenticated(
      {required final AuthStatus authStatus,
      required final String authId,
      required final String token}) = _$AppStateAuthenticatedImpl;
  const AppStateAuthenticated._() : super._();

  @override
  AuthStatus get authStatus;
  String get authId;
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$AppStateAuthenticatedImplCopyWith<_$AppStateAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppStateReadyImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateReadyImplCopyWith(
          _$AppStateReadyImpl value, $Res Function(_$AppStateReadyImpl) then) =
      __$$AppStateReadyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus authStatus,
      String authId,
      String token,
      int? workspaceId,
      Map<int, AuthInfo> workspaces});

  @override
  $AuthStatusCopyWith<$Res> get authStatus;
}

/// @nodoc
class __$$AppStateReadyImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateReadyImpl>
    implements _$$AppStateReadyImplCopyWith<$Res> {
  __$$AppStateReadyImplCopyWithImpl(
      _$AppStateReadyImpl _value, $Res Function(_$AppStateReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authStatus = null,
    Object? authId = null,
    Object? token = null,
    Object? workspaceId = freezed,
    Object? workspaces = null,
  }) {
    return _then(_$AppStateReadyImpl(
      authStatus: null == authStatus
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceId: freezed == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int?,
      workspaces: null == workspaces
          ? _value._workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as Map<int, AuthInfo>,
    ));
  }
}

/// @nodoc

class _$AppStateReadyImpl extends AppStateReady {
  const _$AppStateReadyImpl(
      {required this.authStatus,
      required this.authId,
      required this.token,
      required this.workspaceId,
      required final Map<int, AuthInfo> workspaces})
      : _workspaces = workspaces,
        super._();

  @override
  final AuthStatus authStatus;
  @override
  final String authId;
  @override
  final String token;
  @override
  final int? workspaceId;
  final Map<int, AuthInfo> _workspaces;
  @override
  Map<int, AuthInfo> get workspaces {
    if (_workspaces is EqualUnmodifiableMapView) return _workspaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workspaces);
  }

  @override
  String toString() {
    return 'AppState.ready(authStatus: $authStatus, authId: $authId, token: $token, workspaceId: $workspaceId, workspaces: $workspaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateReadyImpl &&
            (identical(other.authStatus, authStatus) ||
                other.authStatus == authStatus) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            const DeepCollectionEquality()
                .equals(other._workspaces, _workspaces));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authStatus, authId, token,
      workspaceId, const DeepCollectionEquality().hash(_workspaces));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateReadyImplCopyWith<_$AppStateReadyImpl> get copyWith =>
      __$$AppStateReadyImplCopyWithImpl<_$AppStateReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus authStatus) unauthenticated,
    required TResult Function(
            AuthStatus authStatus, String authId, String token)
        authenticated,
    required TResult Function(AuthStatus authStatus, String authId,
            String token, int? workspaceId, Map<int, AuthInfo> workspaces)
        ready,
  }) {
    return ready(authStatus, authId, token, workspaceId, workspaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus authStatus)? unauthenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult? Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
  }) {
    return ready?.call(authStatus, authId, token, workspaceId, workspaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus authStatus)? unauthenticated,
    TResult Function(AuthStatus authStatus, String authId, String token)?
        authenticated,
    TResult Function(AuthStatus authStatus, String authId, String token,
            int? workspaceId, Map<int, AuthInfo> workspaces)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(authStatus, authId, token, workspaceId, workspaces);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
    required TResult Function(AppStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
    TResult? Function(AppStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    TResult Function(AppStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class AppStateReady extends AppState {
  const factory AppStateReady(
      {required final AuthStatus authStatus,
      required final String authId,
      required final String token,
      required final int? workspaceId,
      required final Map<int, AuthInfo> workspaces}) = _$AppStateReadyImpl;
  const AppStateReady._() : super._();

  @override
  AuthStatus get authStatus;
  String get authId;
  String get token;
  int? get workspaceId;
  Map<int, AuthInfo> get workspaces;
  @override
  @JsonKey(ignore: true)
  _$$AppStateReadyImplCopyWith<_$AppStateReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
