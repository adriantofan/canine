// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LinkEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authzCheck,
    required TResult Function(bool success) didValidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? authzCheck,
    TResult? Function(bool success)? didValidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authzCheck,
    TResult Function(bool success)? didValidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LinkEventStarted value) started,
    required TResult Function(LinkEventAuthzCheck value) authzCheck,
    required TResult Function(LinkEventDidValidate value) didValidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LinkEventStarted value)? started,
    TResult? Function(LinkEventAuthzCheck value)? authzCheck,
    TResult? Function(LinkEventDidValidate value)? didValidate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LinkEventStarted value)? started,
    TResult Function(LinkEventAuthzCheck value)? authzCheck,
    TResult Function(LinkEventDidValidate value)? didValidate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkEventCopyWith<$Res> {
  factory $LinkEventCopyWith(LinkEvent value, $Res Function(LinkEvent) then) =
      _$LinkEventCopyWithImpl<$Res, LinkEvent>;
}

/// @nodoc
class _$LinkEventCopyWithImpl<$Res, $Val extends LinkEvent>
    implements $LinkEventCopyWith<$Res> {
  _$LinkEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LinkEventStartedImplCopyWith<$Res> {
  factory _$$LinkEventStartedImplCopyWith(_$LinkEventStartedImpl value,
          $Res Function(_$LinkEventStartedImpl) then) =
      __$$LinkEventStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LinkEventStartedImplCopyWithImpl<$Res>
    extends _$LinkEventCopyWithImpl<$Res, _$LinkEventStartedImpl>
    implements _$$LinkEventStartedImplCopyWith<$Res> {
  __$$LinkEventStartedImplCopyWithImpl(_$LinkEventStartedImpl _value,
      $Res Function(_$LinkEventStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LinkEventStartedImpl implements LinkEventStarted {
  const _$LinkEventStartedImpl();

  @override
  String toString() {
    return 'LinkEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LinkEventStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authzCheck,
    required TResult Function(bool success) didValidate,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? authzCheck,
    TResult? Function(bool success)? didValidate,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authzCheck,
    TResult Function(bool success)? didValidate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LinkEventStarted value) started,
    required TResult Function(LinkEventAuthzCheck value) authzCheck,
    required TResult Function(LinkEventDidValidate value) didValidate,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LinkEventStarted value)? started,
    TResult? Function(LinkEventAuthzCheck value)? authzCheck,
    TResult? Function(LinkEventDidValidate value)? didValidate,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LinkEventStarted value)? started,
    TResult Function(LinkEventAuthzCheck value)? authzCheck,
    TResult Function(LinkEventDidValidate value)? didValidate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class LinkEventStarted implements LinkEvent {
  const factory LinkEventStarted() = _$LinkEventStartedImpl;
}

/// @nodoc
abstract class _$$LinkEventAuthzCheckImplCopyWith<$Res> {
  factory _$$LinkEventAuthzCheckImplCopyWith(_$LinkEventAuthzCheckImpl value,
          $Res Function(_$LinkEventAuthzCheckImpl) then) =
      __$$LinkEventAuthzCheckImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LinkEventAuthzCheckImplCopyWithImpl<$Res>
    extends _$LinkEventCopyWithImpl<$Res, _$LinkEventAuthzCheckImpl>
    implements _$$LinkEventAuthzCheckImplCopyWith<$Res> {
  __$$LinkEventAuthzCheckImplCopyWithImpl(_$LinkEventAuthzCheckImpl _value,
      $Res Function(_$LinkEventAuthzCheckImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LinkEventAuthzCheckImpl implements LinkEventAuthzCheck {
  const _$LinkEventAuthzCheckImpl();

  @override
  String toString() {
    return 'LinkEvent.authzCheck()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkEventAuthzCheckImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authzCheck,
    required TResult Function(bool success) didValidate,
  }) {
    return authzCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? authzCheck,
    TResult? Function(bool success)? didValidate,
  }) {
    return authzCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authzCheck,
    TResult Function(bool success)? didValidate,
    required TResult orElse(),
  }) {
    if (authzCheck != null) {
      return authzCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LinkEventStarted value) started,
    required TResult Function(LinkEventAuthzCheck value) authzCheck,
    required TResult Function(LinkEventDidValidate value) didValidate,
  }) {
    return authzCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LinkEventStarted value)? started,
    TResult? Function(LinkEventAuthzCheck value)? authzCheck,
    TResult? Function(LinkEventDidValidate value)? didValidate,
  }) {
    return authzCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LinkEventStarted value)? started,
    TResult Function(LinkEventAuthzCheck value)? authzCheck,
    TResult Function(LinkEventDidValidate value)? didValidate,
    required TResult orElse(),
  }) {
    if (authzCheck != null) {
      return authzCheck(this);
    }
    return orElse();
  }
}

abstract class LinkEventAuthzCheck implements LinkEvent {
  const factory LinkEventAuthzCheck() = _$LinkEventAuthzCheckImpl;
}

/// @nodoc
abstract class _$$LinkEventDidValidateImplCopyWith<$Res> {
  factory _$$LinkEventDidValidateImplCopyWith(_$LinkEventDidValidateImpl value,
          $Res Function(_$LinkEventDidValidateImpl) then) =
      __$$LinkEventDidValidateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$LinkEventDidValidateImplCopyWithImpl<$Res>
    extends _$LinkEventCopyWithImpl<$Res, _$LinkEventDidValidateImpl>
    implements _$$LinkEventDidValidateImplCopyWith<$Res> {
  __$$LinkEventDidValidateImplCopyWithImpl(_$LinkEventDidValidateImpl _value,
      $Res Function(_$LinkEventDidValidateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$LinkEventDidValidateImpl(
      null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LinkEventDidValidateImpl implements LinkEventDidValidate {
  const _$LinkEventDidValidateImpl(this.success);

  @override
  final bool success;

  @override
  String toString() {
    return 'LinkEvent.didValidate(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkEventDidValidateImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkEventDidValidateImplCopyWith<_$LinkEventDidValidateImpl>
      get copyWith =>
          __$$LinkEventDidValidateImplCopyWithImpl<_$LinkEventDidValidateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() authzCheck,
    required TResult Function(bool success) didValidate,
  }) {
    return didValidate(success);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? authzCheck,
    TResult? Function(bool success)? didValidate,
  }) {
    return didValidate?.call(success);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? authzCheck,
    TResult Function(bool success)? didValidate,
    required TResult orElse(),
  }) {
    if (didValidate != null) {
      return didValidate(success);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LinkEventStarted value) started,
    required TResult Function(LinkEventAuthzCheck value) authzCheck,
    required TResult Function(LinkEventDidValidate value) didValidate,
  }) {
    return didValidate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LinkEventStarted value)? started,
    TResult? Function(LinkEventAuthzCheck value)? authzCheck,
    TResult? Function(LinkEventDidValidate value)? didValidate,
  }) {
    return didValidate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LinkEventStarted value)? started,
    TResult Function(LinkEventAuthzCheck value)? authzCheck,
    TResult Function(LinkEventDidValidate value)? didValidate,
    required TResult orElse(),
  }) {
    if (didValidate != null) {
      return didValidate(this);
    }
    return orElse();
  }
}

abstract class LinkEventDidValidate implements LinkEvent {
  const factory LinkEventDidValidate(final bool success) =
      _$LinkEventDidValidateImpl;

  bool get success;
  @JsonKey(ignore: true)
  _$$LinkEventDidValidateImplCopyWith<_$LinkEventDidValidateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LinkState {
  EndUserAuthorization? get authorization => throw _privateConstructorUsedError;
  FormzSubmissionStatus get authorizationCheckStatus =>
      throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // A new phone was added to the user account, so we need to redo the flow
  bool get didValidate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LinkStateCopyWith<LinkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkStateCopyWith<$Res> {
  factory $LinkStateCopyWith(LinkState value, $Res Function(LinkState) then) =
      _$LinkStateCopyWithImpl<$Res, LinkState>;
  @useResult
  $Res call(
      {EndUserAuthorization? authorization,
      FormzSubmissionStatus authorizationCheckStatus,
      String? errorMessage,
      bool didValidate});

  $EndUserAuthorizationCopyWith<$Res>? get authorization;
}

/// @nodoc
class _$LinkStateCopyWithImpl<$Res, $Val extends LinkState>
    implements $LinkStateCopyWith<$Res> {
  _$LinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorization = freezed,
    Object? authorizationCheckStatus = null,
    Object? errorMessage = freezed,
    Object? didValidate = null,
  }) {
    return _then(_value.copyWith(
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as EndUserAuthorization?,
      authorizationCheckStatus: null == authorizationCheckStatus
          ? _value.authorizationCheckStatus
          : authorizationCheckStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      didValidate: null == didValidate
          ? _value.didValidate
          : didValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EndUserAuthorizationCopyWith<$Res>? get authorization {
    if (_value.authorization == null) {
      return null;
    }

    return $EndUserAuthorizationCopyWith<$Res>(_value.authorization!, (value) {
      return _then(_value.copyWith(authorization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LinkStateImplCopyWith<$Res>
    implements $LinkStateCopyWith<$Res> {
  factory _$$LinkStateImplCopyWith(
          _$LinkStateImpl value, $Res Function(_$LinkStateImpl) then) =
      __$$LinkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EndUserAuthorization? authorization,
      FormzSubmissionStatus authorizationCheckStatus,
      String? errorMessage,
      bool didValidate});

  @override
  $EndUserAuthorizationCopyWith<$Res>? get authorization;
}

/// @nodoc
class __$$LinkStateImplCopyWithImpl<$Res>
    extends _$LinkStateCopyWithImpl<$Res, _$LinkStateImpl>
    implements _$$LinkStateImplCopyWith<$Res> {
  __$$LinkStateImplCopyWithImpl(
      _$LinkStateImpl _value, $Res Function(_$LinkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorization = freezed,
    Object? authorizationCheckStatus = null,
    Object? errorMessage = freezed,
    Object? didValidate = null,
  }) {
    return _then(_$LinkStateImpl(
      authorization: freezed == authorization
          ? _value.authorization
          : authorization // ignore: cast_nullable_to_non_nullable
              as EndUserAuthorization?,
      authorizationCheckStatus: null == authorizationCheckStatus
          ? _value.authorizationCheckStatus
          : authorizationCheckStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      didValidate: null == didValidate
          ? _value.didValidate
          : didValidate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LinkStateImpl implements _LinkState {
  const _$LinkStateImpl(
      {this.authorization,
      required this.authorizationCheckStatus,
      this.errorMessage,
      this.didValidate = false});

  @override
  final EndUserAuthorization? authorization;
  @override
  final FormzSubmissionStatus authorizationCheckStatus;
  @override
  final String? errorMessage;
// A new phone was added to the user account, so we need to redo the flow
  @override
  @JsonKey()
  final bool didValidate;

  @override
  String toString() {
    return 'LinkState(authorization: $authorization, authorizationCheckStatus: $authorizationCheckStatus, errorMessage: $errorMessage, didValidate: $didValidate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkStateImpl &&
            (identical(other.authorization, authorization) ||
                other.authorization == authorization) &&
            (identical(
                    other.authorizationCheckStatus, authorizationCheckStatus) ||
                other.authorizationCheckStatus == authorizationCheckStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.didValidate, didValidate) ||
                other.didValidate == didValidate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authorization,
      authorizationCheckStatus, errorMessage, didValidate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkStateImplCopyWith<_$LinkStateImpl> get copyWith =>
      __$$LinkStateImplCopyWithImpl<_$LinkStateImpl>(this, _$identity);
}

abstract class _LinkState implements LinkState {
  const factory _LinkState(
      {final EndUserAuthorization? authorization,
      required final FormzSubmissionStatus authorizationCheckStatus,
      final String? errorMessage,
      final bool didValidate}) = _$LinkStateImpl;

  @override
  EndUserAuthorization? get authorization;
  @override
  FormzSubmissionStatus get authorizationCheckStatus;
  @override
  String? get errorMessage;
  @override // A new phone was added to the user account, so we need to redo the flow
  bool get didValidate;
  @override
  @JsonKey(ignore: true)
  _$$LinkStateImplCopyWith<_$LinkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
