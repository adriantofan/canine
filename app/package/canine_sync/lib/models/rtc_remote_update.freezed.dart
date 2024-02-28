// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rtc_remote_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RTCRemoteUpdate _$RTCRemoteUpdateFromJson(Map<String, dynamic> json) {
  return _RTCRemoteUpdate.fromJson(json);
}

/// @nodoc
mixin _$RTCRemoteUpdate {
  List<Conversation> get conversations => throw _privateConstructorUsedError;
  List<ConversationMessages> get messages => throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  String get syncToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RTCRemoteUpdateCopyWith<RTCRemoteUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RTCRemoteUpdateCopyWith<$Res> {
  factory $RTCRemoteUpdateCopyWith(
          RTCRemoteUpdate value, $Res Function(RTCRemoteUpdate) then) =
      _$RTCRemoteUpdateCopyWithImpl<$Res, RTCRemoteUpdate>;
  @useResult
  $Res call(
      {List<Conversation> conversations,
      List<ConversationMessages> messages,
      List<User> users,
      String syncToken});
}

/// @nodoc
class _$RTCRemoteUpdateCopyWithImpl<$Res, $Val extends RTCRemoteUpdate>
    implements $RTCRemoteUpdateCopyWith<$Res> {
  _$RTCRemoteUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? messages = null,
    Object? users = null,
    Object? syncToken = null,
  }) {
    return _then(_value.copyWith(
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ConversationMessages>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      syncToken: null == syncToken
          ? _value.syncToken
          : syncToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RTCRemoteUpdateImplCopyWith<$Res>
    implements $RTCRemoteUpdateCopyWith<$Res> {
  factory _$$RTCRemoteUpdateImplCopyWith(_$RTCRemoteUpdateImpl value,
          $Res Function(_$RTCRemoteUpdateImpl) then) =
      __$$RTCRemoteUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Conversation> conversations,
      List<ConversationMessages> messages,
      List<User> users,
      String syncToken});
}

/// @nodoc
class __$$RTCRemoteUpdateImplCopyWithImpl<$Res>
    extends _$RTCRemoteUpdateCopyWithImpl<$Res, _$RTCRemoteUpdateImpl>
    implements _$$RTCRemoteUpdateImplCopyWith<$Res> {
  __$$RTCRemoteUpdateImplCopyWithImpl(
      _$RTCRemoteUpdateImpl _value, $Res Function(_$RTCRemoteUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? messages = null,
    Object? users = null,
    Object? syncToken = null,
  }) {
    return _then(_$RTCRemoteUpdateImpl(
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ConversationMessages>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      syncToken: null == syncToken
          ? _value.syncToken
          : syncToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RTCRemoteUpdateImpl implements _RTCRemoteUpdate {
  const _$RTCRemoteUpdateImpl(
      {required final List<Conversation> conversations,
      required final List<ConversationMessages> messages,
      required final List<User> users,
      required this.syncToken})
      : _conversations = conversations,
        _messages = messages,
        _users = users;

  factory _$RTCRemoteUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RTCRemoteUpdateImplFromJson(json);

  final List<Conversation> _conversations;
  @override
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  final List<ConversationMessages> _messages;
  @override
  List<ConversationMessages> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String syncToken;

  @override
  String toString() {
    return 'RTCRemoteUpdate(conversations: $conversations, messages: $messages, users: $users, syncToken: $syncToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RTCRemoteUpdateImpl &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.syncToken, syncToken) ||
                other.syncToken == syncToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_conversations),
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_users),
      syncToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RTCRemoteUpdateImplCopyWith<_$RTCRemoteUpdateImpl> get copyWith =>
      __$$RTCRemoteUpdateImplCopyWithImpl<_$RTCRemoteUpdateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RTCRemoteUpdateImplToJson(
      this,
    );
  }
}

abstract class _RTCRemoteUpdate implements RTCRemoteUpdate {
  const factory _RTCRemoteUpdate(
      {required final List<Conversation> conversations,
      required final List<ConversationMessages> messages,
      required final List<User> users,
      required final String syncToken}) = _$RTCRemoteUpdateImpl;

  factory _RTCRemoteUpdate.fromJson(Map<String, dynamic> json) =
      _$RTCRemoteUpdateImpl.fromJson;

  @override
  List<Conversation> get conversations;
  @override
  List<ConversationMessages> get messages;
  @override
  List<User> get users;
  @override
  String get syncToken;
  @override
  @JsonKey(ignore: true)
  _$$RTCRemoteUpdateImplCopyWith<_$RTCRemoteUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
