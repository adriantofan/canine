import 'dart:convert';

import 'package:app/state/ws.dart';
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

    var msg = ServerMessage.fromJson(jsonDecode(jsontxt));
    expect(msg, isA<ServerMessageMessages>());
    switch (msg) {
      case ServerMessageConversations():
        print(msg);
      case ServerMessageMessages():
        takesM(msg);
      case ServerMessageInvalid():
        print("Invalid");
    }
  });
}

void takesM(ServerMessageMessages msg) {
  print(msg.data);
}
