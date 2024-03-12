// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'updates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Update {
  ListUpdate<Object> get update => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListUpdate<Conversation> update) conversations,
    required TResult Function(int conversationId, ListUpdate<Message> update)
        messages,
    required TResult Function(ListUpdate<User> update) users,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListUpdate<Conversation> update)? conversations,
    TResult? Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult? Function(ListUpdate<User> update)? users,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListUpdate<Conversation> update)? conversations,
    TResult Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult Function(ListUpdate<User> update)? users,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsUpdate value) conversations,
    required TResult Function(MessagesUpdate value) messages,
    required TResult Function(UsersUpdate value) users,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsUpdate value)? conversations,
    TResult? Function(MessagesUpdate value)? messages,
    TResult? Function(UsersUpdate value)? users,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsUpdate value)? conversations,
    TResult Function(MessagesUpdate value)? messages,
    TResult Function(UsersUpdate value)? users,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCopyWith<$Res> {
  factory $UpdateCopyWith(Update value, $Res Function(Update) then) =
      _$UpdateCopyWithImpl<$Res, Update>;
}

/// @nodoc
class _$UpdateCopyWithImpl<$Res, $Val extends Update>
    implements $UpdateCopyWith<$Res> {
  _$UpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConversationsUpdateImplCopyWith<$Res> {
  factory _$$ConversationsUpdateImplCopyWith(_$ConversationsUpdateImpl value,
          $Res Function(_$ConversationsUpdateImpl) then) =
      __$$ConversationsUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListUpdate<Conversation> update});
}

/// @nodoc
class __$$ConversationsUpdateImplCopyWithImpl<$Res>
    extends _$UpdateCopyWithImpl<$Res, _$ConversationsUpdateImpl>
    implements _$$ConversationsUpdateImplCopyWith<$Res> {
  __$$ConversationsUpdateImplCopyWithImpl(_$ConversationsUpdateImpl _value,
      $Res Function(_$ConversationsUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update = null,
  }) {
    return _then(_$ConversationsUpdateImpl(
      null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as ListUpdate<Conversation>,
    ));
  }
}

/// @nodoc

class _$ConversationsUpdateImpl implements ConversationsUpdate {
  const _$ConversationsUpdateImpl(this.update);

  @override
  final ListUpdate<Conversation> update;

  @override
  String toString() {
    return 'Update.conversations(update: $update)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationsUpdateImpl &&
            (identical(other.update, update) || other.update == update));
  }

  @override
  int get hashCode => Object.hash(runtimeType, update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationsUpdateImplCopyWith<_$ConversationsUpdateImpl> get copyWith =>
      __$$ConversationsUpdateImplCopyWithImpl<_$ConversationsUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListUpdate<Conversation> update) conversations,
    required TResult Function(int conversationId, ListUpdate<Message> update)
        messages,
    required TResult Function(ListUpdate<User> update) users,
  }) {
    return conversations(update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListUpdate<Conversation> update)? conversations,
    TResult? Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult? Function(ListUpdate<User> update)? users,
  }) {
    return conversations?.call(update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListUpdate<Conversation> update)? conversations,
    TResult Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult Function(ListUpdate<User> update)? users,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsUpdate value) conversations,
    required TResult Function(MessagesUpdate value) messages,
    required TResult Function(UsersUpdate value) users,
  }) {
    return conversations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsUpdate value)? conversations,
    TResult? Function(MessagesUpdate value)? messages,
    TResult? Function(UsersUpdate value)? users,
  }) {
    return conversations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsUpdate value)? conversations,
    TResult Function(MessagesUpdate value)? messages,
    TResult Function(UsersUpdate value)? users,
    required TResult orElse(),
  }) {
    if (conversations != null) {
      return conversations(this);
    }
    return orElse();
  }
}

abstract class ConversationsUpdate implements Update {
  const factory ConversationsUpdate(final ListUpdate<Conversation> update) =
      _$ConversationsUpdateImpl;

  @override
  ListUpdate<Conversation> get update;
  @JsonKey(ignore: true)
  _$$ConversationsUpdateImplCopyWith<_$ConversationsUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessagesUpdateImplCopyWith<$Res> {
  factory _$$MessagesUpdateImplCopyWith(_$MessagesUpdateImpl value,
          $Res Function(_$MessagesUpdateImpl) then) =
      __$$MessagesUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int conversationId, ListUpdate<Message> update});
}

/// @nodoc
class __$$MessagesUpdateImplCopyWithImpl<$Res>
    extends _$UpdateCopyWithImpl<$Res, _$MessagesUpdateImpl>
    implements _$$MessagesUpdateImplCopyWith<$Res> {
  __$$MessagesUpdateImplCopyWithImpl(
      _$MessagesUpdateImpl _value, $Res Function(_$MessagesUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? update = null,
  }) {
    return _then(_$MessagesUpdateImpl(
      null == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as ListUpdate<Message>,
    ));
  }
}

/// @nodoc

class _$MessagesUpdateImpl implements MessagesUpdate {
  const _$MessagesUpdateImpl(this.conversationId, this.update);

  @override
  final int conversationId;
  @override
  final ListUpdate<Message> update;

  @override
  String toString() {
    return 'Update.messages(conversationId: $conversationId, update: $update)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesUpdateImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.update, update) || other.update == update));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationId, update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesUpdateImplCopyWith<_$MessagesUpdateImpl> get copyWith =>
      __$$MessagesUpdateImplCopyWithImpl<_$MessagesUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListUpdate<Conversation> update) conversations,
    required TResult Function(int conversationId, ListUpdate<Message> update)
        messages,
    required TResult Function(ListUpdate<User> update) users,
  }) {
    return messages(conversationId, update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListUpdate<Conversation> update)? conversations,
    TResult? Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult? Function(ListUpdate<User> update)? users,
  }) {
    return messages?.call(conversationId, update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListUpdate<Conversation> update)? conversations,
    TResult Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult Function(ListUpdate<User> update)? users,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(conversationId, update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsUpdate value) conversations,
    required TResult Function(MessagesUpdate value) messages,
    required TResult Function(UsersUpdate value) users,
  }) {
    return messages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsUpdate value)? conversations,
    TResult? Function(MessagesUpdate value)? messages,
    TResult? Function(UsersUpdate value)? users,
  }) {
    return messages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsUpdate value)? conversations,
    TResult Function(MessagesUpdate value)? messages,
    TResult Function(UsersUpdate value)? users,
    required TResult orElse(),
  }) {
    if (messages != null) {
      return messages(this);
    }
    return orElse();
  }
}

abstract class MessagesUpdate implements Update {
  const factory MessagesUpdate(
          final int conversationId, final ListUpdate<Message> update) =
      _$MessagesUpdateImpl;

  int get conversationId;
  @override
  ListUpdate<Message> get update;
  @JsonKey(ignore: true)
  _$$MessagesUpdateImplCopyWith<_$MessagesUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UsersUpdateImplCopyWith<$Res> {
  factory _$$UsersUpdateImplCopyWith(
          _$UsersUpdateImpl value, $Res Function(_$UsersUpdateImpl) then) =
      __$$UsersUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListUpdate<User> update});
}

/// @nodoc
class __$$UsersUpdateImplCopyWithImpl<$Res>
    extends _$UpdateCopyWithImpl<$Res, _$UsersUpdateImpl>
    implements _$$UsersUpdateImplCopyWith<$Res> {
  __$$UsersUpdateImplCopyWithImpl(
      _$UsersUpdateImpl _value, $Res Function(_$UsersUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? update = null,
  }) {
    return _then(_$UsersUpdateImpl(
      null == update
          ? _value.update
          : update // ignore: cast_nullable_to_non_nullable
              as ListUpdate<User>,
    ));
  }
}

/// @nodoc

class _$UsersUpdateImpl implements UsersUpdate {
  const _$UsersUpdateImpl(this.update);

  @override
  final ListUpdate<User> update;

  @override
  String toString() {
    return 'Update.users(update: $update)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersUpdateImpl &&
            (identical(other.update, update) || other.update == update));
  }

  @override
  int get hashCode => Object.hash(runtimeType, update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersUpdateImplCopyWith<_$UsersUpdateImpl> get copyWith =>
      __$$UsersUpdateImplCopyWithImpl<_$UsersUpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ListUpdate<Conversation> update) conversations,
    required TResult Function(int conversationId, ListUpdate<Message> update)
        messages,
    required TResult Function(ListUpdate<User> update) users,
  }) {
    return users(update);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ListUpdate<Conversation> update)? conversations,
    TResult? Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult? Function(ListUpdate<User> update)? users,
  }) {
    return users?.call(update);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ListUpdate<Conversation> update)? conversations,
    TResult Function(int conversationId, ListUpdate<Message> update)? messages,
    TResult Function(ListUpdate<User> update)? users,
    required TResult orElse(),
  }) {
    if (users != null) {
      return users(update);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationsUpdate value) conversations,
    required TResult Function(MessagesUpdate value) messages,
    required TResult Function(UsersUpdate value) users,
  }) {
    return users(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationsUpdate value)? conversations,
    TResult? Function(MessagesUpdate value)? messages,
    TResult? Function(UsersUpdate value)? users,
  }) {
    return users?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationsUpdate value)? conversations,
    TResult Function(MessagesUpdate value)? messages,
    TResult Function(UsersUpdate value)? users,
    required TResult orElse(),
  }) {
    if (users != null) {
      return users(this);
    }
    return orElse();
  }
}

abstract class UsersUpdate implements Update {
  const factory UsersUpdate(final ListUpdate<User> update) = _$UsersUpdateImpl;

  @override
  ListUpdate<User> get update;
  @JsonKey(ignore: true)
  _$$UsersUpdateImplCopyWith<_$UsersUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
