import 'path.dart';

class AppRoutes {
  static const RootPath wellcome = RootPath(path: '/wellcome');
  static const RootPath slash = RootPath(path: '/');
  static const WorkspacePath switchWorkspace =
      WorkspacePath(subPath: '/switch-workspace');
  static const RootPath login = RootPath(path: '/login');
  static const WorkspacePath createAccount =
      WorkspacePath(subPath: '/create-account');
  static const WorkspacePath confirmPassword =
      WorkspacePath(subPath: '/confirm-password');

  static const WorkspacePath home = WorkspacePath(subPath: '/home');
  static final ConversationPath homeConversation = ConversationPath(home);
  static const WorkspacePath homeNew = WorkspacePath(subPath: '/new');
  static const WorkspacePath settings = WorkspacePath(subPath: '/settings');
  static const RootPath logout = RootPath(path: '/logout');
}
