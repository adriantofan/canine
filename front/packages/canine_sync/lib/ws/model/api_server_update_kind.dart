import 'package:json_annotation/json_annotation.dart';

enum APIServerUpdateKind { create, update, delete }

// Custom converter for APIServerUpdateKind
class APIServerUpdateKindConverter
    implements JsonConverter<APIServerUpdateKind, String> {
  const APIServerUpdateKindConverter();

  @override
  APIServerUpdateKind fromJson(String json) {
    switch (json) {
      case 'create':
        return APIServerUpdateKind.create;
      case 'update':
        return APIServerUpdateKind.update;
      case 'delete':
        return APIServerUpdateKind.delete;
      default:
        throw ArgumentError.value(json, 'json', 'Invalid APIServerUpdateKind');
    }
  }

  @override
  String toJson(APIServerUpdateKind object) {
    switch (object) {
      case APIServerUpdateKind.create:
        return 'create';
      case APIServerUpdateKind.update:
        return 'update';
      case APIServerUpdateKind.delete:
        return 'delete';
    }
  }
}
