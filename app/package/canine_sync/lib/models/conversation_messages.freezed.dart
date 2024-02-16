// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConversationMessages _$ConversationMessagesFromJson(Map<String, dynamic> json) {
  return _ConversationMessages.fromJson(json);
}

/// @nodoc
mixin _$ConversationMessages {
  int get conversationId => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationMessagesCopyWith<ConversationMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationMessagesCopyWith<$Res> {
  factory $ConversationMessagesCopyWith(ConversationMessages value,
          $Res Function(ConversationMessages) then) =
      _$ConversationMessagesCopyWithImpl<$Res, ConversationMessages>;
  @useResult
  $Res call({int conversationId, List<Message> messages});
}

/// @nodoc
class _$ConversationMessagesCopyWithImpl<$Res,
        $Val extends ConversationMessages>
    implements $ConversationMessagesCopyWith<$Res> {
  _$ConversationMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationMessagesImplCopyWith<$Res>
    implements $ConversationMessagesCopyWith<$Res> {
  factory _$$ConversationMessagesImplCopyWith(_$ConversationMessagesImpl value,
          $Res Function(_$ConversationMessagesImpl) then) =
      __$$ConversationMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int conversationId, List<Message> messages});
}

/// @nodoc
class __$$ConversationMessagesImplCopyWithImpl<$Res>
    extends _$ConversationMessagesCopyWithImpl<$Res, _$ConversationMessagesImpl>
    implements _$$ConversationMessagesImplCopyWith<$Res> {
  __$$ConversationMessagesImplCopyWithImpl(_$ConversationMessagesImpl _value,
      $Res Function(_$ConversationMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? messages = null,
  }) {
    return _then(_$ConversationMessagesImpl(
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationMessagesImpl implements _ConversationMessages {
  const _$ConversationMessagesImpl(
      {required this.conversationId, required final List<Message> messages})
      : _messages = messages;

  factory _$ConversationMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationMessagesImplFromJson(json);

  @override
  final int conversationId;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ConversationMessages(conversationId: $conversationId, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationMessagesImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, conversationId,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationMessagesImplCopyWith<_$ConversationMessagesImpl>
      get copyWith =>
          __$$ConversationMessagesImplCopyWithImpl<_$ConversationMessagesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationMessagesImplToJson(
      this,
    );
  }
}

abstract class _ConversationMessages implements ConversationMessages {
  const factory _ConversationMessages(
      {required final int conversationId,
      required final List<Message> messages}) = _$ConversationMessagesImpl;

  factory _ConversationMessages.fromJson(Map<String, dynamic> json) =
      _$ConversationMessagesImpl.fromJson;

  @override
  int get conversationId;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$ConversationMessagesImplCopyWith<_$ConversationMessagesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
