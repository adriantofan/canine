// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_upload_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DevisUploadState {
  dynamic get showFileDialog => throw _privateConstructorUsedError;
  FileInput get file => throw _privateConstructorUsedError;
  DevisRecipient? get recipient => throw _privateConstructorUsedError;
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)?
        form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)?
        form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevisUploadStateForm value) form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevisUploadStateForm value)? form,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevisUploadStateForm value)? form,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DevisUploadStateCopyWith<DevisUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisUploadStateCopyWith<$Res> {
  factory $DevisUploadStateCopyWith(
          DevisUploadState value, $Res Function(DevisUploadState) then) =
      _$DevisUploadStateCopyWithImpl<$Res, DevisUploadState>;
  @useResult
  $Res call(
      {dynamic showFileDialog,
      FileInput file,
      DevisRecipient? recipient,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});

  $DevisRecipientCopyWith<$Res>? get recipient;
}

/// @nodoc
class _$DevisUploadStateCopyWithImpl<$Res, $Val extends DevisUploadState>
    implements $DevisUploadStateCopyWith<$Res> {
  _$DevisUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFileDialog = freezed,
    Object? file = null,
    Object? recipient = freezed,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      showFileDialog: freezed == showFileDialog
          ? _value.showFileDialog
          : showFileDialog // ignore: cast_nullable_to_non_nullable
              as dynamic,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInput,
      recipient: freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as DevisRecipient?,
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
}

/// @nodoc
abstract class _$$DevisUploadStateFormImplCopyWith<$Res>
    implements $DevisUploadStateCopyWith<$Res> {
  factory _$$DevisUploadStateFormImplCopyWith(_$DevisUploadStateFormImpl value,
          $Res Function(_$DevisUploadStateFormImpl) then) =
      __$$DevisUploadStateFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic showFileDialog,
      FileInput file,
      DevisRecipient? recipient,
      FormzSubmissionStatus status,
      bool isValid,
      String? errorMessage});

  @override
  $DevisRecipientCopyWith<$Res>? get recipient;
}

/// @nodoc
class __$$DevisUploadStateFormImplCopyWithImpl<$Res>
    extends _$DevisUploadStateCopyWithImpl<$Res, _$DevisUploadStateFormImpl>
    implements _$$DevisUploadStateFormImplCopyWith<$Res> {
  __$$DevisUploadStateFormImplCopyWithImpl(_$DevisUploadStateFormImpl _value,
      $Res Function(_$DevisUploadStateFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showFileDialog = freezed,
    Object? file = null,
    Object? recipient = freezed,
    Object? status = null,
    Object? isValid = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$DevisUploadStateFormImpl(
      freezed == showFileDialog ? _value.showFileDialog! : showFileDialog,
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileInput,
      freezed == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as DevisRecipient?,
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

class _$DevisUploadStateFormImpl implements DevisUploadStateForm {
  const _$DevisUploadStateFormImpl(
      [this.showFileDialog = false,
      this.file = const FileInput.pure(),
      this.recipient = null,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false,
      this.errorMessage]);

  @override
  @JsonKey()
  final dynamic showFileDialog;
  @override
  @JsonKey()
  final FileInput file;
  @override
  @JsonKey()
  final DevisRecipient? recipient;
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
    return 'DevisUploadState.form(showFileDialog: $showFileDialog, file: $file, recipient: $recipient, status: $status, isValid: $isValid, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevisUploadStateFormImpl &&
            const DeepCollectionEquality()
                .equals(other.showFileDialog, showFileDialog) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showFileDialog),
      file,
      recipient,
      status,
      isValid,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevisUploadStateFormImplCopyWith<_$DevisUploadStateFormImpl>
      get copyWith =>
          __$$DevisUploadStateFormImplCopyWithImpl<_$DevisUploadStateFormImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)
        form,
  }) {
    return form(showFileDialog, file, recipient, status, isValid, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)?
        form,
  }) {
    return form?.call(
        showFileDialog, file, recipient, status, isValid, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            dynamic showFileDialog,
            FileInput file,
            DevisRecipient? recipient,
            FormzSubmissionStatus status,
            bool isValid,
            String? errorMessage)?
        form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(
          showFileDialog, file, recipient, status, isValid, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevisUploadStateForm value) form,
  }) {
    return form(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevisUploadStateForm value)? form,
  }) {
    return form?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevisUploadStateForm value)? form,
    required TResult orElse(),
  }) {
    if (form != null) {
      return form(this);
    }
    return orElse();
  }
}

abstract class DevisUploadStateForm implements DevisUploadState {
  const factory DevisUploadStateForm(
      [final dynamic showFileDialog,
      final FileInput file,
      final DevisRecipient? recipient,
      final FormzSubmissionStatus status,
      final bool isValid,
      final String? errorMessage]) = _$DevisUploadStateFormImpl;

  @override
  dynamic get showFileDialog;
  @override
  FileInput get file;
  @override
  DevisRecipient? get recipient;
  @override
  FormzSubmissionStatus get status;
  @override
  bool get isValid;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$DevisUploadStateFormImplCopyWith<_$DevisUploadStateFormImpl>
      get copyWith => throw _privateConstructorUsedError;
}
