// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_conversation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraftConversationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DraftConversation draftConversation) initial,
    required TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)
        created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DraftConversation draftConversation)? initial,
    TResult? Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DraftConversation draftConversation)? initial,
    TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DraftConversationStateInitial value) initial,
    required TResult Function(DraftConversationStateCreated value) created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DraftConversationStateInitial value)? initial,
    TResult? Function(DraftConversationStateCreated value)? created,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DraftConversationStateInitial value)? initial,
    TResult Function(DraftConversationStateCreated value)? created,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftConversationStateCopyWith<$Res> {
  factory $DraftConversationStateCopyWith(DraftConversationState value,
          $Res Function(DraftConversationState) then) =
      _$DraftConversationStateCopyWithImpl<$Res, DraftConversationState>;
}

/// @nodoc
class _$DraftConversationStateCopyWithImpl<$Res,
        $Val extends DraftConversationState>
    implements $DraftConversationStateCopyWith<$Res> {
  _$DraftConversationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DraftConversationStateInitialImplCopyWith<$Res> {
  factory _$$DraftConversationStateInitialImplCopyWith(
          _$DraftConversationStateInitialImpl value,
          $Res Function(_$DraftConversationStateInitialImpl) then) =
      __$$DraftConversationStateInitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftConversation draftConversation});

  $DraftConversationCopyWith<$Res> get draftConversation;
}

/// @nodoc
class __$$DraftConversationStateInitialImplCopyWithImpl<$Res>
    extends _$DraftConversationStateCopyWithImpl<$Res,
        _$DraftConversationStateInitialImpl>
    implements _$$DraftConversationStateInitialImplCopyWith<$Res> {
  __$$DraftConversationStateInitialImplCopyWithImpl(
      _$DraftConversationStateInitialImpl _value,
      $Res Function(_$DraftConversationStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftConversation = null,
  }) {
    return _then(_$DraftConversationStateInitialImpl(
      null == draftConversation
          ? _value.draftConversation
          : draftConversation // ignore: cast_nullable_to_non_nullable
              as DraftConversation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DraftConversationCopyWith<$Res> get draftConversation {
    return $DraftConversationCopyWith<$Res>(_value.draftConversation, (value) {
      return _then(_value.copyWith(draftConversation: value));
    });
  }
}

/// @nodoc

class _$DraftConversationStateInitialImpl
    implements DraftConversationStateInitial {
  _$DraftConversationStateInitialImpl(this.draftConversation);

  @override
  final DraftConversation draftConversation;

  @override
  String toString() {
    return 'DraftConversationState.initial(draftConversation: $draftConversation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftConversationStateInitialImpl &&
            (identical(other.draftConversation, draftConversation) ||
                other.draftConversation == draftConversation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draftConversation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftConversationStateInitialImplCopyWith<
          _$DraftConversationStateInitialImpl>
      get copyWith => __$$DraftConversationStateInitialImplCopyWithImpl<
          _$DraftConversationStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DraftConversation draftConversation) initial,
    required TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)
        created,
  }) {
    return initial(draftConversation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DraftConversation draftConversation)? initial,
    TResult? Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
  }) {
    return initial?.call(draftConversation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DraftConversation draftConversation)? initial,
    TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(draftConversation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DraftConversationStateInitial value) initial,
    required TResult Function(DraftConversationStateCreated value) created,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DraftConversationStateInitial value)? initial,
    TResult? Function(DraftConversationStateCreated value)? created,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DraftConversationStateInitial value)? initial,
    TResult Function(DraftConversationStateCreated value)? created,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DraftConversationStateInitial implements DraftConversationState {
  factory DraftConversationStateInitial(
          final DraftConversation draftConversation) =
      _$DraftConversationStateInitialImpl;

  DraftConversation get draftConversation;
  @JsonKey(ignore: true)
  _$$DraftConversationStateInitialImplCopyWith<
          _$DraftConversationStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DraftConversationStateCreatedImplCopyWith<$Res> {
  factory _$$DraftConversationStateCreatedImplCopyWith(
          _$DraftConversationStateCreatedImpl value,
          $Res Function(_$DraftConversationStateCreatedImpl) then) =
      __$$DraftConversationStateCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DraftMessage draftMessage, ConversationInfo conversationInfo});

  $DraftMessageCopyWith<$Res> get draftMessage;
}

/// @nodoc
class __$$DraftConversationStateCreatedImplCopyWithImpl<$Res>
    extends _$DraftConversationStateCopyWithImpl<$Res,
        _$DraftConversationStateCreatedImpl>
    implements _$$DraftConversationStateCreatedImplCopyWith<$Res> {
  __$$DraftConversationStateCreatedImplCopyWithImpl(
      _$DraftConversationStateCreatedImpl _value,
      $Res Function(_$DraftConversationStateCreatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draftMessage = null,
    Object? conversationInfo = null,
  }) {
    return _then(_$DraftConversationStateCreatedImpl(
      null == draftMessage
          ? _value.draftMessage
          : draftMessage // ignore: cast_nullable_to_non_nullable
              as DraftMessage,
      null == conversationInfo
          ? _value.conversationInfo
          : conversationInfo // ignore: cast_nullable_to_non_nullable
              as ConversationInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DraftMessageCopyWith<$Res> get draftMessage {
    return $DraftMessageCopyWith<$Res>(_value.draftMessage, (value) {
      return _then(_value.copyWith(draftMessage: value));
    });
  }
}

/// @nodoc

class _$DraftConversationStateCreatedImpl
    implements DraftConversationStateCreated {
  _$DraftConversationStateCreatedImpl(this.draftMessage, this.conversationInfo);

  @override
  final DraftMessage draftMessage;
  @override
  final ConversationInfo conversationInfo;

  @override
  String toString() {
    return 'DraftConversationState.created(draftMessage: $draftMessage, conversationInfo: $conversationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftConversationStateCreatedImpl &&
            (identical(other.draftMessage, draftMessage) ||
                other.draftMessage == draftMessage) &&
            (identical(other.conversationInfo, conversationInfo) ||
                other.conversationInfo == conversationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, draftMessage, conversationInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftConversationStateCreatedImplCopyWith<
          _$DraftConversationStateCreatedImpl>
      get copyWith => __$$DraftConversationStateCreatedImplCopyWithImpl<
          _$DraftConversationStateCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DraftConversation draftConversation) initial,
    required TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)
        created,
  }) {
    return created(draftMessage, conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DraftConversation draftConversation)? initial,
    TResult? Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
  }) {
    return created?.call(draftMessage, conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DraftConversation draftConversation)? initial,
    TResult Function(
            DraftMessage draftMessage, ConversationInfo conversationInfo)?
        created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(draftMessage, conversationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DraftConversationStateInitial value) initial,
    required TResult Function(DraftConversationStateCreated value) created,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DraftConversationStateInitial value)? initial,
    TResult? Function(DraftConversationStateCreated value)? created,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DraftConversationStateInitial value)? initial,
    TResult Function(DraftConversationStateCreated value)? created,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class DraftConversationStateCreated implements DraftConversationState {
  factory DraftConversationStateCreated(final DraftMessage draftMessage,
          final ConversationInfo conversationInfo) =
      _$DraftConversationStateCreatedImpl;

  DraftMessage get draftMessage;
  ConversationInfo get conversationInfo;
  @JsonKey(ignore: true)
  _$$DraftConversationStateCreatedImplCopyWith<
          _$DraftConversationStateCreatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
