// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() empty,
    required TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)
        cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? empty,
    TResult? Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? empty,
    TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListStateUnknown<T> value) unknown,
    required TResult Function(ListStateEmpty<T> value) empty,
    required TResult Function(ListStateCached<T> value) cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListStateUnknown<T> value)? unknown,
    TResult? Function(ListStateEmpty<T> value)? empty,
    TResult? Function(ListStateCached<T> value)? cached,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListStateUnknown<T> value)? unknown,
    TResult Function(ListStateEmpty<T> value)? empty,
    TResult Function(ListStateCached<T> value)? cached,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListStateCopyWith<T, $Res> {
  factory $ListStateCopyWith(
          ListState<T> value, $Res Function(ListState<T>) then) =
      _$ListStateCopyWithImpl<T, $Res, ListState<T>>;
}

/// @nodoc
class _$ListStateCopyWithImpl<T, $Res, $Val extends ListState<T>>
    implements $ListStateCopyWith<T, $Res> {
  _$ListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ListStateUnknownImplCopyWith<T, $Res> {
  factory _$$ListStateUnknownImplCopyWith(_$ListStateUnknownImpl<T> value,
          $Res Function(_$ListStateUnknownImpl<T>) then) =
      __$$ListStateUnknownImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ListStateUnknownImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListStateUnknownImpl<T>>
    implements _$$ListStateUnknownImplCopyWith<T, $Res> {
  __$$ListStateUnknownImplCopyWithImpl(_$ListStateUnknownImpl<T> _value,
      $Res Function(_$ListStateUnknownImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ListStateUnknownImpl<T> extends ListStateUnknown<T> {
  const _$ListStateUnknownImpl() : super._();

  @override
  String toString() {
    return 'ListState<$T>.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateUnknownImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() empty,
    required TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)
        cached,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? empty,
    TResult? Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? empty,
    TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListStateUnknown<T> value) unknown,
    required TResult Function(ListStateEmpty<T> value) empty,
    required TResult Function(ListStateCached<T> value) cached,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListStateUnknown<T> value)? unknown,
    TResult? Function(ListStateEmpty<T> value)? empty,
    TResult? Function(ListStateCached<T> value)? cached,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListStateUnknown<T> value)? unknown,
    TResult Function(ListStateEmpty<T> value)? empty,
    TResult Function(ListStateCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class ListStateUnknown<T> extends ListState<T> {
  const factory ListStateUnknown() = _$ListStateUnknownImpl<T>;
  const ListStateUnknown._() : super._();
}

/// @nodoc
abstract class _$$ListStateEmptyImplCopyWith<T, $Res> {
  factory _$$ListStateEmptyImplCopyWith(_$ListStateEmptyImpl<T> value,
          $Res Function(_$ListStateEmptyImpl<T>) then) =
      __$$ListStateEmptyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ListStateEmptyImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListStateEmptyImpl<T>>
    implements _$$ListStateEmptyImplCopyWith<T, $Res> {
  __$$ListStateEmptyImplCopyWithImpl(_$ListStateEmptyImpl<T> _value,
      $Res Function(_$ListStateEmptyImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ListStateEmptyImpl<T> extends ListStateEmpty<T> {
  const _$ListStateEmptyImpl() : super._();

  @override
  String toString() {
    return 'ListState<$T>.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ListStateEmptyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() empty,
    required TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)
        cached,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? empty,
    TResult? Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? empty,
    TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListStateUnknown<T> value) unknown,
    required TResult Function(ListStateEmpty<T> value) empty,
    required TResult Function(ListStateCached<T> value) cached,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListStateUnknown<T> value)? unknown,
    TResult? Function(ListStateEmpty<T> value)? empty,
    TResult? Function(ListStateCached<T> value)? cached,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListStateUnknown<T> value)? unknown,
    TResult Function(ListStateEmpty<T> value)? empty,
    TResult Function(ListStateCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ListStateEmpty<T> extends ListState<T> {
  const factory ListStateEmpty() = _$ListStateEmptyImpl<T>;
  const ListStateEmpty._() : super._();
}

/// @nodoc
abstract class _$$ListStateCachedImplCopyWith<T, $Res> {
  factory _$$ListStateCachedImplCopyWith(_$ListStateCachedImpl<T> value,
          $Res Function(_$ListStateCachedImpl<T>) then) =
      __$$ListStateCachedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({List<T> items, int startId, int endId, bool moreBeforeStart});
}

/// @nodoc
class __$$ListStateCachedImplCopyWithImpl<T, $Res>
    extends _$ListStateCopyWithImpl<T, $Res, _$ListStateCachedImpl<T>>
    implements _$$ListStateCachedImplCopyWith<T, $Res> {
  __$$ListStateCachedImplCopyWithImpl(_$ListStateCachedImpl<T> _value,
      $Res Function(_$ListStateCachedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? startId = null,
    Object? endId = null,
    Object? moreBeforeStart = null,
  }) {
    return _then(_$ListStateCachedImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      startId: null == startId
          ? _value.startId
          : startId // ignore: cast_nullable_to_non_nullable
              as int,
      endId: null == endId
          ? _value.endId
          : endId // ignore: cast_nullable_to_non_nullable
              as int,
      moreBeforeStart: null == moreBeforeStart
          ? _value.moreBeforeStart
          : moreBeforeStart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ListStateCachedImpl<T> extends ListStateCached<T> {
  const _$ListStateCachedImpl(
      {required final List<T> items,
      required this.startId,
      required this.endId,
      required this.moreBeforeStart})
      : _items = items,
        super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int startId;
  @override
  final int endId;
  @override
  final bool moreBeforeStart;

  @override
  String toString() {
    return 'ListState<$T>.cached(items: $items, startId: $startId, endId: $endId, moreBeforeStart: $moreBeforeStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListStateCachedImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.startId, startId) || other.startId == startId) &&
            (identical(other.endId, endId) || other.endId == endId) &&
            (identical(other.moreBeforeStart, moreBeforeStart) ||
                other.moreBeforeStart == moreBeforeStart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      startId,
      endId,
      moreBeforeStart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListStateCachedImplCopyWith<T, _$ListStateCachedImpl<T>> get copyWith =>
      __$$ListStateCachedImplCopyWithImpl<T, _$ListStateCachedImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() empty,
    required TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)
        cached,
  }) {
    return cached(items, startId, endId, moreBeforeStart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? empty,
    TResult? Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
  }) {
    return cached?.call(items, startId, endId, moreBeforeStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? empty,
    TResult Function(
            List<T> items, int startId, int endId, bool moreBeforeStart)?
        cached,
    required TResult orElse(),
  }) {
    if (cached != null) {
      return cached(items, startId, endId, moreBeforeStart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListStateUnknown<T> value) unknown,
    required TResult Function(ListStateEmpty<T> value) empty,
    required TResult Function(ListStateCached<T> value) cached,
  }) {
    return cached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListStateUnknown<T> value)? unknown,
    TResult? Function(ListStateEmpty<T> value)? empty,
    TResult? Function(ListStateCached<T> value)? cached,
  }) {
    return cached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListStateUnknown<T> value)? unknown,
    TResult Function(ListStateEmpty<T> value)? empty,
    TResult Function(ListStateCached<T> value)? cached,
    required TResult orElse(),
  }) {
    if (cached != null) {
      return cached(this);
    }
    return orElse();
  }
}

abstract class ListStateCached<T> extends ListState<T> {
  const factory ListStateCached(
      {required final List<T> items,
      required final int startId,
      required final int endId,
      required final bool moreBeforeStart}) = _$ListStateCachedImpl<T>;
  const ListStateCached._() : super._();

  List<T> get items;
  int get startId;
  int get endId;
  bool get moreBeforeStart;
  @JsonKey(ignore: true)
  _$$ListStateCachedImplCopyWith<T, _$ListStateCachedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
