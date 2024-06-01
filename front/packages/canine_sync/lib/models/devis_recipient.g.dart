// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devis_recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DevisRecipientImpl _$$DevisRecipientImplFromJson(Map<String, dynamic> json) =>
    _$DevisRecipientImpl(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$DevisRecipientImplToJson(
        _$DevisRecipientImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
    };
