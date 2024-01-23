// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServerMessage _$ServerMessageFromJson(Map<String, dynamic> json) {
  switch (json['kind']) {
    case 'Default':
      return ServerMessageInvalid.fromJson(json);
    case 'messages':
      return ServerMessageMessages.fromJson(json);
    case 'conversations':
      return ServerMessageConversations.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'kind', 'ServerMessage',
          'Invalid union type "${json['kind']}"!');
  }
}

/// @nodoc
mixin _$ServerMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value) $default, {
    required TResult Function(ServerMessageMessages value) messages,
    required TResult Function(ServerMessageConversations value) conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ServerMessageInvalid value)? $default, {
    TResult? Function(ServerMessageMessages value)? messages,
    TResult? Function(ServerMessageConversations value)? conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value)? $default, {
    TResult Function(ServerMessageMessages value)? messages,
    TResult Function(ServerMessageConversations value)? conversations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerMessageCopyWith<$Res> {
  factory $ServerMessageCopyWith(
          ServerMessage value, $Res Function(ServerMessage) then) =
      _$ServerMessageCopyWithImpl<$Res, ServerMessage>;
}

/// @nodoc
class _$ServerMessageCopyWithImpl<$Res, $Val extends ServerMessage>
    implements $ServerMessageCopyWith<$Res> {
  _$ServerMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerMessageInvalidImplCopyWith<$Res> {
  factory _$$ServerMessageInvalidImplCopyWith(_$ServerMessageInvalidImpl value,
          $Res Function(_$ServerMessageInvalidImpl) then) =
      __$$ServerMessageInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerMessageInvalidImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$ServerMessageInvalidImpl>
    implements _$$ServerMessageInvalidImplCopyWith<$Res> {
  __$$ServerMessageInvalidImplCopyWithImpl(_$ServerMessageInvalidImpl _value,
      $Res Function(_$ServerMessageInvalidImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ServerMessageInvalidImpl
    with DiagnosticableTreeMixin
    implements ServerMessageInvalid {
  const _$ServerMessageInvalidImpl({final String? $type})
      : $type = $type ?? 'Default';

  factory _$ServerMessageInvalidImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerMessageInvalidImplFromJson(json);

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerMessage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ServerMessage'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerMessageInvalidImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value) $default, {
    required TResult Function(ServerMessageMessages value) messages,
    required TResult Function(ServerMessageConversations value) conversations,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ServerMessageInvalid value)? $default, {
    TResult? Function(ServerMessageMessages value)? messages,
    TResult? Function(ServerMessageConversations value)? conversations,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value)? $default, {
    TResult Function(ServerMessageMessages value)? messages,
    TResult Function(ServerMessageConversations value)? conversations,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerMessageInvalidImplToJson(
      this,
    );
  }
}

abstract class ServerMessageInvalid implements ServerMessage {
  const factory ServerMessageInvalid() = _$ServerMessageInvalidImpl;

  factory ServerMessageInvalid.fromJson(Map<String, dynamic> json) =
      _$ServerMessageInvalidImpl.fromJson;
}

/// @nodoc
abstract class _$$ServerMessageMessagesImplCopyWith<$Res> {
  factory _$$ServerMessageMessagesImplCopyWith(
          _$ServerMessageMessagesImpl value,
          $Res Function(_$ServerMessageMessagesImpl) then) =
      __$$ServerMessageMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> data});
}

/// @nodoc
class __$$ServerMessageMessagesImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$ServerMessageMessagesImpl>
    implements _$$ServerMessageMessagesImplCopyWith<$Res> {
  __$$ServerMessageMessagesImplCopyWithImpl(_$ServerMessageMessagesImpl _value,
      $Res Function(_$ServerMessageMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ServerMessageMessagesImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerMessageMessagesImpl
    with DiagnosticableTreeMixin
    implements ServerMessageMessages {
  const _$ServerMessageMessagesImpl(final List<Message> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'messages';

  factory _$ServerMessageMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerMessageMessagesImplFromJson(json);

  final List<Message> _data;
  @override
  List<Message> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerMessage.messages(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerMessage.messages'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerMessageMessagesImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerMessageMessagesImplCopyWith<_$ServerMessageMessagesImpl>
      get copyWith => __$$ServerMessageMessagesImplCopyWithImpl<
          _$ServerMessageMessagesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
  }) {
    return messages(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
  }) {
    return messages?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value) $default, {
    required TResult Function(ServerMessageMessages value) messages,
    required TResult Function(ServerMessageConversations value) conversations,
  }) {
    return messages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ServerMessageInvalid value)? $default, {
    TResult? Function(ServerMessageMessages value)? messages,
    TResult? Function(ServerMessageConversations value)? conversations,
  }) {
    return messages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value)? $default, {
    TResult Function(ServerMessageMessages value)? messages,
    TResult Function(ServerMessageConversations value)? conversations,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerMessageMessagesImplToJson(
      this,
    );
  }
}

abstract class ServerMessageMessages implements ServerMessage {
  const factory ServerMessageMessages(final List<Message> data) =
      _$ServerMessageMessagesImpl;

  factory ServerMessageMessages.fromJson(Map<String, dynamic> json) =
      _$ServerMessageMessagesImpl.fromJson;

  List<Message> get data;
  @JsonKey(ignore: true)
  _$$ServerMessageMessagesImplCopyWith<_$ServerMessageMessagesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerMessageConversationsImplCopyWith<$Res> {
  factory _$$ServerMessageConversationsImplCopyWith(
          _$ServerMessageConversationsImpl value,
          $Res Function(_$ServerMessageConversationsImpl) then) =
      __$$ServerMessageConversationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Conversation> data});
}

/// @nodoc
class __$$ServerMessageConversationsImplCopyWithImpl<$Res>
    extends _$ServerMessageCopyWithImpl<$Res, _$ServerMessageConversationsImpl>
    implements _$$ServerMessageConversationsImplCopyWith<$Res> {
  __$$ServerMessageConversationsImplCopyWithImpl(
      _$ServerMessageConversationsImpl _value,
      $Res Function(_$ServerMessageConversationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ServerMessageConversationsImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerMessageConversationsImpl
    with DiagnosticableTreeMixin
    implements ServerMessageConversations {
  const _$ServerMessageConversationsImpl(final List<Conversation> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'conversations';

  factory _$ServerMessageConversationsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServerMessageConversationsImplFromJson(json);

  final List<Conversation> _data;
  @override
  List<Conversation> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServerMessage.conversations(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServerMessage.conversations'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerMessageConversationsImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerMessageConversationsImplCopyWith<_$ServerMessageConversationsImpl>
      get copyWith => __$$ServerMessageConversationsImplCopyWithImpl<
          _$ServerMessageConversationsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
  }) {
    return conversations(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
  }) {
    return conversations?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value) $default, {
    required TResult Function(ServerMessageMessages value) messages,
    required TResult Function(ServerMessageConversations value) conversations,
  }) {
    return conversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ServerMessageInvalid value)? $default, {
    TResult? Function(ServerMessageMessages value)? messages,
    TResult? Function(ServerMessageConversations value)? conversations,
  }) {
    return conversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerMessageInvalid value)? $default, {
    TResult Function(ServerMessageMessages value)? messages,
    TResult Function(ServerMessageConversations value)? conversations,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerMessageConversationsImplToJson(
      this,
    );
  }
}

abstract class ServerMessageConversations implements ServerMessage {
  const factory ServerMessageConversations(final List<Conversation> data) =
      _$ServerMessageConversationsImpl;

  factory ServerMessageConversations.fromJson(Map<String, dynamic> json) =
      _$ServerMessageConversationsImpl.fromJson;

  List<Conversation> get data;
  @JsonKey(ignore: true)
  _$$ServerMessageConversationsImplCopyWith<_$ServerMessageConversationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  int get id => throw _privateConstructorUsedError;
  int get conversationId => throw _privateConstructorUsedError;
  int get senderId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {int id,
      int conversationId,
      int senderId,
      String message,
      String type,
      int createdAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? message = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int conversationId,
      int senderId,
      String message,
      String type,
      int createdAt});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? conversationId = null,
    Object? senderId = null,
    Object? message = null,
    Object? type = null,
    Object? createdAt = null,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      conversationId: null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl with DiagnosticableTreeMixin implements _Message {
  const _$MessageImpl(
      {required this.id,
      required this.conversationId,
      required this.senderId,
      required this.message,
      required this.type,
      required this.createdAt});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final int id;
  @override
  final int conversationId;
  @override
  final int senderId;
  @override
  final String message;
  @override
  final String type;
  @override
  final int createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Message(id: $id, conversationId: $conversationId, senderId: $senderId, message: $message, type: $type, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Message'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('conversationId', conversationId))
      ..add(DiagnosticsProperty('senderId', senderId))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, conversationId, senderId, message, type, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final int id,
      required final int conversationId,
      required final int senderId,
      required final String message,
      required final String type,
      required final int createdAt}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  int get id;
  @override
  int get conversationId;
  @override
  int get senderId;
  @override
  String get message;
  @override
  String get type;
  @override
  int get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
mixin _$Conversation {
  int get id => throw _privateConstructorUsedError;
  int get externalUserId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res, Conversation>;
  @useResult
  $Res call(
      {int id, int externalUserId, String name, int createdAt, int updatedAt});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res, $Val extends Conversation>
    implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalUserId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      externalUserId: null == externalUserId
          ? _value.externalUserId
          : externalUserId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationImplCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$$ConversationImplCopyWith(
          _$ConversationImpl value, $Res Function(_$ConversationImpl) then) =
      __$$ConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int externalUserId, String name, int createdAt, int updatedAt});
}

/// @nodoc
class __$$ConversationImplCopyWithImpl<$Res>
    extends _$ConversationCopyWithImpl<$Res, _$ConversationImpl>
    implements _$$ConversationImplCopyWith<$Res> {
  __$$ConversationImplCopyWithImpl(
      _$ConversationImpl _value, $Res Function(_$ConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? externalUserId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ConversationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      externalUserId: null == externalUserId
          ? _value.externalUserId
          : externalUserId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationImpl with DiagnosticableTreeMixin implements _Conversation {
  const _$ConversationImpl(
      {required this.id,
      required this.externalUserId,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  factory _$ConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationImplFromJson(json);

  @override
  final int id;
  @override
  final int externalUserId;
  @override
  final String name;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Conversation(id: $id, externalUserId: $externalUserId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Conversation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('externalUserId', externalUserId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.externalUserId, externalUserId) ||
                other.externalUserId == externalUserId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, externalUserId, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      __$$ConversationImplCopyWithImpl<_$ConversationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationImplToJson(
      this,
    );
  }
}

abstract class _Conversation implements Conversation {
  const factory _Conversation(
      {required final int id,
      required final int externalUserId,
      required final String name,
      required final int createdAt,
      required final int updatedAt}) = _$ConversationImpl;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$ConversationImpl.fromJson;

  @override
  int get id;
  @override
  int get externalUserId;
  @override
  String get name;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ConversationImplCopyWith<_$ConversationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get messagingAddress => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String messagingAddress,
      String type,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messagingAddress = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      messagingAddress: null == messagingAddress
          ? _value.messagingAddress
          : messagingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String messagingAddress,
      String type,
      int createdAt,
      int updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messagingAddress = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      messagingAddress: null == messagingAddress
          ? _value.messagingAddress
          : messagingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  const _$UserImpl(
      {required this.id,
      required this.messagingAddress,
      required this.type,
      required this.createdAt,
      required this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String messagingAddress;
  @override
  final String type;
  @override
  final int createdAt;
  @override
  final int updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, messagingAddress: $messagingAddress, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('messagingAddress', messagingAddress))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messagingAddress, messagingAddress) ||
                other.messagingAddress == messagingAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, messagingAddress, type, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String messagingAddress,
      required final String type,
      required final int createdAt,
      required final int updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get messagingAddress;
  @override
  String get type;
  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
