// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStatusUnknownImpl _$$AuthStatusUnknownImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusUnknownImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusUnknownImplToJson(
        _$AuthStatusUnknownImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AuthStatusDisconnectedImpl _$$AuthStatusDisconnectedImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusDisconnectedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusDisconnectedImplToJson(
        _$AuthStatusDisconnectedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AuthStatusLoginImpl _$$AuthStatusLoginImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusLoginImpl(
      $enumDecode(_$AuthStatusLoginStateEnumMap, json['state']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusLoginImplToJson(
        _$AuthStatusLoginImpl instance) =>
    <String, dynamic>{
      'state': _$AuthStatusLoginStateEnumMap[instance.state]!,
      'runtimeType': instance.$type,
    };

const _$AuthStatusLoginStateEnumMap = {
  AuthStatusLoginState.disconnected: 'disconnected',
  AuthStatusLoginState.connecting: 'connecting',
  AuthStatusLoginState.link: 'link',
  AuthStatusLoginState.rejected: 'rejected',
};

_$AuthStatusAuthenticatedImpl _$$AuthStatusAuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusAuthenticatedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusAuthenticatedImplToJson(
        _$AuthStatusAuthenticatedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
