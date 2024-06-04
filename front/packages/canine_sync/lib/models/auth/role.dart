enum Role {
  wkspAdmin,
  // add other roles as needed
}

extension RoleExtension on Role {
  static List<Role> adminRoles = [Role.wkspAdmin];
  String get name {
    switch (this) {
      case Role.wkspAdmin:
        return "wksp_admin";
      // add other roles as needed
      default:
        return "";
    }
  }

  static Role fromName(String name) {
    switch (name) {
      case "wksp_admin":
        return Role.wkspAdmin;
      // add other roles as needed
      default:
        throw ArgumentError("Unknown role: $name");
    }
  }
}
