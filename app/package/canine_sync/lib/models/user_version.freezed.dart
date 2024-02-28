// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserVersion _$UserVersionFromJson(Map<String, dynamic> json) {
  return _UserVersion.fromJson(json);
}

/// @nodoc
mixin _$UserVersion {
  @TimestampSerializer()
  DateTime get maxUpdateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserVersionCopyWith<UserVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserVersionCopyWith<$Res> {
  factory $UserVersionCopyWith(
          UserVersion value, $Res Function(UserVersion) then) =
      _$UserVersionCopyWithImpl<$Res, UserVersion>;
  @useResult
  $Res call({@TimestampSerializer() DateTime maxUpdateTime});
}

/// @nodoc
class _$UserVersionCopyWithImpl<$Res, $Val extends UserVersion>
    implements $UserVersionCopyWith<$Res> {
  _$UserVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxUpdateTime = null,
  }) {
    return _then(_value.copyWith(
      maxUpdateTime: null == maxUpdateTime
          ? _value.maxUpdateTime
          : maxUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserVersionImplCopyWith<$Res>
    implements $UserVersionCopyWith<$Res> {
  factory _$$UserVersionImplCopyWith(
          _$UserVersionImpl value, $Res Function(_$UserVersionImpl) then) =
      __$$UserVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimestampSerializer() DateTime maxUpdateTime});
}

/// @nodoc
class __$$UserVersionImplCopyWithImpl<$Res>
    extends _$UserVersionCopyWithImpl<$Res, _$UserVersionImpl>
    implements _$$UserVersionImplCopyWith<$Res> {
  __$$UserVersionImplCopyWithImpl(
      _$UserVersionImpl _value, $Res Function(_$UserVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxUpdateTime = null,
  }) {
    return _then(_$UserVersionImpl(
      maxUpdateTime: null == maxUpdateTime
          ? _value.maxUpdateTime
          : maxUpdateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserVersionImpl implements _UserVersion {
  const _$UserVersionImpl({@TimestampSerializer() required this.maxUpdateTime});

  factory _$UserVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserVersionImplFromJson(json);

  @override
  @TimestampSerializer()
  final DateTime maxUpdateTime;

  @override
  String toString() {
    return 'UserVersion(maxUpdateTime: $maxUpdateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserVersionImpl &&
            (identical(other.maxUpdateTime, maxUpdateTime) ||
                other.maxUpdateTime == maxUpdateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, maxUpdateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserVersionImplCopyWith<_$UserVersionImpl> get copyWith =>
      __$$UserVersionImplCopyWithImpl<_$UserVersionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserVersionImplToJson(
      this,
    );
  }
}

abstract class _UserVersion implements UserVersion {
  const factory _UserVersion(
          {@TimestampSerializer() required final DateTime maxUpdateTime}) =
      _$UserVersionImpl;

  factory _UserVersion.fromJson(Map<String, dynamic> json) =
      _$UserVersionImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime get maxUpdateTime;
  @override
  @JsonKey(ignore: true)
  _$$UserVersionImplCopyWith<_$UserVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
