// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchQuery _$SearchQueryFromJson(Map<String, dynamic> json) {
  return _SearchQuery.fromJson(json);
}

/// @nodoc
mixin _$SearchQuery {
  String? get query => throw _privateConstructorUsedError;
  WithTag? get withTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchQueryCopyWith<SearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchQueryCopyWith<$Res> {
  factory $SearchQueryCopyWith(
          SearchQuery value, $Res Function(SearchQuery) then) =
      _$SearchQueryCopyWithImpl<$Res, SearchQuery>;
  @useResult
  $Res call({String? query, WithTag? withTag});

  $WithTagCopyWith<$Res>? get withTag;
}

/// @nodoc
class _$SearchQueryCopyWithImpl<$Res, $Val extends SearchQuery>
    implements $SearchQueryCopyWith<$Res> {
  _$SearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? withTag = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      withTag: freezed == withTag
          ? _value.withTag
          : withTag // ignore: cast_nullable_to_non_nullable
              as WithTag?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WithTagCopyWith<$Res>? get withTag {
    if (_value.withTag == null) {
      return null;
    }

    return $WithTagCopyWith<$Res>(_value.withTag!, (value) {
      return _then(_value.copyWith(withTag: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchQueryImplCopyWith<$Res>
    implements $SearchQueryCopyWith<$Res> {
  factory _$$SearchQueryImplCopyWith(
          _$SearchQueryImpl value, $Res Function(_$SearchQueryImpl) then) =
      __$$SearchQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query, WithTag? withTag});

  @override
  $WithTagCopyWith<$Res>? get withTag;
}

/// @nodoc
class __$$SearchQueryImplCopyWithImpl<$Res>
    extends _$SearchQueryCopyWithImpl<$Res, _$SearchQueryImpl>
    implements _$$SearchQueryImplCopyWith<$Res> {
  __$$SearchQueryImplCopyWithImpl(
      _$SearchQueryImpl _value, $Res Function(_$SearchQueryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? withTag = freezed,
  }) {
    return _then(_$SearchQueryImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      withTag: freezed == withTag
          ? _value.withTag
          : withTag // ignore: cast_nullable_to_non_nullable
              as WithTag?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchQueryImpl implements _SearchQuery {
  const _$SearchQueryImpl({this.query, this.withTag});

  factory _$SearchQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchQueryImplFromJson(json);

  @override
  final String? query;
  @override
  final WithTag? withTag;

  @override
  String toString() {
    return 'SearchQuery(query: $query, withTag: $withTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQueryImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.withTag, withTag) || other.withTag == withTag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, withTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      __$$SearchQueryImplCopyWithImpl<_$SearchQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchQueryImplToJson(
      this,
    );
  }
}

abstract class _SearchQuery implements SearchQuery {
  const factory _SearchQuery({final String? query, final WithTag? withTag}) =
      _$SearchQueryImpl;

  factory _SearchQuery.fromJson(Map<String, dynamic> json) =
      _$SearchQueryImpl.fromJson;

  @override
  String? get query;
  @override
  WithTag? get withTag;
  @override
  @JsonKey(ignore: true)
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WithTag _$WithTagFromJson(Map<String, dynamic> json) {
  return _WithTag.fromJson(json);
}

/// @nodoc
mixin _$WithTag {
  int get id => throw _privateConstructorUsedError;
  DateTime? get since => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithTagCopyWith<WithTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithTagCopyWith<$Res> {
  factory $WithTagCopyWith(WithTag value, $Res Function(WithTag) then) =
      _$WithTagCopyWithImpl<$Res, WithTag>;
  @useResult
  $Res call({int id, DateTime? since});
}

/// @nodoc
class _$WithTagCopyWithImpl<$Res, $Val extends WithTag>
    implements $WithTagCopyWith<$Res> {
  _$WithTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? since = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WithTagImplCopyWith<$Res> implements $WithTagCopyWith<$Res> {
  factory _$$WithTagImplCopyWith(
          _$WithTagImpl value, $Res Function(_$WithTagImpl) then) =
      __$$WithTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DateTime? since});
}

/// @nodoc
class __$$WithTagImplCopyWithImpl<$Res>
    extends _$WithTagCopyWithImpl<$Res, _$WithTagImpl>
    implements _$$WithTagImplCopyWith<$Res> {
  __$$WithTagImplCopyWithImpl(
      _$WithTagImpl _value, $Res Function(_$WithTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? since = freezed,
  }) {
    return _then(_$WithTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      since: freezed == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WithTagImpl implements _WithTag {
  const _$WithTagImpl({required this.id, this.since});

  factory _$WithTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithTagImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime? since;

  @override
  String toString() {
    return 'WithTag(id: $id, since: $since)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.since, since) || other.since == since));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, since);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WithTagImplCopyWith<_$WithTagImpl> get copyWith =>
      __$$WithTagImplCopyWithImpl<_$WithTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WithTagImplToJson(
      this,
    );
  }
}

abstract class _WithTag implements WithTag {
  const factory _WithTag({required final int id, final DateTime? since}) =
      _$WithTagImpl;

  factory _WithTag.fromJson(Map<String, dynamic> json) = _$WithTagImpl.fromJson;

  @override
  int get id;
  @override
  DateTime? get since;
  @override
  @JsonKey(ignore: true)
  _$$WithTagImplCopyWith<_$WithTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
