// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageRange _$MessageRangeFromJson(Map<String, dynamic> json) {
  return _MessageRange.fromJson(json);
}

/// @nodoc
mixin _$MessageRange {
  int get conversationId => throw _privateConstructorUsedError;
  Range get range => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageRangeCopyWith<MessageRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageRangeCopyWith<$Res> {
  factory $MessageRangeCopyWith(
          MessageRange value, $Res Function(MessageRange) then) =
      _$MessageRangeCopyWithImpl<$Res, MessageRange>;
  @useResult
  $Res call({int conversationId, Range range});

  $RangeCopyWith<$Res> get range;
}

/// @nodoc
class _$MessageRangeCopyWithImpl<$Res, $Val extends MessageRange>
    implements $MessageRangeCopyWith<$Res> {
  _$MessageRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? range = null,
  }) {
    return _then(_value.copyWith(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Range,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res> get range {
    return $RangeCopyWith<$Res>(_value.range, (value) {
      return _then(_value.copyWith(range: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageRangeImplCopyWith<$Res>
    implements $MessageRangeCopyWith<$Res> {
  factory _$$MessageRangeImplCopyWith(
          _$MessageRangeImpl value, $Res Function(_$MessageRangeImpl) then) =
      __$$MessageRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int conversationId, Range range});

  @override
  $RangeCopyWith<$Res> get range;
}

/// @nodoc
class __$$MessageRangeImplCopyWithImpl<$Res>
    extends _$MessageRangeCopyWithImpl<$Res, _$MessageRangeImpl>
    implements _$$MessageRangeImplCopyWith<$Res> {
  __$$MessageRangeImplCopyWithImpl(
      _$MessageRangeImpl _value, $Res Function(_$MessageRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? range = null,
  }) {
    return _then(_$MessageRangeImpl(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as Range,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageRangeImpl implements _MessageRange {
  const _$MessageRangeImpl({required this.conversationId, required this.range});

  factory _$MessageRangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageRangeImplFromJson(json);

  @override
  final int conversationId;
  @override
  final Range range;

  @override
  String toString() {
    return 'MessageRange(conversationId: $conversationId, range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRangeImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.range, range) || other.range == range));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conversationId, range);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageRangeImplCopyWith<_$MessageRangeImpl> get copyWith =>
      __$$MessageRangeImplCopyWithImpl<_$MessageRangeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageRangeImplToJson(
      this,
    );
  }
}

abstract class _MessageRange implements MessageRange {
  const factory _MessageRange(
      {required final int conversationId,
      required final Range range}) = _$MessageRangeImpl;

  factory _MessageRange.fromJson(Map<String, dynamic> json) =
      _$MessageRangeImpl.fromJson;

  @override
  int get conversationId;
  @override
  Range get range;
  @override
  @JsonKey(ignore: true)
  _$$MessageRangeImplCopyWith<_$MessageRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
