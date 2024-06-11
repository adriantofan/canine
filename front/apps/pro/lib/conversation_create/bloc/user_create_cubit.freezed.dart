// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_create_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserCreateState {
  FirstName get firstName => throw _privateConstructorUsedError;
  LastName get lastName => throw _privateConstructorUsedError;
  Mobile get mobile => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)?
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)?
        form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCreateStateCopyWith<UserCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreateStateCopyWith<$Res> {
  factory $UserCreateStateCopyWith(
          UserCreateState value, $Res Function(UserCreateState) then) =
      _$UserCreateStateCopyWithImpl<$Res, UserCreateState>;
  @useResult
  $Res call(
      {FirstName firstName,
      LastName lastName,
      Mobile mobile,
      Email email,
      FormzSubmissionStatus status,
      bool isValid,
      User? user,
      String? errorMessage});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserCreateStateCopyWithImpl<$Res, $Val extends UserCreateState>
    implements $UserCreateStateCopyWith<$Res> {
  _$UserCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? mobile = null,
    Object? email = null,
    Object? status = null,
    Object? isValid = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as FirstName,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as LastName,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as Mobile,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserCreateStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FirstName firstName,
      LastName lastName,
      Mobile mobile,
      Email email,
      FormzSubmissionStatus status,
      bool isValid,
      User? user,
      String? errorMessage});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserCreateStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? mobile = null,
    Object? email = null,
    Object? status = null,
    Object? isValid = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InitialImpl(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as FirstName,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as LastName,
      null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as Mobile,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      [this.firstName = const FirstName.pure(),
      this.lastName = const LastName.pure(),
      this.mobile = const Mobile.pure(),
      this.email = const Email.pure(),
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.user = null,
      this.errorMessage])
      : super._();

  @override
  @JsonKey()
  final FirstName firstName;
  @override
  @JsonKey()
  final LastName lastName;
  @override
  @JsonKey()
  final Mobile mobile;
  @override
  @JsonKey()
  final Email email;
  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final User? user;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'UserCreateState.form(firstName: $firstName, lastName: $lastName, mobile: $mobile, email: $email, status: $status, isValid: $isValid, user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, mobile,
      email, status, isValid, user, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)
        form,
  }) {
    return form(firstName, lastName, mobile, email, status, isValid, user,
        errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)?
        form,
  }) {
    return form?.call(firstName, lastName, mobile, email, status, isValid, user,
        errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            FirstName firstName,
            LastName lastName,
            Mobile mobile,
            Email email,
            FormzSubmissionStatus status,
            bool isValid,
            User? user,
            String? errorMessage)?
        form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(firstName, lastName, mobile, email, status, isValid, user,
          errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) form,
  }) {
    return form(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? form,
  }) {
    return form?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(this);
    }
    return orElse();
  }
}

abstract class _Initial extends UserCreateState {
  const factory _Initial(
      [final FirstName firstName,
      final LastName lastName,
      final Mobile mobile,
      final Email email,
      final FormzSubmissionStatus status,
      final bool isValid,
      final User? user,
      final String? errorMessage]) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  FirstName get firstName;
  @override
  LastName get lastName;
  @override
  Mobile get mobile;
  @override
  Email get email;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  User? get user;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
