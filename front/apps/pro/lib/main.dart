import 'package:applib/applib.dart';
import 'package:applib/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'config.dart';
import 'router.dart';

void main() async {
  // setLogging();
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (record.error != null || record.stackTrace != null) {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ❗️${record.message} ${record.error} ${record.stackTrace}');
    } else {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
  // usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Config().loadConfig();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  final authRepository = AuthRepository(
    oidcUrl: Config().oidcUrl,
    appClientId: Config().appClientId,
    appProjectId: Config().appProjectId,
    endUserOrganizationId: Config().endUserOrganizationId,
    callbackUrlScheme: Config().callbackUrlScheme,
    // apiClient: APIClientBase(Config().apiBase, Config().wsBase),
  );
  final apiClient = APIClientBase(Config().apiBase, Config().wsBase);
  authRepository.init();
  final syncSessionRepository =
      SyncSessionRepository(Config().apiBase, Config().wsBase);
  initAppLib(AppType.pro);
  AppRouter.instance; // Make sure the router is initialized when app starts
  final prefs = PersistentPreferences();
  await prefs.init();
  final (lastWorkspaceId, lastConversationId) = await prefs.getLastWorkspace();
  runApp(MainApp(
    authRepository: authRepository,
    apiClient: apiClient,
    syncSessionRepository: syncSessionRepository,
    router: AppRouter.router,
    appType: AppType.clemia,
    preferences: prefs,
    lastWorkspaceId: lastWorkspaceId,
    lastConversationId: lastConversationId,
  ));
}
