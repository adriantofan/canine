// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_screen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagesScreenState {
  ConversationContainer get conversationContainer =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationContainer conversationContainer)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConversationContainer conversationContainer)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationContainer conversationContainer)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesScreenStateCopyWith<MessagesScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesScreenStateCopyWith<$Res> {
  factory $MessagesScreenStateCopyWith(
          MessagesScreenState value, $Res Function(MessagesScreenState) then) =
      _$MessagesScreenStateCopyWithImpl<$Res, MessagesScreenState>;
  @useResult
  $Res call({ConversationContainer conversationContainer});

  $ConversationContainerCopyWith<$Res> get conversationContainer;
}

/// @nodoc
class _$MessagesScreenStateCopyWithImpl<$Res, $Val extends MessagesScreenState>
    implements $MessagesScreenStateCopyWith<$Res> {
  _$MessagesScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationContainer = null,
  }) {
    return _then(_value.copyWith(
      conversationContainer: null == conversationContainer
          ? _value.conversationContainer
          : conversationContainer // ignore: cast_nullable_to_non_nullable
              as ConversationContainer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ConversationContainerCopyWith<$Res> get conversationContainer {
    return $ConversationContainerCopyWith<$Res>(_value.conversationContainer,
        (value) {
      return _then(_value.copyWith(conversationContainer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $MessagesScreenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConversationContainer conversationContainer});

  @override
  $ConversationContainerCopyWith<$Res> get conversationContainer;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MessagesScreenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationContainer = null,
  }) {
    return _then(_$InitialImpl(
      conversationContainer: null == conversationContainer
          ? _value.conversationContainer
          : conversationContainer // ignore: cast_nullable_to_non_nullable
              as ConversationContainer,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl({required this.conversationContainer});

  @override
  final ConversationContainer conversationContainer;

  @override
  String toString() {
    return 'MessagesScreenState.initial(conversationContainer: $conversationContainer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.conversationContainer, conversationContainer) ||
                other.conversationContainer == conversationContainer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationContainer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationContainer conversationContainer)
        initial,
  }) {
    return initial(conversationContainer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConversationContainer conversationContainer)? initial,
  }) {
    return initial?.call(conversationContainer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationContainer conversationContainer)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(conversationContainer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MessagesScreenState {
  factory _Initial(
          {required final ConversationContainer conversationContainer}) =
      _$InitialImpl;

  @override
  ConversationContainer get conversationContainer;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
