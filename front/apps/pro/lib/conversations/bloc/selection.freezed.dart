// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Selection {
  int get listIndex => throw _privateConstructorUsedError;
  int get conversationId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectionCopyWith<Selection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionCopyWith<$Res> {
  factory $SelectionCopyWith(Selection value, $Res Function(Selection) then) =
      _$SelectionCopyWithImpl<$Res, Selection>;
  @useResult
  $Res call({int listIndex, int conversationId});
}

/// @nodoc
class _$SelectionCopyWithImpl<$Res, $Val extends Selection>
    implements $SelectionCopyWith<$Res> {
  _$SelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listIndex = null,
    Object? conversationId = null,
  }) {
    return _then(_value.copyWith(
      listIndex: null == listIndex
          ? _value.listIndex
          : listIndex // ignore: cast_nullable_to_non_nullable
              as int,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionImplCopyWith<$Res>
    implements $SelectionCopyWith<$Res> {
  factory _$$SelectionImplCopyWith(
          _$SelectionImpl value, $Res Function(_$SelectionImpl) then) =
      __$$SelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int listIndex, int conversationId});
}

/// @nodoc
class __$$SelectionImplCopyWithImpl<$Res>
    extends _$SelectionCopyWithImpl<$Res, _$SelectionImpl>
    implements _$$SelectionImplCopyWith<$Res> {
  __$$SelectionImplCopyWithImpl(
      _$SelectionImpl _value, $Res Function(_$SelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listIndex = null,
    Object? conversationId = null,
  }) {
    return _then(_$SelectionImpl(
      listIndex: null == listIndex
          ? _value.listIndex
          : listIndex // ignore: cast_nullable_to_non_nullable
              as int,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectionImpl implements _Selection {
  const _$SelectionImpl(
      {required this.listIndex, required this.conversationId});

  @override
  final int listIndex;
  @override
  final int conversationId;

  @override
  String toString() {
    return 'Selection(listIndex: $listIndex, conversationId: $conversationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionImpl &&
            (identical(other.listIndex, listIndex) ||
                other.listIndex == listIndex) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, listIndex, conversationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      __$$SelectionImplCopyWithImpl<_$SelectionImpl>(this, _$identity);
}

abstract class _Selection implements Selection {
  const factory _Selection(
      {required final int listIndex,
      required final int conversationId}) = _$SelectionImpl;

  @override
  int get listIndex;
  @override
  int get conversationId;
  @override
  @JsonKey(ignore: true)
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
