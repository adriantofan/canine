// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthStatus _$AuthStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'unknown':
      return AuthStatusUnknown.fromJson(json);
    case 'disconnected':
      return AuthStatusDisconnected.fromJson(json);
    case 'restricted':
      return AuthStatusRestricted.fromJson(json);
    case 'authenticated':
      return AuthStatusAuthenticated.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() disconnected,
    required TResult Function() restricted,
    required TResult Function(
            Map<Role, List<int>> roles, String authId, String token)
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? disconnected,
    TResult? Function()? restricted,
    TResult? Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? disconnected,
    TResult Function()? restricted,
    TResult Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusUnknown value) unknown,
    required TResult Function(AuthStatusDisconnected value) disconnected,
    required TResult Function(AuthStatusRestricted value) restricted,
    required TResult Function(AuthStatusAuthenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusUnknown value)? unknown,
    TResult? Function(AuthStatusDisconnected value)? disconnected,
    TResult? Function(AuthStatusRestricted value)? restricted,
    TResult? Function(AuthStatusAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusUnknown value)? unknown,
    TResult Function(AuthStatusDisconnected value)? disconnected,
    TResult Function(AuthStatusRestricted value)? restricted,
    TResult Function(AuthStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusCopyWith<$Res> {
  factory $AuthStatusCopyWith(
          AuthStatus value, $Res Function(AuthStatus) then) =
      _$AuthStatusCopyWithImpl<$Res, AuthStatus>;
}

/// @nodoc
class _$AuthStatusCopyWithImpl<$Res, $Val extends AuthStatus>
    implements $AuthStatusCopyWith<$Res> {
  _$AuthStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthStatusUnknownImplCopyWith<$Res> {
  factory _$$AuthStatusUnknownImplCopyWith(_$AuthStatusUnknownImpl value,
          $Res Function(_$AuthStatusUnknownImpl) then) =
      __$$AuthStatusUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatusUnknownImplCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$AuthStatusUnknownImpl>
    implements _$$AuthStatusUnknownImplCopyWith<$Res> {
  __$$AuthStatusUnknownImplCopyWithImpl(_$AuthStatusUnknownImpl _value,
      $Res Function(_$AuthStatusUnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthStatusUnknownImpl implements AuthStatusUnknown {
  const _$AuthStatusUnknownImpl({final String? $type})
      : $type = $type ?? 'unknown';

  factory _$AuthStatusUnknownImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStatusUnknownImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthStatus.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStatusUnknownImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() disconnected,
    required TResult Function() restricted,
    required TResult Function(
            Map<Role, List<int>> roles, String authId, String token)
        authenticated,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? disconnected,
    TResult? Function()? restricted,
    TResult? Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? disconnected,
    TResult Function()? restricted,
    TResult Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
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
    required TResult Function(AuthStatusUnknown value) unknown,
    required TResult Function(AuthStatusDisconnected value) disconnected,
    required TResult Function(AuthStatusRestricted value) restricted,
    required TResult Function(AuthStatusAuthenticated value) authenticated,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusUnknown value)? unknown,
    TResult? Function(AuthStatusDisconnected value)? disconnected,
    TResult? Function(AuthStatusRestricted value)? restricted,
    TResult? Function(AuthStatusAuthenticated value)? authenticated,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusUnknown value)? unknown,
    TResult Function(AuthStatusDisconnected value)? disconnected,
    TResult Function(AuthStatusRestricted value)? restricted,
    TResult Function(AuthStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStatusUnknownImplToJson(
      this,
    );
  }
}

abstract class AuthStatusUnknown implements AuthStatus {
  const factory AuthStatusUnknown() = _$AuthStatusUnknownImpl;

  factory AuthStatusUnknown.fromJson(Map<String, dynamic> json) =
      _$AuthStatusUnknownImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthStatusDisconnectedImplCopyWith<$Res> {
  factory _$$AuthStatusDisconnectedImplCopyWith(
          _$AuthStatusDisconnectedImpl value,
          $Res Function(_$AuthStatusDisconnectedImpl) then) =
      __$$AuthStatusDisconnectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatusDisconnectedImplCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$AuthStatusDisconnectedImpl>
    implements _$$AuthStatusDisconnectedImplCopyWith<$Res> {
  __$$AuthStatusDisconnectedImplCopyWithImpl(
      _$AuthStatusDisconnectedImpl _value,
      $Res Function(_$AuthStatusDisconnectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthStatusDisconnectedImpl implements AuthStatusDisconnected {
  const _$AuthStatusDisconnectedImpl({final String? $type})
      : $type = $type ?? 'disconnected';

  factory _$AuthStatusDisconnectedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStatusDisconnectedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthStatus.disconnected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusDisconnectedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() disconnected,
    required TResult Function() restricted,
    required TResult Function(
            Map<Role, List<int>> roles, String authId, String token)
        authenticated,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? disconnected,
    TResult? Function()? restricted,
    TResult? Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? disconnected,
    TResult Function()? restricted,
    TResult Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusUnknown value) unknown,
    required TResult Function(AuthStatusDisconnected value) disconnected,
    required TResult Function(AuthStatusRestricted value) restricted,
    required TResult Function(AuthStatusAuthenticated value) authenticated,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusUnknown value)? unknown,
    TResult? Function(AuthStatusDisconnected value)? disconnected,
    TResult? Function(AuthStatusRestricted value)? restricted,
    TResult? Function(AuthStatusAuthenticated value)? authenticated,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusUnknown value)? unknown,
    TResult Function(AuthStatusDisconnected value)? disconnected,
    TResult Function(AuthStatusRestricted value)? restricted,
    TResult Function(AuthStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStatusDisconnectedImplToJson(
      this,
    );
  }
}

abstract class AuthStatusDisconnected implements AuthStatus {
  const factory AuthStatusDisconnected() = _$AuthStatusDisconnectedImpl;

  factory AuthStatusDisconnected.fromJson(Map<String, dynamic> json) =
      _$AuthStatusDisconnectedImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthStatusRestrictedImplCopyWith<$Res> {
  factory _$$AuthStatusRestrictedImplCopyWith(_$AuthStatusRestrictedImpl value,
          $Res Function(_$AuthStatusRestrictedImpl) then) =
      __$$AuthStatusRestrictedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatusRestrictedImplCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$AuthStatusRestrictedImpl>
    implements _$$AuthStatusRestrictedImplCopyWith<$Res> {
  __$$AuthStatusRestrictedImplCopyWithImpl(_$AuthStatusRestrictedImpl _value,
      $Res Function(_$AuthStatusRestrictedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthStatusRestrictedImpl implements AuthStatusRestricted {
  const _$AuthStatusRestrictedImpl({final String? $type})
      : $type = $type ?? 'restricted';

  factory _$AuthStatusRestrictedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStatusRestrictedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthStatus.restricted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusRestrictedImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() disconnected,
    required TResult Function() restricted,
    required TResult Function(
            Map<Role, List<int>> roles, String authId, String token)
        authenticated,
  }) {
    return restricted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? disconnected,
    TResult? Function()? restricted,
    TResult? Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
  }) {
    return restricted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? disconnected,
    TResult Function()? restricted,
    TResult Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusUnknown value) unknown,
    required TResult Function(AuthStatusDisconnected value) disconnected,
    required TResult Function(AuthStatusRestricted value) restricted,
    required TResult Function(AuthStatusAuthenticated value) authenticated,
  }) {
    return restricted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusUnknown value)? unknown,
    TResult? Function(AuthStatusDisconnected value)? disconnected,
    TResult? Function(AuthStatusRestricted value)? restricted,
    TResult? Function(AuthStatusAuthenticated value)? authenticated,
  }) {
    return restricted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusUnknown value)? unknown,
    TResult Function(AuthStatusDisconnected value)? disconnected,
    TResult Function(AuthStatusRestricted value)? restricted,
    TResult Function(AuthStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStatusRestrictedImplToJson(
      this,
    );
  }
}

abstract class AuthStatusRestricted implements AuthStatus {
  const factory AuthStatusRestricted() = _$AuthStatusRestrictedImpl;

  factory AuthStatusRestricted.fromJson(Map<String, dynamic> json) =
      _$AuthStatusRestrictedImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthStatusAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthStatusAuthenticatedImplCopyWith(
          _$AuthStatusAuthenticatedImpl value,
          $Res Function(_$AuthStatusAuthenticatedImpl) then) =
      __$$AuthStatusAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<Role, List<int>> roles, String authId, String token});
}

/// @nodoc
class __$$AuthStatusAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStatusCopyWithImpl<$Res, _$AuthStatusAuthenticatedImpl>
    implements _$$AuthStatusAuthenticatedImplCopyWith<$Res> {
  __$$AuthStatusAuthenticatedImplCopyWithImpl(
      _$AuthStatusAuthenticatedImpl _value,
      $Res Function(_$AuthStatusAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roles = null,
    Object? authId = null,
    Object? token = null,
  }) {
    return _then(_$AuthStatusAuthenticatedImpl(
      null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as Map<Role, List<int>>,
      null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthStatusAuthenticatedImpl implements AuthStatusAuthenticated {
  const _$AuthStatusAuthenticatedImpl(
      final Map<Role, List<int>> roles, this.authId, this.token,
      {final String? $type})
      : _roles = roles,
        $type = $type ?? 'authenticated';

  factory _$AuthStatusAuthenticatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthStatusAuthenticatedImplFromJson(json);

  final Map<Role, List<int>> _roles;
  @override
  Map<Role, List<int>> get roles {
    if (_roles is EqualUnmodifiableMapView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roles);
  }

  @override
  final String authId;
  @override
  final String token;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthStatus.authenticated(roles: $roles, authId: $authId, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusAuthenticatedImpl &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_roles), authId, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStatusAuthenticatedImplCopyWith<_$AuthStatusAuthenticatedImpl>
      get copyWith => __$$AuthStatusAuthenticatedImplCopyWithImpl<
          _$AuthStatusAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() disconnected,
    required TResult Function() restricted,
    required TResult Function(
            Map<Role, List<int>> roles, String authId, String token)
        authenticated,
  }) {
    return authenticated(roles, authId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? disconnected,
    TResult? Function()? restricted,
    TResult? Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
  }) {
    return authenticated?.call(roles, authId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? disconnected,
    TResult Function()? restricted,
    TResult Function(Map<Role, List<int>> roles, String authId, String token)?
        authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(roles, authId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStatusUnknown value) unknown,
    required TResult Function(AuthStatusDisconnected value) disconnected,
    required TResult Function(AuthStatusRestricted value) restricted,
    required TResult Function(AuthStatusAuthenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStatusUnknown value)? unknown,
    TResult? Function(AuthStatusDisconnected value)? disconnected,
    TResult? Function(AuthStatusRestricted value)? restricted,
    TResult? Function(AuthStatusAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStatusUnknown value)? unknown,
    TResult Function(AuthStatusDisconnected value)? disconnected,
    TResult Function(AuthStatusRestricted value)? restricted,
    TResult Function(AuthStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthStatusAuthenticatedImplToJson(
      this,
    );
  }
}

abstract class AuthStatusAuthenticated implements AuthStatus {
  const factory AuthStatusAuthenticated(final Map<Role, List<int>> roles,
      final String authId, final String token) = _$AuthStatusAuthenticatedImpl;

  factory AuthStatusAuthenticated.fromJson(Map<String, dynamic> json) =
      _$AuthStatusAuthenticatedImpl.fromJson;

  Map<Role, List<int>> get roles;
  String get authId;
  String get token;
  @JsonKey(ignore: true)
  _$$AuthStatusAuthenticatedImplCopyWith<_$AuthStatusAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
