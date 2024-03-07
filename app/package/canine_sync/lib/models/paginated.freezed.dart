// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Paginated<T> _$PaginatedFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Paginated<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Paginated<T> {
  List<T> get data => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedCopyWith<T, Paginated<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCopyWith<T, $Res> {
  factory $PaginatedCopyWith(
          Paginated<T> value, $Res Function(Paginated<T>) then) =
      _$PaginatedCopyWithImpl<T, $Res, Paginated<T>>;
  @useResult
  $Res call({List<T> data, PaginationMeta meta});

  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaginatedCopyWithImpl<T, $Res, $Val extends Paginated<T>>
    implements $PaginatedCopyWith<T, $Res> {
  _$PaginatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedImplCopyWith<T, $Res>
    implements $PaginatedCopyWith<T, $Res> {
  factory _$$PaginatedImplCopyWith(
          _$PaginatedImpl<T> value, $Res Function(_$PaginatedImpl<T>) then) =
      __$$PaginatedImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> data, PaginationMeta meta});

  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaginatedImplCopyWithImpl<T, $Res>
    extends _$PaginatedCopyWithImpl<T, $Res, _$PaginatedImpl<T>>
    implements _$$PaginatedImplCopyWith<T, $Res> {
  __$$PaginatedImplCopyWithImpl(
      _$PaginatedImpl<T> _value, $Res Function(_$PaginatedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$PaginatedImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginatedImpl<T> implements _Paginated<T> {
  const _$PaginatedImpl({required final List<T> data, required this.meta})
      : _data = data;

  factory _$PaginatedImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginatedImplFromJson(json, fromJsonT);

  final List<T> _data;
  @override
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationMeta meta;

  @override
  String toString() {
    return 'Paginated<$T>(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedImplCopyWith<T, _$PaginatedImpl<T>> get copyWith =>
      __$$PaginatedImplCopyWithImpl<T, _$PaginatedImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginatedImplToJson<T>(this, toJsonT);
  }
}

abstract class _Paginated<T> implements Paginated<T> {
  const factory _Paginated(
      {required final List<T> data,
      required final PaginationMeta meta}) = _$PaginatedImpl<T>;

  factory _Paginated.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginatedImpl<T>.fromJson;

  @override
  List<T> get data;
  @override
  PaginationMeta get meta;
  @override
  @JsonKey(ignore: true)
  _$$PaginatedImplCopyWith<T, _$PaginatedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
