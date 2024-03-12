// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListChange {
  int get index => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int count) addedLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int count)? addedLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int count)? addedLeft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListChangeAddedLeft value) addedLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListChangeAddedLeft value)? addedLeft,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListChangeAddedLeft value)? addedLeft,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListChangeCopyWith<ListChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListChangeCopyWith<$Res> {
  factory $ListChangeCopyWith(
          ListChange value, $Res Function(ListChange) then) =
      _$ListChangeCopyWithImpl<$Res, ListChange>;
  @useResult
  $Res call({int index, int count});
}

/// @nodoc
class _$ListChangeCopyWithImpl<$Res, $Val extends ListChange>
    implements $ListChangeCopyWith<$Res> {
  _$ListChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListChangeAddedLeftImplCopyWith<$Res>
    implements $ListChangeCopyWith<$Res> {
  factory _$$ListChangeAddedLeftImplCopyWith(_$ListChangeAddedLeftImpl value,
          $Res Function(_$ListChangeAddedLeftImpl) then) =
      __$$ListChangeAddedLeftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, int count});
}

/// @nodoc
class __$$ListChangeAddedLeftImplCopyWithImpl<$Res>
    extends _$ListChangeCopyWithImpl<$Res, _$ListChangeAddedLeftImpl>
    implements _$$ListChangeAddedLeftImplCopyWith<$Res> {
  __$$ListChangeAddedLeftImplCopyWithImpl(_$ListChangeAddedLeftImpl _value,
      $Res Function(_$ListChangeAddedLeftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? count = null,
  }) {
    return _then(_$ListChangeAddedLeftImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListChangeAddedLeftImpl implements ListChangeAddedLeft {
  const _$ListChangeAddedLeftImpl(this.index, this.count);

  @override
  final int index;
  @override
  final int count;

  @override
  String toString() {
    return 'ListChange.addedLeft(index: $index, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListChangeAddedLeftImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListChangeAddedLeftImplCopyWith<_$ListChangeAddedLeftImpl> get copyWith =>
      __$$ListChangeAddedLeftImplCopyWithImpl<_$ListChangeAddedLeftImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index, int count) addedLeft,
  }) {
    return addedLeft(index, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index, int count)? addedLeft,
  }) {
    return addedLeft?.call(index, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index, int count)? addedLeft,
    required TResult orElse(),
  }) {
    if (addedLeft != null) {
      return addedLeft(index, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListChangeAddedLeft value) addedLeft,
  }) {
    return addedLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListChangeAddedLeft value)? addedLeft,
  }) {
    return addedLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListChangeAddedLeft value)? addedLeft,
    required TResult orElse(),
  }) {
    if (addedLeft != null) {
      return addedLeft(this);
    }
    return orElse();
  }
}

abstract class ListChangeAddedLeft implements ListChange {
  const factory ListChangeAddedLeft(final int index, final int count) =
      _$ListChangeAddedLeftImpl;

  @override
  int get index;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$ListChangeAddedLeftImplCopyWith<_$ListChangeAddedLeftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
