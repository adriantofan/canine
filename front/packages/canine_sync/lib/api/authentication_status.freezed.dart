// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationStatus _$AuthenticationStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'unknown':
      return AuthenticationStatusUnknown.fromJson(json);
    case 'unauthenticated':
      return AuthenticationStatusUnauthenticated.fromJson(json);
    case 'authenticated':
      return AuthenticationStatusAuthenticated.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'AuthenticationStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthenticationStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Identity? identity) unauthenticated,
    required TResult Function(Identity identity) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Identity? identity)? unauthenticated,
    TResult? Function(Identity identity)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Identity? identity)? unauthenticated,
    TResult Function(Identity identity)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStatusUnknown value) unknown,
    required TResult Function(AuthenticationStatusUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStatusAuthenticated value)
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatusUnknown value)? unknown,
    TResult? Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult? Function(AuthenticationStatusAuthenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStatusUnknown value)? unknown,
    TResult Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult Function(AuthenticationStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStatusCopyWith<$Res> {
  factory $AuthenticationStatusCopyWith(AuthenticationStatus value,
          $Res Function(AuthenticationStatus) then) =
      _$AuthenticationStatusCopyWithImpl<$Res, AuthenticationStatus>;
}

/// @nodoc
class _$AuthenticationStatusCopyWithImpl<$Res,
        $Val extends AuthenticationStatus>
    implements $AuthenticationStatusCopyWith<$Res> {
  _$AuthenticationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthenticationStatusUnknownImplCopyWith<$Res> {
  factory _$$AuthenticationStatusUnknownImplCopyWith(
          _$AuthenticationStatusUnknownImpl value,
          $Res Function(_$AuthenticationStatusUnknownImpl) then) =
      __$$AuthenticationStatusUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticationStatusUnknownImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res,
        _$AuthenticationStatusUnknownImpl>
    implements _$$AuthenticationStatusUnknownImplCopyWith<$Res> {
  __$$AuthenticationStatusUnknownImplCopyWithImpl(
      _$AuthenticationStatusUnknownImpl _value,
      $Res Function(_$AuthenticationStatusUnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationStatusUnknownImpl implements AuthenticationStatusUnknown {
  _$AuthenticationStatusUnknownImpl({final String? $type})
      : $type = $type ?? 'unknown';

  factory _$AuthenticationStatusUnknownImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AuthenticationStatusUnknownImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationStatus.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStatusUnknownImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Identity? identity) unauthenticated,
    required TResult Function(Identity identity) authenticated,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Identity? identity)? unauthenticated,
    TResult? Function(Identity identity)? authenticated,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Identity? identity)? unauthenticated,
    TResult Function(Identity identity)? authenticated,
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
    required TResult Function(AuthenticationStatusUnknown value) unknown,
    required TResult Function(AuthenticationStatusUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStatusAuthenticated value)
        authenticated,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatusUnknown value)? unknown,
    TResult? Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult? Function(AuthenticationStatusAuthenticated value)? authenticated,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStatusUnknown value)? unknown,
    TResult Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult Function(AuthenticationStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationStatusUnknownImplToJson(
      this,
    );
  }
}

abstract class AuthenticationStatusUnknown implements AuthenticationStatus {
  factory AuthenticationStatusUnknown() = _$AuthenticationStatusUnknownImpl;

  factory AuthenticationStatusUnknown.fromJson(Map<String, dynamic> json) =
      _$AuthenticationStatusUnknownImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthenticationStatusUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticationStatusUnauthenticatedImplCopyWith(
          _$AuthenticationStatusUnauthenticatedImpl value,
          $Res Function(_$AuthenticationStatusUnauthenticatedImpl) then) =
      __$$AuthenticationStatusUnauthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity? identity});

  $IdentityCopyWith<$Res>? get identity;
}

/// @nodoc
class __$$AuthenticationStatusUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res,
        _$AuthenticationStatusUnauthenticatedImpl>
    implements _$$AuthenticationStatusUnauthenticatedImplCopyWith<$Res> {
  __$$AuthenticationStatusUnauthenticatedImplCopyWithImpl(
      _$AuthenticationStatusUnauthenticatedImpl _value,
      $Res Function(_$AuthenticationStatusUnauthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = freezed,
  }) {
    return _then(_$AuthenticationStatusUnauthenticatedImpl(
      freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res>? get identity {
    if (_value.identity == null) {
      return null;
    }

    return $IdentityCopyWith<$Res>(_value.identity!, (value) {
      return _then(_value.copyWith(identity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationStatusUnauthenticatedImpl
    implements AuthenticationStatusUnauthenticated {
  _$AuthenticationStatusUnauthenticatedImpl(this.identity,
      {final String? $type})
      : $type = $type ?? 'unauthenticated';

  factory _$AuthenticationStatusUnauthenticatedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AuthenticationStatusUnauthenticatedImplFromJson(json);

  @override
  final Identity? identity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationStatus.unauthenticated(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStatusUnauthenticatedImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStatusUnauthenticatedImplCopyWith<
          _$AuthenticationStatusUnauthenticatedImpl>
      get copyWith => __$$AuthenticationStatusUnauthenticatedImplCopyWithImpl<
          _$AuthenticationStatusUnauthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Identity? identity) unauthenticated,
    required TResult Function(Identity identity) authenticated,
  }) {
    return unauthenticated(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Identity? identity)? unauthenticated,
    TResult? Function(Identity identity)? authenticated,
  }) {
    return unauthenticated?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Identity? identity)? unauthenticated,
    TResult Function(Identity identity)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStatusUnknown value) unknown,
    required TResult Function(AuthenticationStatusUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStatusAuthenticated value)
        authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatusUnknown value)? unknown,
    TResult? Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult? Function(AuthenticationStatusAuthenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStatusUnknown value)? unknown,
    TResult Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult Function(AuthenticationStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationStatusUnauthenticatedImplToJson(
      this,
    );
  }
}

abstract class AuthenticationStatusUnauthenticated
    implements AuthenticationStatus {
  factory AuthenticationStatusUnauthenticated(final Identity? identity) =
      _$AuthenticationStatusUnauthenticatedImpl;

  factory AuthenticationStatusUnauthenticated.fromJson(
          Map<String, dynamic> json) =
      _$AuthenticationStatusUnauthenticatedImpl.fromJson;

  Identity? get identity;
  @JsonKey(ignore: true)
  _$$AuthenticationStatusUnauthenticatedImplCopyWith<
          _$AuthenticationStatusUnauthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationStatusAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticationStatusAuthenticatedImplCopyWith(
          _$AuthenticationStatusAuthenticatedImpl value,
          $Res Function(_$AuthenticationStatusAuthenticatedImpl) then) =
      __$$AuthenticationStatusAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Identity identity});

  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$AuthenticationStatusAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthenticationStatusCopyWithImpl<$Res,
        _$AuthenticationStatusAuthenticatedImpl>
    implements _$$AuthenticationStatusAuthenticatedImplCopyWith<$Res> {
  __$$AuthenticationStatusAuthenticatedImplCopyWithImpl(
      _$AuthenticationStatusAuthenticatedImpl _value,
      $Res Function(_$AuthenticationStatusAuthenticatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
  }) {
    return _then(_$AuthenticationStatusAuthenticatedImpl(
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
@JsonSerializable()
class _$AuthenticationStatusAuthenticatedImpl
    implements AuthenticationStatusAuthenticated {
  _$AuthenticationStatusAuthenticatedImpl(this.identity, {final String? $type})
      : $type = $type ?? 'authenticated';

  factory _$AuthenticationStatusAuthenticatedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AuthenticationStatusAuthenticatedImplFromJson(json);

  @override
  final Identity identity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthenticationStatus.authenticated(identity: $identity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationStatusAuthenticatedImpl &&
            (identical(other.identity, identity) ||
                other.identity == identity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationStatusAuthenticatedImplCopyWith<
          _$AuthenticationStatusAuthenticatedImpl>
      get copyWith => __$$AuthenticationStatusAuthenticatedImplCopyWithImpl<
          _$AuthenticationStatusAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function(Identity? identity) unauthenticated,
    required TResult Function(Identity identity) authenticated,
  }) {
    return authenticated(identity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function(Identity? identity)? unauthenticated,
    TResult? Function(Identity identity)? authenticated,
  }) {
    return authenticated?.call(identity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function(Identity? identity)? unauthenticated,
    TResult Function(Identity identity)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(identity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationStatusUnknown value) unknown,
    required TResult Function(AuthenticationStatusUnauthenticated value)
        unauthenticated,
    required TResult Function(AuthenticationStatusAuthenticated value)
        authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthenticationStatusUnknown value)? unknown,
    TResult? Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult? Function(AuthenticationStatusAuthenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationStatusUnknown value)? unknown,
    TResult Function(AuthenticationStatusUnauthenticated value)?
        unauthenticated,
    TResult Function(AuthenticationStatusAuthenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationStatusAuthenticatedImplToJson(
      this,
    );
  }
}

abstract class AuthenticationStatusAuthenticated
    implements AuthenticationStatus {
  factory AuthenticationStatusAuthenticated(final Identity identity) =
      _$AuthenticationStatusAuthenticatedImpl;

  factory AuthenticationStatusAuthenticated.fromJson(
          Map<String, dynamic> json) =
      _$AuthenticationStatusAuthenticatedImpl.fromJson;

  Identity get identity;
  @JsonKey(ignore: true)
  _$$AuthenticationStatusAuthenticatedImplCopyWith<
          _$AuthenticationStatusAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
