// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis_recipient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DevisRecipient _$DevisRecipientFromJson(Map<String, dynamic> json) {
  return _DevisRecipient.fromJson(json);
}

/// @nodoc
mixin _$DevisRecipient {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DevisRecipientCopyWith<DevisRecipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevisRecipientCopyWith<$Res> {
  factory $DevisRecipientCopyWith(
          DevisRecipient value, $Res Function(DevisRecipient) then) =
      _$DevisRecipientCopyWithImpl<$Res, DevisRecipient>;
  @useResult
  $Res call({String firstName, String lastName, String phone, String? email});
}

/// @nodoc
class _$DevisRecipientCopyWithImpl<$Res, $Val extends DevisRecipient>
    implements $DevisRecipientCopyWith<$Res> {
  _$DevisRecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DevisRecipientImplCopyWith<$Res>
    implements $DevisRecipientCopyWith<$Res> {
  factory _$$DevisRecipientImplCopyWith(_$DevisRecipientImpl value,
          $Res Function(_$DevisRecipientImpl) then) =
      __$$DevisRecipientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, String phone, String? email});
}

/// @nodoc
class __$$DevisRecipientImplCopyWithImpl<$Res>
    extends _$DevisRecipientCopyWithImpl<$Res, _$DevisRecipientImpl>
    implements _$$DevisRecipientImplCopyWith<$Res> {
  __$$DevisRecipientImplCopyWithImpl(
      _$DevisRecipientImpl _value, $Res Function(_$DevisRecipientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? phone = null,
    Object? email = freezed,
  }) {
    return _then(_$DevisRecipientImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DevisRecipientImpl implements _DevisRecipient {
  _$DevisRecipientImpl(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      this.email});

  factory _$DevisRecipientImpl.fromJson(Map<String, dynamic> json) =>
      _$$DevisRecipientImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String? email;

  @override
  String toString() {
    return 'DevisRecipient(firstName: $firstName, lastName: $lastName, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevisRecipientImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevisRecipientImplCopyWith<_$DevisRecipientImpl> get copyWith =>
      __$$DevisRecipientImplCopyWithImpl<_$DevisRecipientImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DevisRecipientImplToJson(
      this,
    );
  }
}

abstract class _DevisRecipient implements DevisRecipient {
  factory _DevisRecipient(
      {required final String firstName,
      required final String lastName,
      required final String phone,
      final String? email}) = _$DevisRecipientImpl;

  factory _DevisRecipient.fromJson(Map<String, dynamic> json) =
      _$DevisRecipientImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get phone;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$DevisRecipientImplCopyWith<_$DevisRecipientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
