// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIError _$APIErrorFromJson(Map<String, dynamic> json) {
  return _APIError.fromJson(json);
}

/// @nodoc
mixin _$APIError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String? get debug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $APIErrorCopyWith<APIError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIErrorCopyWith<$Res> {
  factory $APIErrorCopyWith(APIError value, $Res Function(APIError) then) =
      _$APIErrorCopyWithImpl<$Res, APIError>;
  @useResult
  $Res call({String code, String message, String reason, String? debug});
}

/// @nodoc
class _$APIErrorCopyWithImpl<$Res, $Val extends APIError>
    implements $APIErrorCopyWith<$Res> {
  _$APIErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? reason = null,
    Object? debug = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      debug: freezed == debug
          ? _value.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$APIErrorImplCopyWith<$Res>
    implements $APIErrorCopyWith<$Res> {
  factory _$$APIErrorImplCopyWith(
          _$APIErrorImpl value, $Res Function(_$APIErrorImpl) then) =
      __$$APIErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String reason, String? debug});
}

/// @nodoc
class __$$APIErrorImplCopyWithImpl<$Res>
    extends _$APIErrorCopyWithImpl<$Res, _$APIErrorImpl>
    implements _$$APIErrorImplCopyWith<$Res> {
  __$$APIErrorImplCopyWithImpl(
      _$APIErrorImpl _value, $Res Function(_$APIErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? reason = null,
    Object? debug = freezed,
  }) {
    return _then(_$APIErrorImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      debug: freezed == debug
          ? _value.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIErrorImpl extends _APIError {
  const _$APIErrorImpl(this.code, this.message, this.reason, {this.debug})
      : super._();

  factory _$APIErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIErrorImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String reason;
  @override
  final String? debug;

  @override
  String toString() {
    return 'APIError(code: $code, message: $message, reason: $reason, debug: $debug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.debug, debug) || other.debug == debug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, reason, debug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIErrorImplCopyWith<_$APIErrorImpl> get copyWith =>
      __$$APIErrorImplCopyWithImpl<_$APIErrorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$APIErrorImplToJson(
      this,
    );
  }
}

abstract class _APIError extends APIError {
  const factory _APIError(
      final String code, final String message, final String reason,
      {final String? debug}) = _$APIErrorImpl;
  const _APIError._() : super._();

  factory _APIError.fromJson(Map<String, dynamic> json) =
      _$APIErrorImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String get reason;
  @override
  String? get debug;
  @override
  @JsonKey(ignore: true)
  _$$APIErrorImplCopyWith<_$APIErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
