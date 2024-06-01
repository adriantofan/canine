// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CredentialSet _$CredentialSetFromJson(Map<String, dynamic> json) {
  return _Credential.fromJson(json);
}

/// @nodoc
mixin _$CredentialSet {
  Identity get identity => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  DateTime? get tokenExpiration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialSetCopyWith<CredentialSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialSetCopyWith<$Res> {
  factory $CredentialSetCopyWith(
          CredentialSet value, $Res Function(CredentialSet) then) =
      _$CredentialSetCopyWithImpl<$Res, CredentialSet>;
  @useResult
  $Res call({Identity identity, String? token, DateTime? tokenExpiration});

  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class _$CredentialSetCopyWithImpl<$Res, $Val extends CredentialSet>
    implements $CredentialSetCopyWith<$Res> {
  _$CredentialSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? token = freezed,
    Object? tokenExpiration = freezed,
  }) {
    return _then(_value.copyWith(
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiration: freezed == tokenExpiration
          ? _value.tokenExpiration
          : tokenExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IdentityCopyWith<$Res> get identity {
    return $IdentityCopyWith<$Res>(_value.identity, (value) {
      return _then(_value.copyWith(identity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CredentialImplCopyWith<$Res>
    implements $CredentialSetCopyWith<$Res> {
  factory _$$CredentialImplCopyWith(
          _$CredentialImpl value, $Res Function(_$CredentialImpl) then) =
      __$$CredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Identity identity, String? token, DateTime? tokenExpiration});

  @override
  $IdentityCopyWith<$Res> get identity;
}

/// @nodoc
class __$$CredentialImplCopyWithImpl<$Res>
    extends _$CredentialSetCopyWithImpl<$Res, _$CredentialImpl>
    implements _$$CredentialImplCopyWith<$Res> {
  __$$CredentialImplCopyWithImpl(
      _$CredentialImpl _value, $Res Function(_$CredentialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = null,
    Object? token = freezed,
    Object? tokenExpiration = freezed,
  }) {
    return _then(_$CredentialImpl(
      identity: null == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenExpiration: freezed == tokenExpiration
          ? _value.tokenExpiration
          : tokenExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CredentialImpl extends _Credential {
  _$CredentialImpl({required this.identity, this.token, this.tokenExpiration})
      : super._();

  factory _$CredentialImpl.fromJson(Map<String, dynamic> json) =>
      _$$CredentialImplFromJson(json);

  @override
  final Identity identity;
  @override
  final String? token;
  @override
  final DateTime? tokenExpiration;

  @override
  String toString() {
    return 'CredentialSet(identity: $identity, token: $token, tokenExpiration: $tokenExpiration)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CredentialImplCopyWith<_$CredentialImpl> get copyWith =>
      __$$CredentialImplCopyWithImpl<_$CredentialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CredentialImplToJson(
      this,
    );
  }
}

abstract class _Credential extends CredentialSet {
  factory _Credential(
      {required final Identity identity,
      final String? token,
      final DateTime? tokenExpiration}) = _$CredentialImpl;
  _Credential._() : super._();

  factory _Credential.fromJson(Map<String, dynamic> json) =
      _$CredentialImpl.fromJson;

  @override
  Identity get identity;
  @override
  String? get token;
  @override
  DateTime? get tokenExpiration;
  @override
  @JsonKey(ignore: true)
  _$$CredentialImplCopyWith<_$CredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
