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

_$AuthStatusAuthenticatedImpl _$$AuthStatusAuthenticatedImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusAuthenticatedImpl(
      (json['roles'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$RoleEnumMap, k),
            (e as List<dynamic>).map((e) => (e as num).toInt()).toList()),
      ),
      json['auth_id'] as String,
      json['token'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusAuthenticatedImplToJson(
        _$AuthStatusAuthenticatedImpl instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((k, e) => MapEntry(_$RoleEnumMap[k]!, e)),
      'auth_id': instance.authId,
      'token': instance.token,
      'runtimeType': instance.$type,
    };

const _$RoleEnumMap = {
  Role.wkspAdmin: 'wkspAdmin',
  Role.user: 'user',
};
