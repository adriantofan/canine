class Config {
  static final Config _instance = Config._internal();

  factory Config() {
    return _instance;
  }

  Config._internal();

  late final String apiBase;
  late final String wsBase;
  late final Uri oidcUrl;
  late final String appClientId;
  late final String appProjectId;
  late final String endUserOrganizationId;
  late final String callbackUrlScheme;

  Future<void> loadConfig() async {
    apiBase = const String.fromEnvironment('API_BASE',
        defaultValue: 'https://bjrdoc.fr/api/v1');
    wsBase = const String.fromEnvironment('WS_BASE',
        defaultValue: 'https://bjrdoc.fr/api/v1');
    oidcUrl = Uri.parse(const String.fromEnvironment('OIDC_URL',
        defaultValue: 'https://clemia-test-cudifn.zitadel.cloud'));
    appClientId = const String.fromEnvironment('APP_CLIENT_ID',
        defaultValue: '268939975775556876@clemia'); //clemia-dev/clemia/app,
    appProjectId = const String.fromEnvironment('APP_PROJECT_ID',
        defaultValue: '268939777150031116'); // clemia-dev/clemia,
    endUserOrganizationId = const String.fromEnvironment('END_USER_ORG_ID',
        defaultValue: '268939597935809804'); // clemia-dev,
    callbackUrlScheme = const String.fromEnvironment('CALLBACK_URL_SCHEME',
        defaultValue: 'fr.clemia.proapp');
  }
}
