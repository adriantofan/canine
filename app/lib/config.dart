class Config {
  static final Config _instance = Config._internal();

  factory Config() {
    return _instance;
  }

  Config._internal();

  late final String apiBase;
  late final String wsBase;

  Future<void> loadConfig() async {
    apiBase = const String.fromEnvironment('API_BASE',
        defaultValue: 'https://bjrdoc.fr');
    wsBase = const String.fromEnvironment('WS_BASE',
        defaultValue: 'https://bjrdoc.fr');
    print('API_BASE: $apiBase');
  }
}
