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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
abstract class _$$MsgLoginImplCopyWith<$Res> {
  factory _$$MsgLoginImplCopyWith(
          _$MsgLoginImpl value, $Res Function(_$MsgLoginImpl) then) =
      __$$MsgLoginImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SendPort sendPort, int workspaceId, String username, String password});
}

/// @nodoc
class __$$MsgLoginImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgLoginImpl>
    implements _$$MsgLoginImplCopyWith<$Res> {
  __$$MsgLoginImplCopyWithImpl(
      _$MsgLoginImpl _value, $Res Function(_$MsgLoginImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? workspaceId = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$MsgLoginImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as int,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgLoginImpl implements MsgLogin {
  const _$MsgLoginImpl(
      this.sendPort, this.workspaceId, this.username, this.password);

  @override
  final SendPort sendPort;
  @override
  final int workspaceId;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'Msg.login(sendPort: $sendPort, workspaceId: $workspaceId, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgLoginImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sendPort, workspaceId, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgLoginImplCopyWith<_$MsgLoginImpl> get copyWith =>
      __$$MsgLoginImplCopyWithImpl<_$MsgLoginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return login(sendPort, workspaceId, username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return login?.call(sendPort, workspaceId, username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(sendPort, workspaceId, username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class MsgLogin implements Msg {
  const factory MsgLogin(final SendPort sendPort, final int workspaceId,
      final String username, final String password) = _$MsgLoginImpl;

  SendPort get sendPort;
  int get workspaceId;
  String get username;
  String get password;
  @JsonKey(ignore: true)
  _$$MsgLoginImplCopyWith<_$MsgLoginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgLogoutImplCopyWith<$Res> {
  factory _$$MsgLogoutImplCopyWith(
          _$MsgLogoutImpl value, $Res Function(_$MsgLogoutImpl) then) =
      __$$MsgLogoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort});
}

/// @nodoc
class __$$MsgLogoutImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgLogoutImpl>
    implements _$$MsgLogoutImplCopyWith<$Res> {
  __$$MsgLogoutImplCopyWithImpl(
      _$MsgLogoutImpl _value, $Res Function(_$MsgLogoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
  }) {
    return _then(_$MsgLogoutImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
    ));
  }
}

/// @nodoc

class _$MsgLogoutImpl implements MsgLogout {
  const _$MsgLogoutImpl(this.sendPort);

  @override
  final SendPort sendPort;

  @override
  String toString() {
    return 'Msg.logout(sendPort: $sendPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgLogoutImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgLogoutImplCopyWith<_$MsgLogoutImpl> get copyWith =>
      __$$MsgLogoutImplCopyWithImpl<_$MsgLogoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return logout(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return logout?.call(sendPort);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(sendPort);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class MsgLogout implements Msg {
  const factory MsgLogout(final SendPort sendPort) = _$MsgLogoutImpl;

  SendPort get sendPort;
  @JsonKey(ignore: true)
  _$$MsgLogoutImplCopyWith<_$MsgLogoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgAuthStatusSubscribeImplCopyWith<$Res> {
  factory _$$MsgAuthStatusSubscribeImplCopyWith(
          _$MsgAuthStatusSubscribeImpl value,
          $Res Function(_$MsgAuthStatusSubscribeImpl) then) =
      __$$MsgAuthStatusSubscribeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SendPort sendPort, String key});
}

/// @nodoc
class __$$MsgAuthStatusSubscribeImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgAuthStatusSubscribeImpl>
    implements _$$MsgAuthStatusSubscribeImplCopyWith<$Res> {
  __$$MsgAuthStatusSubscribeImplCopyWithImpl(
      _$MsgAuthStatusSubscribeImpl _value,
      $Res Function(_$MsgAuthStatusSubscribeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendPort = null,
    Object? key = null,
  }) {
    return _then(_$MsgAuthStatusSubscribeImpl(
      null == sendPort
          ? _value.sendPort
          : sendPort // ignore: cast_nullable_to_non_nullable
              as SendPort,
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgAuthStatusSubscribeImpl implements MsgAuthStatusSubscribe {
  const _$MsgAuthStatusSubscribeImpl(this.sendPort, this.key);

  @override
  final SendPort sendPort;
  @override
  final String key;

  @override
  String toString() {
    return 'Msg.authStatusSubscribe(sendPort: $sendPort, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgAuthStatusSubscribeImpl &&
            (identical(other.sendPort, sendPort) ||
                other.sendPort == sendPort) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendPort, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgAuthStatusSubscribeImplCopyWith<_$MsgAuthStatusSubscribeImpl>
      get copyWith => __$$MsgAuthStatusSubscribeImplCopyWithImpl<
          _$MsgAuthStatusSubscribeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return authStatusSubscribe(sendPort, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return authStatusSubscribe?.call(sendPort, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) {
    if (authStatusSubscribe != null) {
      return authStatusSubscribe(sendPort, key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return authStatusSubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return authStatusSubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    required TResult orElse(),
  }) {
    if (authStatusSubscribe != null) {
      return authStatusSubscribe(this);
    }
    return orElse();
  }
}

abstract class MsgAuthStatusSubscribe implements Msg {
  const factory MsgAuthStatusSubscribe(
      final SendPort sendPort, final String key) = _$MsgAuthStatusSubscribeImpl;

  SendPort get sendPort;
  String get key;
  @JsonKey(ignore: true)
  _$$MsgAuthStatusSubscribeImplCopyWith<_$MsgAuthStatusSubscribeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MsgAuthStatusUnsubscribeImplCopyWith<$Res> {
  factory _$$MsgAuthStatusUnsubscribeImplCopyWith(
          _$MsgAuthStatusUnsubscribeImpl value,
          $Res Function(_$MsgAuthStatusUnsubscribeImpl) then) =
      __$$MsgAuthStatusUnsubscribeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String key});
}

/// @nodoc
class __$$MsgAuthStatusUnsubscribeImplCopyWithImpl<$Res>
    extends _$MsgCopyWithImpl<$Res, _$MsgAuthStatusUnsubscribeImpl>
    implements _$$MsgAuthStatusUnsubscribeImplCopyWith<$Res> {
  __$$MsgAuthStatusUnsubscribeImplCopyWithImpl(
      _$MsgAuthStatusUnsubscribeImpl _value,
      $Res Function(_$MsgAuthStatusUnsubscribeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
  }) {
    return _then(_$MsgAuthStatusUnsubscribeImpl(
      null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MsgAuthStatusUnsubscribeImpl implements MsgAuthStatusUnsubscribe {
  const _$MsgAuthStatusUnsubscribeImpl(this.key);

  @override
  final String key;

  @override
  String toString() {
    return 'Msg.authStatusUnsubscribe(key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MsgAuthStatusUnsubscribeImpl &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgAuthStatusUnsubscribeImplCopyWith<_$MsgAuthStatusUnsubscribeImpl>
      get copyWith => __$$MsgAuthStatusUnsubscribeImplCopyWithImpl<
          _$MsgAuthStatusUnsubscribeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return authStatusUnsubscribe(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return authStatusUnsubscribe?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) {
    if (authStatusUnsubscribe != null) {
      return authStatusUnsubscribe(key);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return authStatusUnsubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return authStatusUnsubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
    required TResult orElse(),
  }) {
    if (authStatusUnsubscribe != null) {
      return authStatusUnsubscribe(this);
    }
    return orElse();
  }
}

abstract class MsgAuthStatusUnsubscribe implements Msg {
  const factory MsgAuthStatusUnsubscribe(final String key) =
      _$MsgAuthStatusUnsubscribeImpl;

  String get key;
  @JsonKey(ignore: true)
  _$$MsgAuthStatusUnsubscribeImplCopyWith<_$MsgAuthStatusUnsubscribeImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return subscribeProc(sendPort, procBuilder, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return subscribeProc?.call(sendPort, procBuilder, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
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
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return subscribeProc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return subscribeProc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return unsubscribeProc(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return unsubscribeProc?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
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
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return unsubscribeProc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return unsubscribeProc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return conversationMessagesSyncStateSubscribe(
        sendPort, conversationId, key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return conversationMessagesSyncStateSubscribe?.call(
        sendPort, conversationId, key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
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
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return conversationMessagesSyncStateSubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return conversationMessagesSyncStateSubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return conversationMessagesSyncStateUnsubscribe(key);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return conversationMessagesSyncStateUnsubscribe?.call(key);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
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
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return conversationMessagesSyncStateUnsubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return conversationMessagesSyncStateUnsubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return conversationMessagesLoadPast(sendPort, conversationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return conversationMessagesLoadPast?.call(sendPort, conversationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
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
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return conversationMessagesLoadPast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return conversationMessagesLoadPast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
      String idempotencyId});
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
    ));
  }
}

/// @nodoc

class _$MsgCreateMessageImpl implements MsgCreateMessage {
  const _$MsgCreateMessageImpl(
      this.sendPort, this.conversationId, this.text, this.idempotencyId);

  @override
  final SendPort sendPort;
  @override
  final int conversationId;
  @override
  final String text;
  @override
  final String idempotencyId;

  @override
  String toString() {
    return 'Msg.createMessage(sendPort: $sendPort, conversationId: $conversationId, text: $text, idempotencyId: $idempotencyId)';
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
                other.idempotencyId == idempotencyId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, sendPort, conversationId, text, idempotencyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MsgCreateMessageImplCopyWith<_$MsgCreateMessageImpl> get copyWith =>
      __$$MsgCreateMessageImplCopyWithImpl<_$MsgCreateMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SendPort sendPort, int workspaceId,
            String username, String password)
        login,
    required TResult Function(SendPort sendPort) logout,
    required TResult Function(SendPort sendPort, String key)
        authStatusSubscribe,
    required TResult Function(String key) authStatusUnsubscribe,
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
            String text, String idempotencyId)
        createMessage,
  }) {
    return createMessage(sendPort, conversationId, text, idempotencyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult? Function(SendPort sendPort)? logout,
    TResult? Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult? Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
  }) {
    return createMessage?.call(sendPort, conversationId, text, idempotencyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SendPort sendPort, int workspaceId, String username,
            String password)?
        login,
    TResult Function(SendPort sendPort)? logout,
    TResult Function(SendPort sendPort, String key)? authStatusSubscribe,
    TResult Function(String key)? authStatusUnsubscribe,
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
            String idempotencyId)?
        createMessage,
    required TResult orElse(),
  }) {
    if (createMessage != null) {
      return createMessage(sendPort, conversationId, text, idempotencyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MsgLogin value) login,
    required TResult Function(MsgLogout value) logout,
    required TResult Function(MsgAuthStatusSubscribe value) authStatusSubscribe,
    required TResult Function(MsgAuthStatusUnsubscribe value)
        authStatusUnsubscribe,
    required TResult Function(MsgSubscribeProc value) subscribeProc,
    required TResult Function(MsgUnsubscribeProc value) unsubscribeProc,
    required TResult Function(MsgConversationMessagesSyncStateSubscribe value)
        conversationMessagesSyncStateSubscribe,
    required TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)
        conversationMessagesSyncStateUnsubscribe,
    required TResult Function(MsgConversationMessagesLoadPast value)
        conversationMessagesLoadPast,
    required TResult Function(MsgCreateMessage value) createMessage,
  }) {
    return createMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MsgLogin value)? login,
    TResult? Function(MsgLogout value)? logout,
    TResult? Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult? Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult? Function(MsgSubscribeProc value)? subscribeProc,
    TResult? Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult? Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult? Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult? Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult? Function(MsgCreateMessage value)? createMessage,
  }) {
    return createMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MsgLogin value)? login,
    TResult Function(MsgLogout value)? logout,
    TResult Function(MsgAuthStatusSubscribe value)? authStatusSubscribe,
    TResult Function(MsgAuthStatusUnsubscribe value)? authStatusUnsubscribe,
    TResult Function(MsgSubscribeProc value)? subscribeProc,
    TResult Function(MsgUnsubscribeProc value)? unsubscribeProc,
    TResult Function(MsgConversationMessagesSyncStateSubscribe value)?
        conversationMessagesSyncStateSubscribe,
    TResult Function(MsgConversationMessagesSyncStateUnsubscribe value)?
        conversationMessagesSyncStateUnsubscribe,
    TResult Function(MsgConversationMessagesLoadPast value)?
        conversationMessagesLoadPast,
    TResult Function(MsgCreateMessage value)? createMessage,
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
      final String idempotencyId) = _$MsgCreateMessageImpl;

  SendPort get sendPort;
  int get conversationId;
  String get text;
  String get idempotencyId;
  @JsonKey(ignore: true)
  _$$MsgCreateMessageImplCopyWith<_$MsgCreateMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
