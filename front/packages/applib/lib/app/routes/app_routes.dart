import '../../routes/path.dart';

class AppRoutes {
  // Should be enabled only for proapp
  static const RootPath createOrg = RootPath(path: '/create-org');

  static const RootPath wellcome = RootPath(path: '/wellcome');
  // This should be different in the pro app vs user app depending on the
  // user's role. For the enduser app, this should link.
  static const RootPath restricted = RootPath(path: '/restricted');
  static const RootPath slash = RootPath(path: '/');
  static const RootPath login = RootPath(path: '/login');
  static const RootPath error = RootPath(path: '/error');

  static const WorkspacePath home = WorkspacePath(subPath: '/home');

  static const RootPath logout = RootPath(path: '/logout');
}
