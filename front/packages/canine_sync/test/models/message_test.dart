import 'dart:convert';

import 'package:canine_sync/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('serialize userType', () {
    final jsonTxt = jsonEncode({
      'type': UserType.external,
    });
    expect(jsonTxt, '{"type":"external"}');
    expect(UserType.fromJson('external'), UserType.external);
  });

  test('serialize round trip', () {
    final createdAt = DateTime(2024, 1, 29, 10, 44, 10, 480);
    final updatedAt = createdAt.add(const Duration(seconds: 1));
    final user = User(
        id: 1,
        workspaceId: 1,
        email: "adr",
        type: UserType.external,
        phone: "1234567890",
        createdAt: createdAt,
        updatedAt: updatedAt);
    final encoded = jsonEncode(user.toJson());
    final decoded = jsonDecode(encoded);
    final userActual = User.fromJson(decoded);
    expect(userActual, user);
  });
}
