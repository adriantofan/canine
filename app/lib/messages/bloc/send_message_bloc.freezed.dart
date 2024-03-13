// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEventTextChanged value) textChanged,
    required TResult Function(SendMessageEventSend value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEventTextChanged value)? textChanged,
    TResult? Function(SendMessageEventSend value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEventTextChanged value)? textChanged,
    TResult Function(SendMessageEventSend value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageEventCopyWith<$Res> {
  factory $SendMessageEventCopyWith(
          SendMessageEvent value, $Res Function(SendMessageEvent) then) =
      _$SendMessageEventCopyWithImpl<$Res, SendMessageEvent>;
}

/// @nodoc
class _$SendMessageEventCopyWithImpl<$Res, $Val extends SendMessageEvent>
    implements $SendMessageEventCopyWith<$Res> {
  _$SendMessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendMessageEventTextChangedImplCopyWith<$Res> {
  factory _$$SendMessageEventTextChangedImplCopyWith(
          _$SendMessageEventTextChangedImpl value,
          $Res Function(_$SendMessageEventTextChangedImpl) then) =
      __$$SendMessageEventTextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SendMessageEventTextChangedImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res,
        _$SendMessageEventTextChangedImpl>
    implements _$$SendMessageEventTextChangedImplCopyWith<$Res> {
  __$$SendMessageEventTextChangedImplCopyWithImpl(
      _$SendMessageEventTextChangedImpl _value,
      $Res Function(_$SendMessageEventTextChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SendMessageEventTextChangedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageEventTextChangedImpl implements SendMessageEventTextChanged {
  const _$SendMessageEventTextChangedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SendMessageEvent.textChanged(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageEventTextChangedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageEventTextChangedImplCopyWith<_$SendMessageEventTextChangedImpl>
      get copyWith => __$$SendMessageEventTextChangedImplCopyWithImpl<
          _$SendMessageEventTextChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEventTextChanged value) textChanged,
    required TResult Function(SendMessageEventSend value) send,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEventTextChanged value)? textChanged,
    TResult? Function(SendMessageEventSend value)? send,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEventTextChanged value)? textChanged,
    TResult Function(SendMessageEventSend value)? send,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class SendMessageEventTextChanged implements SendMessageEvent {
  const factory SendMessageEventTextChanged(final String text) =
      _$SendMessageEventTextChangedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SendMessageEventTextChangedImplCopyWith<_$SendMessageEventTextChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageEventSendImplCopyWith<$Res> {
  factory _$$SendMessageEventSendImplCopyWith(_$SendMessageEventSendImpl value,
          $Res Function(_$SendMessageEventSendImpl) then) =
      __$$SendMessageEventSendImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendMessageEventSendImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$SendMessageEventSendImpl>
    implements _$$SendMessageEventSendImplCopyWith<$Res> {
  __$$SendMessageEventSendImplCopyWithImpl(_$SendMessageEventSendImpl _value,
      $Res Function(_$SendMessageEventSendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendMessageEventSendImpl implements SendMessageEventSend {
  const _$SendMessageEventSendImpl();

  @override
  String toString() {
    return 'SendMessageEvent.send()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageEventSendImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendMessageEventTextChanged value) textChanged,
    required TResult Function(SendMessageEventSend value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendMessageEventTextChanged value)? textChanged,
    TResult? Function(SendMessageEventSend value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendMessageEventTextChanged value)? textChanged,
    TResult Function(SendMessageEventSend value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class SendMessageEventSend implements SendMessageEvent {
  const factory SendMessageEventSend() = _$SendMessageEventSendImpl;
}

/// @nodoc
mixin _$SendMessageState {
  int get conversationId => throw _privateConstructorUsedError;
  String get idempotencyId => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  MessageInput get message => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendMessageStateCopyWith<SendMessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageStateCopyWith<$Res> {
  factory $SendMessageStateCopyWith(
          SendMessageState value, $Res Function(SendMessageState) then) =
      _$SendMessageStateCopyWithImpl<$Res, SendMessageState>;
  @useResult
  $Res call(
      {int conversationId,
      String idempotencyId,
      FormzSubmissionStatus status,
      MessageInput message,
      bool isValid});
}

/// @nodoc
class _$SendMessageStateCopyWithImpl<$Res, $Val extends SendMessageState>
    implements $SendMessageStateCopyWith<$Res> {
  _$SendMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? idempotencyId = null,
    Object? status = null,
    Object? message = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      idempotencyId: null == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMessageStateImplCopyWith<$Res>
    implements $SendMessageStateCopyWith<$Res> {
  factory _$$SendMessageStateImplCopyWith(_$SendMessageStateImpl value,
          $Res Function(_$SendMessageStateImpl) then) =
      __$$SendMessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int conversationId,
      String idempotencyId,
      FormzSubmissionStatus status,
      MessageInput message,
      bool isValid});
}

/// @nodoc
class __$$SendMessageStateImplCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$SendMessageStateImpl>
    implements _$$SendMessageStateImplCopyWith<$Res> {
  __$$SendMessageStateImplCopyWithImpl(_$SendMessageStateImpl _value,
      $Res Function(_$SendMessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? idempotencyId = null,
    Object? status = null,
    Object? message = null,
    Object? isValid = null,
  }) {
    return _then(_$SendMessageStateImpl(
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageInput,
      null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SendMessageStateImpl extends _SendMessageState {
  const _$SendMessageStateImpl(this.conversationId, this.idempotencyId,
      [this.status = FormzSubmissionStatus.initial,
      this.message = const MessageInput.pure(),
      this.isValid = false])
      : super._();

  @override
  final int conversationId;
  @override
  final String idempotencyId;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final MessageInput message;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'SendMessageState(conversationId: $conversationId, idempotencyId: $idempotencyId, status: $status, message: $message, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageStateImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.idempotencyId, idempotencyId) ||
                other.idempotencyId == idempotencyId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, conversationId, idempotencyId, status, message, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageStateImplCopyWith<_$SendMessageStateImpl> get copyWith =>
      __$$SendMessageStateImplCopyWithImpl<_$SendMessageStateImpl>(
          this, _$identity);
}

abstract class _SendMessageState extends SendMessageState {
  const factory _SendMessageState(
      final int conversationId, final String idempotencyId,
      [final FormzSubmissionStatus status,
      final MessageInput message,
      final bool isValid]) = _$SendMessageStateImpl;
  const _SendMessageState._() : super._();

  @override
  int get conversationId;
  @override
  String get idempotencyId;
  @override
  FormzSubmissionStatus get status;
  @override
  MessageInput get message;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageStateImplCopyWith<_$SendMessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
