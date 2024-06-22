// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'end_user_authorization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EndUserAuthorization _$EndUserAuthorizationFromJson(Map<String, dynamic> json) {
  return _EndUserAuthorization.fromJson(json);
}

/// @nodoc
mixin _$EndUserAuthorization {
  bool get authorized => throw _privateConstructorUsedError;
  EndUserAuthorizationCode get code => throw _privateConstructorUsedError;
  String get hint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndUserAuthorizationCopyWith<EndUserAuthorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndUserAuthorizationCopyWith<$Res> {
  factory $EndUserAuthorizationCopyWith(EndUserAuthorization value,
          $Res Function(EndUserAuthorization) then) =
      _$EndUserAuthorizationCopyWithImpl<$Res, EndUserAuthorization>;
  @useResult
  $Res call({bool authorized, EndUserAuthorizationCode code, String hint});
}

/// @nodoc
class _$EndUserAuthorizationCopyWithImpl<$Res,
        $Val extends EndUserAuthorization>
    implements $EndUserAuthorizationCopyWith<$Res> {
  _$EndUserAuthorizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorized = null,
    Object? code = null,
    Object? hint = null,
  }) {
    return _then(_value.copyWith(
      authorized: null == authorized
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as EndUserAuthorizationCode,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndUserAuthorizationImplCopyWith<$Res>
    implements $EndUserAuthorizationCopyWith<$Res> {
  factory _$$EndUserAuthorizationImplCopyWith(_$EndUserAuthorizationImpl value,
          $Res Function(_$EndUserAuthorizationImpl) then) =
      __$$EndUserAuthorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool authorized, EndUserAuthorizationCode code, String hint});
}

/// @nodoc
class __$$EndUserAuthorizationImplCopyWithImpl<$Res>
    extends _$EndUserAuthorizationCopyWithImpl<$Res, _$EndUserAuthorizationImpl>
    implements _$$EndUserAuthorizationImplCopyWith<$Res> {
  __$$EndUserAuthorizationImplCopyWithImpl(_$EndUserAuthorizationImpl _value,
      $Res Function(_$EndUserAuthorizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorized = null,
    Object? code = null,
    Object? hint = null,
  }) {
    return _then(_$EndUserAuthorizationImpl(
      authorized: null == authorized
          ? _value.authorized
          : authorized // ignore: cast_nullable_to_non_nullable
              as bool,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as EndUserAuthorizationCode,
      hint: null == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EndUserAuthorizationImpl implements _EndUserAuthorization {
  const _$EndUserAuthorizationImpl(
      {required this.authorized, required this.code, required this.hint});

  factory _$EndUserAuthorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndUserAuthorizationImplFromJson(json);

  @override
  final bool authorized;
  @override
  final EndUserAuthorizationCode code;
  @override
  final String hint;

  @override
  String toString() {
    return 'EndUserAuthorization(authorized: $authorized, code: $code, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndUserAuthorizationImpl &&
            (identical(other.authorized, authorized) ||
                other.authorized == authorized) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorized, code, hint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EndUserAuthorizationImplCopyWith<_$EndUserAuthorizationImpl>
      get copyWith =>
          __$$EndUserAuthorizationImplCopyWithImpl<_$EndUserAuthorizationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EndUserAuthorizationImplToJson(
      this,
    );
  }
}

abstract class _EndUserAuthorization implements EndUserAuthorization {
  const factory _EndUserAuthorization(
      {required final bool authorized,
      required final EndUserAuthorizationCode code,
      required final String hint}) = _$EndUserAuthorizationImpl;

  factory _EndUserAuthorization.fromJson(Map<String, dynamic> json) =
      _$EndUserAuthorizationImpl.fromJson;

  @override
  bool get authorized;
  @override
  EndUserAuthorizationCode get code;
  @override
  String get hint;
  @override
  @JsonKey(ignore: true)
  _$$EndUserAuthorizationImplCopyWith<_$EndUserAuthorizationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
