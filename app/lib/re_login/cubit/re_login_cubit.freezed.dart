// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 're_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReLoginState {
  Identity? get identity => throw _privateConstructorUsedError;
  PasswordSubmit get password => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReLoginStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReLoginStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReLoginStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReLoginStateCopyWith<ReLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReLoginStateCopyWith<$Res> {
  factory $ReLoginStateCopyWith(
          ReLoginState value, $Res Function(ReLoginState) then) =
      _$ReLoginStateCopyWithImpl<$Res, ReLoginState>;
  @useResult
  $Res call(
      {Identity? identity,
      PasswordSubmit password,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class _$ReLoginStateCopyWithImpl<$Res, $Val extends ReLoginState>
    implements $ReLoginStateCopyWith<$Res> {
  _$ReLoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = freezed,
    Object? password = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      identity: freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordSubmit,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReLoginStateInitialImplCopyWith<$Res>
    implements $ReLoginStateCopyWith<$Res> {
  factory _$$ReLoginStateInitialImplCopyWith(_$ReLoginStateInitialImpl value,
          $Res Function(_$ReLoginStateInitialImpl) then) =
      __$$ReLoginStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Identity? identity,
      PasswordSubmit password,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});
}

/// @nodoc
class __$$ReLoginStateInitialImplCopyWithImpl<$Res>
    extends _$ReLoginStateCopyWithImpl<$Res, _$ReLoginStateInitialImpl>
    implements _$$ReLoginStateInitialImplCopyWith<$Res> {
  __$$ReLoginStateInitialImplCopyWithImpl(_$ReLoginStateInitialImpl _value,
      $Res Function(_$ReLoginStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identity = freezed,
    Object? password = null,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ReLoginStateInitialImpl(
      freezed == identity
          ? _value.identity
          : identity // ignore: cast_nullable_to_non_nullable
              as Identity?,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordSubmit,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReLoginStateInitialImpl implements _ReLoginStateInitial {
  const _$ReLoginStateInitialImpl(
      [this.identity = null,
      this.password = const PasswordSubmit.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage]);

  @override
  @JsonKey()
  final Identity? identity;
  @override
  @JsonKey()
  final PasswordSubmit password;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReLoginState.initial(identity: $identity, password: $password, status: $status, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReLoginStateInitialImpl &&
            const DeepCollectionEquality().equals(other.identity, identity) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(identity),
      password,
      status,
      isValid,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReLoginStateInitialImplCopyWith<_$ReLoginStateInitialImpl> get copyWith =>
      __$$ReLoginStateInitialImplCopyWithImpl<_$ReLoginStateInitialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)
        initial,
  }) {
    return initial(identity, password, status, isValid, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)?
        initial,
  }) {
    return initial?.call(identity, password, status, isValid, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Identity? identity, PasswordSubmit password,
            FormzSubmissionStatus status, bool isValid, String? errorMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(identity, password, status, isValid, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReLoginStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReLoginStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReLoginStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ReLoginStateInitial implements ReLoginState {
  const factory _ReLoginStateInitial(
      [final Identity? identity,
      final PasswordSubmit password,
      final FormzSubmissionStatus status,
      final bool isValid,
      final String? errorMessage]) = _$ReLoginStateInitialImpl;

  @override
  Identity? get identity;
  @override
  PasswordSubmit get password;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ReLoginStateInitialImplCopyWith<_$ReLoginStateInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
