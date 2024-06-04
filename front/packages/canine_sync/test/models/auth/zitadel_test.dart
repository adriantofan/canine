// tes parseRoles method
// Path: test/models/auth/zitadel_test.dart

import 'package:canine_sync/models/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const projectID = '268939777150031116';
  final roles = {
    'urn:zitadel:iam:org:project:268939777150031116:roles': {
      'wksp_admin': {
        '269409655246049911': 'dr-emma.clemia-test-cudifn.zitadel.cloud'
      }
    }
  };

  test('parseRoles', () {
    final result = parseRoles(projectID, roles);
    expect(result, {
      Role.wkspAdmin: [269409655246049911]
    });
  });
  test('parseRoles with empty roles', () {
    final result = parseRoles(projectID, {});
    expect(result, {});
  });
  test('parseRoles with empty roles map', () {
    final result = parseRoles(projectID,
        {'urn:zitadel:iam:org:project:268939777150031116:roles': {}});
    expect(result, {});
  });
  test('parseRoles with empty project roles map', () {
    final result = parseRoles(projectID, {
      'urn:zitadel:iam:org:project:268939777150031116:roles': {'wksp_admin': {}}
    });
    expect(result, {});
  });
  test('parseRoles with another project', () {
    final result = parseRoles('123', roles);
    expect(result, {});
  });
  test('parseRoles with non existent roles', () {
    try {
      final result = parseRoles(projectID, {
        'urn:zitadel:iam:org:project:268939777150031116:roles': {
          'non_existent': {"123": "dr-emma.clemia-test-cudifn.zitadel.cloud"}
        }
      });
    } catch (e) {
      expect(e, isA<ArgumentError>());
      return;
    }
    fail('Should have thrown an ArgumentError');
  });
}
