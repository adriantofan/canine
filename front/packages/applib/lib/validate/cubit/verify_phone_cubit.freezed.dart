// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_phone_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyPhoneState {
  DateTime get sentAt => throw _privateConstructorUsedError;
  Code get code => throw _privateConstructorUsedError;
  FormzSubmissionStatus get sendStatus => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get canResend => throw _privateConstructorUsedError;
  FormzSubmissionStatus get resendCodeStatus =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyPhoneStateInitial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyPhoneStateInitial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyPhoneStateInitial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyPhoneStateCopyWith<VerifyPhoneState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPhoneStateCopyWith<$Res> {
  factory $VerifyPhoneStateCopyWith(
          VerifyPhoneState value, $Res Function(VerifyPhoneState) then) =
      _$VerifyPhoneStateCopyWithImpl<$Res, VerifyPhoneState>;
  @useResult
  $Res call(
      {DateTime sentAt,
      Code code,
      FormzSubmissionStatus sendStatus,
      bool isValid,
      bool canResend,
      FormzSubmissionStatus resendCodeStatus,
      String? errorMessage});
}

/// @nodoc
class _$VerifyPhoneStateCopyWithImpl<$Res, $Val extends VerifyPhoneState>
    implements $VerifyPhoneStateCopyWith<$Res> {
  _$VerifyPhoneStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentAt = null,
    Object? code = null,
    Object? sendStatus = null,
    Object? isValid = null,
    Object? canResend = null,
    Object? resendCodeStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Code,
      sendStatus: null == sendStatus
          ? _value.sendStatus
          : sendStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
      resendCodeStatus: null == resendCodeStatus
          ? _value.resendCodeStatus
          : resendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPhoneStateInitialImplCopyWith<$Res>
    implements $VerifyPhoneStateCopyWith<$Res> {
  factory _$$VerifyPhoneStateInitialImplCopyWith(
          _$VerifyPhoneStateInitialImpl value,
          $Res Function(_$VerifyPhoneStateInitialImpl) then) =
      __$$VerifyPhoneStateInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime sentAt,
      Code code,
      FormzSubmissionStatus sendStatus,
      bool isValid,
      bool canResend,
      FormzSubmissionStatus resendCodeStatus,
      String? errorMessage});
}

/// @nodoc
class __$$VerifyPhoneStateInitialImplCopyWithImpl<$Res>
    extends _$VerifyPhoneStateCopyWithImpl<$Res, _$VerifyPhoneStateInitialImpl>
    implements _$$VerifyPhoneStateInitialImplCopyWith<$Res> {
  __$$VerifyPhoneStateInitialImplCopyWithImpl(
      _$VerifyPhoneStateInitialImpl _value,
      $Res Function(_$VerifyPhoneStateInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentAt = null,
    Object? code = null,
    Object? sendStatus = null,
    Object? isValid = null,
    Object? canResend = null,
    Object? resendCodeStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$VerifyPhoneStateInitialImpl(
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as Code,
      sendStatus: null == sendStatus
          ? _value.sendStatus
          : sendStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      canResend: null == canResend
          ? _value.canResend
          : canResend // ignore: cast_nullable_to_non_nullable
              as bool,
      resendCodeStatus: null == resendCodeStatus
          ? _value.resendCodeStatus
          : resendCodeStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerifyPhoneStateInitialImpl implements VerifyPhoneStateInitial {
  _$VerifyPhoneStateInitialImpl(
      {required this.sentAt,
      this.code = const Code.pure(),
      this.sendStatus = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.canResend = false,
      this.resendCodeStatus = FormzSubmissionStatus.initial,
      this.errorMessage});

  @override
  final DateTime sentAt;
  @override
  @JsonKey()
  final Code code;
  @override
  @JsonKey()
  final FormzSubmissionStatus sendStatus;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final bool canResend;
  @override
  @JsonKey()
  final FormzSubmissionStatus resendCodeStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'VerifyPhoneState.initial(sentAt: $sentAt, code: $code, sendStatus: $sendStatus, isValid: $isValid, canResend: $canResend, resendCodeStatus: $resendCodeStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPhoneStateInitialImpl &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.sendStatus, sendStatus) ||
                other.sendStatus == sendStatus) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend) &&
            (identical(other.resendCodeStatus, resendCodeStatus) ||
                other.resendCodeStatus == resendCodeStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sentAt, code, sendStatus,
      isValid, canResend, resendCodeStatus, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPhoneStateInitialImplCopyWith<_$VerifyPhoneStateInitialImpl>
      get copyWith => __$$VerifyPhoneStateInitialImplCopyWithImpl<
          _$VerifyPhoneStateInitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)
        initial,
  }) {
    return initial(sentAt, code, sendStatus, isValid, canResend,
        resendCodeStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)?
        initial,
  }) {
    return initial?.call(sentAt, code, sendStatus, isValid, canResend,
        resendCodeStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime sentAt,
            Code code,
            FormzSubmissionStatus sendStatus,
            bool isValid,
            bool canResend,
            FormzSubmissionStatus resendCodeStatus,
            String? errorMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(sentAt, code, sendStatus, isValid, canResend,
          resendCodeStatus, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyPhoneStateInitial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyPhoneStateInitial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyPhoneStateInitial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class VerifyPhoneStateInitial implements VerifyPhoneState {
  factory VerifyPhoneStateInitial(
      {required final DateTime sentAt,
      final Code code,
      final FormzSubmissionStatus sendStatus,
      final bool isValid,
      final bool canResend,
      final FormzSubmissionStatus resendCodeStatus,
      final String? errorMessage}) = _$VerifyPhoneStateInitialImpl;

  @override
  DateTime get sentAt;
  @override
  Code get code;
  @override
  FormzSubmissionStatus get sendStatus;
  @override
  bool get isValid;
  @override
  bool get canResend;
  @override
  FormzSubmissionStatus get resendCodeStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$VerifyPhoneStateInitialImplCopyWith<_$VerifyPhoneStateInitialImpl>
      get copyWith => throw _privateConstructorUsedError;
}
