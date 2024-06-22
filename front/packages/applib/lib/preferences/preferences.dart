import 'package:shared_preferences/shared_preferences.dart';

class PersistentPreferences {
  late SharedPreferences prefs;
  static const String workspaceKey = 'workspace';
  static const String conversationKey = 'conversation';

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<(int?, int?)> getLastWorkspace() async {
    final workspaceId = prefs.getInt(workspaceKey);
    final conversationId = prefs.getInt(conversationKey);
    return (workspaceId, conversationId);
  }

  Future<void> setLastWorkspace(int? workspaceId, int? conversationId) async {
    if (workspaceId != null) {
      await prefs.setInt(workspaceKey, workspaceId);
    } else {
      await prefs.remove(workspaceKey);
    }

    if (conversationId != null) {
      await prefs.setInt(conversationKey, conversationId);
    } else {
      await prefs.remove(conversationKey);
    }
  }
}
