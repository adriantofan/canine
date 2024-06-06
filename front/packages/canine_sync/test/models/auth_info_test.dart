import 'dart:convert';

import 'package:canine_sync/models/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deserialize auth info', () {
    final jsonMap = jsonDecode("""  {
          "user": {
            "id": 1,
            "workspace_id": 1717076668746,
            "email": "emma@example.com",
            "type": "internal",
            "created_at": 1717076667920,
            "updated_at": 1717076667920,
            "phone": null
          },
          "workspace": {
            "id": 1717076668746,
            "name": "Dr. Emma",
            "created_at": 1717076667920,
            "updated_at": 1717076667920
          }
        }
       """);
    final authInfo = AuthInfo.fromJson(jsonMap);
    final expected = AuthInfo(
        user: User(
            id: 1,
            workspaceId: 1717076668746,
            email: "emma@example.com",
            type: UserType.internal,
            createdAt: DateTime.fromMillisecondsSinceEpoch(1717076667920),
            updatedAt: DateTime.fromMillisecondsSinceEpoch(1717076667920),
            phone: ''),
        workspace: Workspace(
          id: 1717076668746,
          name: "Dr. Emma",
          createdAt: DateTime.fromMillisecondsSinceEpoch(1717076667920),
          updatedAt: DateTime.fromMillisecondsSinceEpoch(1717076667920),
        ));
    expect(authInfo, expected);
  });
}
