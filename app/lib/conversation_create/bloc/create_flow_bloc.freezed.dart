// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_flow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateFlowEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFlowEventCopyWith<$Res> {
  factory $CreateFlowEventCopyWith(
          CreateFlowEvent value, $Res Function(CreateFlowEvent) then) =
      _$CreateFlowEventCopyWithImpl<$Res, CreateFlowEvent>;
}

/// @nodoc
class _$CreateFlowEventCopyWithImpl<$Res, $Val extends CreateFlowEvent>
    implements $CreateFlowEventCopyWith<$Res> {
  _$CreateFlowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateFlowEventDidSelectUserImplCopyWith<$Res> {
  factory _$$CreateFlowEventDidSelectUserImplCopyWith(
          _$CreateFlowEventDidSelectUserImpl value,
          $Res Function(_$CreateFlowEventDidSelectUserImpl) then) =
      __$$CreateFlowEventDidSelectUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CreateFlowEventDidSelectUserImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res,
        _$CreateFlowEventDidSelectUserImpl>
    implements _$$CreateFlowEventDidSelectUserImplCopyWith<$Res> {
  __$$CreateFlowEventDidSelectUserImplCopyWithImpl(
      _$CreateFlowEventDidSelectUserImpl _value,
      $Res Function(_$CreateFlowEventDidSelectUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$CreateFlowEventDidSelectUserImpl(
      null == user
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

class _$CreateFlowEventDidSelectUserImpl
    implements CreateFlowEventDidSelectUser {
  const _$CreateFlowEventDidSelectUserImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'CreateFlowEvent.didSelectUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventDidSelectUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowEventDidSelectUserImplCopyWith<
          _$CreateFlowEventDidSelectUserImpl>
      get copyWith => __$$CreateFlowEventDidSelectUserImplCopyWithImpl<
          _$CreateFlowEventDidSelectUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return didSelectUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return didSelectUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (didSelectUser != null) {
      return didSelectUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return didSelectUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return didSelectUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (didSelectUser != null) {
      return didSelectUser(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventDidSelectUser implements CreateFlowEvent {
  const factory CreateFlowEventDidSelectUser(final User user) =
      _$CreateFlowEventDidSelectUserImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$CreateFlowEventDidSelectUserImplCopyWith<
          _$CreateFlowEventDidSelectUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowEventFilePressedImplCopyWith<$Res> {
  factory _$$CreateFlowEventFilePressedImplCopyWith(
          _$CreateFlowEventFilePressedImpl value,
          $Res Function(_$CreateFlowEventFilePressedImpl) then) =
      __$$CreateFlowEventFilePressedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventFilePressedImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res,
        _$CreateFlowEventFilePressedImpl>
    implements _$$CreateFlowEventFilePressedImplCopyWith<$Res> {
  __$$CreateFlowEventFilePressedImplCopyWithImpl(
      _$CreateFlowEventFilePressedImpl _value,
      $Res Function(_$CreateFlowEventFilePressedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventFilePressedImpl implements CreateFlowEventFilePressed {
  const _$CreateFlowEventFilePressedImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.filePressed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventFilePressedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return filePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return filePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (filePressed != null) {
      return filePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return filePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return filePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (filePressed != null) {
      return filePressed(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventFilePressed implements CreateFlowEvent {
  const factory CreateFlowEventFilePressed() = _$CreateFlowEventFilePressedImpl;
}

/// @nodoc
abstract class _$$CreateFlowEventDevisUploadedImplCopyWith<$Res> {
  factory _$$CreateFlowEventDevisUploadedImplCopyWith(
          _$CreateFlowEventDevisUploadedImpl value,
          $Res Function(_$CreateFlowEventDevisUploadedImpl) then) =
      __$$CreateFlowEventDevisUploadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventDevisUploadedImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res,
        _$CreateFlowEventDevisUploadedImpl>
    implements _$$CreateFlowEventDevisUploadedImplCopyWith<$Res> {
  __$$CreateFlowEventDevisUploadedImplCopyWithImpl(
      _$CreateFlowEventDevisUploadedImpl _value,
      $Res Function(_$CreateFlowEventDevisUploadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventDevisUploadedImpl
    implements CreateFlowEventDevisUploaded {
  const _$CreateFlowEventDevisUploadedImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.devisUploaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventDevisUploadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return devisUploaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return devisUploaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (devisUploaded != null) {
      return devisUploaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return devisUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return devisUploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (devisUploaded != null) {
      return devisUploaded(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventDevisUploaded implements CreateFlowEvent {
  const factory CreateFlowEventDevisUploaded() =
      _$CreateFlowEventDevisUploadedImpl;
}

/// @nodoc
abstract class _$$CreateFlowEventUserCreatedImplCopyWith<$Res> {
  factory _$$CreateFlowEventUserCreatedImplCopyWith(
          _$CreateFlowEventUserCreatedImpl value,
          $Res Function(_$CreateFlowEventUserCreatedImpl) then) =
      __$$CreateFlowEventUserCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventUserCreatedImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res,
        _$CreateFlowEventUserCreatedImpl>
    implements _$$CreateFlowEventUserCreatedImplCopyWith<$Res> {
  __$$CreateFlowEventUserCreatedImplCopyWithImpl(
      _$CreateFlowEventUserCreatedImpl _value,
      $Res Function(_$CreateFlowEventUserCreatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventUserCreatedImpl implements CreateFlowEventUserCreated {
  const _$CreateFlowEventUserCreatedImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.userCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventUserCreatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return userCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return userCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return userCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return userCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventUserCreated implements CreateFlowEvent {
  const factory CreateFlowEventUserCreated() = _$CreateFlowEventUserCreatedImpl;
}

/// @nodoc
abstract class _$$CreateFlowEventCreateFlowdImplCopyWith<$Res> {
  factory _$$CreateFlowEventCreateFlowdImplCopyWith(
          _$CreateFlowEventCreateFlowdImpl value,
          $Res Function(_$CreateFlowEventCreateFlowdImpl) then) =
      __$$CreateFlowEventCreateFlowdImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventCreateFlowdImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res,
        _$CreateFlowEventCreateFlowdImpl>
    implements _$$CreateFlowEventCreateFlowdImplCopyWith<$Res> {
  __$$CreateFlowEventCreateFlowdImplCopyWithImpl(
      _$CreateFlowEventCreateFlowdImpl _value,
      $Res Function(_$CreateFlowEventCreateFlowdImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventCreateFlowdImpl implements CreateFlowEventCreateFlowd {
  const _$CreateFlowEventCreateFlowdImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.CreateFlowd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventCreateFlowdImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return CreateFlowd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return CreateFlowd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (CreateFlowd != null) {
      return CreateFlowd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return CreateFlowd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return CreateFlowd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (CreateFlowd != null) {
      return CreateFlowd(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventCreateFlowd implements CreateFlowEvent {
  const factory CreateFlowEventCreateFlowd() = _$CreateFlowEventCreateFlowdImpl;
}

/// @nodoc
abstract class _$$CreateFlowEventCancelStepImplCopyWith<$Res> {
  factory _$$CreateFlowEventCancelStepImplCopyWith(
          _$CreateFlowEventCancelStepImpl value,
          $Res Function(_$CreateFlowEventCancelStepImpl) then) =
      __$$CreateFlowEventCancelStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventCancelStepImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res, _$CreateFlowEventCancelStepImpl>
    implements _$$CreateFlowEventCancelStepImplCopyWith<$Res> {
  __$$CreateFlowEventCancelStepImplCopyWithImpl(
      _$CreateFlowEventCancelStepImpl _value,
      $Res Function(_$CreateFlowEventCancelStepImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventCancelStepImpl implements CreateFlowEventCancelStep {
  const _$CreateFlowEventCancelStepImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.cancelStep()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventCancelStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return cancelStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return cancelStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (cancelStep != null) {
      return cancelStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return cancelStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return cancelStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancelStep != null) {
      return cancelStep(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventCancelStep implements CreateFlowEvent {
  const factory CreateFlowEventCancelStep() = _$CreateFlowEventCancelStepImpl;
}

/// @nodoc
abstract class _$$CreateFlowEventCancelImplCopyWith<$Res> {
  factory _$$CreateFlowEventCancelImplCopyWith(
          _$CreateFlowEventCancelImpl value,
          $Res Function(_$CreateFlowEventCancelImpl) then) =
      __$$CreateFlowEventCancelImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventCancelImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res, _$CreateFlowEventCancelImpl>
    implements _$$CreateFlowEventCancelImplCopyWith<$Res> {
  __$$CreateFlowEventCancelImplCopyWithImpl(_$CreateFlowEventCancelImpl _value,
      $Res Function(_$CreateFlowEventCancelImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventCancelImpl implements CreateFlowEventCancel {
  const _$CreateFlowEventCancelImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.cancel()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventCancelImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function() devisUploaded,
    required TResult Function() userCreated,
    required TResult Function() CreateFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function()? devisUploaded,
    TResult? Function()? userCreated,
    TResult? Function()? CreateFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function()? devisUploaded,
    TResult Function()? userCreated,
    TResult Function()? CreateFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) CreateFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? CreateFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventCancel implements CreateFlowEvent {
  const factory CreateFlowEventCancel() = _$CreateFlowEventCancelImpl;
}

/// @nodoc
mixin _$CreateFlowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFlowStateCopyWith<$Res> {
  factory $CreateFlowStateCopyWith(
          CreateFlowState value, $Res Function(CreateFlowState) then) =
      _$CreateFlowStateCopyWithImpl<$Res, CreateFlowState>;
}

/// @nodoc
class _$CreateFlowStateCopyWithImpl<$Res, $Val extends CreateFlowState>
    implements $CreateFlowStateCopyWith<$Res> {
  _$CreateFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateFlowStateNothingSelectedImplCopyWith<$Res> {
  factory _$$CreateFlowStateNothingSelectedImplCopyWith(
          _$CreateFlowStateNothingSelectedImpl value,
          $Res Function(_$CreateFlowStateNothingSelectedImpl) then) =
      __$$CreateFlowStateNothingSelectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowStateNothingSelectedImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowStateNothingSelectedImpl>
    implements _$$CreateFlowStateNothingSelectedImplCopyWith<$Res> {
  __$$CreateFlowStateNothingSelectedImplCopyWithImpl(
      _$CreateFlowStateNothingSelectedImpl _value,
      $Res Function(_$CreateFlowStateNothingSelectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowStateNothingSelectedImpl
    implements CreateFlowStateNothingSelected {
  const _$CreateFlowStateNothingSelectedImpl();

  @override
  String toString() {
    return 'CreateFlowState.nothingSelected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateNothingSelectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) {
    return nothingSelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) {
    return nothingSelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (nothingSelected != null) {
      return nothingSelected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) {
    return nothingSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) {
    return nothingSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (nothingSelected != null) {
      return nothingSelected(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateNothingSelected implements CreateFlowState {
  const factory CreateFlowStateNothingSelected() =
      _$CreateFlowStateNothingSelectedImpl;
}

/// @nodoc
abstract class _$$CreateFlowStateCreatingWithUserImplCopyWith<$Res> {
  factory _$$CreateFlowStateCreatingWithUserImplCopyWith(
          _$CreateFlowStateCreatingWithUserImpl value,
          $Res Function(_$CreateFlowStateCreatingWithUserImpl) then) =
      __$$CreateFlowStateCreatingWithUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CreateFlowStateCreatingWithUserImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowStateCreatingWithUserImpl>
    implements _$$CreateFlowStateCreatingWithUserImplCopyWith<$Res> {
  __$$CreateFlowStateCreatingWithUserImplCopyWithImpl(
      _$CreateFlowStateCreatingWithUserImpl _value,
      $Res Function(_$CreateFlowStateCreatingWithUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$CreateFlowStateCreatingWithUserImpl(
      null == user
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

class _$CreateFlowStateCreatingWithUserImpl
    implements CreateFlowStateCreatingWithUser {
  const _$CreateFlowStateCreatingWithUserImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'CreateFlowState.creatingWithUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateCreatingWithUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowStateCreatingWithUserImplCopyWith<
          _$CreateFlowStateCreatingWithUserImpl>
      get copyWith => __$$CreateFlowStateCreatingWithUserImplCopyWithImpl<
          _$CreateFlowStateCreatingWithUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) {
    return creatingWithUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) {
    return creatingWithUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (creatingWithUser != null) {
      return creatingWithUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) {
    return creatingWithUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) {
    return creatingWithUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (creatingWithUser != null) {
      return creatingWithUser(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateCreatingWithUser implements CreateFlowState {
  const factory CreateFlowStateCreatingWithUser(final User user) =
      _$CreateFlowStateCreatingWithUserImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$CreateFlowStateCreatingWithUserImplCopyWith<
          _$CreateFlowStateCreatingWithUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowStateUploadDevisImplCopyWith<$Res> {
  factory _$$CreateFlowStateUploadDevisImplCopyWith(
          _$CreateFlowStateUploadDevisImpl value,
          $Res Function(_$CreateFlowStateUploadDevisImpl) then) =
      __$$CreateFlowStateUploadDevisImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowStateUploadDevisImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowStateUploadDevisImpl>
    implements _$$CreateFlowStateUploadDevisImplCopyWith<$Res> {
  __$$CreateFlowStateUploadDevisImplCopyWithImpl(
      _$CreateFlowStateUploadDevisImpl _value,
      $Res Function(_$CreateFlowStateUploadDevisImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowStateUploadDevisImpl implements CreateFlowStateUploadDevis {
  const _$CreateFlowStateUploadDevisImpl();

  @override
  String toString() {
    return 'CreateFlowState.uploadDevis()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateUploadDevisImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) {
    return uploadDevis();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) {
    return uploadDevis?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (uploadDevis != null) {
      return uploadDevis();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) {
    return uploadDevis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) {
    return uploadDevis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (uploadDevis != null) {
      return uploadDevis(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateUploadDevis implements CreateFlowState {
  const factory CreateFlowStateUploadDevis() = _$CreateFlowStateUploadDevisImpl;
}

/// @nodoc
abstract class _$$CreateFlowStateCreateDevisUserImplCopyWith<$Res> {
  factory _$$CreateFlowStateCreateDevisUserImplCopyWith(
          _$CreateFlowStateCreateDevisUserImpl value,
          $Res Function(_$CreateFlowStateCreateDevisUserImpl) then) =
      __$$CreateFlowStateCreateDevisUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowStateCreateDevisUserImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowStateCreateDevisUserImpl>
    implements _$$CreateFlowStateCreateDevisUserImplCopyWith<$Res> {
  __$$CreateFlowStateCreateDevisUserImplCopyWithImpl(
      _$CreateFlowStateCreateDevisUserImpl _value,
      $Res Function(_$CreateFlowStateCreateDevisUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowStateCreateDevisUserImpl
    implements CreateFlowStateCreateDevisUser {
  const _$CreateFlowStateCreateDevisUserImpl();

  @override
  String toString() {
    return 'CreateFlowState.createDevisUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateCreateDevisUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) {
    return createDevisUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) {
    return createDevisUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (createDevisUser != null) {
      return createDevisUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) {
    return createDevisUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) {
    return createDevisUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (createDevisUser != null) {
      return createDevisUser(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateCreateDevisUser implements CreateFlowState {
  const factory CreateFlowStateCreateDevisUser() =
      _$CreateFlowStateCreateDevisUserImpl;
}

/// @nodoc
abstract class _$$CreateFlowStateCreatingWithDevisImplCopyWith<$Res> {
  factory _$$CreateFlowStateCreatingWithDevisImplCopyWith(
          _$CreateFlowStateCreatingWithDevisImpl value,
          $Res Function(_$CreateFlowStateCreatingWithDevisImpl) then) =
      __$$CreateFlowStateCreatingWithDevisImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowStateCreatingWithDevisImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowStateCreatingWithDevisImpl>
    implements _$$CreateFlowStateCreatingWithDevisImplCopyWith<$Res> {
  __$$CreateFlowStateCreatingWithDevisImplCopyWithImpl(
      _$CreateFlowStateCreatingWithDevisImpl _value,
      $Res Function(_$CreateFlowStateCreatingWithDevisImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowStateCreatingWithDevisImpl
    implements CreateFlowStateCreatingWithDevis {
  const _$CreateFlowStateCreatingWithDevisImpl();

  @override
  String toString() {
    return 'CreateFlowState.creatingWithDevis()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateCreatingWithDevisImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(User user) creatingWithUser,
    required TResult Function() uploadDevis,
    required TResult Function() createDevisUser,
    required TResult Function() creatingWithDevis,
  }) {
    return creatingWithDevis();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(User user)? creatingWithUser,
    TResult? Function()? uploadDevis,
    TResult? Function()? createDevisUser,
    TResult? Function()? creatingWithDevis,
  }) {
    return creatingWithDevis?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(User user)? creatingWithUser,
    TResult Function()? uploadDevis,
    TResult Function()? createDevisUser,
    TResult Function()? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (creatingWithDevis != null) {
      return creatingWithDevis();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateCreatingWithUser value)
        creatingWithUser,
    required TResult Function(CreateFlowStateUploadDevis value) uploadDevis,
    required TResult Function(CreateFlowStateCreateDevisUser value)
        createDevisUser,
    required TResult Function(CreateFlowStateCreatingWithDevis value)
        creatingWithDevis,
  }) {
    return creatingWithDevis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult? Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult? Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult? Function(CreateFlowStateCreatingWithDevis value)?
        creatingWithDevis,
  }) {
    return creatingWithDevis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateCreatingWithUser value)? creatingWithUser,
    TResult Function(CreateFlowStateUploadDevis value)? uploadDevis,
    TResult Function(CreateFlowStateCreateDevisUser value)? createDevisUser,
    TResult Function(CreateFlowStateCreatingWithDevis value)? creatingWithDevis,
    required TResult orElse(),
  }) {
    if (creatingWithDevis != null) {
      return creatingWithDevis(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateCreatingWithDevis implements CreateFlowState {
  const factory CreateFlowStateCreatingWithDevis() =
      _$CreateFlowStateCreatingWithDevisImpl;
}
