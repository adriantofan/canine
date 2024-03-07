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
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
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
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnknownImpl implements Unknown {
  const _$UnknownImpl();

  @override
  String toString() {
    return 'AppState.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements AppState {
  const factory Unknown() = _$UnknownImpl;
}

/// @nodoc
abstract class _$$LoginRegisterFlowImplCopyWith<$Res> {
  factory _$$LoginRegisterFlowImplCopyWith(_$LoginRegisterFlowImpl value,
          $Res Function(_$LoginRegisterFlowImpl) then) =
      __$$LoginRegisterFlowImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginRegisterFlowImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoginRegisterFlowImpl>
    implements _$$LoginRegisterFlowImplCopyWith<$Res> {
  __$$LoginRegisterFlowImplCopyWithImpl(_$LoginRegisterFlowImpl _value,
      $Res Function(_$LoginRegisterFlowImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginRegisterFlowImpl implements LoginRegisterFlow {
  const _$LoginRegisterFlowImpl();

  @override
  String toString() {
    return 'AppState.loginRegisterFlow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginRegisterFlowImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return loginRegisterFlow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return loginRegisterFlow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loginRegisterFlow != null) {
      return loginRegisterFlow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return loginRegisterFlow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return loginRegisterFlow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loginRegisterFlow != null) {
      return loginRegisterFlow(this);
    }
    return orElse();
  }
}

abstract class LoginRegisterFlow implements AppState {
  const factory LoginRegisterFlow() = _$LoginRegisterFlowImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity identity});

  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
  }) {
    return _then(_$LoginImpl(
      null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res> get identity {
    return $IdentityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value));
    });
  }
}

/// @nodoc

class _$LoginImpl implements Login {
  const _$LoginImpl(this.identity);

  @override
  final Identity identity;

  @override
  String toString() {
    return 'AppState.login(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      __$$LoginImplCopyWithImpl<_$LoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return login(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return login?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements AppState {
  const factory Login(final Identity identity) = _$LoginImpl;

  Identity get identity;
  @JsonKey(ignore: true)
  _$$LoginImplCopyWith<_$LoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningImplCopyWith<$Res> {
  factory _$$RunningImplCopyWith(
          _$RunningImpl value, $Res Function(_$RunningImpl) then) =
      __$$RunningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity identity});

  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$RunningImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$RunningImpl>
    implements _$$RunningImplCopyWith<$Res> {
  __$$RunningImplCopyWithImpl(
      _$RunningImpl _value, $Res Function(_$RunningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
  }) {
    return _then(_$RunningImpl(
      null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res> get identity {
    return $IdentityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value));
    });
  }
}

/// @nodoc

class _$RunningImpl implements Running {
  const _$RunningImpl(this.identity);

  @override
  final Identity identity;

  @override
  String toString() {
    return 'AppState.running(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningImplCopyWith<_$RunningImpl> get copyWith =>
      __$$RunningImplCopyWithImpl<_$RunningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return running(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return running?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class Running implements AppState {
  const factory Running(final Identity identity) = _$RunningImpl;

  Identity get identity;
  @JsonKey(ignore: true)
  _$$RunningImplCopyWith<_$RunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningRefreshImplCopyWith<$Res> {
  factory _$$RunningRefreshImplCopyWith(_$RunningRefreshImpl value,
          $Res Function(_$RunningRefreshImpl) then) =
      __$$RunningRefreshImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity identity});

  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$RunningRefreshImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$RunningRefreshImpl>
    implements _$$RunningRefreshImplCopyWith<$Res> {
  __$$RunningRefreshImplCopyWithImpl(
      _$RunningRefreshImpl _value, $Res Function(_$RunningRefreshImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
  }) {
    return _then(_$RunningRefreshImpl(
      null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res> get identity {
    return $IdentityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value));
    });
  }
}

/// @nodoc

class _$RunningRefreshImpl implements RunningRefresh {
  const _$RunningRefreshImpl(this.identity);

  @override
  final Identity identity;

  @override
  String toString() {
    return 'AppState.runningRefresh(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningRefreshImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningRefreshImplCopyWith<_$RunningRefreshImpl> get copyWith =>
      __$$RunningRefreshImplCopyWithImpl<_$RunningRefreshImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return runningRefresh(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return runningRefresh?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (runningRefresh != null) {
      return runningRefresh(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return runningRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return runningRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (runningRefresh != null) {
      return runningRefresh(this);
    }
    return orElse();
  }
}

abstract class RunningRefresh implements AppState {
  const factory RunningRefresh(final Identity identity) = _$RunningRefreshImpl;

  Identity get identity;
  @JsonKey(ignore: true)
  _$$RunningRefreshImplCopyWith<_$RunningRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggingOutImplCopyWith<$Res> {
  factory _$$LoggingOutImplCopyWith(
          _$LoggingOutImpl value, $Res Function(_$LoggingOutImpl) then) =
      __$$LoggingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggingOutImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$LoggingOutImpl>
    implements _$$LoggingOutImplCopyWith<$Res> {
  __$$LoggingOutImplCopyWithImpl(
      _$LoggingOutImpl _value, $Res Function(_$LoggingOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoggingOutImpl implements LoggingOut {
  const _$LoggingOutImpl();

  @override
  String toString() {
    return 'AppState.loggingOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loginRegisterFlow,
    required TResult Function(Identity identity) login,
    required TResult Function(Identity identity) running,
    required TResult Function(Identity identity) runningRefresh,
    required TResult Function() loggingOut,
  }) {
    return loggingOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loginRegisterFlow,
    TResult? Function(Identity identity)? login,
    TResult? Function(Identity identity)? running,
    TResult? Function(Identity identity)? runningRefresh,
    TResult? Function()? loggingOut,
  }) {
    return loggingOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loginRegisterFlow,
    TResult Function(Identity identity)? login,
    TResult Function(Identity identity)? running,
    TResult Function(Identity identity)? runningRefresh,
    TResult Function()? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unknown value) unknown,
    required TResult Function(LoginRegisterFlow value) loginRegisterFlow,
    required TResult Function(Login value) login,
    required TResult Function(Running value) running,
    required TResult Function(RunningRefresh value) runningRefresh,
    required TResult Function(LoggingOut value) loggingOut,
  }) {
    return loggingOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unknown value)? unknown,
    TResult? Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult? Function(Login value)? login,
    TResult? Function(Running value)? running,
    TResult? Function(RunningRefresh value)? runningRefresh,
    TResult? Function(LoggingOut value)? loggingOut,
  }) {
    return loggingOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unknown value)? unknown,
    TResult Function(LoginRegisterFlow value)? loginRegisterFlow,
    TResult Function(Login value)? login,
    TResult Function(Running value)? running,
    TResult Function(RunningRefresh value)? runningRefresh,
    TResult Function(LoggingOut value)? loggingOut,
    required TResult orElse(),
  }) {
    if (loggingOut != null) {
      return loggingOut(this);
    }
    return orElse();
  }
}

abstract class LoggingOut implements AppState {
  const factory LoggingOut() = _$LoggingOutImpl;
}
