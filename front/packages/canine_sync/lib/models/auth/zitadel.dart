import 'role.dart';

/*
parseRoles method is used to parse the roles from the user claims. Given below is the sample user claims:
{
    "urn:zitadel:iam:org:project:268939777150031116:roles": {
        "wksp_admin": {
            "269409655246049911": "dr-emma.clemia-test-cudifn.zitadel.cloud"
        }
    }
}
it returns the roles in the following format:
  {
   wksp_admin: [269409655246049911]
   }
*/
typedef ProjectRoles = Map<Role, List<int>>;

ProjectRoles parseRoles(String projectID, Map<String, dynamic> roles) {
  final ProjectRoles parsedRoles = {};
  final rolesMap = roles['urn:zitadel:iam:org:project:$projectID:roles'];
  if (rolesMap != null && rolesMap is Map<String, dynamic>) {
    for (final role in rolesMap.keys) {
      if (rolesMap[role] is Map<String, dynamic>) {
        final roleMap = rolesMap[role] as Map<String, dynamic>;
        final List<int> roleIds = [];
        for (final roleId in roleMap.keys) {
          roleIds.add(int.parse(roleId));
        }
        parsedRoles[RoleExtension.fromName(role)] = roleIds;
      }
    }
  }
  return parsedRoles;
}
