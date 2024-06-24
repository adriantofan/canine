// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_loader_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversationLoaderState {
  int get workspaceId => throw _privateConstructorUsedError;
  ConversationInfo? get conversationInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int workspaceId, ConversationInfo? conversationInfo)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workspaceId, ConversationInfo? conversationInfo)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workspaceId, ConversationInfo? conversationInfo)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationLoaderStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationLoaderStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationLoaderStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationLoaderStateCopyWith<ConversationLoaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationLoaderStateCopyWith<$Res> {
  factory $ConversationLoaderStateCopyWith(ConversationLoaderState value,
          $Res Function(ConversationLoaderState) then) =
      _$ConversationLoaderStateCopyWithImpl<$Res, ConversationLoaderState>;
  @useResult
  $Res call({int workspaceId, ConversationInfo? conversationInfo});
}

/// @nodoc
class _$ConversationLoaderStateCopyWithImpl<$Res,
        $Val extends ConversationLoaderState>
    implements $ConversationLoaderStateCopyWith<$Res> {
  _$ConversationLoaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
    Object? conversationInfo = freezed,
  }) {
    return _then(_value.copyWith(
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
      conversationInfo: freezed == conversationInfo
          ? _value.conversationInfo
          : conversationInfo // ignore: cast_nullable_to_non_nullable
              as ConversationInfo?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationLoaderStateInitialImplCopyWith<$Res>
    implements $ConversationLoaderStateCopyWith<$Res> {
  factory _$$ConversationLoaderStateInitialImplCopyWith(
          _$ConversationLoaderStateInitialImpl value,
          $Res Function(_$ConversationLoaderStateInitialImpl) then) =
      __$$ConversationLoaderStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int workspaceId, ConversationInfo? conversationInfo});
}

/// @nodoc
class __$$ConversationLoaderStateInitialImplCopyWithImpl<$Res>
    extends _$ConversationLoaderStateCopyWithImpl<$Res,
        _$ConversationLoaderStateInitialImpl>
    implements _$$ConversationLoaderStateInitialImplCopyWith<$Res> {
  __$$ConversationLoaderStateInitialImplCopyWithImpl(
      _$ConversationLoaderStateInitialImpl _value,
      $Res Function(_$ConversationLoaderStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceId = null,
    Object? conversationInfo = freezed,
  }) {
    return _then(_$ConversationLoaderStateInitialImpl(
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
      conversationInfo: freezed == conversationInfo
          ? _value.conversationInfo
          : conversationInfo // ignore: cast_nullable_to_non_nullable
              as ConversationInfo?,
    ));
  }
}

/// @nodoc

class _$ConversationLoaderStateInitialImpl
    implements ConversationLoaderStateInitial {
  const _$ConversationLoaderStateInitialImpl(
      {required this.workspaceId, this.conversationInfo = null});

  @override
  final int workspaceId;
  @override
  @JsonKey()
  final ConversationInfo? conversationInfo;

  @override
  String toString() {
    return 'ConversationLoaderState.initial(workspaceId: $workspaceId, conversationInfo: $conversationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationLoaderStateInitialImpl &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.conversationInfo, conversationInfo) ||
                other.conversationInfo == conversationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, workspaceId, conversationInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationLoaderStateInitialImplCopyWith<
          _$ConversationLoaderStateInitialImpl>
      get copyWith => __$$ConversationLoaderStateInitialImplCopyWithImpl<
          _$ConversationLoaderStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int workspaceId, ConversationInfo? conversationInfo)
        initial,
  }) {
    return initial(workspaceId, conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int workspaceId, ConversationInfo? conversationInfo)?
        initial,
  }) {
    return initial?.call(workspaceId, conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int workspaceId, ConversationInfo? conversationInfo)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(workspaceId, conversationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationLoaderStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationLoaderStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationLoaderStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConversationLoaderStateInitial
    implements ConversationLoaderState {
  const factory ConversationLoaderStateInitial(
          {required final int workspaceId,
          final ConversationInfo? conversationInfo}) =
      _$ConversationLoaderStateInitialImpl;

  @override
  int get workspaceId;
  @override
  ConversationInfo? get conversationInfo;
  @override
  @JsonKey(ignore: true)
  _$$ConversationLoaderStateInitialImplCopyWith<
          _$ConversationLoaderStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
