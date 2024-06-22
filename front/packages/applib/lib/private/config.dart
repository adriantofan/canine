import '../app/bloc/app_bloc.dart';

class AppLibConfig {
  static AppLibConfig? _instance;
  static AppLibConfig get instance => _instance!;

  final AppType appType;
  AppLibConfig({required this.appType});
  static void init({required AppType appType}) {
    _instance = AppLibConfig(appType: appType);
  }
}
