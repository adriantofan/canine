// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncSession {
  int get workspaceId => throw _privateConstructorUsedError;
  String get authId => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  Sync get service => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SyncSessionCopyWith<SyncSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncSessionCopyWith<$Res> {
  factory $SyncSessionCopyWith(
          SyncSession value, $Res Function(SyncSession) then) =
      _$SyncSessionCopyWithImpl<$Res, SyncSession>;
  @useResult
  $Res call({int workspaceId, String authId, int userId, Sync service});
}

/// @nodoc
class _$SyncSessionCopyWithImpl<$Res, $Val extends SyncSession>
    implements $SyncSessionCopyWith<$Res> {
  _$SyncSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
    Object? authId = null,
    Object? userId = null,
    Object? service = null,
  }) {
    return _then(_value.copyWith(
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Sync,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncSessionImplCopyWith<$Res>
    implements $SyncSessionCopyWith<$Res> {
  factory _$$SyncSessionImplCopyWith(
          _$SyncSessionImpl value, $Res Function(_$SyncSessionImpl) then) =
      __$$SyncSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int workspaceId, String authId, int userId, Sync service});
}

/// @nodoc
class __$$SyncSessionImplCopyWithImpl<$Res>
    extends _$SyncSessionCopyWithImpl<$Res, _$SyncSessionImpl>
    implements _$$SyncSessionImplCopyWith<$Res> {
  __$$SyncSessionImplCopyWithImpl(
      _$SyncSessionImpl _value, $Res Function(_$SyncSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
    Object? authId = null,
    Object? userId = null,
    Object? service = null,
  }) {
    return _then(_$SyncSessionImpl(
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
      authId: null == authId
          ? _value.authId
          : authId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Sync,
    ));
  }
}

/// @nodoc

class _$SyncSessionImpl extends _SyncSession {
  const _$SyncSessionImpl(
      {required this.workspaceId,
      required this.authId,
      required this.userId,
      required this.service})
      : super._();

  @override
  final int workspaceId;
  @override
  final String authId;
  @override
  final int userId;
  @override
  final Sync service;

  @override
  String toString() {
    return 'SyncSession(workspaceId: $workspaceId, authId: $authId, userId: $userId, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncSessionImpl &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.authId, authId) || other.authId == authId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.service, service) || other.service == service));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, workspaceId, authId, userId, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncSessionImplCopyWith<_$SyncSessionImpl> get copyWith =>
      __$$SyncSessionImplCopyWithImpl<_$SyncSessionImpl>(this, _$identity);
}

abstract class _SyncSession extends SyncSession {
  const factory _SyncSession(
      {required final int workspaceId,
      required final String authId,
      required final int userId,
      required final Sync service}) = _$SyncSessionImpl;
  const _SyncSession._() : super._();

  @override
  int get workspaceId;
  @override
  String get authId;
  @override
  int get userId;
  @override
  Sync get service;
  @override
  @JsonKey(ignore: true)
  _$$SyncSessionImplCopyWith<_$SyncSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
