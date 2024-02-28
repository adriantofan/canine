// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Range _$RangeFromJson(Map<String, dynamic> json) {
  return _Range.fromJson(json);
}

/// @nodoc
mixin _$Range {
  int get firstId => throw _privateConstructorUsedError;
  int get lastId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RangeCopyWith<Range> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeCopyWith<$Res> {
  factory $RangeCopyWith(Range value, $Res Function(Range) then) =
      _$RangeCopyWithImpl<$Res, Range>;
  @useResult
  $Res call({int firstId, int lastId});
}

/// @nodoc
class _$RangeCopyWithImpl<$Res, $Val extends Range>
    implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstId = null,
    Object? lastId = null,
  }) {
    return _then(_value.copyWith(
      firstId: null == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as int,
      lastId: null == lastId
          ? _value.lastId
          : lastId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RangeImplCopyWith<$Res> implements $RangeCopyWith<$Res> {
  factory _$$RangeImplCopyWith(
          _$RangeImpl value, $Res Function(_$RangeImpl) then) =
      __$$RangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int firstId, int lastId});
}

/// @nodoc
class __$$RangeImplCopyWithImpl<$Res>
    extends _$RangeCopyWithImpl<$Res, _$RangeImpl>
    implements _$$RangeImplCopyWith<$Res> {
  __$$RangeImplCopyWithImpl(
      _$RangeImpl _value, $Res Function(_$RangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstId = null,
    Object? lastId = null,
  }) {
    return _then(_$RangeImpl(
      firstId: null == firstId
          ? _value.firstId
          : firstId // ignore: cast_nullable_to_non_nullable
              as int,
      lastId: null == lastId
          ? _value.lastId
          : lastId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RangeImpl implements _Range {
  const _$RangeImpl({required this.firstId, required this.lastId});

  factory _$RangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RangeImplFromJson(json);

  @override
  final int firstId;
  @override
  final int lastId;

  @override
  String toString() {
    return 'Range(firstId: $firstId, lastId: $lastId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RangeImpl &&
            (identical(other.firstId, firstId) || other.firstId == firstId) &&
            (identical(other.lastId, lastId) || other.lastId == lastId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstId, lastId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RangeImplCopyWith<_$RangeImpl> get copyWith =>
      __$$RangeImplCopyWithImpl<_$RangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RangeImplToJson(
      this,
    );
  }
}

abstract class _Range implements Range {
  const factory _Range(
      {required final int firstId, required final int lastId}) = _$RangeImpl;

  factory _Range.fromJson(Map<String, dynamic> json) = _$RangeImpl.fromJson;

  @override
  int get firstId;
  @override
  int get lastId;
  @override
  @JsonKey(ignore: true)
  _$$RangeImplCopyWith<_$RangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
