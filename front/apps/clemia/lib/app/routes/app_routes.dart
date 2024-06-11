import 'package:applib/applib.dart';

class AppRoutes {
  static const RootPath wellcome = RootPath(path: '/wellcome');
  static const RootPath restricted = RootPath(path: '/restricted');
  static const RootPath slash = RootPath(path: '/');
  static const RootPath login = RootPath(path: '/login');

  static const WorkspacePath home = WorkspacePath(subPath: '/home');
  static const WorkspacePath homeConversation =
      WorkspacePath(subPath: '/conversation');
  static const RootPath logout = RootPath(path: '/logout');
}
