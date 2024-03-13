// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_server_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIServerUpdate _$APIServerUpdateFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'Default':
      return APIServerUpdateInvalid.fromJson(json);
    case 'user':
      return APIServerUpdateUsers.fromJson(json);
    case 'message':
      return APIServerUpdateMessage.fromJson(json);
    case 'conversation':
      return APIServerUpdateConversation.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'APIServerUpdate',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$APIServerUpdate {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)
        users,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)
        message,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)
        conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value) $default, {
    required TResult Function(APIServerUpdateUsers value) users,
    required TResult Function(APIServerUpdateMessage value) message,
    required TResult Function(APIServerUpdateConversation value) conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerUpdateInvalid value)? $default, {
    TResult? Function(APIServerUpdateUsers value)? users,
    TResult? Function(APIServerUpdateMessage value)? message,
    TResult? Function(APIServerUpdateConversation value)? conversations,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value)? $default, {
    TResult Function(APIServerUpdateUsers value)? users,
    TResult Function(APIServerUpdateMessage value)? message,
    TResult Function(APIServerUpdateConversation value)? conversations,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIServerUpdateCopyWith<$Res> {
  factory $APIServerUpdateCopyWith(
          APIServerUpdate value, $Res Function(APIServerUpdate) then) =
      _$APIServerUpdateCopyWithImpl<$Res, APIServerUpdate>;
}

/// @nodoc
class _$APIServerUpdateCopyWithImpl<$Res, $Val extends APIServerUpdate>
    implements $APIServerUpdateCopyWith<$Res> {
  _$APIServerUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$APIServerUpdateInvalidImplCopyWith<$Res> {
  factory _$$APIServerUpdateInvalidImplCopyWith(
          _$APIServerUpdateInvalidImpl value,
          $Res Function(_$APIServerUpdateInvalidImpl) then) =
      __$$APIServerUpdateInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$APIServerUpdateInvalidImplCopyWithImpl<$Res>
    extends _$APIServerUpdateCopyWithImpl<$Res, _$APIServerUpdateInvalidImpl>
    implements _$$APIServerUpdateInvalidImplCopyWith<$Res> {
  __$$APIServerUpdateInvalidImplCopyWithImpl(
      _$APIServerUpdateInvalidImpl _value,
      $Res Function(_$APIServerUpdateInvalidImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$APIServerUpdateInvalidImpl implements APIServerUpdateInvalid {
  const _$APIServerUpdateInvalidImpl({final String? $type})
      : $type = $type ?? 'Default';

  factory _$APIServerUpdateInvalidImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIServerUpdateInvalidImplFromJson(json);

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'APIServerUpdate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerUpdateInvalidImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)
        users,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)
        message,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)
        conversations,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
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
    TResult Function(APIServerUpdateInvalid value) $default, {
    required TResult Function(APIServerUpdateUsers value) users,
    required TResult Function(APIServerUpdateMessage value) message,
    required TResult Function(APIServerUpdateConversation value) conversations,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerUpdateInvalid value)? $default, {
    TResult? Function(APIServerUpdateUsers value)? users,
    TResult? Function(APIServerUpdateMessage value)? message,
    TResult? Function(APIServerUpdateConversation value)? conversations,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value)? $default, {
    TResult Function(APIServerUpdateUsers value)? users,
    TResult Function(APIServerUpdateMessage value)? message,
    TResult Function(APIServerUpdateConversation value)? conversations,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerUpdateInvalidImplToJson(
      this,
    );
  }
}

abstract class APIServerUpdateInvalid implements APIServerUpdate {
  const factory APIServerUpdateInvalid() = _$APIServerUpdateInvalidImpl;

  factory APIServerUpdateInvalid.fromJson(Map<String, dynamic> json) =
      _$APIServerUpdateInvalidImpl.fromJson;
}

/// @nodoc
abstract class _$$APIServerUpdateUsersImplCopyWith<$Res> {
  factory _$$APIServerUpdateUsersImplCopyWith(_$APIServerUpdateUsersImpl value,
          $Res Function(_$APIServerUpdateUsersImpl) then) =
      __$$APIServerUpdateUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@APIServerUpdateKindConverter() APIServerUpdateKind kind,
      List<User> data});
}

/// @nodoc
class __$$APIServerUpdateUsersImplCopyWithImpl<$Res>
    extends _$APIServerUpdateCopyWithImpl<$Res, _$APIServerUpdateUsersImpl>
    implements _$$APIServerUpdateUsersImplCopyWith<$Res> {
  __$$APIServerUpdateUsersImplCopyWithImpl(_$APIServerUpdateUsersImpl _value,
      $Res Function(_$APIServerUpdateUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? data = null,
  }) {
    return _then(_$APIServerUpdateUsersImpl(
      null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as APIServerUpdateKind,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIServerUpdateUsersImpl implements APIServerUpdateUsers {
  const _$APIServerUpdateUsersImpl(
      @APIServerUpdateKindConverter() this.kind, final List<User> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'user';

  factory _$APIServerUpdateUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIServerUpdateUsersImplFromJson(json);

  @override
  @APIServerUpdateKindConverter()
  final APIServerUpdateKind kind;
  final List<User> _data;
  @override
  List<User> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'APIServerUpdate.users(kind: $kind, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerUpdateUsersImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIServerUpdateUsersImplCopyWith<_$APIServerUpdateUsersImpl>
      get copyWith =>
          __$$APIServerUpdateUsersImplCopyWithImpl<_$APIServerUpdateUsersImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)
        users,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)
        message,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)
        conversations,
  }) {
    return users(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
  }) {
    return users?.call(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
    required TResult orElse(),
  }) {
    if (users != null) {
      return users(kind, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value) $default, {
    required TResult Function(APIServerUpdateUsers value) users,
    required TResult Function(APIServerUpdateMessage value) message,
    required TResult Function(APIServerUpdateConversation value) conversations,
  }) {
    return users(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerUpdateInvalid value)? $default, {
    TResult? Function(APIServerUpdateUsers value)? users,
    TResult? Function(APIServerUpdateMessage value)? message,
    TResult? Function(APIServerUpdateConversation value)? conversations,
  }) {
    return users?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value)? $default, {
    TResult Function(APIServerUpdateUsers value)? users,
    TResult Function(APIServerUpdateMessage value)? message,
    TResult Function(APIServerUpdateConversation value)? conversations,
    required TResult orElse(),
  }) {
    if (users != null) {
      return users(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerUpdateUsersImplToJson(
      this,
    );
  }
}

abstract class APIServerUpdateUsers implements APIServerUpdate {
  const factory APIServerUpdateUsers(
      @APIServerUpdateKindConverter() final APIServerUpdateKind kind,
      final List<User> data) = _$APIServerUpdateUsersImpl;

  factory APIServerUpdateUsers.fromJson(Map<String, dynamic> json) =
      _$APIServerUpdateUsersImpl.fromJson;

  @APIServerUpdateKindConverter()
  APIServerUpdateKind get kind;
  List<User> get data;
  @JsonKey(ignore: true)
  _$$APIServerUpdateUsersImplCopyWith<_$APIServerUpdateUsersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIServerUpdateMessageImplCopyWith<$Res> {
  factory _$$APIServerUpdateMessageImplCopyWith(
          _$APIServerUpdateMessageImpl value,
          $Res Function(_$APIServerUpdateMessageImpl) then) =
      __$$APIServerUpdateMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@APIServerUpdateKindConverter() APIServerUpdateKind kind, Message data});

  $MessageCopyWith<$Res> get data;
}

/// @nodoc
class __$$APIServerUpdateMessageImplCopyWithImpl<$Res>
    extends _$APIServerUpdateCopyWithImpl<$Res, _$APIServerUpdateMessageImpl>
    implements _$$APIServerUpdateMessageImplCopyWith<$Res> {
  __$$APIServerUpdateMessageImplCopyWithImpl(
      _$APIServerUpdateMessageImpl _value,
      $Res Function(_$APIServerUpdateMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? data = null,
  }) {
    return _then(_$APIServerUpdateMessageImpl(
      null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as APIServerUpdateKind,
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Message,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get data {
    return $MessageCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$APIServerUpdateMessageImpl implements APIServerUpdateMessage {
  const _$APIServerUpdateMessageImpl(
      @APIServerUpdateKindConverter() this.kind, this.data,
      {final String? $type})
      : $type = $type ?? 'message';

  factory _$APIServerUpdateMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$APIServerUpdateMessageImplFromJson(json);

  @override
  @APIServerUpdateKindConverter()
  final APIServerUpdateKind kind;
  @override
  final Message data;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'APIServerUpdate.message(kind: $kind, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerUpdateMessageImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, kind, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIServerUpdateMessageImplCopyWith<_$APIServerUpdateMessageImpl>
      get copyWith => __$$APIServerUpdateMessageImplCopyWithImpl<
          _$APIServerUpdateMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)
        users,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)
        message,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)
        conversations,
  }) {
    return message(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
  }) {
    return message?.call(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(kind, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value) $default, {
    required TResult Function(APIServerUpdateUsers value) users,
    required TResult Function(APIServerUpdateMessage value) message,
    required TResult Function(APIServerUpdateConversation value) conversations,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerUpdateInvalid value)? $default, {
    TResult? Function(APIServerUpdateUsers value)? users,
    TResult? Function(APIServerUpdateMessage value)? message,
    TResult? Function(APIServerUpdateConversation value)? conversations,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value)? $default, {
    TResult Function(APIServerUpdateUsers value)? users,
    TResult Function(APIServerUpdateMessage value)? message,
    TResult Function(APIServerUpdateConversation value)? conversations,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerUpdateMessageImplToJson(
      this,
    );
  }
}

abstract class APIServerUpdateMessage implements APIServerUpdate {
  const factory APIServerUpdateMessage(
      @APIServerUpdateKindConverter() final APIServerUpdateKind kind,
      final Message data) = _$APIServerUpdateMessageImpl;

  factory APIServerUpdateMessage.fromJson(Map<String, dynamic> json) =
      _$APIServerUpdateMessageImpl.fromJson;

  @APIServerUpdateKindConverter()
  APIServerUpdateKind get kind;
  Message get data;
  @JsonKey(ignore: true)
  _$$APIServerUpdateMessageImplCopyWith<_$APIServerUpdateMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIServerUpdateConversationImplCopyWith<$Res> {
  factory _$$APIServerUpdateConversationImplCopyWith(
          _$APIServerUpdateConversationImpl value,
          $Res Function(_$APIServerUpdateConversationImpl) then) =
      __$$APIServerUpdateConversationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {@APIServerUpdateKindConverter() APIServerUpdateKind kind,
      List<Conversation> data});
}

/// @nodoc
class __$$APIServerUpdateConversationImplCopyWithImpl<$Res>
    extends _$APIServerUpdateCopyWithImpl<$Res,
        _$APIServerUpdateConversationImpl>
    implements _$$APIServerUpdateConversationImplCopyWith<$Res> {
  __$$APIServerUpdateConversationImplCopyWithImpl(
      _$APIServerUpdateConversationImpl _value,
      $Res Function(_$APIServerUpdateConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? data = null,
  }) {
    return _then(_$APIServerUpdateConversationImpl(
      null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as APIServerUpdateKind,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Conversation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$APIServerUpdateConversationImpl implements APIServerUpdateConversation {
  const _$APIServerUpdateConversationImpl(
      @APIServerUpdateKindConverter() this.kind, final List<Conversation> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'conversation';

  factory _$APIServerUpdateConversationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$APIServerUpdateConversationImplFromJson(json);

  @override
  @APIServerUpdateKindConverter()
  final APIServerUpdateKind kind;
  final List<Conversation> _data;
  @override
  List<Conversation> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'APIServerUpdate.conversations(kind: $kind, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIServerUpdateConversationImpl &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, kind, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$APIServerUpdateConversationImplCopyWith<_$APIServerUpdateConversationImpl>
      get copyWith => __$$APIServerUpdateConversationImplCopyWithImpl<
          _$APIServerUpdateConversationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)
        users,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)
        message,
    required TResult Function(
            @APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)
        conversations,
  }) {
    return conversations(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult? Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
  }) {
    return conversations?.call(kind, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<User> data)?
        users,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            Message data)?
        message,
    TResult Function(@APIServerUpdateKindConverter() APIServerUpdateKind kind,
            List<Conversation> data)?
        conversations,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(kind, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value) $default, {
    required TResult Function(APIServerUpdateUsers value) users,
    required TResult Function(APIServerUpdateMessage value) message,
    required TResult Function(APIServerUpdateConversation value) conversations,
  }) {
    return conversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(APIServerUpdateInvalid value)? $default, {
    TResult? Function(APIServerUpdateUsers value)? users,
    TResult? Function(APIServerUpdateMessage value)? message,
    TResult? Function(APIServerUpdateConversation value)? conversations,
  }) {
    return conversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(APIServerUpdateInvalid value)? $default, {
    TResult Function(APIServerUpdateUsers value)? users,
    TResult Function(APIServerUpdateMessage value)? message,
    TResult Function(APIServerUpdateConversation value)? conversations,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$APIServerUpdateConversationImplToJson(
      this,
    );
  }
}

abstract class APIServerUpdateConversation implements APIServerUpdate {
  const factory APIServerUpdateConversation(
      @APIServerUpdateKindConverter() final APIServerUpdateKind kind,
      final List<Conversation> data) = _$APIServerUpdateConversationImpl;

  factory APIServerUpdateConversation.fromJson(Map<String, dynamic> json) =
      _$APIServerUpdateConversationImpl.fromJson;

  @APIServerUpdateKindConverter()
  APIServerUpdateKind get kind;
  List<Conversation> get data;
  @JsonKey(ignore: true)
  _$$APIServerUpdateConversationImplCopyWith<_$APIServerUpdateConversationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
