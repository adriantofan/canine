// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtc_remote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RtcRemote _$RtcRemoteFromJson(Map<String, dynamic> json) {
  return _RtcRemote.fromJson(json);
}

/// @nodoc
mixin _$RtcRemote {
  Range? get conversationsUpdateSeq => throw _privateConstructorUsedError;
  List<MessageRange>? get messageRange => throw _privateConstructorUsedError;
  UserVersion? get lastKnownUserVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RtcRemoteCopyWith<RtcRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RtcRemoteCopyWith<$Res> {
  factory $RtcRemoteCopyWith(RtcRemote value, $Res Function(RtcRemote) then) =
      _$RtcRemoteCopyWithImpl<$Res, RtcRemote>;
  @useResult
  $Res call(
      {Range? conversationsUpdateSeq,
      List<MessageRange>? messageRange,
      UserVersion? lastKnownUserVersion});

  $RangeCopyWith<$Res>? get conversationsUpdateSeq;
  $UserVersionCopyWith<$Res>? get lastKnownUserVersion;
}

/// @nodoc
class _$RtcRemoteCopyWithImpl<$Res, $Val extends RtcRemote>
    implements $RtcRemoteCopyWith<$Res> {
  _$RtcRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsUpdateSeq = freezed,
    Object? messageRange = freezed,
    Object? lastKnownUserVersion = freezed,
  }) {
    return _then(_value.copyWith(
      conversationsUpdateSeq: freezed == conversationsUpdateSeq
          ? _value.conversationsUpdateSeq
          : conversationsUpdateSeq // ignore: cast_nullable_to_non_nullable
              as Range?,
      messageRange: freezed == messageRange
          ? _value.messageRange
          : messageRange // ignore: cast_nullable_to_non_nullable
              as List<MessageRange>?,
      lastKnownUserVersion: freezed == lastKnownUserVersion
          ? _value.lastKnownUserVersion
          : lastKnownUserVersion // ignore: cast_nullable_to_non_nullable
              as UserVersion?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RangeCopyWith<$Res>? get conversationsUpdateSeq {
    if (_value.conversationsUpdateSeq == null) {
      return null;
    }

    return $RangeCopyWith<$Res>(_value.conversationsUpdateSeq!, (value) {
      return _then(_value.copyWith(conversationsUpdateSeq: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserVersionCopyWith<$Res>? get lastKnownUserVersion {
    if (_value.lastKnownUserVersion == null) {
      return null;
    }

    return $UserVersionCopyWith<$Res>(_value.lastKnownUserVersion!, (value) {
      return _then(_value.copyWith(lastKnownUserVersion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RtcRemoteImplCopyWith<$Res>
    implements $RtcRemoteCopyWith<$Res> {
  factory _$$RtcRemoteImplCopyWith(
          _$RtcRemoteImpl value, $Res Function(_$RtcRemoteImpl) then) =
      __$$RtcRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Range? conversationsUpdateSeq,
      List<MessageRange>? messageRange,
      UserVersion? lastKnownUserVersion});

  @override
  $RangeCopyWith<$Res>? get conversationsUpdateSeq;
  @override
  $UserVersionCopyWith<$Res>? get lastKnownUserVersion;
}

/// @nodoc
class __$$RtcRemoteImplCopyWithImpl<$Res>
    extends _$RtcRemoteCopyWithImpl<$Res, _$RtcRemoteImpl>
    implements _$$RtcRemoteImplCopyWith<$Res> {
  __$$RtcRemoteImplCopyWithImpl(
      _$RtcRemoteImpl _value, $Res Function(_$RtcRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationsUpdateSeq = freezed,
    Object? messageRange = freezed,
    Object? lastKnownUserVersion = freezed,
  }) {
    return _then(_$RtcRemoteImpl(
      conversationsUpdateSeq: freezed == conversationsUpdateSeq
          ? _value.conversationsUpdateSeq
          : conversationsUpdateSeq // ignore: cast_nullable_to_non_nullable
              as Range?,
      messageRange: freezed == messageRange
          ? _value._messageRange
          : messageRange // ignore: cast_nullable_to_non_nullable
              as List<MessageRange>?,
      lastKnownUserVersion: freezed == lastKnownUserVersion
          ? _value.lastKnownUserVersion
          : lastKnownUserVersion // ignore: cast_nullable_to_non_nullable
              as UserVersion?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RtcRemoteImpl implements _RtcRemote {
  const _$RtcRemoteImpl(
      {this.conversationsUpdateSeq,
      final List<MessageRange>? messageRange,
      this.lastKnownUserVersion})
      : _messageRange = messageRange;

  factory _$RtcRemoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RtcRemoteImplFromJson(json);

  @override
  final Range? conversationsUpdateSeq;
  final List<MessageRange>? _messageRange;
  @override
  List<MessageRange>? get messageRange {
    final value = _messageRange;
    if (value == null) return null;
    if (_messageRange is EqualUnmodifiableListView) return _messageRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserVersion? lastKnownUserVersion;

  @override
  String toString() {
    return 'RtcRemote(conversationsUpdateSeq: $conversationsUpdateSeq, messageRange: $messageRange, lastKnownUserVersion: $lastKnownUserVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RtcRemoteImpl &&
            (identical(other.conversationsUpdateSeq, conversationsUpdateSeq) ||
                other.conversationsUpdateSeq == conversationsUpdateSeq) &&
            const DeepCollectionEquality()
                .equals(other._messageRange, _messageRange) &&
            (identical(other.lastKnownUserVersion, lastKnownUserVersion) ||
                other.lastKnownUserVersion == lastKnownUserVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conversationsUpdateSeq,
      const DeepCollectionEquality().hash(_messageRange), lastKnownUserVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RtcRemoteImplCopyWith<_$RtcRemoteImpl> get copyWith =>
      __$$RtcRemoteImplCopyWithImpl<_$RtcRemoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RtcRemoteImplToJson(
      this,
    );
  }
}

abstract class _RtcRemote implements RtcRemote {
  const factory _RtcRemote(
      {final Range? conversationsUpdateSeq,
      final List<MessageRange>? messageRange,
      final UserVersion? lastKnownUserVersion}) = _$RtcRemoteImpl;

  factory _RtcRemote.fromJson(Map<String, dynamic> json) =
      _$RtcRemoteImpl.fromJson;

  @override
  Range? get conversationsUpdateSeq;
  @override
  List<MessageRange>? get messageRange;
  @override
  UserVersion? get lastKnownUserVersion;
  @override
  @JsonKey(ignore: true)
  _$$RtcRemoteImplCopyWith<_$RtcRemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
