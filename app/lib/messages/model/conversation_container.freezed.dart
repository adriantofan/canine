// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversationContainer {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationInfo conversationInfo)
        withConversation,
    required TResult Function(User user) withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConversationInfo conversationInfo)? withConversation,
    TResult? Function(User user)? withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationInfo conversationInfo)? withConversation,
    TResult Function(User user)? withUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationContainerWithConversation value)
        withConversation,
    required TResult Function(ConversationContainerWithUser value) withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult? Function(ConversationContainerWithUser value)? withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult Function(ConversationContainerWithUser value)? withUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationContainerCopyWith<$Res> {
  factory $ConversationContainerCopyWith(ConversationContainer value,
          $Res Function(ConversationContainer) then) =
      _$ConversationContainerCopyWithImpl<$Res, ConversationContainer>;
}

/// @nodoc
class _$ConversationContainerCopyWithImpl<$Res,
        $Val extends ConversationContainer>
    implements $ConversationContainerCopyWith<$Res> {
  _$ConversationContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ConversationContainerWithConversationImplCopyWith<$Res> {
  factory _$$ConversationContainerWithConversationImplCopyWith(
          _$ConversationContainerWithConversationImpl value,
          $Res Function(_$ConversationContainerWithConversationImpl) then) =
      __$$ConversationContainerWithConversationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConversationInfo conversationInfo});
}

/// @nodoc
class __$$ConversationContainerWithConversationImplCopyWithImpl<$Res>
    extends _$ConversationContainerCopyWithImpl<$Res,
        _$ConversationContainerWithConversationImpl>
    implements _$$ConversationContainerWithConversationImplCopyWith<$Res> {
  __$$ConversationContainerWithConversationImplCopyWithImpl(
      _$ConversationContainerWithConversationImpl _value,
      $Res Function(_$ConversationContainerWithConversationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationInfo = null,
  }) {
    return _then(_$ConversationContainerWithConversationImpl(
      conversationInfo: null == conversationInfo
          ? _value.conversationInfo
          : conversationInfo // ignore: cast_nullable_to_non_nullable
              as ConversationInfo,
    ));
  }
}

/// @nodoc

class _$ConversationContainerWithConversationImpl
    implements ConversationContainerWithConversation {
  const _$ConversationContainerWithConversationImpl(
      {required this.conversationInfo});

  @override
  final ConversationInfo conversationInfo;

  @override
  String toString() {
    return 'ConversationContainer.withConversation(conversationInfo: $conversationInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationContainerWithConversationImpl &&
            (identical(other.conversationInfo, conversationInfo) ||
                other.conversationInfo == conversationInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, conversationInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationContainerWithConversationImplCopyWith<
          _$ConversationContainerWithConversationImpl>
      get copyWith => __$$ConversationContainerWithConversationImplCopyWithImpl<
          _$ConversationContainerWithConversationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationInfo conversationInfo)
        withConversation,
    required TResult Function(User user) withUser,
  }) {
    return withConversation(conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConversationInfo conversationInfo)? withConversation,
    TResult? Function(User user)? withUser,
  }) {
    return withConversation?.call(conversationInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationInfo conversationInfo)? withConversation,
    TResult Function(User user)? withUser,
    required TResult orElse(),
  }) {
    if (withConversation != null) {
      return withConversation(conversationInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationContainerWithConversation value)
        withConversation,
    required TResult Function(ConversationContainerWithUser value) withUser,
  }) {
    return withConversation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult? Function(ConversationContainerWithUser value)? withUser,
  }) {
    return withConversation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult Function(ConversationContainerWithUser value)? withUser,
    required TResult orElse(),
  }) {
    if (withConversation != null) {
      return withConversation(this);
    }
    return orElse();
  }
}

abstract class ConversationContainerWithConversation
    implements ConversationContainer {
  const factory ConversationContainerWithConversation(
          {required final ConversationInfo conversationInfo}) =
      _$ConversationContainerWithConversationImpl;

  ConversationInfo get conversationInfo;
  @JsonKey(ignore: true)
  _$$ConversationContainerWithConversationImplCopyWith<
          _$ConversationContainerWithConversationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConversationContainerWithUserImplCopyWith<$Res> {
  factory _$$ConversationContainerWithUserImplCopyWith(
          _$ConversationContainerWithUserImpl value,
          $Res Function(_$ConversationContainerWithUserImpl) then) =
      __$$ConversationContainerWithUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ConversationContainerWithUserImplCopyWithImpl<$Res>
    extends _$ConversationContainerCopyWithImpl<$Res,
        _$ConversationContainerWithUserImpl>
    implements _$$ConversationContainerWithUserImplCopyWith<$Res> {
  __$$ConversationContainerWithUserImplCopyWithImpl(
      _$ConversationContainerWithUserImpl _value,
      $Res Function(_$ConversationContainerWithUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ConversationContainerWithUserImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ConversationContainerWithUserImpl
    implements ConversationContainerWithUser {
  const _$ConversationContainerWithUserImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'ConversationContainer.withUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationContainerWithUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationContainerWithUserImplCopyWith<
          _$ConversationContainerWithUserImpl>
      get copyWith => __$$ConversationContainerWithUserImplCopyWithImpl<
          _$ConversationContainerWithUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ConversationInfo conversationInfo)
        withConversation,
    required TResult Function(User user) withUser,
  }) {
    return withUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ConversationInfo conversationInfo)? withConversation,
    TResult? Function(User user)? withUser,
  }) {
    return withUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ConversationInfo conversationInfo)? withConversation,
    TResult Function(User user)? withUser,
    required TResult orElse(),
  }) {
    if (withUser != null) {
      return withUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversationContainerWithConversation value)
        withConversation,
    required TResult Function(ConversationContainerWithUser value) withUser,
  }) {
    return withUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult? Function(ConversationContainerWithUser value)? withUser,
  }) {
    return withUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversationContainerWithConversation value)?
        withConversation,
    TResult Function(ConversationContainerWithUser value)? withUser,
    required TResult orElse(),
  }) {
    if (withUser != null) {
      return withUser(this);
    }
    return orElse();
  }
}

abstract class ConversationContainerWithUser implements ConversationContainer {
  const factory ConversationContainerWithUser({required final User user}) =
      _$ConversationContainerWithUserImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$ConversationContainerWithUserImplCopyWith<
          _$ConversationContainerWithUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}
