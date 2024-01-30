// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_client_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientMessage _$ClientMessageFromJson(Map<String, dynamic> json) {
  switch (json['kind']) {
    case 'Default':
      return ClientMessageInvalid.fromJson(json);
    case 'sync':
      return SyncMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'kind', 'ClientMessage',
          'Invalid union type "${json['kind']}"!');
  }
}

/// @nodoc
mixin _$ClientMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() sync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? sync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? sync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value) $default, {
    required TResult Function(SyncMessage value) sync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ClientMessageInvalid value)? $default, {
    TResult? Function(SyncMessage value)? sync,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value)? $default, {
    TResult Function(SyncMessage value)? sync,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientMessageCopyWith<$Res> {
  factory $ClientMessageCopyWith(
          ClientMessage value, $Res Function(ClientMessage) then) =
      _$ClientMessageCopyWithImpl<$Res, ClientMessage>;
}

/// @nodoc
class _$ClientMessageCopyWithImpl<$Res, $Val extends ClientMessage>
    implements $ClientMessageCopyWith<$Res> {
  _$ClientMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClientMessageInvalidImplCopyWith<$Res> {
  factory _$$ClientMessageInvalidImplCopyWith(_$ClientMessageInvalidImpl value,
          $Res Function(_$ClientMessageInvalidImpl) then) =
      __$$ClientMessageInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientMessageInvalidImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$ClientMessageInvalidImpl>
    implements _$$ClientMessageInvalidImplCopyWith<$Res> {
  __$$ClientMessageInvalidImplCopyWithImpl(_$ClientMessageInvalidImpl _value,
      $Res Function(_$ClientMessageInvalidImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ClientMessageInvalidImpl implements ClientMessageInvalid {
  const _$ClientMessageInvalidImpl({final String? $type})
      : $type = $type ?? 'Default';

  factory _$ClientMessageInvalidImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientMessageInvalidImplFromJson(json);

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientMessageInvalidImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() sync,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? sync,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? sync,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value) $default, {
    required TResult Function(SyncMessage value) sync,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ClientMessageInvalid value)? $default, {
    TResult? Function(SyncMessage value)? sync,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value)? $default, {
    TResult Function(SyncMessage value)? sync,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientMessageInvalidImplToJson(
      this,
    );
  }
}

abstract class ClientMessageInvalid implements ClientMessage {
  const factory ClientMessageInvalid() = _$ClientMessageInvalidImpl;

  factory ClientMessageInvalid.fromJson(Map<String, dynamic> json) =
      _$ClientMessageInvalidImpl.fromJson;
}

/// @nodoc
abstract class _$$SyncMessageImplCopyWith<$Res> {
  factory _$$SyncMessageImplCopyWith(
          _$SyncMessageImpl value, $Res Function(_$SyncMessageImpl) then) =
      __$$SyncMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncMessageImplCopyWithImpl<$Res>
    extends _$ClientMessageCopyWithImpl<$Res, _$SyncMessageImpl>
    implements _$$SyncMessageImplCopyWith<$Res> {
  __$$SyncMessageImplCopyWithImpl(
      _$SyncMessageImpl _value, $Res Function(_$SyncMessageImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$SyncMessageImpl implements SyncMessage {
  const _$SyncMessageImpl({final String? $type}) : $type = $type ?? 'sync';

  factory _$SyncMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncMessageImplFromJson(json);

  @JsonKey(name: 'kind')
  final String $type;

  @override
  String toString() {
    return 'ClientMessage.sync()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncMessageImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function() sync,
  }) {
    return sync();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function()? sync,
  }) {
    return sync?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function()? sync,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value) $default, {
    required TResult Function(SyncMessage value) sync,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(ClientMessageInvalid value)? $default, {
    TResult? Function(SyncMessage value)? sync,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ClientMessageInvalid value)? $default, {
    TResult Function(SyncMessage value)? sync,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncMessageImplToJson(
      this,
    );
  }
}

abstract class SyncMessage implements ClientMessage {
  const factory SyncMessage() = _$SyncMessageImpl;

  factory SyncMessage.fromJson(Map<String, dynamic> json) =
      _$SyncMessageImpl.fromJson;
}
