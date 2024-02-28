import 'dart:convert';

import 'package:canine_sync/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('serialize round trip', () {
    final createdAt = DateTime(2024, 1, 29, 10, 44, 10, 480);
    final updatedAt = createdAt.add(const Duration(seconds: 1));
    final user = User(
        id: 1,
        workspaceId: 1,
        messagingAddress: "adr",
        type: "t",
        createdAt: createdAt,
        updatedAt: updatedAt);
    final encoded = jsonEncode(user.toJson());
    final decoded = jsonDecode(encoded);
    final userActual = User.fromJson(decoded);
    expect(userActual, user);
  });
}
