// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryState {
  int get startId => throw _privateConstructorUsedError;
  RemoteDataStatus get startStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call({int startId, RemoteDataStatus startStatus});

  $RemoteDataStatusCopyWith<$Res> get startStatus;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startId = null,
    Object? startStatus = null,
  }) {
    return _then(_value.copyWith(
      startId: null == startId
          ? _value.startId
          : startId // ignore: cast_nullable_to_non_nullable
              as int,
      startStatus: null == startStatus
          ? _value.startStatus
          : startStatus // ignore: cast_nullable_to_non_nullable
              as RemoteDataStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteDataStatusCopyWith<$Res> get startStatus {
    return $RemoteDataStatusCopyWith<$Res>(_value.startStatus, (value) {
      return _then(_value.copyWith(startStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startId, RemoteDataStatus startStatus});

  @override
  $RemoteDataStatusCopyWith<$Res> get startStatus;
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startId = null,
    Object? startStatus = null,
  }) {
    return _then(_$HistoryStateImpl(
      null == startId
          ? _value.startId
          : startId // ignore: cast_nullable_to_non_nullable
              as int,
      null == startStatus
          ? _value.startStatus
          : startStatus // ignore: cast_nullable_to_non_nullable
              as RemoteDataStatus,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(this.startId, this.startStatus);

  @override
  final int startId;
  @override
  final RemoteDataStatus startStatus;

  @override
  String toString() {
    return 'HistoryState(startId: $startId, startStatus: $startStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            (identical(other.startId, startId) || other.startId == startId) &&
            (identical(other.startStatus, startStatus) ||
                other.startStatus == startStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startId, startStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
          final int startId, final RemoteDataStatus startStatus) =
      _$HistoryStateImpl;

  @override
  int get startId;
  @override
  RemoteDataStatus get startStatus;
  @override
  @JsonKey(ignore: true)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
