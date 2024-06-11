// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  FormzSubmissionStatus get workspaceStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get createStatus => throw _privateConstructorUsedError;
  bool get onWorkspace => throw _privateConstructorUsedError;
  String? get loadErrorMessage => throw _privateConstructorUsedError;
  Workspace? get workspace => throw _privateConstructorUsedError;
  bool get notFound =>
      throw _privateConstructorUsedError; // Second step of the login step
  FormzSubmissionStatus get loginStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus workspaceStatus,
      FormzSubmissionStatus createStatus,
      bool onWorkspace,
      String? loadErrorMessage,
      Workspace? workspace,
      bool notFound,
      FormzSubmissionStatus loginStatus,
      String? errorMessage});

  $WorkspaceCopyWith<$Res>? get workspace;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceStatus = null,
    Object? createStatus = null,
    Object? onWorkspace = null,
    Object? loadErrorMessage = freezed,
    Object? workspace = freezed,
    Object? notFound = null,
    Object? loginStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      workspaceStatus: null == workspaceStatus
          ? _value.workspaceStatus
          : workspaceStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      createStatus: null == createStatus
          ? _value.createStatus
          : createStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      onWorkspace: null == onWorkspace
          ? _value.onWorkspace
          : onWorkspace // ignore: cast_nullable_to_non_nullable
              as bool,
      loadErrorMessage: freezed == loadErrorMessage
          ? _value.loadErrorMessage
          : loadErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      workspace: freezed == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace?,
      notFound: null == notFound
          ? _value.notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as bool,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkspaceCopyWith<$Res>? get workspace {
    if (_value.workspace == null) {
      return null;
    }

    return $WorkspaceCopyWith<$Res>(_value.workspace!, (value) {
      return _then(_value.copyWith(workspace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus workspaceStatus,
      FormzSubmissionStatus createStatus,
      bool onWorkspace,
      String? loadErrorMessage,
      Workspace? workspace,
      bool notFound,
      FormzSubmissionStatus loginStatus,
      String? errorMessage});

  @override
  $WorkspaceCopyWith<$Res>? get workspace;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workspaceStatus = null,
    Object? createStatus = null,
    Object? onWorkspace = null,
    Object? loadErrorMessage = freezed,
    Object? workspace = freezed,
    Object? notFound = null,
    Object? loginStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InitialImpl(
      workspaceStatus: null == workspaceStatus
          ? _value.workspaceStatus
          : workspaceStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      createStatus: null == createStatus
          ? _value.createStatus
          : createStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      onWorkspace: null == onWorkspace
          ? _value.onWorkspace
          : onWorkspace // ignore: cast_nullable_to_non_nullable
              as bool,
      loadErrorMessage: freezed == loadErrorMessage
          ? _value.loadErrorMessage
          : loadErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      workspace: freezed == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace?,
      notFound: null == notFound
          ? _value.notFound
          : notFound // ignore: cast_nullable_to_non_nullable
              as bool,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.workspaceStatus = FormzSubmissionStatus.initial,
      this.createStatus = FormzSubmissionStatus.initial,
      this.onWorkspace = false,
      this.loadErrorMessage,
      this.workspace,
      this.notFound = true,
      this.loginStatus = FormzSubmissionStatus.initial,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final FormzSubmissionStatus workspaceStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus createStatus;
  @override
  @JsonKey()
  final bool onWorkspace;
  @override
  final String? loadErrorMessage;
  @override
  final Workspace? workspace;
  @override
  @JsonKey()
  final bool notFound;
// Second step of the login step
  @override
  @JsonKey()
  final FormzSubmissionStatus loginStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'LoginState.initial(workspaceStatus: $workspaceStatus, createStatus: $createStatus, onWorkspace: $onWorkspace, loadErrorMessage: $loadErrorMessage, workspace: $workspace, notFound: $notFound, loginStatus: $loginStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.workspaceStatus, workspaceStatus) ||
                other.workspaceStatus == workspaceStatus) &&
            (identical(other.createStatus, createStatus) ||
                other.createStatus == createStatus) &&
            (identical(other.onWorkspace, onWorkspace) ||
                other.onWorkspace == onWorkspace) &&
            (identical(other.loadErrorMessage, loadErrorMessage) ||
                other.loadErrorMessage == loadErrorMessage) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace) &&
            (identical(other.notFound, notFound) ||
                other.notFound == notFound) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      workspaceStatus,
      createStatus,
      onWorkspace,
      loadErrorMessage,
      workspace,
      notFound,
      loginStatus,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)
        initial,
  }) {
    return initial(workspaceStatus, createStatus, onWorkspace, loadErrorMessage,
        workspace, notFound, loginStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)?
        initial,
  }) {
    return initial?.call(workspaceStatus, createStatus, onWorkspace,
        loadErrorMessage, workspace, notFound, loginStatus, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            FormzSubmissionStatus workspaceStatus,
            FormzSubmissionStatus createStatus,
            bool onWorkspace,
            String? loadErrorMessage,
            Workspace? workspace,
            bool notFound,
            FormzSubmissionStatus loginStatus,
            String? errorMessage)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(workspaceStatus, createStatus, onWorkspace,
          loadErrorMessage, workspace, notFound, loginStatus, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends LoginState {
  const factory _Initial(
      {final FormzSubmissionStatus workspaceStatus,
      final FormzSubmissionStatus createStatus,
      final bool onWorkspace,
      final String? loadErrorMessage,
      final Workspace? workspace,
      final bool notFound,
      final FormzSubmissionStatus loginStatus,
      final String? errorMessage}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  FormzSubmissionStatus get workspaceStatus;
  @override
  FormzSubmissionStatus get createStatus;
  @override
  bool get onWorkspace;
  @override
  String? get loadErrorMessage;
  @override
  Workspace? get workspace;
  @override
  bool get notFound;
  @override // Second step of the login step
  FormzSubmissionStatus get loginStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
