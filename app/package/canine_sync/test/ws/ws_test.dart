import 'dart:convert';

import 'package:canine_sync/canine_sync.dart';
import 'package:test/test.dart';

void main() {
  test('decode json', () {
    var jsontxt = """{
      "kind": "messages",
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

    var msg = APIServerMessage.fromJson(jsonDecode(jsontxt));
    expect(msg, isA<APIServerMessageMessages>());
    switch (msg) {
      case APIServerMessageConversations():
        print(msg);
      case APIServerMessageMessages():
        takesM(msg);
      case APIServerMessageInvalid():
        print("Invalid");
      default:
        throw Exception("not tested");
    }
  });
}

void takesM(APIServerMessageMessages msg) {
  print(msg.data);
}
