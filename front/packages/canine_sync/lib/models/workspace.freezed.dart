// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
mixin _$Workspace {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res, Workspace>;
  @useResult
  $Res call(
      {int id,
      String name,
      @TimestampSerializer() DateTime createdAt,
      @TimestampSerializer() DateTime updatedAt});
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res, $Val extends Workspace>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceImplCopyWith<$Res>
    implements $WorkspaceCopyWith<$Res> {
  factory _$$WorkspaceImplCopyWith(
          _$WorkspaceImpl value, $Res Function(_$WorkspaceImpl) then) =
      __$$WorkspaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @TimestampSerializer() DateTime createdAt,
      @TimestampSerializer() DateTime updatedAt});
}

/// @nodoc
class __$$WorkspaceImplCopyWithImpl<$Res>
    extends _$WorkspaceCopyWithImpl<$Res, _$WorkspaceImpl>
    implements _$$WorkspaceImplCopyWith<$Res> {
  __$$WorkspaceImplCopyWithImpl(
      _$WorkspaceImpl _value, $Res Function(_$WorkspaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$WorkspaceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceImpl implements _Workspace {
  const _$WorkspaceImpl(
      {required this.id,
      required this.name,
      @TimestampSerializer() required this.createdAt,
      @TimestampSerializer() required this.updatedAt});

  factory _$WorkspaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @TimestampSerializer()
  final DateTime createdAt;
  @override
  @TimestampSerializer()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      __$$WorkspaceImplCopyWithImpl<_$WorkspaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceImplToJson(
      this,
    );
  }
}

abstract class _Workspace implements Workspace {
  const factory _Workspace(
          {required final int id,
          required final String name,
          @TimestampSerializer() required final DateTime createdAt,
          @TimestampSerializer() required final DateTime updatedAt}) =
      _$WorkspaceImpl;

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$WorkspaceImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @TimestampSerializer()
  DateTime get createdAt;
  @override
  @TimestampSerializer()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
