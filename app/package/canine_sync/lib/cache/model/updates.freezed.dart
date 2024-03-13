// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Update {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int conversationId, List<Message> newMessages)
        messagesAdded,
    required TResult Function(APIServerUpdate message) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult? Function(APIServerUpdate message)? server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult Function(APIServerUpdate message)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateMessagesAdded value) messagesAdded,
    required TResult Function(UpdateServer value) server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateMessagesAdded value)? messagesAdded,
    TResult? Function(UpdateServer value)? server,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateMessagesAdded value)? messagesAdded,
    TResult Function(UpdateServer value)? server,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCopyWith<$Res> {
  factory $UpdateCopyWith(Update value, $Res Function(Update) then) =
      _$UpdateCopyWithImpl<$Res, Update>;
}

/// @nodoc
class _$UpdateCopyWithImpl<$Res, $Val extends Update>
    implements $UpdateCopyWith<$Res> {
  _$UpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateMessagesAddedImplCopyWith<$Res> {
  factory _$$UpdateMessagesAddedImplCopyWith(_$UpdateMessagesAddedImpl value,
          $Res Function(_$UpdateMessagesAddedImpl) then) =
      __$$UpdateMessagesAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversationId, List<Message> newMessages});
}

/// @nodoc
class __$$UpdateMessagesAddedImplCopyWithImpl<$Res>
    extends _$UpdateCopyWithImpl<$Res, _$UpdateMessagesAddedImpl>
    implements _$$UpdateMessagesAddedImplCopyWith<$Res> {
  __$$UpdateMessagesAddedImplCopyWithImpl(_$UpdateMessagesAddedImpl _value,
      $Res Function(_$UpdateMessagesAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? newMessages = null,
  }) {
    return _then(_$UpdateMessagesAddedImpl(
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == newMessages
          ? _value._newMessages
          : newMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$UpdateMessagesAddedImpl implements UpdateMessagesAdded {
  const _$UpdateMessagesAddedImpl(
      this.conversationId, final List<Message> newMessages)
      : _newMessages = newMessages;

  @override
  final int conversationId;
  final List<Message> _newMessages;
  @override
  List<Message> get newMessages {
    if (_newMessages is EqualUnmodifiableListView) return _newMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newMessages);
  }

  @override
  String toString() {
    return 'Update.messagesAdded(conversationId: $conversationId, newMessages: $newMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMessagesAddedImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            const DeepCollectionEquality()
                .equals(other._newMessages, _newMessages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationId,
      const DeepCollectionEquality().hash(_newMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMessagesAddedImplCopyWith<_$UpdateMessagesAddedImpl> get copyWith =>
      __$$UpdateMessagesAddedImplCopyWithImpl<_$UpdateMessagesAddedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int conversationId, List<Message> newMessages)
        messagesAdded,
    required TResult Function(APIServerUpdate message) server,
  }) {
    return messagesAdded(conversationId, newMessages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult? Function(APIServerUpdate message)? server,
  }) {
    return messagesAdded?.call(conversationId, newMessages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult Function(APIServerUpdate message)? server,
    required TResult orElse(),
  }) {
    if (messagesAdded != null) {
      return messagesAdded(conversationId, newMessages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateMessagesAdded value) messagesAdded,
    required TResult Function(UpdateServer value) server,
  }) {
    return messagesAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateMessagesAdded value)? messagesAdded,
    TResult? Function(UpdateServer value)? server,
  }) {
    return messagesAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateMessagesAdded value)? messagesAdded,
    TResult Function(UpdateServer value)? server,
    required TResult orElse(),
  }) {
    if (messagesAdded != null) {
      return messagesAdded(this);
    }
    return orElse();
  }
}

abstract class UpdateMessagesAdded implements Update {
  const factory UpdateMessagesAdded(
          final int conversationId, final List<Message> newMessages) =
      _$UpdateMessagesAddedImpl;

  int get conversationId;
  List<Message> get newMessages;
  @JsonKey(ignore: true)
  _$$UpdateMessagesAddedImplCopyWith<_$UpdateMessagesAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateServerImplCopyWith<$Res> {
  factory _$$UpdateServerImplCopyWith(
          _$UpdateServerImpl value, $Res Function(_$UpdateServerImpl) then) =
      __$$UpdateServerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({APIServerUpdate message});

  $APIServerUpdateCopyWith<$Res> get message;
}

/// @nodoc
class __$$UpdateServerImplCopyWithImpl<$Res>
    extends _$UpdateCopyWithImpl<$Res, _$UpdateServerImpl>
    implements _$$UpdateServerImplCopyWith<$Res> {
  __$$UpdateServerImplCopyWithImpl(
      _$UpdateServerImpl _value, $Res Function(_$UpdateServerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdateServerImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as APIServerUpdate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $APIServerUpdateCopyWith<$Res> get message {
    return $APIServerUpdateCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$UpdateServerImpl implements UpdateServer {
  const _$UpdateServerImpl(this.message);

  @override
  final APIServerUpdate message;

  @override
  String toString() {
    return 'Update.server(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateServerImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateServerImplCopyWith<_$UpdateServerImpl> get copyWith =>
      __$$UpdateServerImplCopyWithImpl<_$UpdateServerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int conversationId, List<Message> newMessages)
        messagesAdded,
    required TResult Function(APIServerUpdate message) server,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult? Function(APIServerUpdate message)? server,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int conversationId, List<Message> newMessages)?
        messagesAdded,
    TResult Function(APIServerUpdate message)? server,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateMessagesAdded value) messagesAdded,
    required TResult Function(UpdateServer value) server,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateMessagesAdded value)? messagesAdded,
    TResult? Function(UpdateServer value)? server,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateMessagesAdded value)? messagesAdded,
    TResult Function(UpdateServer value)? server,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class UpdateServer implements Update {
  const factory UpdateServer(final APIServerUpdate message) =
      _$UpdateServerImpl;

  APIServerUpdate get message;
  @JsonKey(ignore: true)
  _$$UpdateServerImplCopyWith<_$UpdateServerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
