// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListSyncState {
  RemoteDataStatus get startStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListSyncStateCopyWith<ListSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListSyncStateCopyWith<$Res> {
  factory $ListSyncStateCopyWith(
          ListSyncState value, $Res Function(ListSyncState) then) =
      _$ListSyncStateCopyWithImpl<$Res, ListSyncState>;
  @useResult
  $Res call({RemoteDataStatus startStatus});

  $RemoteDataStatusCopyWith<$Res> get startStatus;
}

/// @nodoc
class _$ListSyncStateCopyWithImpl<$Res, $Val extends ListSyncState>
    implements $ListSyncStateCopyWith<$Res> {
  _$ListSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startStatus = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$ListSyncStateImplCopyWith<$Res>
    implements $ListSyncStateCopyWith<$Res> {
  factory _$$ListSyncStateImplCopyWith(
          _$ListSyncStateImpl value, $Res Function(_$ListSyncStateImpl) then) =
      __$$ListSyncStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RemoteDataStatus startStatus});

  @override
  $RemoteDataStatusCopyWith<$Res> get startStatus;
}

/// @nodoc
class __$$ListSyncStateImplCopyWithImpl<$Res>
    extends _$ListSyncStateCopyWithImpl<$Res, _$ListSyncStateImpl>
    implements _$$ListSyncStateImplCopyWith<$Res> {
  __$$ListSyncStateImplCopyWithImpl(
      _$ListSyncStateImpl _value, $Res Function(_$ListSyncStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startStatus = null,
  }) {
    return _then(_$ListSyncStateImpl(
      null == startStatus
          ? _value.startStatus
          : startStatus // ignore: cast_nullable_to_non_nullable
              as RemoteDataStatus,
    ));
  }
}

/// @nodoc

class _$ListSyncStateImpl implements _ListSyncState {
  const _$ListSyncStateImpl(this.startStatus);

  @override
  final RemoteDataStatus startStatus;

  @override
  String toString() {
    return 'ListSyncState(startStatus: $startStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListSyncStateImpl &&
            (identical(other.startStatus, startStatus) ||
                other.startStatus == startStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListSyncStateImplCopyWith<_$ListSyncStateImpl> get copyWith =>
      __$$ListSyncStateImplCopyWithImpl<_$ListSyncStateImpl>(this, _$identity);
}

abstract class _ListSyncState implements ListSyncState {
  const factory _ListSyncState(final RemoteDataStatus startStatus) =
      _$ListSyncStateImpl;

  @override
  RemoteDataStatus get startStatus;
  @override
  @JsonKey(ignore: true)
  _$$ListSyncStateImplCopyWith<_$ListSyncStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
