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
    required TResult Function(AuthenticationStatus status) statusChanged,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatus status)? statusChanged,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticationStatus status)? statusChanged,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusChanged value) statusChanged,
    required TResult Function(Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusChanged value)? statusChanged,
    TResult? Function(Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusChanged value)? statusChanged,
    TResult Function(Logout value)? logout,
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
abstract class _$$StatusChangedImplCopyWith<$Res> {
  factory _$$StatusChangedImplCopyWith(
          _$StatusChangedImpl value, $Res Function(_$StatusChangedImpl) then) =
      __$$StatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthenticationStatus status});

  $AuthenticationStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$StatusChangedImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$StatusChangedImpl>
    implements _$$StatusChangedImplCopyWith<$Res> {
  __$$StatusChangedImplCopyWithImpl(
      _$StatusChangedImpl _value, $Res Function(_$StatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$StatusChangedImpl(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticationStatusCopyWith<$Res> get status {
    return $AuthenticationStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc

class _$StatusChangedImpl implements StatusChanged {
  const _$StatusChangedImpl(this.status);

  @override
  final AuthenticationStatus status;

  @override
  String toString() {
    return 'AppEvent.statusChanged(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusChangedImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusChangedImplCopyWith<_$StatusChangedImpl> get copyWith =>
      __$$StatusChangedImplCopyWithImpl<_$StatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticationStatus status) statusChanged,
    required TResult Function() logout,
  }) {
    return statusChanged(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatus status)? statusChanged,
    TResult? Function()? logout,
  }) {
    return statusChanged?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticationStatus status)? statusChanged,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatusChanged value) statusChanged,
    required TResult Function(Logout value) logout,
  }) {
    return statusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusChanged value)? statusChanged,
    TResult? Function(Logout value)? logout,
  }) {
    return statusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusChanged value)? statusChanged,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(this);
    }
    return orElse();
  }
}

abstract class StatusChanged implements AppEvent {
  const factory StatusChanged(final AuthenticationStatus status) =
      _$StatusChangedImpl;

  AuthenticationStatus get status;
  @JsonKey(ignore: true)
  _$$StatusChangedImplCopyWith<_$StatusChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutImpl implements Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AppEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthenticationStatus status) statusChanged,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatus status)? statusChanged,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthenticationStatus status)? statusChanged,
    TResult Function()? logout,
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
    required TResult Function(StatusChanged value) statusChanged,
    required TResult Function(Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatusChanged value)? statusChanged,
    TResult? Function(Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatusChanged value)? statusChanged,
    TResult Function(Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class Logout implements AppEvent {
  const factory Logout() = _$LogoutImpl;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppStateStartingImplCopyWith<$Res> {
  factory _$$AppStateStartingImplCopyWith(_$AppStateStartingImpl value,
          $Res Function(_$AppStateStartingImpl) then) =
      __$$AppStateStartingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppStateStartingImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateStartingImpl>
    implements _$$AppStateStartingImplCopyWith<$Res> {
  __$$AppStateStartingImplCopyWithImpl(_$AppStateStartingImpl _value,
      $Res Function(_$AppStateStartingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppStateStartingImpl implements AppStateStarting {
  const _$AppStateStartingImpl();

  @override
  String toString() {
    return 'AppState.starting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppStateStartingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return starting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return starting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return starting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return starting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (starting != null) {
      return starting(this);
    }
    return orElse();
  }
}

abstract class AppStateStarting implements AppState {
  const factory AppStateStarting() = _$AppStateStartingImpl;
}

/// @nodoc
abstract class _$$AppStateNAImplCopyWith<$Res> {
  factory _$$AppStateNAImplCopyWith(
          _$AppStateNAImpl value, $Res Function(_$AppStateNAImpl) then) =
      __$$AppStateNAImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppStateNAImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateNAImpl>
    implements _$$AppStateNAImplCopyWith<$Res> {
  __$$AppStateNAImplCopyWithImpl(
      _$AppStateNAImpl _value, $Res Function(_$AppStateNAImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppStateNAImpl implements AppStateNA {
  const _$AppStateNAImpl();

  @override
  String toString() {
    return 'AppState.na()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppStateNAImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return na();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return na?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (na != null) {
      return na();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return na(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return na?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (na != null) {
      return na(this);
    }
    return orElse();
  }
}

abstract class AppStateNA implements AppState {
  const factory AppStateNA() = _$AppStateNAImpl;
}

/// @nodoc
abstract class _$$AppStateUnauthenticatedImplCopyWith<$Res> {
  factory _$$AppStateUnauthenticatedImplCopyWith(
          _$AppStateUnauthenticatedImpl value,
          $Res Function(_$AppStateUnauthenticatedImpl) then) =
      __$$AppStateUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppStateUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateUnauthenticatedImpl>
    implements _$$AppStateUnauthenticatedImplCopyWith<$Res> {
  __$$AppStateUnauthenticatedImplCopyWithImpl(
      _$AppStateUnauthenticatedImpl _value,
      $Res Function(_$AppStateUnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppStateUnauthenticatedImpl implements AppStateUnauthenticated {
  const _$AppStateUnauthenticatedImpl();

  @override
  String toString() {
    return 'AppState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AppStateUnauthenticated implements AppState {
  const factory AppStateUnauthenticated() = _$AppStateUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AppStateUnauthenticatedWkspImplCopyWith<$Res> {
  factory _$$AppStateUnauthenticatedWkspImplCopyWith(
          _$AppStateUnauthenticatedWkspImpl value,
          $Res Function(_$AppStateUnauthenticatedWkspImpl) then) =
      __$$AppStateUnauthenticatedWkspImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int workspaceID});
}

/// @nodoc
class __$$AppStateUnauthenticatedWkspImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateUnauthenticatedWkspImpl>
    implements _$$AppStateUnauthenticatedWkspImplCopyWith<$Res> {
  __$$AppStateUnauthenticatedWkspImplCopyWithImpl(
      _$AppStateUnauthenticatedWkspImpl _value,
      $Res Function(_$AppStateUnauthenticatedWkspImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceID = null,
  }) {
    return _then(_$AppStateUnauthenticatedWkspImpl(
      null == workspaceID
          ? _value.workspaceID
          : workspaceID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppStateUnauthenticatedWkspImpl implements AppStateUnauthenticatedWksp {
  const _$AppStateUnauthenticatedWkspImpl(this.workspaceID);

  @override
  final int workspaceID;

  @override
  String toString() {
    return 'AppState.unauthenticatedWksp(workspaceID: $workspaceID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateUnauthenticatedWkspImpl &&
            (identical(other.workspaceID, workspaceID) ||
                other.workspaceID == workspaceID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateUnauthenticatedWkspImplCopyWith<_$AppStateUnauthenticatedWkspImpl>
      get copyWith => __$$AppStateUnauthenticatedWkspImplCopyWithImpl<
          _$AppStateUnauthenticatedWkspImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return unauthenticatedWksp(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return unauthenticatedWksp?.call(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticatedWksp != null) {
      return unauthenticatedWksp(workspaceID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return unauthenticatedWksp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return unauthenticatedWksp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticatedWksp != null) {
      return unauthenticatedWksp(this);
    }
    return orElse();
  }
}

abstract class AppStateUnauthenticatedWksp implements AppState {
  const factory AppStateUnauthenticatedWksp(final int workspaceID) =
      _$AppStateUnauthenticatedWkspImpl;

  int get workspaceID;
  @JsonKey(ignore: true)
  _$$AppStateUnauthenticatedWkspImplCopyWith<_$AppStateUnauthenticatedWkspImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppStateAuthenticatingImplCopyWith<$Res> {
  factory _$$AppStateAuthenticatingImplCopyWith(
          _$AppStateAuthenticatingImpl value,
          $Res Function(_$AppStateAuthenticatingImpl) then) =
      __$$AppStateAuthenticatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int workspaceID});
}

/// @nodoc
class __$$AppStateAuthenticatingImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateAuthenticatingImpl>
    implements _$$AppStateAuthenticatingImplCopyWith<$Res> {
  __$$AppStateAuthenticatingImplCopyWithImpl(
      _$AppStateAuthenticatingImpl _value,
      $Res Function(_$AppStateAuthenticatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceID = null,
  }) {
    return _then(_$AppStateAuthenticatingImpl(
      null == workspaceID
          ? _value.workspaceID
          : workspaceID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppStateAuthenticatingImpl implements AppStateAuthenticating {
  const _$AppStateAuthenticatingImpl(this.workspaceID);

  @override
  final int workspaceID;

  @override
  String toString() {
    return 'AppState.partiallyAuthenticated(workspaceID: $workspaceID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateAuthenticatingImpl &&
            (identical(other.workspaceID, workspaceID) ||
                other.workspaceID == workspaceID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateAuthenticatingImplCopyWith<_$AppStateAuthenticatingImpl>
      get copyWith => __$$AppStateAuthenticatingImplCopyWithImpl<
          _$AppStateAuthenticatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return partiallyAuthenticated(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return partiallyAuthenticated?.call(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (partiallyAuthenticated != null) {
      return partiallyAuthenticated(workspaceID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return partiallyAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return partiallyAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (partiallyAuthenticated != null) {
      return partiallyAuthenticated(this);
    }
    return orElse();
  }
}

abstract class AppStateAuthenticating implements AppState {
  const factory AppStateAuthenticating(final int workspaceID) =
      _$AppStateAuthenticatingImpl;

  int get workspaceID;
  @JsonKey(ignore: true)
  _$$AppStateAuthenticatingImplCopyWith<_$AppStateAuthenticatingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppStateAuthenticatedImplCopyWith<$Res> {
  factory _$$AppStateAuthenticatedImplCopyWith(
          _$AppStateAuthenticatedImpl value,
          $Res Function(_$AppStateAuthenticatedImpl) then) =
      __$$AppStateAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int workspaceID});
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
    Object? workspaceID = null,
  }) {
    return _then(_$AppStateAuthenticatedImpl(
      null == workspaceID
          ? _value.workspaceID
          : workspaceID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppStateAuthenticatedImpl implements AppStateAuthenticated {
  const _$AppStateAuthenticatedImpl(this.workspaceID);

  @override
  final int workspaceID;

  @override
  String toString() {
    return 'AppState.authenticated(workspaceID: $workspaceID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateAuthenticatedImpl &&
            (identical(other.workspaceID, workspaceID) ||
                other.workspaceID == workspaceID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateAuthenticatedImplCopyWith<_$AppStateAuthenticatedImpl>
      get copyWith => __$$AppStateAuthenticatedImplCopyWithImpl<
          _$AppStateAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() starting,
    required TResult Function() na,
    required TResult Function() unauthenticated,
    required TResult Function(int workspaceID) unauthenticatedWksp,
    required TResult Function(int workspaceID) partiallyAuthenticated,
    required TResult Function(int workspaceID) authenticated,
  }) {
    return authenticated(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? starting,
    TResult? Function()? na,
    TResult? Function()? unauthenticated,
    TResult? Function(int workspaceID)? unauthenticatedWksp,
    TResult? Function(int workspaceID)? partiallyAuthenticated,
    TResult? Function(int workspaceID)? authenticated,
  }) {
    return authenticated?.call(workspaceID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? starting,
    TResult Function()? na,
    TResult Function()? unauthenticated,
    TResult Function(int workspaceID)? unauthenticatedWksp,
    TResult Function(int workspaceID)? partiallyAuthenticated,
    TResult Function(int workspaceID)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(workspaceID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppStateStarting value) starting,
    required TResult Function(AppStateNA value) na,
    required TResult Function(AppStateUnauthenticated value) unauthenticated,
    required TResult Function(AppStateUnauthenticatedWksp value)
        unauthenticatedWksp,
    required TResult Function(AppStateAuthenticating value)
        partiallyAuthenticated,
    required TResult Function(AppStateAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppStateStarting value)? starting,
    TResult? Function(AppStateNA value)? na,
    TResult? Function(AppStateUnauthenticated value)? unauthenticated,
    TResult? Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult? Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult? Function(AppStateAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppStateStarting value)? starting,
    TResult Function(AppStateNA value)? na,
    TResult Function(AppStateUnauthenticated value)? unauthenticated,
    TResult Function(AppStateUnauthenticatedWksp value)? unauthenticatedWksp,
    TResult Function(AppStateAuthenticating value)? partiallyAuthenticated,
    TResult Function(AppStateAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AppStateAuthenticated implements AppState {
  const factory AppStateAuthenticated(final int workspaceID) =
      _$AppStateAuthenticatedImpl;

  int get workspaceID;
  @JsonKey(ignore: true)
  _$$AppStateAuthenticatedImplCopyWith<_$AppStateAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
