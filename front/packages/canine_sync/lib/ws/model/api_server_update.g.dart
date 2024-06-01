// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_server_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$APIServerUpdateInvalidImpl _$$APIServerUpdateInvalidImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerUpdateInvalidImpl(
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$APIServerUpdateInvalidImplToJson(
        _$APIServerUpdateInvalidImpl instance) =>
    <String, dynamic>{
      'type': instance.$type,
    };

_$APIServerUpdateUsersImpl _$$APIServerUpdateUsersImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerUpdateUsersImpl(
      const APIServerUpdateKindConverter().fromJson(json['kind'] as String),
      User.fromJson(json['data'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$APIServerUpdateUsersImplToJson(
        _$APIServerUpdateUsersImpl instance) =>
    <String, dynamic>{
      'kind': const APIServerUpdateKindConverter().toJson(instance.kind),
      'data': instance.data,
      'type': instance.$type,
    };

_$APIServerUpdateMessageImpl _$$APIServerUpdateMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerUpdateMessageImpl(
      const APIServerUpdateKindConverter().fromJson(json['kind'] as String),
      Message.fromJson(json['data'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$APIServerUpdateMessageImplToJson(
        _$APIServerUpdateMessageImpl instance) =>
    <String, dynamic>{
      'kind': const APIServerUpdateKindConverter().toJson(instance.kind),
      'data': instance.data,
      'type': instance.$type,
    };

_$APIServerUpdateConversationImpl _$$APIServerUpdateConversationImplFromJson(
        Map<String, dynamic> json) =>
    _$APIServerUpdateConversationImpl(
      const APIServerUpdateKindConverter().fromJson(json['kind'] as String),
      Conversation.fromJson(json['data'] as Map<String, dynamic>),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$APIServerUpdateConversationImplToJson(
        _$APIServerUpdateConversationImpl instance) =>
    <String, dynamic>{
      'kind': const APIServerUpdateKindConverter().toJson(instance.kind),
      'data': instance.data,
      'type': instance.$type,
    };
