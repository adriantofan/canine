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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowEventDidSelectUser value) didSelectUser,
    required TResult Function(CreateFlowEventFilePressed value) filePressed,
    required TResult Function(CreateFlowEventDevisUploaded value) devisUploaded,
    required TResult Function(CreateFlowEventUserCreated value) userCreated,
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return didSelectUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return didSelectUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return filePressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return filePressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
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
  @useResult
  $Res call({XFile file, DevisRecipient recipient});

  $DevisRecipientCopyWith<$Res> get recipient;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? recipient = null,
  }) {
    return _then(_$CreateFlowEventDevisUploadedImpl(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as DevisRecipient,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DevisRecipientCopyWith<$Res> get recipient {
    return $DevisRecipientCopyWith<$Res>(_value.recipient, (value) {
      return _then(_value.copyWith(recipient: value));
    });
  }
}

/// @nodoc

class _$CreateFlowEventDevisUploadedImpl
    implements CreateFlowEventDevisUploaded {
  const _$CreateFlowEventDevisUploadedImpl(this.file, this.recipient);

  @override
  final XFile file;
  @override
  final DevisRecipient recipient;

  @override
  String toString() {
    return 'CreateFlowEvent.devisUploaded(file: $file, recipient: $recipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventDevisUploadedImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, recipient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowEventDevisUploadedImplCopyWith<
          _$CreateFlowEventDevisUploadedImpl>
      get copyWith => __$$CreateFlowEventDevisUploadedImplCopyWithImpl<
          _$CreateFlowEventDevisUploadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return devisUploaded(file, recipient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return devisUploaded?.call(file, recipient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
    required TResult orElse(),
  }) {
    if (devisUploaded != null) {
      return devisUploaded(file, recipient);
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
    required TResult orElse(),
  }) {
    if (devisUploaded != null) {
      return devisUploaded(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventDevisUploaded implements CreateFlowEvent {
  const factory CreateFlowEventDevisUploaded(
          final XFile file, final DevisRecipient recipient) =
      _$CreateFlowEventDevisUploadedImpl;

  XFile get file;
  DevisRecipient get recipient;
  @JsonKey(ignore: true)
  _$$CreateFlowEventDevisUploadedImplCopyWith<
          _$CreateFlowEventDevisUploadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowEventUserCreatedImplCopyWith<$Res> {
  factory _$$CreateFlowEventUserCreatedImplCopyWith(
          _$CreateFlowEventUserCreatedImpl value,
          $Res Function(_$CreateFlowEventUserCreatedImpl) then) =
      __$$CreateFlowEventUserCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$CreateFlowEventUserCreatedImpl(
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

class _$CreateFlowEventUserCreatedImpl implements CreateFlowEventUserCreated {
  const _$CreateFlowEventUserCreatedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'CreateFlowEvent.userCreated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventUserCreatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowEventUserCreatedImplCopyWith<_$CreateFlowEventUserCreatedImpl>
      get copyWith => __$$CreateFlowEventUserCreatedImplCopyWithImpl<
          _$CreateFlowEventUserCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return userCreated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return userCreated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated(user);
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
    required TResult orElse(),
  }) {
    if (userCreated != null) {
      return userCreated(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventUserCreated implements CreateFlowEvent {
  const factory CreateFlowEventUserCreated(final User user) =
      _$CreateFlowEventUserCreatedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$CreateFlowEventUserCreatedImplCopyWith<_$CreateFlowEventUserCreatedImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    return 'CreateFlowEvent.createFlowd()';
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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return createFlowd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return createFlowd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
    required TResult orElse(),
  }) {
    if (createFlowd != null) {
      return createFlowd();
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
  }) {
    return createFlowd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
  }) {
    return createFlowd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
    required TResult orElse(),
  }) {
    if (createFlowd != null) {
      return createFlowd(this);
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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return cancelStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return cancelStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
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
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
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
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
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
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
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
abstract class _$$CreateFlowEventDidPopImplCopyWith<$Res> {
  factory _$$CreateFlowEventDidPopImplCopyWith(
          _$CreateFlowEventDidPopImpl value,
          $Res Function(_$CreateFlowEventDidPopImpl) then) =
      __$$CreateFlowEventDidPopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateFlowEventDidPopImplCopyWithImpl<$Res>
    extends _$CreateFlowEventCopyWithImpl<$Res, _$CreateFlowEventDidPopImpl>
    implements _$$CreateFlowEventDidPopImplCopyWith<$Res> {
  __$$CreateFlowEventDidPopImplCopyWithImpl(_$CreateFlowEventDidPopImpl _value,
      $Res Function(_$CreateFlowEventDidPopImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateFlowEventDidPopImpl implements CreateFlowEventDidPop {
  const _$CreateFlowEventDidPopImpl();

  @override
  String toString() {
    return 'CreateFlowEvent.didPop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEventDidPopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) didSelectUser,
    required TResult Function() filePressed,
    required TResult Function(XFile file, DevisRecipient recipient)
        devisUploaded,
    required TResult Function(User user) userCreated,
    required TResult Function() createFlowd,
    required TResult Function() cancelStep,
    required TResult Function() cancel,
    required TResult Function() didPop,
  }) {
    return didPop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? didSelectUser,
    TResult? Function()? filePressed,
    TResult? Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult? Function(User user)? userCreated,
    TResult? Function()? createFlowd,
    TResult? Function()? cancelStep,
    TResult? Function()? cancel,
    TResult? Function()? didPop,
  }) {
    return didPop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? didSelectUser,
    TResult Function()? filePressed,
    TResult Function(XFile file, DevisRecipient recipient)? devisUploaded,
    TResult Function(User user)? userCreated,
    TResult Function()? createFlowd,
    TResult Function()? cancelStep,
    TResult Function()? cancel,
    TResult Function()? didPop,
    required TResult orElse(),
  }) {
    if (didPop != null) {
      return didPop();
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
    required TResult Function(CreateFlowEventCreateFlowd value) createFlowd,
    required TResult Function(CreateFlowEventCancelStep value) cancelStep,
    required TResult Function(CreateFlowEventCancel value) cancel,
    required TResult Function(CreateFlowEventDidPop value) didPop,
  }) {
    return didPop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult? Function(CreateFlowEventFilePressed value)? filePressed,
    TResult? Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult? Function(CreateFlowEventUserCreated value)? userCreated,
    TResult? Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult? Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult? Function(CreateFlowEventCancel value)? cancel,
    TResult? Function(CreateFlowEventDidPop value)? didPop,
  }) {
    return didPop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowEventDidSelectUser value)? didSelectUser,
    TResult Function(CreateFlowEventFilePressed value)? filePressed,
    TResult Function(CreateFlowEventDevisUploaded value)? devisUploaded,
    TResult Function(CreateFlowEventUserCreated value)? userCreated,
    TResult Function(CreateFlowEventCreateFlowd value)? createFlowd,
    TResult Function(CreateFlowEventCancelStep value)? cancelStep,
    TResult Function(CreateFlowEventCancel value)? cancel,
    TResult Function(CreateFlowEventDidPop value)? didPop,
    required TResult orElse(),
  }) {
    if (didPop != null) {
      return didPop(this);
    }
    return orElse();
  }
}

abstract class CreateFlowEventDidPop implements CreateFlowEvent {
  const factory CreateFlowEventDidPop() = _$CreateFlowEventDidPopImpl;
}

/// @nodoc
mixin _$CreateFlowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(CreateFlowDevisState devisFlow) withDevis,
    required TResult Function(User? user) withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult? Function(User? user)? withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult Function(User? user)? withUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateWithDevis value) withDevis,
    required TResult Function(CreateFlowStateWithUser value) withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateWithDevis value)? withDevis,
    TResult? Function(CreateFlowStateWithUser value)? withUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateWithDevis value)? withDevis,
    TResult Function(CreateFlowStateWithUser value)? withUser,
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
    extends CreateFlowStateNothingSelected {
  const _$CreateFlowStateNothingSelectedImpl() : super._();

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
    required TResult Function(CreateFlowDevisState devisFlow) withDevis,
    required TResult Function(User? user) withUser,
  }) {
    return nothingSelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult? Function(User? user)? withUser,
  }) {
    return nothingSelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult Function(User? user)? withUser,
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
    required TResult Function(CreateFlowStateWithDevis value) withDevis,
    required TResult Function(CreateFlowStateWithUser value) withUser,
  }) {
    return nothingSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateWithDevis value)? withDevis,
    TResult? Function(CreateFlowStateWithUser value)? withUser,
  }) {
    return nothingSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateWithDevis value)? withDevis,
    TResult Function(CreateFlowStateWithUser value)? withUser,
    required TResult orElse(),
  }) {
    if (nothingSelected != null) {
      return nothingSelected(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateNothingSelected extends CreateFlowState {
  const factory CreateFlowStateNothingSelected() =
      _$CreateFlowStateNothingSelectedImpl;
  const CreateFlowStateNothingSelected._() : super._();
}

/// @nodoc
abstract class _$$CreateFlowStateWithDevisImplCopyWith<$Res> {
  factory _$$CreateFlowStateWithDevisImplCopyWith(
          _$CreateFlowStateWithDevisImpl value,
          $Res Function(_$CreateFlowStateWithDevisImpl) then) =
      __$$CreateFlowStateWithDevisImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateFlowDevisState devisFlow});

  $CreateFlowDevisStateCopyWith<$Res> get devisFlow;
}

/// @nodoc
class __$$CreateFlowStateWithDevisImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowStateWithDevisImpl>
    implements _$$CreateFlowStateWithDevisImplCopyWith<$Res> {
  __$$CreateFlowStateWithDevisImplCopyWithImpl(
      _$CreateFlowStateWithDevisImpl _value,
      $Res Function(_$CreateFlowStateWithDevisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devisFlow = null,
  }) {
    return _then(_$CreateFlowStateWithDevisImpl(
      null == devisFlow
          ? _value.devisFlow
          : devisFlow // ignore: cast_nullable_to_non_nullable
              as CreateFlowDevisState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateFlowDevisStateCopyWith<$Res> get devisFlow {
    return $CreateFlowDevisStateCopyWith<$Res>(_value.devisFlow, (value) {
      return _then(_value.copyWith(devisFlow: value));
    });
  }
}

/// @nodoc

class _$CreateFlowStateWithDevisImpl extends CreateFlowStateWithDevis {
  const _$CreateFlowStateWithDevisImpl(this.devisFlow) : super._();

  @override
  final CreateFlowDevisState devisFlow;

  @override
  String toString() {
    return 'CreateFlowState.withDevis(devisFlow: $devisFlow)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateWithDevisImpl &&
            (identical(other.devisFlow, devisFlow) ||
                other.devisFlow == devisFlow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, devisFlow);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowStateWithDevisImplCopyWith<_$CreateFlowStateWithDevisImpl>
      get copyWith => __$$CreateFlowStateWithDevisImplCopyWithImpl<
          _$CreateFlowStateWithDevisImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(CreateFlowDevisState devisFlow) withDevis,
    required TResult Function(User? user) withUser,
  }) {
    return withDevis(devisFlow);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult? Function(User? user)? withUser,
  }) {
    return withDevis?.call(devisFlow);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult Function(User? user)? withUser,
    required TResult orElse(),
  }) {
    if (withDevis != null) {
      return withDevis(devisFlow);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateWithDevis value) withDevis,
    required TResult Function(CreateFlowStateWithUser value) withUser,
  }) {
    return withDevis(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateWithDevis value)? withDevis,
    TResult? Function(CreateFlowStateWithUser value)? withUser,
  }) {
    return withDevis?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateWithDevis value)? withDevis,
    TResult Function(CreateFlowStateWithUser value)? withUser,
    required TResult orElse(),
  }) {
    if (withDevis != null) {
      return withDevis(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateWithDevis extends CreateFlowState {
  const factory CreateFlowStateWithDevis(final CreateFlowDevisState devisFlow) =
      _$CreateFlowStateWithDevisImpl;
  const CreateFlowStateWithDevis._() : super._();

  CreateFlowDevisState get devisFlow;
  @JsonKey(ignore: true)
  _$$CreateFlowStateWithDevisImplCopyWith<_$CreateFlowStateWithDevisImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowStateWithUserImplCopyWith<$Res> {
  factory _$$CreateFlowStateWithUserImplCopyWith(
          _$CreateFlowStateWithUserImpl value,
          $Res Function(_$CreateFlowStateWithUserImpl) then) =
      __$$CreateFlowStateWithUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CreateFlowStateWithUserImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowStateWithUserImpl>
    implements _$$CreateFlowStateWithUserImplCopyWith<$Res> {
  __$$CreateFlowStateWithUserImplCopyWithImpl(
      _$CreateFlowStateWithUserImpl _value,
      $Res Function(_$CreateFlowStateWithUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$CreateFlowStateWithUserImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$CreateFlowStateWithUserImpl extends CreateFlowStateWithUser {
  const _$CreateFlowStateWithUserImpl(this.user) : super._();

  @override
  final User? user;

  @override
  String toString() {
    return 'CreateFlowState.withUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowStateWithUserImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowStateWithUserImplCopyWith<_$CreateFlowStateWithUserImpl>
      get copyWith => __$$CreateFlowStateWithUserImplCopyWithImpl<
          _$CreateFlowStateWithUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nothingSelected,
    required TResult Function(CreateFlowDevisState devisFlow) withDevis,
    required TResult Function(User? user) withUser,
  }) {
    return withUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nothingSelected,
    TResult? Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult? Function(User? user)? withUser,
  }) {
    return withUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nothingSelected,
    TResult Function(CreateFlowDevisState devisFlow)? withDevis,
    TResult Function(User? user)? withUser,
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
    required TResult Function(CreateFlowStateNothingSelected value)
        nothingSelected,
    required TResult Function(CreateFlowStateWithDevis value) withDevis,
    required TResult Function(CreateFlowStateWithUser value) withUser,
  }) {
    return withUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult? Function(CreateFlowStateWithDevis value)? withDevis,
    TResult? Function(CreateFlowStateWithUser value)? withUser,
  }) {
    return withUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowStateNothingSelected value)? nothingSelected,
    TResult Function(CreateFlowStateWithDevis value)? withDevis,
    TResult Function(CreateFlowStateWithUser value)? withUser,
    required TResult orElse(),
  }) {
    if (withUser != null) {
      return withUser(this);
    }
    return orElse();
  }
}

abstract class CreateFlowStateWithUser extends CreateFlowState {
  const factory CreateFlowStateWithUser(final User? user) =
      _$CreateFlowStateWithUserImpl;
  const CreateFlowStateWithUser._() : super._();

  User? get user;
  @JsonKey(ignore: true)
  _$$CreateFlowStateWithUserImplCopyWith<_$CreateFlowStateWithUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateFlowDevisState {
  CreateFlowDevisStep get step => throw _privateConstructorUsedError;
  XFile? get file => throw _privateConstructorUsedError;
  DevisRecipient? get recipient => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)?
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)?
        form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowDevisStateForm value) form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowDevisStateForm value)? form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowDevisStateForm value)? form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateFlowDevisStateCopyWith<CreateFlowDevisState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFlowDevisStateCopyWith<$Res> {
  factory $CreateFlowDevisStateCopyWith(CreateFlowDevisState value,
          $Res Function(CreateFlowDevisState) then) =
      _$CreateFlowDevisStateCopyWithImpl<$Res, CreateFlowDevisState>;
  @useResult
  $Res call(
      {CreateFlowDevisStep step,
      XFile? file,
      DevisRecipient? recipient,
      User? user});

  $DevisRecipientCopyWith<$Res>? get recipient;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$CreateFlowDevisStateCopyWithImpl<$Res,
        $Val extends CreateFlowDevisState>
    implements $CreateFlowDevisStateCopyWith<$Res> {
  _$CreateFlowDevisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? file = freezed,
    Object? recipient = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as CreateFlowDevisStep,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as DevisRecipient?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DevisRecipientCopyWith<$Res>? get recipient {
    if (_value.recipient == null) {
      return null;
    }

    return $DevisRecipientCopyWith<$Res>(_value.recipient!, (value) {
      return _then(_value.copyWith(recipient: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateFlowDevisStateFormImplCopyWith<$Res>
    implements $CreateFlowDevisStateCopyWith<$Res> {
  factory _$$CreateFlowDevisStateFormImplCopyWith(
          _$CreateFlowDevisStateFormImpl value,
          $Res Function(_$CreateFlowDevisStateFormImpl) then) =
      __$$CreateFlowDevisStateFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CreateFlowDevisStep step,
      XFile? file,
      DevisRecipient? recipient,
      User? user});

  @override
  $DevisRecipientCopyWith<$Res>? get recipient;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$CreateFlowDevisStateFormImplCopyWithImpl<$Res>
    extends _$CreateFlowDevisStateCopyWithImpl<$Res,
        _$CreateFlowDevisStateFormImpl>
    implements _$$CreateFlowDevisStateFormImplCopyWith<$Res> {
  __$$CreateFlowDevisStateFormImplCopyWithImpl(
      _$CreateFlowDevisStateFormImpl _value,
      $Res Function(_$CreateFlowDevisStateFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? file = freezed,
    Object? recipient = freezed,
    Object? user = freezed,
  }) {
    return _then(_$CreateFlowDevisStateFormImpl(
      null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as CreateFlowDevisStep,
      freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile?,
      freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as DevisRecipient?,
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$CreateFlowDevisStateFormImpl implements CreateFlowDevisStateForm {
  const _$CreateFlowDevisStateFormImpl(
      [this.step = CreateFlowDevisStep.uploadDevis,
      this.file = null,
      this.recipient = null,
      this.user = null]);

  @override
  @JsonKey()
  final CreateFlowDevisStep step;
  @override
  @JsonKey()
  final XFile? file;
  @override
  @JsonKey()
  final DevisRecipient? recipient;
  @override
  @JsonKey()
  final User? user;

  @override
  String toString() {
    return 'CreateFlowDevisState.form(step: $step, file: $file, recipient: $recipient, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowDevisStateFormImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step, file, recipient, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowDevisStateFormImplCopyWith<_$CreateFlowDevisStateFormImpl>
      get copyWith => __$$CreateFlowDevisStateFormImplCopyWithImpl<
          _$CreateFlowDevisStateFormImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)
        form,
  }) {
    return form(step, file, recipient, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)?
        form,
  }) {
    return form?.call(step, file, recipient, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowDevisStep step, XFile? file,
            DevisRecipient? recipient, User? user)?
        form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(step, file, recipient, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowDevisStateForm value) form,
  }) {
    return form(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowDevisStateForm value)? form,
  }) {
    return form?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowDevisStateForm value)? form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(this);
    }
    return orElse();
  }
}

abstract class CreateFlowDevisStateForm implements CreateFlowDevisState {
  const factory CreateFlowDevisStateForm(
      [final CreateFlowDevisStep step,
      final XFile? file,
      final DevisRecipient? recipient,
      final User? user]) = _$CreateFlowDevisStateFormImpl;

  @override
  CreateFlowDevisStep get step;
  @override
  XFile? get file;
  @override
  DevisRecipient? get recipient;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$CreateFlowDevisStateFormImplCopyWith<_$CreateFlowDevisStateFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}
