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

_$AuthStatusRestrictedImpl _$$AuthStatusRestrictedImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthStatusRestrictedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusRestrictedImplToJson(
        _$AuthStatusRestrictedImpl instance) =>
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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AuthStatusAuthenticatedImplToJson(
        _$AuthStatusAuthenticatedImpl instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((k, e) => MapEntry(_$RoleEnumMap[k]!, e)),
      'runtimeType': instance.$type,
    };

const _$RoleEnumMap = {
  Role.wkspAdmin: 'wkspAdmin',
};
