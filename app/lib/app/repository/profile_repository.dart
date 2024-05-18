import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileRepository {
  Future<int?> get workspaceId;
  Future<void> setWorkspaceId(int? workspaceId);
}

class ProfileRepositorySharedPreferences implements ProfileRepository {
  static SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get instance async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  @override
  Future<void> setWorkspaceId(int? workspaceId) async {
    final prefs = await instance;
    if (workspaceId == null) {
      await prefs.remove('workspaceId');
      return;
    }
    await prefs.setInt('workspaceId', workspaceId);
  }

  @override
  Future<int?> get workspaceId async {
    final prefs = await instance;
    return prefs.getInt('workspaceId');
  }
}
