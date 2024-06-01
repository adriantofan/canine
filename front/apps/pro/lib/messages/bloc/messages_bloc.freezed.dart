// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ListUpdate<ChatMessage> messages) changes,
    required TResult Function(ListSyncState syncState) syncStateChanged,
    required TResult Function() loadPast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ListUpdate<ChatMessage> messages)? changes,
    TResult? Function(ListSyncState syncState)? syncStateChanged,
    TResult? Function()? loadPast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ListUpdate<ChatMessage> messages)? changes,
    TResult Function(ListSyncState syncState)? syncStateChanged,
    TResult Function()? loadPast,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagesEventStarted value) started,
    required TResult Function(MessagesEventChanges value) changes,
    required TResult Function(MessagesEventSyncStateChanged value)
        syncStateChanged,
    required TResult Function(MessagesEventLoadMore value) loadPast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagesEventStarted value)? started,
    TResult? Function(MessagesEventChanges value)? changes,
    TResult? Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult? Function(MessagesEventLoadMore value)? loadPast,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagesEventStarted value)? started,
    TResult Function(MessagesEventChanges value)? changes,
    TResult Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult Function(MessagesEventLoadMore value)? loadPast,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesEventCopyWith<$Res> {
  factory $MessagesEventCopyWith(
          MessagesEvent value, $Res Function(MessagesEvent) then) =
      _$MessagesEventCopyWithImpl<$Res, MessagesEvent>;
}

/// @nodoc
class _$MessagesEventCopyWithImpl<$Res, $Val extends MessagesEvent>
    implements $MessagesEventCopyWith<$Res> {
  _$MessagesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MessagesEventStartedImplCopyWith<$Res> {
  factory _$$MessagesEventStartedImplCopyWith(_$MessagesEventStartedImpl value,
          $Res Function(_$MessagesEventStartedImpl) then) =
      __$$MessagesEventStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessagesEventStartedImplCopyWithImpl<$Res>
    extends _$MessagesEventCopyWithImpl<$Res, _$MessagesEventStartedImpl>
    implements _$$MessagesEventStartedImplCopyWith<$Res> {
  __$$MessagesEventStartedImplCopyWithImpl(_$MessagesEventStartedImpl _value,
      $Res Function(_$MessagesEventStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessagesEventStartedImpl implements MessagesEventStarted {
  const _$MessagesEventStartedImpl();

  @override
  String toString() {
    return 'MessagesEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesEventStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ListUpdate<ChatMessage> messages) changes,
    required TResult Function(ListSyncState syncState) syncStateChanged,
    required TResult Function() loadPast,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ListUpdate<ChatMessage> messages)? changes,
    TResult? Function(ListSyncState syncState)? syncStateChanged,
    TResult? Function()? loadPast,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ListUpdate<ChatMessage> messages)? changes,
    TResult Function(ListSyncState syncState)? syncStateChanged,
    TResult Function()? loadPast,
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
    required TResult Function(MessagesEventStarted value) started,
    required TResult Function(MessagesEventChanges value) changes,
    required TResult Function(MessagesEventSyncStateChanged value)
        syncStateChanged,
    required TResult Function(MessagesEventLoadMore value) loadPast,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagesEventStarted value)? started,
    TResult? Function(MessagesEventChanges value)? changes,
    TResult? Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult? Function(MessagesEventLoadMore value)? loadPast,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagesEventStarted value)? started,
    TResult Function(MessagesEventChanges value)? changes,
    TResult Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult Function(MessagesEventLoadMore value)? loadPast,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class MessagesEventStarted implements MessagesEvent {
  const factory MessagesEventStarted() = _$MessagesEventStartedImpl;
}

/// @nodoc
abstract class _$$MessagesEventChangesImplCopyWith<$Res> {
  factory _$$MessagesEventChangesImplCopyWith(_$MessagesEventChangesImpl value,
          $Res Function(_$MessagesEventChangesImpl) then) =
      __$$MessagesEventChangesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListUpdate<ChatMessage> messages});
}

/// @nodoc
class __$$MessagesEventChangesImplCopyWithImpl<$Res>
    extends _$MessagesEventCopyWithImpl<$Res, _$MessagesEventChangesImpl>
    implements _$$MessagesEventChangesImplCopyWith<$Res> {
  __$$MessagesEventChangesImplCopyWithImpl(_$MessagesEventChangesImpl _value,
      $Res Function(_$MessagesEventChangesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$MessagesEventChangesImpl(
      null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as ListUpdate<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$MessagesEventChangesImpl implements MessagesEventChanges {
  const _$MessagesEventChangesImpl(this.messages);

  @override
  final ListUpdate<ChatMessage> messages;

  @override
  String toString() {
    return 'MessagesEvent.changes(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesEventChangesImpl &&
            (identical(other.messages, messages) ||
                other.messages == messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesEventChangesImplCopyWith<_$MessagesEventChangesImpl>
      get copyWith =>
          __$$MessagesEventChangesImplCopyWithImpl<_$MessagesEventChangesImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ListUpdate<ChatMessage> messages) changes,
    required TResult Function(ListSyncState syncState) syncStateChanged,
    required TResult Function() loadPast,
  }) {
    return changes(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ListUpdate<ChatMessage> messages)? changes,
    TResult? Function(ListSyncState syncState)? syncStateChanged,
    TResult? Function()? loadPast,
  }) {
    return changes?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ListUpdate<ChatMessage> messages)? changes,
    TResult Function(ListSyncState syncState)? syncStateChanged,
    TResult Function()? loadPast,
    required TResult orElse(),
  }) {
    if (changes != null) {
      return changes(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagesEventStarted value) started,
    required TResult Function(MessagesEventChanges value) changes,
    required TResult Function(MessagesEventSyncStateChanged value)
        syncStateChanged,
    required TResult Function(MessagesEventLoadMore value) loadPast,
  }) {
    return changes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagesEventStarted value)? started,
    TResult? Function(MessagesEventChanges value)? changes,
    TResult? Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult? Function(MessagesEventLoadMore value)? loadPast,
  }) {
    return changes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagesEventStarted value)? started,
    TResult Function(MessagesEventChanges value)? changes,
    TResult Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult Function(MessagesEventLoadMore value)? loadPast,
    required TResult orElse(),
  }) {
    if (changes != null) {
      return changes(this);
    }
    return orElse();
  }
}

abstract class MessagesEventChanges implements MessagesEvent {
  const factory MessagesEventChanges(final ListUpdate<ChatMessage> messages) =
      _$MessagesEventChangesImpl;

  ListUpdate<ChatMessage> get messages;
  @JsonKey(ignore: true)
  _$$MessagesEventChangesImplCopyWith<_$MessagesEventChangesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessagesEventSyncStateChangedImplCopyWith<$Res> {
  factory _$$MessagesEventSyncStateChangedImplCopyWith(
          _$MessagesEventSyncStateChangedImpl value,
          $Res Function(_$MessagesEventSyncStateChangedImpl) then) =
      __$$MessagesEventSyncStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListSyncState syncState});

  $ListSyncStateCopyWith<$Res> get syncState;
}

/// @nodoc
class __$$MessagesEventSyncStateChangedImplCopyWithImpl<$Res>
    extends _$MessagesEventCopyWithImpl<$Res,
        _$MessagesEventSyncStateChangedImpl>
    implements _$$MessagesEventSyncStateChangedImplCopyWith<$Res> {
  __$$MessagesEventSyncStateChangedImplCopyWithImpl(
      _$MessagesEventSyncStateChangedImpl _value,
      $Res Function(_$MessagesEventSyncStateChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncState = null,
  }) {
    return _then(_$MessagesEventSyncStateChangedImpl(
      null == syncState
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as ListSyncState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ListSyncStateCopyWith<$Res> get syncState {
    return $ListSyncStateCopyWith<$Res>(_value.syncState, (value) {
      return _then(_value.copyWith(syncState: value));
    });
  }
}

/// @nodoc

class _$MessagesEventSyncStateChangedImpl
    implements MessagesEventSyncStateChanged {
  const _$MessagesEventSyncStateChangedImpl(this.syncState);

  @override
  final ListSyncState syncState;

  @override
  String toString() {
    return 'MessagesEvent.syncStateChanged(syncState: $syncState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesEventSyncStateChangedImpl &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesEventSyncStateChangedImplCopyWith<
          _$MessagesEventSyncStateChangedImpl>
      get copyWith => __$$MessagesEventSyncStateChangedImplCopyWithImpl<
          _$MessagesEventSyncStateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ListUpdate<ChatMessage> messages) changes,
    required TResult Function(ListSyncState syncState) syncStateChanged,
    required TResult Function() loadPast,
  }) {
    return syncStateChanged(syncState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ListUpdate<ChatMessage> messages)? changes,
    TResult? Function(ListSyncState syncState)? syncStateChanged,
    TResult? Function()? loadPast,
  }) {
    return syncStateChanged?.call(syncState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ListUpdate<ChatMessage> messages)? changes,
    TResult Function(ListSyncState syncState)? syncStateChanged,
    TResult Function()? loadPast,
    required TResult orElse(),
  }) {
    if (syncStateChanged != null) {
      return syncStateChanged(syncState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagesEventStarted value) started,
    required TResult Function(MessagesEventChanges value) changes,
    required TResult Function(MessagesEventSyncStateChanged value)
        syncStateChanged,
    required TResult Function(MessagesEventLoadMore value) loadPast,
  }) {
    return syncStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagesEventStarted value)? started,
    TResult? Function(MessagesEventChanges value)? changes,
    TResult? Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult? Function(MessagesEventLoadMore value)? loadPast,
  }) {
    return syncStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagesEventStarted value)? started,
    TResult Function(MessagesEventChanges value)? changes,
    TResult Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult Function(MessagesEventLoadMore value)? loadPast,
    required TResult orElse(),
  }) {
    if (syncStateChanged != null) {
      return syncStateChanged(this);
    }
    return orElse();
  }
}

abstract class MessagesEventSyncStateChanged implements MessagesEvent {
  const factory MessagesEventSyncStateChanged(final ListSyncState syncState) =
      _$MessagesEventSyncStateChangedImpl;

  ListSyncState get syncState;
  @JsonKey(ignore: true)
  _$$MessagesEventSyncStateChangedImplCopyWith<
          _$MessagesEventSyncStateChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessagesEventLoadMoreImplCopyWith<$Res> {
  factory _$$MessagesEventLoadMoreImplCopyWith(
          _$MessagesEventLoadMoreImpl value,
          $Res Function(_$MessagesEventLoadMoreImpl) then) =
      __$$MessagesEventLoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MessagesEventLoadMoreImplCopyWithImpl<$Res>
    extends _$MessagesEventCopyWithImpl<$Res, _$MessagesEventLoadMoreImpl>
    implements _$$MessagesEventLoadMoreImplCopyWith<$Res> {
  __$$MessagesEventLoadMoreImplCopyWithImpl(_$MessagesEventLoadMoreImpl _value,
      $Res Function(_$MessagesEventLoadMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MessagesEventLoadMoreImpl implements MessagesEventLoadMore {
  const _$MessagesEventLoadMoreImpl();

  @override
  String toString() {
    return 'MessagesEvent.loadPast()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesEventLoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ListUpdate<ChatMessage> messages) changes,
    required TResult Function(ListSyncState syncState) syncStateChanged,
    required TResult Function() loadPast,
  }) {
    return loadPast();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ListUpdate<ChatMessage> messages)? changes,
    TResult? Function(ListSyncState syncState)? syncStateChanged,
    TResult? Function()? loadPast,
  }) {
    return loadPast?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ListUpdate<ChatMessage> messages)? changes,
    TResult Function(ListSyncState syncState)? syncStateChanged,
    TResult Function()? loadPast,
    required TResult orElse(),
  }) {
    if (loadPast != null) {
      return loadPast();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MessagesEventStarted value) started,
    required TResult Function(MessagesEventChanges value) changes,
    required TResult Function(MessagesEventSyncStateChanged value)
        syncStateChanged,
    required TResult Function(MessagesEventLoadMore value) loadPast,
  }) {
    return loadPast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MessagesEventStarted value)? started,
    TResult? Function(MessagesEventChanges value)? changes,
    TResult? Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult? Function(MessagesEventLoadMore value)? loadPast,
  }) {
    return loadPast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MessagesEventStarted value)? started,
    TResult Function(MessagesEventChanges value)? changes,
    TResult Function(MessagesEventSyncStateChanged value)? syncStateChanged,
    TResult Function(MessagesEventLoadMore value)? loadPast,
    required TResult orElse(),
  }) {
    if (loadPast != null) {
      return loadPast(this);
    }
    return orElse();
  }
}

abstract class MessagesEventLoadMore implements MessagesEvent {
  const factory MessagesEventLoadMore() = _$MessagesEventLoadMoreImpl;
}

/// @nodoc
mixin _$MessagesState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  ListSyncState? get syncState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesStateCopyWith<MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res, MessagesState>;
  @useResult
  $Res call({List<ChatMessage> messages, ListSyncState? syncState});

  $ListSyncStateCopyWith<$Res>? get syncState;
}

/// @nodoc
class _$MessagesStateCopyWithImpl<$Res, $Val extends MessagesState>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? syncState = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      syncState: freezed == syncState
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as ListSyncState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ListSyncStateCopyWith<$Res>? get syncState {
    if (_value.syncState == null) {
      return null;
    }

    return $ListSyncStateCopyWith<$Res>(_value.syncState!, (value) {
      return _then(_value.copyWith(syncState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageStateImplCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$$MessageStateImplCopyWith(
          _$MessageStateImpl value, $Res Function(_$MessageStateImpl) then) =
      __$$MessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatMessage> messages, ListSyncState? syncState});

  @override
  $ListSyncStateCopyWith<$Res>? get syncState;
}

/// @nodoc
class __$$MessageStateImplCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res, _$MessageStateImpl>
    implements _$$MessageStateImplCopyWith<$Res> {
  __$$MessageStateImplCopyWithImpl(
      _$MessageStateImpl _value, $Res Function(_$MessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? syncState = freezed,
  }) {
    return _then(_$MessageStateImpl(
      null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      freezed == syncState
          ? _value.syncState
          : syncState // ignore: cast_nullable_to_non_nullable
              as ListSyncState?,
    ));
  }
}

/// @nodoc

class _$MessageStateImpl implements _MessageState {
  const _$MessageStateImpl(final List<ChatMessage> messages, this.syncState)
      : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final ListSyncState? syncState;

  @override
  String toString() {
    return 'MessagesState(messages: $messages, syncState: $syncState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messages), syncState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      __$$MessageStateImplCopyWithImpl<_$MessageStateImpl>(this, _$identity);
}

abstract class _MessageState implements MessagesState {
  const factory _MessageState(
          final List<ChatMessage> messages, final ListSyncState? syncState) =
      _$MessageStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  ListSyncState? get syncState;
  @override
  @JsonKey(ignore: true)
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
