import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app/app.dart';
import 'app/routes/routes.dart';
import 'config.dart';

void main() async {
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

  final sync = await start(Config().apiBase, Config().wsBase);
  final syncRepository = SyncRepository(sync);
  final authRepository = AuthRepository(
    oidcUrl: Config().oidcUrl,
    appClientId: Config().appClientId,
    appProjectId: Config().appProjectId,
    endUserOrganizationId: Config().endUserOrganizationId,
    callbackUrlScheme: Config().callbackUrlScheme,
    // apiClient: APIClientBase(Config().apiBase, Config().wsBase),
  );
  authRepository.init();
  AppRouter.instance; // Make sure the router is initialized when app starts
  runApp(MainApp(
    syncRepository: syncRepository,
    authRepository: authRepository,
  ));
}
