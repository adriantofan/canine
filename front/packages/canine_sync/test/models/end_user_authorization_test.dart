import 'dart:convert';

import 'package:canine_sync/canine_sync.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    final json =
        jsonDecode('{"authorized":true,"code":"granted_email", "hint":"hint"}');
    final authz = EndUserAuthorization.fromJson(json);
    expect(
      authz,
      const EndUserAuthorization(
          authorized: true,
          code: EndUserAuthorizationCode.grantedEmail,
          hint: 'hint'),
    );
  });
}
