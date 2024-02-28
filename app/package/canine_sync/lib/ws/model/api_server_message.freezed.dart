// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_server_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIServerMessage _$APIServerMessageFromJson(Map<String, dynamic> json) {
  switch (json['kind']) {
    case 'Default':
      return APIServerMessageInvalid.fromJson(json);
    case 'messages':
      return APIServerMessageMessages.fromJson(json);
    case 'conversations':
      return APIServerMessageConversations.fromJson(json);
    case 'syncCompleted':
      return APIServerMessageSyncCompleted.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'kind', 'APIServerMessage',
          'Invalid union type "${json['kind']}"!');
  }
}

/// @nodoc
mixin _$APIServerMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
    required TResult Function() syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
    TResult? Function()? syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value) $default, {
    required TResult Function(APIServerMessageMessages value) messages,
    required TResult Function(APIServerMessageConversations value)
        conversations,
    required TResult Function(APIServerMessageSyncCompleted value)
        syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerMessageInvalid value)? $default, {
    TResult? Function(APIServerMessageMessages value)? messages,
    TResult? Function(APIServerMessageConversations value)? conversations,
    TResult? Function(APIServerMessageSyncCompleted value)? syncCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value)? $default, {
    TResult Function(APIServerMessageMessages value)? messages,
    TResult Function(APIServerMessageConversations value)? conversations,
    TResult Function(APIServerMessageSyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIServerMessageCopyWith<$Res> {
  factory $APIServerMessageCopyWith(
          APIServerMessage value, $Res Function(APIServerMessage) then) =
      _$APIServerMessageCopyWithImpl<$Res, APIServerMessage>;
}

/// @nodoc
class _$APIServerMessageCopyWithImpl<$Res, $Val extends APIServerMessage>
    implements $APIServerMessageCopyWith<$Res> {
  _$APIServerMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$APIServerMessageInvalidImplCopyWith<$Res> {
  factory _$$APIServerMessageInvalidImplCopyWith(
          _$APIServerMessageInvalidImpl value,
          $Res Function(_$APIServerMessageInvalidImpl) then) =
      __$$APIServerMessageInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$APIServerMessageInvalidImplCopyWithImpl<$Res>
    extends _$APIServerMessageCopyWithImpl<$Res, _$APIServerMessageInvalidImpl>
    implements _$$APIServerMessageInvalidImplCopyWith<$Res> {
  __$$APIServerMessageInvalidImplCopyWithImpl(
      _$APIServerMessageInvalidImpl _value,
      $Res Function(_$APIServerMessageInvalidImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$APIServerMessageInvalidImpl implements APIServerMessageInvalid {
  const _$APIServerMessageInvalidImpl({final String? $type})
      : $type = $type ?? 'Default';

  factory _$APIServerMessageInvalidImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIServerMessageInvalidImplFromJson(json);

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString() {
    return 'APIServerMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerMessageInvalidImpl);
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
    required TResult Function() syncCompleted,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
    TResult? Function()? syncCompleted,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    TResult Function()? syncCompleted,
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
    TResult Function(APIServerMessageInvalid value) $default, {
    required TResult Function(APIServerMessageMessages value) messages,
    required TResult Function(APIServerMessageConversations value)
        conversations,
    required TResult Function(APIServerMessageSyncCompleted value)
        syncCompleted,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerMessageInvalid value)? $default, {
    TResult? Function(APIServerMessageMessages value)? messages,
    TResult? Function(APIServerMessageConversations value)? conversations,
    TResult? Function(APIServerMessageSyncCompleted value)? syncCompleted,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value)? $default, {
    TResult Function(APIServerMessageMessages value)? messages,
    TResult Function(APIServerMessageConversations value)? conversations,
    TResult Function(APIServerMessageSyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerMessageInvalidImplToJson(
      this,
    );
  }
}

abstract class APIServerMessageInvalid implements APIServerMessage {
  const factory APIServerMessageInvalid() = _$APIServerMessageInvalidImpl;

  factory APIServerMessageInvalid.fromJson(Map<String, dynamic> json) =
      _$APIServerMessageInvalidImpl.fromJson;
}

/// @nodoc
abstract class _$$APIServerMessageMessagesImplCopyWith<$Res> {
  factory _$$APIServerMessageMessagesImplCopyWith(
          _$APIServerMessageMessagesImpl value,
          $Res Function(_$APIServerMessageMessagesImpl) then) =
      __$$APIServerMessageMessagesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> data});
}

/// @nodoc
class __$$APIServerMessageMessagesImplCopyWithImpl<$Res>
    extends _$APIServerMessageCopyWithImpl<$Res, _$APIServerMessageMessagesImpl>
    implements _$$APIServerMessageMessagesImplCopyWith<$Res> {
  __$$APIServerMessageMessagesImplCopyWithImpl(
      _$APIServerMessageMessagesImpl _value,
      $Res Function(_$APIServerMessageMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$APIServerMessageMessagesImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIServerMessageMessagesImpl implements APIServerMessageMessages {
  const _$APIServerMessageMessagesImpl(final List<Message> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'messages';

  factory _$APIServerMessageMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIServerMessageMessagesImplFromJson(json);

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
  String toString() {
    return 'APIServerMessage.messages(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerMessageMessagesImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIServerMessageMessagesImplCopyWith<_$APIServerMessageMessagesImpl>
      get copyWith => __$$APIServerMessageMessagesImplCopyWithImpl<
          _$APIServerMessageMessagesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
    required TResult Function() syncCompleted,
  }) {
    return messages(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
    TResult? Function()? syncCompleted,
  }) {
    return messages?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    TResult Function()? syncCompleted,
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
    TResult Function(APIServerMessageInvalid value) $default, {
    required TResult Function(APIServerMessageMessages value) messages,
    required TResult Function(APIServerMessageConversations value)
        conversations,
    required TResult Function(APIServerMessageSyncCompleted value)
        syncCompleted,
  }) {
    return messages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerMessageInvalid value)? $default, {
    TResult? Function(APIServerMessageMessages value)? messages,
    TResult? Function(APIServerMessageConversations value)? conversations,
    TResult? Function(APIServerMessageSyncCompleted value)? syncCompleted,
  }) {
    return messages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value)? $default, {
    TResult Function(APIServerMessageMessages value)? messages,
    TResult Function(APIServerMessageConversations value)? conversations,
    TResult Function(APIServerMessageSyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerMessageMessagesImplToJson(
      this,
    );
  }
}

abstract class APIServerMessageMessages implements APIServerMessage {
  const factory APIServerMessageMessages(final List<Message> data) =
      _$APIServerMessageMessagesImpl;

  factory APIServerMessageMessages.fromJson(Map<String, dynamic> json) =
      _$APIServerMessageMessagesImpl.fromJson;

  List<Message> get data;
  @JsonKey(ignore: true)
  _$$APIServerMessageMessagesImplCopyWith<_$APIServerMessageMessagesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIServerMessageConversationsImplCopyWith<$Res> {
  factory _$$APIServerMessageConversationsImplCopyWith(
          _$APIServerMessageConversationsImpl value,
          $Res Function(_$APIServerMessageConversationsImpl) then) =
      __$$APIServerMessageConversationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Conversation> data});
}

/// @nodoc
class __$$APIServerMessageConversationsImplCopyWithImpl<$Res>
    extends _$APIServerMessageCopyWithImpl<$Res,
        _$APIServerMessageConversationsImpl>
    implements _$$APIServerMessageConversationsImplCopyWith<$Res> {
  __$$APIServerMessageConversationsImplCopyWithImpl(
      _$APIServerMessageConversationsImpl _value,
      $Res Function(_$APIServerMessageConversationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$APIServerMessageConversationsImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIServerMessageConversationsImpl
    implements APIServerMessageConversations {
  const _$APIServerMessageConversationsImpl(final List<Conversation> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'conversations';

  factory _$APIServerMessageConversationsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$APIServerMessageConversationsImplFromJson(json);

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
  String toString() {
    return 'APIServerMessage.conversations(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerMessageConversationsImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIServerMessageConversationsImplCopyWith<
          _$APIServerMessageConversationsImpl>
      get copyWith => __$$APIServerMessageConversationsImplCopyWithImpl<
          _$APIServerMessageConversationsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<Message> data) messages,
    required TResult Function(List<Conversation> data) conversations,
    required TResult Function() syncCompleted,
  }) {
    return conversations(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
    TResult? Function()? syncCompleted,
  }) {
    return conversations?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    TResult Function()? syncCompleted,
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
    TResult Function(APIServerMessageInvalid value) $default, {
    required TResult Function(APIServerMessageMessages value) messages,
    required TResult Function(APIServerMessageConversations value)
        conversations,
    required TResult Function(APIServerMessageSyncCompleted value)
        syncCompleted,
  }) {
    return conversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerMessageInvalid value)? $default, {
    TResult? Function(APIServerMessageMessages value)? messages,
    TResult? Function(APIServerMessageConversations value)? conversations,
    TResult? Function(APIServerMessageSyncCompleted value)? syncCompleted,
  }) {
    return conversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value)? $default, {
    TResult Function(APIServerMessageMessages value)? messages,
    TResult Function(APIServerMessageConversations value)? conversations,
    TResult Function(APIServerMessageSyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerMessageConversationsImplToJson(
      this,
    );
  }
}

abstract class APIServerMessageConversations implements APIServerMessage {
  const factory APIServerMessageConversations(final List<Conversation> data) =
      _$APIServerMessageConversationsImpl;

  factory APIServerMessageConversations.fromJson(Map<String, dynamic> json) =
      _$APIServerMessageConversationsImpl.fromJson;

  List<Conversation> get data;
  @JsonKey(ignore: true)
  _$$APIServerMessageConversationsImplCopyWith<
          _$APIServerMessageConversationsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIServerMessageSyncCompletedImplCopyWith<$Res> {
  factory _$$APIServerMessageSyncCompletedImplCopyWith(
          _$APIServerMessageSyncCompletedImpl value,
          $Res Function(_$APIServerMessageSyncCompletedImpl) then) =
      __$$APIServerMessageSyncCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$APIServerMessageSyncCompletedImplCopyWithImpl<$Res>
    extends _$APIServerMessageCopyWithImpl<$Res,
        _$APIServerMessageSyncCompletedImpl>
    implements _$$APIServerMessageSyncCompletedImplCopyWith<$Res> {
  __$$APIServerMessageSyncCompletedImplCopyWithImpl(
      _$APIServerMessageSyncCompletedImpl _value,
      $Res Function(_$APIServerMessageSyncCompletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$APIServerMessageSyncCompletedImpl
    implements APIServerMessageSyncCompleted {
  const _$APIServerMessageSyncCompletedImpl({final String? $type})
      : $type = $type ?? 'syncCompleted';

  factory _$APIServerMessageSyncCompletedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$APIServerMessageSyncCompletedImplFromJson(json);

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString() {
    return 'APIServerMessage.syncCompleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerMessageSyncCompletedImpl);
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
    required TResult Function() syncCompleted,
  }) {
    return syncCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<Message> data)? messages,
    TResult? Function(List<Conversation> data)? conversations,
    TResult? Function()? syncCompleted,
  }) {
    return syncCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<Message> data)? messages,
    TResult Function(List<Conversation> data)? conversations,
    TResult Function()? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value) $default, {
    required TResult Function(APIServerMessageMessages value) messages,
    required TResult Function(APIServerMessageConversations value)
        conversations,
    required TResult Function(APIServerMessageSyncCompleted value)
        syncCompleted,
  }) {
    return syncCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerMessageInvalid value)? $default, {
    TResult? Function(APIServerMessageMessages value)? messages,
    TResult? Function(APIServerMessageConversations value)? conversations,
    TResult? Function(APIServerMessageSyncCompleted value)? syncCompleted,
  }) {
    return syncCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerMessageInvalid value)? $default, {
    TResult Function(APIServerMessageMessages value)? messages,
    TResult Function(APIServerMessageConversations value)? conversations,
    TResult Function(APIServerMessageSyncCompleted value)? syncCompleted,
    required TResult orElse(),
  }) {
    if (syncCompleted != null) {
      return syncCompleted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerMessageSyncCompletedImplToJson(
      this,
    );
  }
}

abstract class APIServerMessageSyncCompleted implements APIServerMessage {
  const factory APIServerMessageSyncCompleted() =
      _$APIServerMessageSyncCompletedImpl;

  factory APIServerMessageSyncCompleted.fromJson(Map<String, dynamic> json) =
      _$APIServerMessageSyncCompletedImpl.fromJson;
}
