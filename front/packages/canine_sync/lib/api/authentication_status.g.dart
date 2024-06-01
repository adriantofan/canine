// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationStatusUnknownImpl _$$AuthenticationStatusUnknownImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationStatusUnknownImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthenticationStatusUnknownImplToJson(
        _$AuthenticationStatusUnknownImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AuthenticationStatusUnauthenticatedImpl
    _$$AuthenticationStatusUnauthenticatedImplFromJson(
            Map<String, dynamic> json) =>
        _$AuthenticationStatusUnauthenticatedImpl(
          json['identity'] == null
              ? null
              : Identity.fromJson(json['identity'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AuthenticationStatusUnauthenticatedImplToJson(
        _$AuthenticationStatusUnauthenticatedImpl instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'runtimeType': instance.$type,
    };

_$AuthenticationStatusAuthenticatedImpl
    _$$AuthenticationStatusAuthenticatedImplFromJson(
            Map<String, dynamic> json) =>
        _$AuthenticationStatusAuthenticatedImpl(
          Identity.fromJson(json['identity'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$AuthenticationStatusAuthenticatedImplToJson(
        _$AuthenticationStatusAuthenticatedImpl instance) =>
    <String, dynamic>{
      'identity': instance.identity,
      'runtimeType': instance.$type,
    };
