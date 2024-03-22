// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraftMessage {
  String? get text => throw _privateConstructorUsedError;
  List<XFile> get attachment => throw _privateConstructorUsedError;
  String? get idempotencyId =>
      throw _privateConstructorUsedError; // Internal for SendBloc
  bool get sending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DraftMessageCopyWith<DraftMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftMessageCopyWith<$Res> {
  factory $DraftMessageCopyWith(
          DraftMessage value, $Res Function(DraftMessage) then) =
      _$DraftMessageCopyWithImpl<$Res, DraftMessage>;
  @useResult
  $Res call(
      {String? text,
      List<XFile> attachment,
      String? idempotencyId,
      bool sending});
}

/// @nodoc
class _$DraftMessageCopyWithImpl<$Res, $Val extends DraftMessage>
    implements $DraftMessageCopyWith<$Res> {
  _$DraftMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? attachment = null,
    Object? idempotencyId = freezed,
    Object? sending = null,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      idempotencyId: freezed == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String?,
      sending: null == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DraftMessageImplCopyWith<$Res>
    implements $DraftMessageCopyWith<$Res> {
  factory _$$DraftMessageImplCopyWith(
          _$DraftMessageImpl value, $Res Function(_$DraftMessageImpl) then) =
      __$$DraftMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? text,
      List<XFile> attachment,
      String? idempotencyId,
      bool sending});
}

/// @nodoc
class __$$DraftMessageImplCopyWithImpl<$Res>
    extends _$DraftMessageCopyWithImpl<$Res, _$DraftMessageImpl>
    implements _$$DraftMessageImplCopyWith<$Res> {
  __$$DraftMessageImplCopyWithImpl(
      _$DraftMessageImpl _value, $Res Function(_$DraftMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? attachment = null,
    Object? idempotencyId = freezed,
    Object? sending = null,
  }) {
    return _then(_$DraftMessageImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: null == attachment
          ? _value._attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      idempotencyId: freezed == idempotencyId
          ? _value.idempotencyId
          : idempotencyId // ignore: cast_nullable_to_non_nullable
              as String?,
      sending: null == sending
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DraftMessageImpl implements _DraftMessage {
  const _$DraftMessageImpl(
      {this.text,
      final List<XFile> attachment = const [],
      this.idempotencyId,
      this.sending = false})
      : _attachment = attachment;

  @override
  final String? text;
  final List<XFile> _attachment;
  @override
  @JsonKey()
  List<XFile> get attachment {
    if (_attachment is EqualUnmodifiableListView) return _attachment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachment);
  }

  @override
  final String? idempotencyId;
// Internal for SendBloc
  @override
  @JsonKey()
  final bool sending;

  @override
  String toString() {
    return 'DraftMessage(text: $text, attachment: $attachment, idempotencyId: $idempotencyId, sending: $sending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DraftMessageImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._attachment, _attachment) &&
            (identical(other.idempotencyId, idempotencyId) ||
                other.idempotencyId == idempotencyId) &&
            (identical(other.sending, sending) || other.sending == sending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text,
      const DeepCollectionEquality().hash(_attachment), idempotencyId, sending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DraftMessageImplCopyWith<_$DraftMessageImpl> get copyWith =>
      __$$DraftMessageImplCopyWithImpl<_$DraftMessageImpl>(this, _$identity);
}

abstract class _DraftMessage implements DraftMessage {
  const factory _DraftMessage(
      {final String? text,
      final List<XFile> attachment,
      final String? idempotencyId,
      final bool sending}) = _$DraftMessageImpl;

  @override
  String? get text;
  @override
  List<XFile> get attachment;
  @override
  String? get idempotencyId;
  @override // Internal for SendBloc
  bool get sending;
  @override
  @JsonKey(ignore: true)
  _$$DraftMessageImplCopyWith<_$DraftMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
