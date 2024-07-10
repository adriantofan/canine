// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_suggest_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchSuggestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) queryChanged,
    required TResult Function(int id) tagChanged,
    required TResult Function(DateTime since) tagSinceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? queryChanged,
    TResult? Function(int id)? tagChanged,
    TResult? Function(DateTime since)? tagSinceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? queryChanged,
    TResult Function(int id)? tagChanged,
    TResult Function(DateTime since)? tagSinceChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSuggestEventStarted value) started,
    required TResult Function(SearchSuggestEventQueryChanged value)
        queryChanged,
    required TResult Function(SearchSuggestEventTagChanged value) tagChanged,
    required TResult Function(SearchSuggestEventTagSinceChanged value)
        tagSinceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSuggestEventStarted value)? started,
    TResult? Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult? Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult? Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSuggestEventStarted value)? started,
    TResult Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestEventCopyWith<$Res> {
  factory $SearchSuggestEventCopyWith(
          SearchSuggestEvent value, $Res Function(SearchSuggestEvent) then) =
      _$SearchSuggestEventCopyWithImpl<$Res, SearchSuggestEvent>;
}

/// @nodoc
class _$SearchSuggestEventCopyWithImpl<$Res, $Val extends SearchSuggestEvent>
    implements $SearchSuggestEventCopyWith<$Res> {
  _$SearchSuggestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchSuggestEventStartedImplCopyWith<$Res> {
  factory _$$SearchSuggestEventStartedImplCopyWith(
          _$SearchSuggestEventStartedImpl value,
          $Res Function(_$SearchSuggestEventStartedImpl) then) =
      __$$SearchSuggestEventStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchSuggestEventStartedImplCopyWithImpl<$Res>
    extends _$SearchSuggestEventCopyWithImpl<$Res,
        _$SearchSuggestEventStartedImpl>
    implements _$$SearchSuggestEventStartedImplCopyWith<$Res> {
  __$$SearchSuggestEventStartedImplCopyWithImpl(
      _$SearchSuggestEventStartedImpl _value,
      $Res Function(_$SearchSuggestEventStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchSuggestEventStartedImpl implements SearchSuggestEventStarted {
  const _$SearchSuggestEventStartedImpl();

  @override
  String toString() {
    return 'SearchSuggestEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestEventStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) queryChanged,
    required TResult Function(int id) tagChanged,
    required TResult Function(DateTime since) tagSinceChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? queryChanged,
    TResult? Function(int id)? tagChanged,
    TResult? Function(DateTime since)? tagSinceChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? queryChanged,
    TResult Function(int id)? tagChanged,
    TResult Function(DateTime since)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSuggestEventStarted value) started,
    required TResult Function(SearchSuggestEventQueryChanged value)
        queryChanged,
    required TResult Function(SearchSuggestEventTagChanged value) tagChanged,
    required TResult Function(SearchSuggestEventTagSinceChanged value)
        tagSinceChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSuggestEventStarted value)? started,
    TResult? Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult? Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult? Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSuggestEventStarted value)? started,
    TResult Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SearchSuggestEventStarted implements SearchSuggestEvent {
  const factory SearchSuggestEventStarted() = _$SearchSuggestEventStartedImpl;
}

/// @nodoc
abstract class _$$SearchSuggestEventQueryChangedImplCopyWith<$Res> {
  factory _$$SearchSuggestEventQueryChangedImplCopyWith(
          _$SearchSuggestEventQueryChangedImpl value,
          $Res Function(_$SearchSuggestEventQueryChangedImpl) then) =
      __$$SearchSuggestEventQueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchSuggestEventQueryChangedImplCopyWithImpl<$Res>
    extends _$SearchSuggestEventCopyWithImpl<$Res,
        _$SearchSuggestEventQueryChangedImpl>
    implements _$$SearchSuggestEventQueryChangedImplCopyWith<$Res> {
  __$$SearchSuggestEventQueryChangedImplCopyWithImpl(
      _$SearchSuggestEventQueryChangedImpl _value,
      $Res Function(_$SearchSuggestEventQueryChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchSuggestEventQueryChangedImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchSuggestEventQueryChangedImpl
    implements SearchSuggestEventQueryChanged {
  const _$SearchSuggestEventQueryChangedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchSuggestEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestEventQueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestEventQueryChangedImplCopyWith<
          _$SearchSuggestEventQueryChangedImpl>
      get copyWith => __$$SearchSuggestEventQueryChangedImplCopyWithImpl<
          _$SearchSuggestEventQueryChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) queryChanged,
    required TResult Function(int id) tagChanged,
    required TResult Function(DateTime since) tagSinceChanged,
  }) {
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? queryChanged,
    TResult? Function(int id)? tagChanged,
    TResult? Function(DateTime since)? tagSinceChanged,
  }) {
    return queryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? queryChanged,
    TResult Function(int id)? tagChanged,
    TResult Function(DateTime since)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSuggestEventStarted value) started,
    required TResult Function(SearchSuggestEventQueryChanged value)
        queryChanged,
    required TResult Function(SearchSuggestEventTagChanged value) tagChanged,
    required TResult Function(SearchSuggestEventTagSinceChanged value)
        tagSinceChanged,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSuggestEventStarted value)? started,
    TResult? Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult? Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult? Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
  }) {
    return queryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSuggestEventStarted value)? started,
    TResult Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class SearchSuggestEventQueryChanged implements SearchSuggestEvent {
  const factory SearchSuggestEventQueryChanged(final String query) =
      _$SearchSuggestEventQueryChangedImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchSuggestEventQueryChangedImplCopyWith<
          _$SearchSuggestEventQueryChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSuggestEventTagChangedImplCopyWith<$Res> {
  factory _$$SearchSuggestEventTagChangedImplCopyWith(
          _$SearchSuggestEventTagChangedImpl value,
          $Res Function(_$SearchSuggestEventTagChangedImpl) then) =
      __$$SearchSuggestEventTagChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SearchSuggestEventTagChangedImplCopyWithImpl<$Res>
    extends _$SearchSuggestEventCopyWithImpl<$Res,
        _$SearchSuggestEventTagChangedImpl>
    implements _$$SearchSuggestEventTagChangedImplCopyWith<$Res> {
  __$$SearchSuggestEventTagChangedImplCopyWithImpl(
      _$SearchSuggestEventTagChangedImpl _value,
      $Res Function(_$SearchSuggestEventTagChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SearchSuggestEventTagChangedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchSuggestEventTagChangedImpl
    implements SearchSuggestEventTagChanged {
  const _$SearchSuggestEventTagChangedImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'SearchSuggestEvent.tagChanged(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestEventTagChangedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestEventTagChangedImplCopyWith<
          _$SearchSuggestEventTagChangedImpl>
      get copyWith => __$$SearchSuggestEventTagChangedImplCopyWithImpl<
          _$SearchSuggestEventTagChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) queryChanged,
    required TResult Function(int id) tagChanged,
    required TResult Function(DateTime since) tagSinceChanged,
  }) {
    return tagChanged(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? queryChanged,
    TResult? Function(int id)? tagChanged,
    TResult? Function(DateTime since)? tagSinceChanged,
  }) {
    return tagChanged?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? queryChanged,
    TResult Function(int id)? tagChanged,
    TResult Function(DateTime since)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (tagChanged != null) {
      return tagChanged(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSuggestEventStarted value) started,
    required TResult Function(SearchSuggestEventQueryChanged value)
        queryChanged,
    required TResult Function(SearchSuggestEventTagChanged value) tagChanged,
    required TResult Function(SearchSuggestEventTagSinceChanged value)
        tagSinceChanged,
  }) {
    return tagChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSuggestEventStarted value)? started,
    TResult? Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult? Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult? Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
  }) {
    return tagChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSuggestEventStarted value)? started,
    TResult Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (tagChanged != null) {
      return tagChanged(this);
    }
    return orElse();
  }
}

abstract class SearchSuggestEventTagChanged implements SearchSuggestEvent {
  const factory SearchSuggestEventTagChanged(final int id) =
      _$SearchSuggestEventTagChangedImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$SearchSuggestEventTagChangedImplCopyWith<
          _$SearchSuggestEventTagChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSuggestEventTagSinceChangedImplCopyWith<$Res> {
  factory _$$SearchSuggestEventTagSinceChangedImplCopyWith(
          _$SearchSuggestEventTagSinceChangedImpl value,
          $Res Function(_$SearchSuggestEventTagSinceChangedImpl) then) =
      __$$SearchSuggestEventTagSinceChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime since});
}

/// @nodoc
class __$$SearchSuggestEventTagSinceChangedImplCopyWithImpl<$Res>
    extends _$SearchSuggestEventCopyWithImpl<$Res,
        _$SearchSuggestEventTagSinceChangedImpl>
    implements _$$SearchSuggestEventTagSinceChangedImplCopyWith<$Res> {
  __$$SearchSuggestEventTagSinceChangedImplCopyWithImpl(
      _$SearchSuggestEventTagSinceChangedImpl _value,
      $Res Function(_$SearchSuggestEventTagSinceChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? since = null,
  }) {
    return _then(_$SearchSuggestEventTagSinceChangedImpl(
      null == since
          ? _value.since
          : since // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SearchSuggestEventTagSinceChangedImpl
    implements SearchSuggestEventTagSinceChanged {
  const _$SearchSuggestEventTagSinceChangedImpl(this.since);

  @override
  final DateTime since;

  @override
  String toString() {
    return 'SearchSuggestEvent.tagSinceChanged(since: $since)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestEventTagSinceChangedImpl &&
            (identical(other.since, since) || other.since == since));
  }

  @override
  int get hashCode => Object.hash(runtimeType, since);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestEventTagSinceChangedImplCopyWith<
          _$SearchSuggestEventTagSinceChangedImpl>
      get copyWith => __$$SearchSuggestEventTagSinceChangedImplCopyWithImpl<
          _$SearchSuggestEventTagSinceChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String query) queryChanged,
    required TResult Function(int id) tagChanged,
    required TResult Function(DateTime since) tagSinceChanged,
  }) {
    return tagSinceChanged(since);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String query)? queryChanged,
    TResult? Function(int id)? tagChanged,
    TResult? Function(DateTime since)? tagSinceChanged,
  }) {
    return tagSinceChanged?.call(since);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String query)? queryChanged,
    TResult Function(int id)? tagChanged,
    TResult Function(DateTime since)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (tagSinceChanged != null) {
      return tagSinceChanged(since);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchSuggestEventStarted value) started,
    required TResult Function(SearchSuggestEventQueryChanged value)
        queryChanged,
    required TResult Function(SearchSuggestEventTagChanged value) tagChanged,
    required TResult Function(SearchSuggestEventTagSinceChanged value)
        tagSinceChanged,
  }) {
    return tagSinceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchSuggestEventStarted value)? started,
    TResult? Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult? Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult? Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
  }) {
    return tagSinceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchSuggestEventStarted value)? started,
    TResult Function(SearchSuggestEventQueryChanged value)? queryChanged,
    TResult Function(SearchSuggestEventTagChanged value)? tagChanged,
    TResult Function(SearchSuggestEventTagSinceChanged value)? tagSinceChanged,
    required TResult orElse(),
  }) {
    if (tagSinceChanged != null) {
      return tagSinceChanged(this);
    }
    return orElse();
  }
}

abstract class SearchSuggestEventTagSinceChanged implements SearchSuggestEvent {
  const factory SearchSuggestEventTagSinceChanged(final DateTime since) =
      _$SearchSuggestEventTagSinceChangedImpl;

  DateTime get since;
  @JsonKey(ignore: true)
  _$$SearchSuggestEventTagSinceChangedImplCopyWith<
          _$SearchSuggestEventTagSinceChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchSuggestState {
  SearchQuery get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchQuery query) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SearchQuery query)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchQuery query)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSuggestStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSuggestStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSuggestStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchSuggestStateCopyWith<SearchSuggestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestStateCopyWith<$Res> {
  factory $SearchSuggestStateCopyWith(
          SearchSuggestState value, $Res Function(SearchSuggestState) then) =
      _$SearchSuggestStateCopyWithImpl<$Res, SearchSuggestState>;
  @useResult
  $Res call({SearchQuery query});

  $SearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$SearchSuggestStateCopyWithImpl<$Res, $Val extends SearchSuggestState>
    implements $SearchSuggestStateCopyWith<$Res> {
  _$SearchSuggestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchQueryCopyWith<$Res> get query {
    return $SearchQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchSuggestStateInitialImplCopyWith<$Res>
    implements $SearchSuggestStateCopyWith<$Res> {
  factory _$$SearchSuggestStateInitialImplCopyWith(
          _$SearchSuggestStateInitialImpl value,
          $Res Function(_$SearchSuggestStateInitialImpl) then) =
      __$$SearchSuggestStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchQuery query});

  @override
  $SearchQueryCopyWith<$Res> get query;
}

/// @nodoc
class __$$SearchSuggestStateInitialImplCopyWithImpl<$Res>
    extends _$SearchSuggestStateCopyWithImpl<$Res,
        _$SearchSuggestStateInitialImpl>
    implements _$$SearchSuggestStateInitialImplCopyWith<$Res> {
  __$$SearchSuggestStateInitialImplCopyWithImpl(
      _$SearchSuggestStateInitialImpl _value,
      $Res Function(_$SearchSuggestStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchSuggestStateInitialImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as SearchQuery,
    ));
  }
}

/// @nodoc

class _$SearchSuggestStateInitialImpl implements _SearchSuggestStateInitial {
  const _$SearchSuggestStateInitialImpl({required this.query});

  @override
  final SearchQuery query;

  @override
  String toString() {
    return 'SearchSuggestState.initial(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestStateInitialImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestStateInitialImplCopyWith<_$SearchSuggestStateInitialImpl>
      get copyWith => __$$SearchSuggestStateInitialImplCopyWithImpl<
          _$SearchSuggestStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SearchQuery query) initial,
  }) {
    return initial(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SearchQuery query)? initial,
  }) {
    return initial?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SearchQuery query)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchSuggestStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SearchSuggestStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchSuggestStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SearchSuggestStateInitial implements SearchSuggestState {
  const factory _SearchSuggestStateInitial({required final SearchQuery query}) =
      _$SearchSuggestStateInitialImpl;

  @override
  SearchQuery get query;
  @override
  @JsonKey(ignore: true)
  _$$SearchSuggestStateInitialImplCopyWith<_$SearchSuggestStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
