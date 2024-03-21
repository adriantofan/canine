// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewMessage {
  String get text => throw _privateConstructorUsedError;
  XFile? get attachment => throw _privateConstructorUsedError;
  String get idempotencyId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewMessageCopyWith<NewMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMessageCopyWith<$Res> {
  factory $NewMessageCopyWith(
          NewMessage value, $Res Function(NewMessage) then) =
      _$NewMessageCopyWithImpl<$Res, NewMessage>;
  @useResult
  $Res call({String text, XFile? attachment, String idempotencyId});
}

/// @nodoc
class _$NewMessageCopyWithImpl<$Res, $Val extends NewMessage>
    implements $NewMessageCopyWith<$Res> {
  _$NewMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? attachment = freezed,
    Object? idempotencyId = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile?,
      idempotencyId: null == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewMessageImplCopyWith<$Res>
    implements $NewMessageCopyWith<$Res> {
  factory _$$NewMessageImplCopyWith(
          _$NewMessageImpl value, $Res Function(_$NewMessageImpl) then) =
      __$$NewMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, XFile? attachment, String idempotencyId});
}

/// @nodoc
class __$$NewMessageImplCopyWithImpl<$Res>
    extends _$NewMessageCopyWithImpl<$Res, _$NewMessageImpl>
    implements _$$NewMessageImplCopyWith<$Res> {
  __$$NewMessageImplCopyWithImpl(
      _$NewMessageImpl _value, $Res Function(_$NewMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? attachment = freezed,
    Object? idempotencyId = null,
  }) {
    return _then(_$NewMessageImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as XFile?,
      idempotencyId: null == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewMessageImpl implements _NewMessage {
  const _$NewMessageImpl(
      {required this.text,
      required this.attachment,
      required this.idempotencyId});

  @override
  final String text;
  @override
  final XFile? attachment;
  @override
  final String idempotencyId;

  @override
  String toString() {
    return 'NewMessage(text: $text, attachment: $attachment, idempotencyId: $idempotencyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewMessageImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.idempotencyId, idempotencyId) ||
                other.idempotencyId == idempotencyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, attachment, idempotencyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewMessageImplCopyWith<_$NewMessageImpl> get copyWith =>
      __$$NewMessageImplCopyWithImpl<_$NewMessageImpl>(this, _$identity);
}

abstract class _NewMessage implements NewMessage {
  const factory _NewMessage(
      {required final String text,
      required final XFile? attachment,
      required final String idempotencyId}) = _$NewMessageImpl;

  @override
  String get text;
  @override
  XFile? get attachment;
  @override
  String get idempotencyId;
  @override
  @JsonKey(ignore: true)
  _$$NewMessageImplCopyWith<_$NewMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
