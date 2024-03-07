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
