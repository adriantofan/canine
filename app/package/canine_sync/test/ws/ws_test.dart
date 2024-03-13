import 'dart:convert';

import 'package:canine_sync/canine_sync.dart';
import 'package:test/test.dart';

void main() {
  test('decode json', () {
    var jsontxt = """{
      "kind": "message",
      "data": [
        {
          "id": 1,
          "conversationId": 1,
          "senderId": 1,
          "message": "Hello",
          "type": "text",
          "createdAt": 1620000000
        }
      ]
    }""";

    var msg = APIServerUpdate.fromJson(jsonDecode(jsontxt));
    expect(msg, isA<APIServerUpdateMessage>());
  });
}
