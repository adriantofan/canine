// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_create_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrgCreatePayload _$OrgCreatePayloadFromJson(Map<String, dynamic> json) {
  return _WorkspaceCreatePayload.fromJson(json);
}

/// @nodoc
mixin _$OrgCreatePayload {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrgCreatePayloadCopyWith<OrgCreatePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgCreatePayloadCopyWith<$Res> {
  factory $OrgCreatePayloadCopyWith(
          OrgCreatePayload value, $Res Function(OrgCreatePayload) then) =
      _$OrgCreatePayloadCopyWithImpl<$Res, OrgCreatePayload>;
  @useResult
  $Res call(
      {String name,
      String email,
      String phone,
      String firstName,
      String lastName,
      String password});
}

/// @nodoc
class _$OrgCreatePayloadCopyWithImpl<$Res, $Val extends OrgCreatePayload>
    implements $OrgCreatePayloadCopyWith<$Res> {
  _$OrgCreatePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceCreatePayloadImplCopyWith<$Res>
    implements $OrgCreatePayloadCopyWith<$Res> {
  factory _$$WorkspaceCreatePayloadImplCopyWith(
          _$WorkspaceCreatePayloadImpl value,
          $Res Function(_$WorkspaceCreatePayloadImpl) then) =
      __$$WorkspaceCreatePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String phone,
      String firstName,
      String lastName,
      String password});
}

/// @nodoc
class __$$WorkspaceCreatePayloadImplCopyWithImpl<$Res>
    extends _$OrgCreatePayloadCopyWithImpl<$Res, _$WorkspaceCreatePayloadImpl>
    implements _$$WorkspaceCreatePayloadImplCopyWith<$Res> {
  __$$WorkspaceCreatePayloadImplCopyWithImpl(
      _$WorkspaceCreatePayloadImpl _value,
      $Res Function(_$WorkspaceCreatePayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
  }) {
    return _then(_$WorkspaceCreatePayloadImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceCreatePayloadImpl implements _WorkspaceCreatePayload {
  const _$WorkspaceCreatePayloadImpl(
      {required this.name,
      required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.password});

  factory _$WorkspaceCreatePayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceCreatePayloadImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;

  @override
  String toString() {
    return 'OrgCreatePayload(name: $name, email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceCreatePayloadImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, email, phone, firstName, lastName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceCreatePayloadImplCopyWith<_$WorkspaceCreatePayloadImpl>
      get copyWith => __$$WorkspaceCreatePayloadImplCopyWithImpl<
          _$WorkspaceCreatePayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceCreatePayloadImplToJson(
      this,
    );
  }
}

abstract class _WorkspaceCreatePayload implements OrgCreatePayload {
  const factory _WorkspaceCreatePayload(
      {required final String name,
      required final String email,
      required final String phone,
      required final String firstName,
      required final String lastName,
      required final String password}) = _$WorkspaceCreatePayloadImpl;

  factory _WorkspaceCreatePayload.fromJson(Map<String, dynamic> json) =
      _$WorkspaceCreatePayloadImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$WorkspaceCreatePayloadImplCopyWith<_$WorkspaceCreatePayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
