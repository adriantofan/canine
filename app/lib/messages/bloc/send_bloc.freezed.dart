// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
    required TResult Function(XFile attachment) attachmentAdded,
    required TResult Function(int index) attachmentRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
    TResult? Function(XFile attachment)? attachmentAdded,
    TResult? Function(int index)? attachmentRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    TResult Function(XFile attachment)? attachmentAdded,
    TResult Function(int index)? attachmentRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventTextChanged value) textChanged,
    required TResult Function(SendEventSend value) send,
    required TResult Function(SendEventAttachmentAdded value) attachmentAdded,
    required TResult Function(SendEventAttachmentRemoved value)
        attachmentRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEventTextChanged value)? textChanged,
    TResult? Function(SendEventSend value)? send,
    TResult? Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult? Function(SendEventAttachmentRemoved value)? attachmentRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventTextChanged value)? textChanged,
    TResult Function(SendEventSend value)? send,
    TResult Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult Function(SendEventAttachmentRemoved value)? attachmentRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEventCopyWith<$Res> {
  factory $SendEventCopyWith(SendEvent value, $Res Function(SendEvent) then) =
      _$SendEventCopyWithImpl<$Res, SendEvent>;
}

/// @nodoc
class _$SendEventCopyWithImpl<$Res, $Val extends SendEvent>
    implements $SendEventCopyWith<$Res> {
  _$SendEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendEventTextChangedImplCopyWith<$Res> {
  factory _$$SendEventTextChangedImplCopyWith(_$SendEventTextChangedImpl value,
          $Res Function(_$SendEventTextChangedImpl) then) =
      __$$SendEventTextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SendEventTextChangedImplCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res, _$SendEventTextChangedImpl>
    implements _$$SendEventTextChangedImplCopyWith<$Res> {
  __$$SendEventTextChangedImplCopyWithImpl(_$SendEventTextChangedImpl _value,
      $Res Function(_$SendEventTextChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SendEventTextChangedImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendEventTextChangedImpl implements SendEventTextChanged {
  const _$SendEventTextChangedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'SendEvent.textChanged(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEventTextChangedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEventTextChangedImplCopyWith<_$SendEventTextChangedImpl>
      get copyWith =>
          __$$SendEventTextChangedImplCopyWithImpl<_$SendEventTextChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
    required TResult Function(XFile attachment) attachmentAdded,
    required TResult Function(int index) attachmentRemoved,
  }) {
    return textChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
    TResult? Function(XFile attachment)? attachmentAdded,
    TResult? Function(int index)? attachmentRemoved,
  }) {
    return textChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    TResult Function(XFile attachment)? attachmentAdded,
    TResult Function(int index)? attachmentRemoved,
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
    required TResult Function(SendEventTextChanged value) textChanged,
    required TResult Function(SendEventSend value) send,
    required TResult Function(SendEventAttachmentAdded value) attachmentAdded,
    required TResult Function(SendEventAttachmentRemoved value)
        attachmentRemoved,
  }) {
    return textChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEventTextChanged value)? textChanged,
    TResult? Function(SendEventSend value)? send,
    TResult? Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult? Function(SendEventAttachmentRemoved value)? attachmentRemoved,
  }) {
    return textChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventTextChanged value)? textChanged,
    TResult Function(SendEventSend value)? send,
    TResult Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult Function(SendEventAttachmentRemoved value)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (textChanged != null) {
      return textChanged(this);
    }
    return orElse();
  }
}

abstract class SendEventTextChanged implements SendEvent {
  const factory SendEventTextChanged(final String text) =
      _$SendEventTextChangedImpl;

  String get text;
  @JsonKey(ignore: true)
  _$$SendEventTextChangedImplCopyWith<_$SendEventTextChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendEventSendImplCopyWith<$Res> {
  factory _$$SendEventSendImplCopyWith(
          _$SendEventSendImpl value, $Res Function(_$SendEventSendImpl) then) =
      __$$SendEventSendImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEventSendImplCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res, _$SendEventSendImpl>
    implements _$$SendEventSendImplCopyWith<$Res> {
  __$$SendEventSendImplCopyWithImpl(
      _$SendEventSendImpl _value, $Res Function(_$SendEventSendImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendEventSendImpl implements SendEventSend {
  const _$SendEventSendImpl();

  @override
  String toString() {
    return 'SendEvent.send()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendEventSendImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
    required TResult Function(XFile attachment) attachmentAdded,
    required TResult Function(int index) attachmentRemoved,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
    TResult? Function(XFile attachment)? attachmentAdded,
    TResult? Function(int index)? attachmentRemoved,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    TResult Function(XFile attachment)? attachmentAdded,
    TResult Function(int index)? attachmentRemoved,
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
    required TResult Function(SendEventTextChanged value) textChanged,
    required TResult Function(SendEventSend value) send,
    required TResult Function(SendEventAttachmentAdded value) attachmentAdded,
    required TResult Function(SendEventAttachmentRemoved value)
        attachmentRemoved,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEventTextChanged value)? textChanged,
    TResult? Function(SendEventSend value)? send,
    TResult? Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult? Function(SendEventAttachmentRemoved value)? attachmentRemoved,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventTextChanged value)? textChanged,
    TResult Function(SendEventSend value)? send,
    TResult Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult Function(SendEventAttachmentRemoved value)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class SendEventSend implements SendEvent {
  const factory SendEventSend() = _$SendEventSendImpl;
}

/// @nodoc
abstract class _$$SendEventAttachmentAddedImplCopyWith<$Res> {
  factory _$$SendEventAttachmentAddedImplCopyWith(
          _$SendEventAttachmentAddedImpl value,
          $Res Function(_$SendEventAttachmentAddedImpl) then) =
      __$$SendEventAttachmentAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile attachment});
}

/// @nodoc
class __$$SendEventAttachmentAddedImplCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res, _$SendEventAttachmentAddedImpl>
    implements _$$SendEventAttachmentAddedImplCopyWith<$Res> {
  __$$SendEventAttachmentAddedImplCopyWithImpl(
      _$SendEventAttachmentAddedImpl _value,
      $Res Function(_$SendEventAttachmentAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attachment = null,
  }) {
    return _then(_$SendEventAttachmentAddedImpl(
      null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$SendEventAttachmentAddedImpl implements SendEventAttachmentAdded {
  const _$SendEventAttachmentAddedImpl(this.attachment);

  @override
  final XFile attachment;

  @override
  String toString() {
    return 'SendEvent.attachmentAdded(attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEventAttachmentAddedImpl &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attachment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEventAttachmentAddedImplCopyWith<_$SendEventAttachmentAddedImpl>
      get copyWith => __$$SendEventAttachmentAddedImplCopyWithImpl<
          _$SendEventAttachmentAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
    required TResult Function(XFile attachment) attachmentAdded,
    required TResult Function(int index) attachmentRemoved,
  }) {
    return attachmentAdded(attachment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
    TResult? Function(XFile attachment)? attachmentAdded,
    TResult? Function(int index)? attachmentRemoved,
  }) {
    return attachmentAdded?.call(attachment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    TResult Function(XFile attachment)? attachmentAdded,
    TResult Function(int index)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (attachmentAdded != null) {
      return attachmentAdded(attachment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventTextChanged value) textChanged,
    required TResult Function(SendEventSend value) send,
    required TResult Function(SendEventAttachmentAdded value) attachmentAdded,
    required TResult Function(SendEventAttachmentRemoved value)
        attachmentRemoved,
  }) {
    return attachmentAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEventTextChanged value)? textChanged,
    TResult? Function(SendEventSend value)? send,
    TResult? Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult? Function(SendEventAttachmentRemoved value)? attachmentRemoved,
  }) {
    return attachmentAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventTextChanged value)? textChanged,
    TResult Function(SendEventSend value)? send,
    TResult Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult Function(SendEventAttachmentRemoved value)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (attachmentAdded != null) {
      return attachmentAdded(this);
    }
    return orElse();
  }
}

abstract class SendEventAttachmentAdded implements SendEvent {
  const factory SendEventAttachmentAdded(final XFile attachment) =
      _$SendEventAttachmentAddedImpl;

  XFile get attachment;
  @JsonKey(ignore: true)
  _$$SendEventAttachmentAddedImplCopyWith<_$SendEventAttachmentAddedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendEventAttachmentRemovedImplCopyWith<$Res> {
  factory _$$SendEventAttachmentRemovedImplCopyWith(
          _$SendEventAttachmentRemovedImpl value,
          $Res Function(_$SendEventAttachmentRemovedImpl) then) =
      __$$SendEventAttachmentRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SendEventAttachmentRemovedImplCopyWithImpl<$Res>
    extends _$SendEventCopyWithImpl<$Res, _$SendEventAttachmentRemovedImpl>
    implements _$$SendEventAttachmentRemovedImplCopyWith<$Res> {
  __$$SendEventAttachmentRemovedImplCopyWithImpl(
      _$SendEventAttachmentRemovedImpl _value,
      $Res Function(_$SendEventAttachmentRemovedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SendEventAttachmentRemovedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SendEventAttachmentRemovedImpl implements SendEventAttachmentRemoved {
  const _$SendEventAttachmentRemovedImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'SendEvent.attachmentRemoved(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEventAttachmentRemovedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEventAttachmentRemovedImplCopyWith<_$SendEventAttachmentRemovedImpl>
      get copyWith => __$$SendEventAttachmentRemovedImplCopyWithImpl<
          _$SendEventAttachmentRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) textChanged,
    required TResult Function() send,
    required TResult Function(XFile attachment) attachmentAdded,
    required TResult Function(int index) attachmentRemoved,
  }) {
    return attachmentRemoved(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? textChanged,
    TResult? Function()? send,
    TResult? Function(XFile attachment)? attachmentAdded,
    TResult? Function(int index)? attachmentRemoved,
  }) {
    return attachmentRemoved?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? textChanged,
    TResult Function()? send,
    TResult Function(XFile attachment)? attachmentAdded,
    TResult Function(int index)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (attachmentRemoved != null) {
      return attachmentRemoved(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendEventTextChanged value) textChanged,
    required TResult Function(SendEventSend value) send,
    required TResult Function(SendEventAttachmentAdded value) attachmentAdded,
    required TResult Function(SendEventAttachmentRemoved value)
        attachmentRemoved,
  }) {
    return attachmentRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendEventTextChanged value)? textChanged,
    TResult? Function(SendEventSend value)? send,
    TResult? Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult? Function(SendEventAttachmentRemoved value)? attachmentRemoved,
  }) {
    return attachmentRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendEventTextChanged value)? textChanged,
    TResult Function(SendEventSend value)? send,
    TResult Function(SendEventAttachmentAdded value)? attachmentAdded,
    TResult Function(SendEventAttachmentRemoved value)? attachmentRemoved,
    required TResult orElse(),
  }) {
    if (attachmentRemoved != null) {
      return attachmentRemoved(this);
    }
    return orElse();
  }
}

abstract class SendEventAttachmentRemoved implements SendEvent {
  const factory SendEventAttachmentRemoved(final int index) =
      _$SendEventAttachmentRemovedImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SendEventAttachmentRemovedImplCopyWith<_$SendEventAttachmentRemovedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendState {
  String get idempotencyId => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  MessageInput get message => throw _privateConstructorUsedError;
  List<XFile> get attachments => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendStateCopyWith<SendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendStateCopyWith<$Res> {
  factory $SendStateCopyWith(SendState value, $Res Function(SendState) then) =
      _$SendStateCopyWithImpl<$Res, SendState>;
  @useResult
  $Res call(
      {String idempotencyId,
      FormzSubmissionStatus status,
      MessageInput message,
      List<XFile> attachments,
      bool isValid});
}

/// @nodoc
class _$SendStateCopyWithImpl<$Res, $Val extends SendState>
    implements $SendStateCopyWith<$Res> {
  _$SendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyId = null,
    Object? status = null,
    Object? message = null,
    Object? attachments = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
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
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendStateImplCopyWith<$Res>
    implements $SendStateCopyWith<$Res> {
  factory _$$SendStateImplCopyWith(
          _$SendStateImpl value, $Res Function(_$SendStateImpl) then) =
      __$$SendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idempotencyId,
      FormzSubmissionStatus status,
      MessageInput message,
      List<XFile> attachments,
      bool isValid});
}

/// @nodoc
class __$$SendStateImplCopyWithImpl<$Res>
    extends _$SendStateCopyWithImpl<$Res, _$SendStateImpl>
    implements _$$SendStateImplCopyWith<$Res> {
  __$$SendStateImplCopyWithImpl(
      _$SendStateImpl _value, $Res Function(_$SendStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idempotencyId = null,
    Object? status = null,
    Object? message = null,
    Object? attachments = null,
    Object? isValid = null,
  }) {
    return _then(_$SendStateImpl(
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
      null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SendStateImpl extends _SendState {
  const _$SendStateImpl(this.idempotencyId,
      [this.status = FormzSubmissionStatus.initial,
      this.message = const MessageInput.pure(),
      final List<XFile> attachments = const [],
      this.isValid = false])
      : _attachments = attachments,
        super._();

  @override
  final String idempotencyId;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final MessageInput message;
  final List<XFile> _attachments;
  @override
  @JsonKey()
  List<XFile> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'SendState(idempotencyId: $idempotencyId, status: $status, message: $message, attachments: $attachments, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendStateImpl &&
            (identical(other.idempotencyId, idempotencyId) ||
                other.idempotencyId == idempotencyId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idempotencyId, status, message,
      const DeepCollectionEquality().hash(_attachments), isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendStateImplCopyWith<_$SendStateImpl> get copyWith =>
      __$$SendStateImplCopyWithImpl<_$SendStateImpl>(this, _$identity);
}

abstract class _SendState extends SendState {
  const factory _SendState(final String idempotencyId,
      [final FormzSubmissionStatus status,
      final MessageInput message,
      final List<XFile> attachments,
      final bool isValid]) = _$SendStateImpl;
  const _SendState._() : super._();

  @override
  String get idempotencyId;
  @override
  FormzSubmissionStatus get status;
  @override
  MessageInput get message;
  @override
  List<XFile> get attachments;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$SendStateImplCopyWith<_$SendStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
