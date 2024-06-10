// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_create_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkspaceCreatePayloadImpl _$$WorkspaceCreatePayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkspaceCreatePayloadImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$WorkspaceCreatePayloadImplToJson(
        _$WorkspaceCreatePayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'password': instance.password,
    };
