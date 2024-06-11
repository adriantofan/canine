// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DraftConversation {
  User get user => throw _privateConstructorUsedError;
  DraftMessage get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DraftConversationCopyWith<DraftConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DraftConversationCopyWith<$Res> {
  factory $DraftConversationCopyWith(
          DraftConversation value, $Res Function(DraftConversation) then) =
      _$DraftConversationCopyWithImpl<$Res, DraftConversation>;
  @useResult
  $Res call({User user, DraftMessage message});

  $DraftMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$DraftConversationCopyWithImpl<$Res, $Val extends DraftConversation>
    implements $DraftConversationCopyWith<$Res> {
  _$DraftConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as DraftMessage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DraftMessageCopyWith<$Res> get message {
    return $DraftMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewConversationImplCopyWith<$Res>
    implements $DraftConversationCopyWith<$Res> {
  factory _$$NewConversationImplCopyWith(_$NewConversationImpl value,
          $Res Function(_$NewConversationImpl) then) =
      __$$NewConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, DraftMessage message});

  @override
  $DraftMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$NewConversationImplCopyWithImpl<$Res>
    extends _$DraftConversationCopyWithImpl<$Res, _$NewConversationImpl>
    implements _$$NewConversationImplCopyWith<$Res> {
  __$$NewConversationImplCopyWithImpl(
      _$NewConversationImpl _value, $Res Function(_$NewConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? message = null,
  }) {
    return _then(_$NewConversationImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as DraftMessage,
    ));
  }
}

/// @nodoc

class _$NewConversationImpl implements _NewConversation {
  const _$NewConversationImpl({required this.user, required this.message});

  @override
  final User user;
  @override
  final DraftMessage message;

  @override
  String toString() {
    return 'DraftConversation(user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewConversationImpl &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(user), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewConversationImplCopyWith<_$NewConversationImpl> get copyWith =>
      __$$NewConversationImplCopyWithImpl<_$NewConversationImpl>(
          this, _$identity);
}

abstract class _NewConversation implements DraftConversation {
  const factory _NewConversation(
      {required final User user,
      required final DraftMessage message}) = _$NewConversationImpl;

  @override
  User get user;
  @override
  DraftMessage get message;
  @override
  @JsonKey(ignore: true)
  _$$NewConversationImplCopyWith<_$NewConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
