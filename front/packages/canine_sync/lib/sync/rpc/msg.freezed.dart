// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Msg {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MsgCopyWith<$Res> {
  factory $MsgCopyWith(Msg value, $Res Function(Msg) then) =
      _$MsgCopyWithImpl<$Res, Msg>;
}

/// @nodoc
class _$MsgCopyWithImpl<$Res, $Val extends Msg> implements $MsgCopyWith<$Res> {
  _$MsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MsgUpdateTokenImplCopyWith<$Res> {
  factory _$$MsgUpdateTokenImplCopyWith(_$MsgUpdateTokenImpl value,
          $Res Function(_$MsgUpdateTokenImpl) then) =
      __$$MsgUpdateTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, String token});
}

/// @nodoc
class __$$MsgUpdateTokenImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgUpdateTokenImpl>
    implements _$$MsgUpdateTokenImplCopyWith<$Res> {
  __$$MsgUpdateTokenImplCopyWithImpl(
      _$MsgUpdateTokenImpl _value, $Res Function(_$MsgUpdateTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? token = null,
  }) {
    return _then(_$MsgUpdateTokenImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgUpdateTokenImpl implements MsgUpdateToken {
  const _$MsgUpdateTokenImpl(this.sendPort, this.token);

  @override
  final SendPort sendPort;
  @override
  final String token;

  @override
  String toString() {
    return 'Msg.updateToken(sendPort: $sendPort, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgUpdateTokenImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgUpdateTokenImplCopyWith<_$MsgUpdateTokenImpl> get copyWith =>
      __$$MsgUpdateTokenImplCopyWithImpl<_$MsgUpdateTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return updateToken(sendPort, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return updateToken?.call(sendPort, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(sendPort, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return updateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return updateToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(this);
    }
    return orElse();
  }
}

abstract class MsgUpdateToken implements Msg {
  const factory MsgUpdateToken(final SendPort sendPort, final String token) =
      _$MsgUpdateTokenImpl;

  SendPort get sendPort;
  String get token;
  @JsonKey(ignore: true)
  _$$MsgUpdateTokenImplCopyWith<_$MsgUpdateTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgDisconnectImplCopyWith<$Res> {
  factory _$$MsgDisconnectImplCopyWith(
          _$MsgDisconnectImpl value, $Res Function(_$MsgDisconnectImpl) then) =
      __$$MsgDisconnectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort});
}

/// @nodoc
class __$$MsgDisconnectImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgDisconnectImpl>
    implements _$$MsgDisconnectImplCopyWith<$Res> {
  __$$MsgDisconnectImplCopyWithImpl(
      _$MsgDisconnectImpl _value, $Res Function(_$MsgDisconnectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
  }) {
    return _then(_$MsgDisconnectImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
    ));
  }
}

/// @nodoc

class _$MsgDisconnectImpl implements MsgDisconnect {
  const _$MsgDisconnectImpl(this.sendPort);

  @override
  final SendPort sendPort;

  @override
  String toString() {
    return 'Msg.disconnect(sendPort: $sendPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgDisconnectImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgDisconnectImplCopyWith<_$MsgDisconnectImpl> get copyWith =>
      __$$MsgDisconnectImplCopyWithImpl<_$MsgDisconnectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return disconnect(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return disconnect?.call(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(sendPort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return disconnect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return disconnect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(this);
    }
    return orElse();
  }
}

abstract class MsgDisconnect implements Msg {
  const factory MsgDisconnect(final SendPort sendPort) = _$MsgDisconnectImpl;

  SendPort get sendPort;
  @JsonKey(ignore: true)
  _$$MsgDisconnectImplCopyWith<_$MsgDisconnectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgSubscribeProcImplCopyWith<$Res> {
  factory _$$MsgSubscribeProcImplCopyWith(_$MsgSubscribeProcImpl value,
          $Res Function(_$MsgSubscribeProcImpl) then) =
      __$$MsgSubscribeProcImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key});
}

/// @nodoc
class __$$MsgSubscribeProcImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgSubscribeProcImpl>
    implements _$$MsgSubscribeProcImplCopyWith<$Res> {
  __$$MsgSubscribeProcImplCopyWithImpl(_$MsgSubscribeProcImpl _value,
      $Res Function(_$MsgSubscribeProcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? procBuilder = null,
    Object? key = null,
  }) {
    return _then(_$MsgSubscribeProcImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == procBuilder
          ? _value.procBuilder
          : procBuilder // ignore: cast_nullable_to_non_nullable
              as ProcBuilder<dynamic>,
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgSubscribeProcImpl implements MsgSubscribeProc {
  const _$MsgSubscribeProcImpl(this.sendPort, this.procBuilder, this.key);

  @override
  final SendPort sendPort;
  @override
  final ProcBuilder<dynamic> procBuilder;
  @override
  final String key;

  @override
  String toString() {
    return 'Msg.subscribeProc(sendPort: $sendPort, procBuilder: $procBuilder, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgSubscribeProcImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.procBuilder, procBuilder) ||
                other.procBuilder == procBuilder) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, procBuilder, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgSubscribeProcImplCopyWith<_$MsgSubscribeProcImpl> get copyWith =>
      __$$MsgSubscribeProcImplCopyWithImpl<_$MsgSubscribeProcImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return subscribeProc(sendPort, procBuilder, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return subscribeProc?.call(sendPort, procBuilder, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (subscribeProc != null) {
      return subscribeProc(sendPort, procBuilder, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return subscribeProc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return subscribeProc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (subscribeProc != null) {
      return subscribeProc(this);
    }
    return orElse();
  }
}

abstract class MsgSubscribeProc implements Msg {
  const factory MsgSubscribeProc(
      final SendPort sendPort,
      final ProcBuilder<dynamic> procBuilder,
      final String key) = _$MsgSubscribeProcImpl;

  SendPort get sendPort;
  ProcBuilder<dynamic> get procBuilder;
  String get key;
  @JsonKey(ignore: true)
  _$$MsgSubscribeProcImplCopyWith<_$MsgSubscribeProcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgUnsubscribeProcImplCopyWith<$Res> {
  factory _$$MsgUnsubscribeProcImplCopyWith(_$MsgUnsubscribeProcImpl value,
          $Res Function(_$MsgUnsubscribeProcImpl) then) =
      __$$MsgUnsubscribeProcImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$MsgUnsubscribeProcImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgUnsubscribeProcImpl>
    implements _$$MsgUnsubscribeProcImplCopyWith<$Res> {
  __$$MsgUnsubscribeProcImplCopyWithImpl(_$MsgUnsubscribeProcImpl _value,
      $Res Function(_$MsgUnsubscribeProcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$MsgUnsubscribeProcImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgUnsubscribeProcImpl implements MsgUnsubscribeProc {
  const _$MsgUnsubscribeProcImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'Msg.unsubscribeProc(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgUnsubscribeProcImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgUnsubscribeProcImplCopyWith<_$MsgUnsubscribeProcImpl> get copyWith =>
      __$$MsgUnsubscribeProcImplCopyWithImpl<_$MsgUnsubscribeProcImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return unsubscribeProc(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return unsubscribeProc?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (unsubscribeProc != null) {
      return unsubscribeProc(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return unsubscribeProc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return unsubscribeProc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (unsubscribeProc != null) {
      return unsubscribeProc(this);
    }
    return orElse();
  }
}

abstract class MsgUnsubscribeProc implements Msg {
  const factory MsgUnsubscribeProc(final String key) = _$MsgUnsubscribeProcImpl;

  String get key;
  @JsonKey(ignore: true)
  _$$MsgUnsubscribeProcImplCopyWith<_$MsgUnsubscribeProcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgConversationMessagesSyncStateSubscribeImplCopyWith<$Res> {
  factory _$$MsgConversationMessagesSyncStateSubscribeImplCopyWith(
          _$MsgConversationMessagesSyncStateSubscribeImpl value,
          $Res Function(_$MsgConversationMessagesSyncStateSubscribeImpl) then) =
      __$$MsgConversationMessagesSyncStateSubscribeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, int conversationId, String key});
}

/// @nodoc
class __$$MsgConversationMessagesSyncStateSubscribeImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res,
        _$MsgConversationMessagesSyncStateSubscribeImpl>
    implements _$$MsgConversationMessagesSyncStateSubscribeImplCopyWith<$Res> {
  __$$MsgConversationMessagesSyncStateSubscribeImplCopyWithImpl(
      _$MsgConversationMessagesSyncStateSubscribeImpl _value,
      $Res Function(_$MsgConversationMessagesSyncStateSubscribeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? conversationId = null,
    Object? key = null,
  }) {
    return _then(_$MsgConversationMessagesSyncStateSubscribeImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgConversationMessagesSyncStateSubscribeImpl
    implements MsgConversationMessagesSyncStateSubscribe {
  const _$MsgConversationMessagesSyncStateSubscribeImpl(
      this.sendPort, this.conversationId, this.key);

  @override
  final SendPort sendPort;
  @override
  final int conversationId;
  @override
  final String key;

  @override
  String toString() {
    return 'Msg.conversationMessagesSyncStateSubscribe(sendPort: $sendPort, conversationId: $conversationId, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgConversationMessagesSyncStateSubscribeImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, conversationId, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgConversationMessagesSyncStateSubscribeImplCopyWith<
          _$MsgConversationMessagesSyncStateSubscribeImpl>
      get copyWith =>
          __$$MsgConversationMessagesSyncStateSubscribeImplCopyWithImpl<
                  _$MsgConversationMessagesSyncStateSubscribeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return conversationMessagesSyncStateSubscribe(
        sendPort, conversationId, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return conversationMessagesSyncStateSubscribe?.call(
        sendPort, conversationId, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesSyncStateSubscribe != null) {
      return conversationMessagesSyncStateSubscribe(
          sendPort, conversationId, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return conversationMessagesSyncStateSubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return conversationMessagesSyncStateSubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesSyncStateSubscribe != null) {
      return conversationMessagesSyncStateSubscribe(this);
    }
    return orElse();
  }
}

abstract class MsgConversationMessagesSyncStateSubscribe implements Msg {
  const factory MsgConversationMessagesSyncStateSubscribe(
          final SendPort sendPort, final int conversationId, final String key) =
      _$MsgConversationMessagesSyncStateSubscribeImpl;

  SendPort get sendPort;
  int get conversationId;
  String get key;
  @JsonKey(ignore: true)
  _$$MsgConversationMessagesSyncStateSubscribeImplCopyWith<
          _$MsgConversationMessagesSyncStateSubscribeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWith<
    $Res> {
  factory _$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWith(
          _$MsgConversationMessagesSyncStateUnsubscribeImpl value,
          $Res Function(_$MsgConversationMessagesSyncStateUnsubscribeImpl)
              then) =
      __$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res,
        _$MsgConversationMessagesSyncStateUnsubscribeImpl>
    implements
        _$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWith<$Res> {
  __$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWithImpl(
      _$MsgConversationMessagesSyncStateUnsubscribeImpl _value,
      $Res Function(_$MsgConversationMessagesSyncStateUnsubscribeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$MsgConversationMessagesSyncStateUnsubscribeImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgConversationMessagesSyncStateUnsubscribeImpl
    implements MsgConversationMessagesSyncStateUnsubscribe {
  const _$MsgConversationMessagesSyncStateUnsubscribeImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'Msg.conversationMessagesSyncStateUnsubscribe(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgConversationMessagesSyncStateUnsubscribeImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWith<
          _$MsgConversationMessagesSyncStateUnsubscribeImpl>
      get copyWith =>
          __$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWithImpl<
                  _$MsgConversationMessagesSyncStateUnsubscribeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return conversationMessagesSyncStateUnsubscribe(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return conversationMessagesSyncStateUnsubscribe?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesSyncStateUnsubscribe != null) {
      return conversationMessagesSyncStateUnsubscribe(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return conversationMessagesSyncStateUnsubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return conversationMessagesSyncStateUnsubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesSyncStateUnsubscribe != null) {
      return conversationMessagesSyncStateUnsubscribe(this);
    }
    return orElse();
  }
}

abstract class MsgConversationMessagesSyncStateUnsubscribe implements Msg {
  const factory MsgConversationMessagesSyncStateUnsubscribe(final String key) =
      _$MsgConversationMessagesSyncStateUnsubscribeImpl;

  String get key;
  @JsonKey(ignore: true)
  _$$MsgConversationMessagesSyncStateUnsubscribeImplCopyWith<
          _$MsgConversationMessagesSyncStateUnsubscribeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgConversationMessagesLoadPastImplCopyWith<$Res> {
  factory _$$MsgConversationMessagesLoadPastImplCopyWith(
          _$MsgConversationMessagesLoadPastImpl value,
          $Res Function(_$MsgConversationMessagesLoadPastImpl) then) =
      __$$MsgConversationMessagesLoadPastImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, int conversationId});
}

/// @nodoc
class __$$MsgConversationMessagesLoadPastImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgConversationMessagesLoadPastImpl>
    implements _$$MsgConversationMessagesLoadPastImplCopyWith<$Res> {
  __$$MsgConversationMessagesLoadPastImplCopyWithImpl(
      _$MsgConversationMessagesLoadPastImpl _value,
      $Res Function(_$MsgConversationMessagesLoadPastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? conversationId = null,
  }) {
    return _then(_$MsgConversationMessagesLoadPastImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MsgConversationMessagesLoadPastImpl
    implements MsgConversationMessagesLoadPast {
  const _$MsgConversationMessagesLoadPastImpl(
      this.sendPort, this.conversationId);

  @override
  final SendPort sendPort;
  @override
  final int conversationId;

  @override
  String toString() {
    return 'Msg.conversationMessagesLoadPast(sendPort: $sendPort, conversationId: $conversationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgConversationMessagesLoadPastImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, conversationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgConversationMessagesLoadPastImplCopyWith<
          _$MsgConversationMessagesLoadPastImpl>
      get copyWith => __$$MsgConversationMessagesLoadPastImplCopyWithImpl<
          _$MsgConversationMessagesLoadPastImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return conversationMessagesLoadPast(sendPort, conversationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return conversationMessagesLoadPast?.call(sendPort, conversationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesLoadPast != null) {
      return conversationMessagesLoadPast(sendPort, conversationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return conversationMessagesLoadPast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return conversationMessagesLoadPast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (conversationMessagesLoadPast != null) {
      return conversationMessagesLoadPast(this);
    }
    return orElse();
  }
}

abstract class MsgConversationMessagesLoadPast implements Msg {
  const factory MsgConversationMessagesLoadPast(
          final SendPort sendPort, final int conversationId) =
      _$MsgConversationMessagesLoadPastImpl;

  SendPort get sendPort;
  int get conversationId;
  @JsonKey(ignore: true)
  _$$MsgConversationMessagesLoadPastImplCopyWith<
          _$MsgConversationMessagesLoadPastImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgCreateMessageImplCopyWith<$Res> {
  factory _$$MsgCreateMessageImplCopyWith(_$MsgCreateMessageImpl value,
          $Res Function(_$MsgCreateMessageImpl) then) =
      __$$MsgCreateMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SendPort sendPort,
      int conversationId,
      String text,
      String idempotencyId,
      List<XFile> attachments});
}

/// @nodoc
class __$$MsgCreateMessageImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgCreateMessageImpl>
    implements _$$MsgCreateMessageImplCopyWith<$Res> {
  __$$MsgCreateMessageImplCopyWithImpl(_$MsgCreateMessageImpl _value,
      $Res Function(_$MsgCreateMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? conversationId = null,
    Object? text = null,
    Object? idempotencyId = null,
    Object? attachments = null,
  }) {
    return _then(_$MsgCreateMessageImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      null == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String,
      null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
    ));
  }
}

/// @nodoc

class _$MsgCreateMessageImpl implements MsgCreateMessage {
  const _$MsgCreateMessageImpl(this.sendPort, this.conversationId, this.text,
      this.idempotencyId, final List<XFile> attachments)
      : _attachments = attachments;

  @override
  final SendPort sendPort;
  @override
  final int conversationId;
  @override
  final String text;
  @override
  final String idempotencyId;
  final List<XFile> _attachments;
  @override
  List<XFile> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'Msg.createMessage(sendPort: $sendPort, conversationId: $conversationId, text: $text, idempotencyId: $idempotencyId, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgCreateMessageImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.idempotencyId, idempotencyId) ||
                other.idempotencyId == idempotencyId) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, conversationId, text,
      idempotencyId, const DeepCollectionEquality().hash(_attachments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgCreateMessageImplCopyWith<_$MsgCreateMessageImpl> get copyWith =>
      __$$MsgCreateMessageImplCopyWithImpl<_$MsgCreateMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return createMessage(
        sendPort, conversationId, text, idempotencyId, attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return createMessage?.call(
        sendPort, conversationId, text, idempotencyId, attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (createMessage != null) {
      return createMessage(
          sendPort, conversationId, text, idempotencyId, attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return createMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return createMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (createMessage != null) {
      return createMessage(this);
    }
    return orElse();
  }
}

abstract class MsgCreateMessage implements Msg {
  const factory MsgCreateMessage(
      final SendPort sendPort,
      final int conversationId,
      final String text,
      final String idempotencyId,
      final List<XFile> attachments) = _$MsgCreateMessageImpl;

  SendPort get sendPort;
  int get conversationId;
  String get text;
  String get idempotencyId;
  List<XFile> get attachments;
  @JsonKey(ignore: true)
  _$$MsgCreateMessageImplCopyWith<_$MsgCreateMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgCreateConversationImplCopyWith<$Res> {
  factory _$$MsgCreateConversationImplCopyWith(
          _$MsgCreateConversationImpl value,
          $Res Function(_$MsgCreateConversationImpl) then) =
      __$$MsgCreateConversationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, int userId});
}

/// @nodoc
class __$$MsgCreateConversationImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgCreateConversationImpl>
    implements _$$MsgCreateConversationImplCopyWith<$Res> {
  __$$MsgCreateConversationImplCopyWithImpl(_$MsgCreateConversationImpl _value,
      $Res Function(_$MsgCreateConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? userId = null,
  }) {
    return _then(_$MsgCreateConversationImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MsgCreateConversationImpl implements MsgCreateConversation {
  const _$MsgCreateConversationImpl(this.sendPort, {required this.userId});

  @override
  final SendPort sendPort;
  @override
  final int userId;

  @override
  String toString() {
    return 'Msg.createConversation(sendPort: $sendPort, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgCreateConversationImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgCreateConversationImplCopyWith<_$MsgCreateConversationImpl>
      get copyWith => __$$MsgCreateConversationImplCopyWithImpl<
          _$MsgCreateConversationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return createConversation(sendPort, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return createConversation?.call(sendPort, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (createConversation != null) {
      return createConversation(sendPort, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return createConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return createConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (createConversation != null) {
      return createConversation(this);
    }
    return orElse();
  }
}

abstract class MsgCreateConversation implements Msg {
  const factory MsgCreateConversation(final SendPort sendPort,
      {required final int userId}) = _$MsgCreateConversationImpl;

  SendPort get sendPort;
  int get userId;
  @JsonKey(ignore: true)
  _$$MsgCreateConversationImplCopyWith<_$MsgCreateConversationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgCreateUserImplCopyWith<$Res> {
  factory _$$MsgCreateUserImplCopyWith(
          _$MsgCreateUserImpl value, $Res Function(_$MsgCreateUserImpl) then) =
      __$$MsgCreateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SendPort sendPort,
      String email,
      String firstName,
      String lastName,
      String phone,
      UserType userType});
}

/// @nodoc
class __$$MsgCreateUserImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgCreateUserImpl>
    implements _$$MsgCreateUserImplCopyWith<$Res> {
  __$$MsgCreateUserImplCopyWithImpl(
      _$MsgCreateUserImpl _value, $Res Function(_$MsgCreateUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? userType = null,
  }) {
    return _then(_$MsgCreateUserImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
    ));
  }
}

/// @nodoc

class _$MsgCreateUserImpl implements MsgCreateUser {
  const _$MsgCreateUserImpl(this.sendPort,
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.userType});

  @override
  final SendPort sendPort;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final UserType userType;

  @override
  String toString() {
    return 'Msg.createUser(sendPort: $sendPort, email: $email, firstName: $firstName, lastName: $lastName, phone: $phone, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgCreateUserImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, sendPort, email, firstName, lastName, phone, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgCreateUserImplCopyWith<_$MsgCreateUserImpl> get copyWith =>
      __$$MsgCreateUserImplCopyWithImpl<_$MsgCreateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, String token) updateToken,
    required TResult Function(SendPort sendPort) disconnect,
    required TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)
        subscribeProc,
    required TResult Function(String key) unsubscribeProc,
    required TResult Function(SendPort sendPort, int conversationId, String key)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(String key)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(SendPort sendPort, int conversationId)
        conversationMessagesLoadPast,
    required TResult Function(SendPort sendPort, int conversationId,
            String text, String idempotencyId, List<XFile> attachments)
        createMessage,
    required TResult Function(SendPort sendPort, int userId) createConversation,
    required TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)
        createUser,
  }) {
    return createUser(sendPort, email, firstName, lastName, phone, userType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, String token)? updateToken,
    TResult? Function(SendPort sendPort)? disconnect,
    TResult? Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult? Function(String key)? unsubscribeProc,
    TResult? Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult? Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult? Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult? Function(SendPort sendPort, int userId)? createConversation,
    TResult? Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
  }) {
    return createUser?.call(
        sendPort, email, firstName, lastName, phone, userType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, String token)? updateToken,
    TResult Function(SendPort sendPort)? disconnect,
    TResult Function(
            SendPort sendPort, ProcBuilder<dynamic> procBuilder, String key)?
        subscribeProc,
    TResult Function(String key)? unsubscribeProc,
    TResult Function(SendPort sendPort, int conversationId, String key)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(String key)? conversationMessagesSyncStateUnsubscribe,
    TResult Function(SendPort sendPort, int conversationId)?
        conversationMessagesLoadPast,
    TResult Function(SendPort sendPort, int conversationId, String text,
            String idempotencyId, List<XFile> attachments)?
        createMessage,
    TResult Function(SendPort sendPort, int userId)? createConversation,
    TResult Function(SendPort sendPort, String email, String firstName,
            String lastName, String phone, UserType userType)?
        createUser,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(sendPort, email, firstName, lastName, phone, userType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgUpdateToken value) updateToken,
    required TResult Function(MsgDisconnect value) disconnect,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
    required TResult Function(MsgCreateConversation value) createConversation,
    required TResult Function(MsgCreateUser value) createUser,
  }) {
    return createUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgUpdateToken value)? updateToken,
    TResult? Function(MsgDisconnect value)? disconnect,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
    TResult? Function(MsgCreateConversation value)? createConversation,
    TResult? Function(MsgCreateUser value)? createUser,
  }) {
    return createUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgUpdateToken value)? updateToken,
    TResult Function(MsgDisconnect value)? disconnect,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    TResult Function(MsgCreateConversation value)? createConversation,
    TResult Function(MsgCreateUser value)? createUser,
    required TResult orElse(),
  }) {
    if (createUser != null) {
      return createUser(this);
    }
    return orElse();
  }
}

abstract class MsgCreateUser implements Msg {
  const factory MsgCreateUser(final SendPort sendPort,
      {required final String email,
      required final String firstName,
      required final String lastName,
      required final String phone,
      required final UserType userType}) = _$MsgCreateUserImpl;

  SendPort get sendPort;
  String get email;
  String get firstName;
  String get lastName;
  String get phone;
  UserType get userType;
  @JsonKey(ignore: true)
  _$$MsgCreateUserImplCopyWith<_$MsgCreateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
