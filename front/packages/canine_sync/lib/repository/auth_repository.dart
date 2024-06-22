import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';
import 'package:rxdart/rxdart.dart';

import '../canine_sync.dart';

class AuthRepository {
  // Zitadel url + client id.
  /// you can replace String.fromEnvironment(*) calls with the actual values
  /// if you don't want to pass them dynamically.
  // final zitadelIssuer = Uri.parse(const String.fromEnvironment('zitadel_url'));
  // const zitadelClientId = String.fromEnvironment('zitadel_client_id');
  late final Uri oidcUrl;
  final String appClientId;
  final String appProjectId;
  final String endUserOrganizationId; // clemia-dev
  /// This should be the app's bundle id.
  final String callbackUrlScheme;

  /// This will be the current url of the page + /auth.html added to it.
  final baseUri = Uri.base;
  final webCallbackUrl = Uri.base.replace(path: 'auth.html').removeFragment();

  /// for web platforms, we use http://website-url.com/auth.html
  ///
  /// for mobile platforms, we use `com.zitadel.zitadelflutter:/`
  late final redirectUri;
  late final OidcUserManager userManager;
  final _logger = Logger('AuthRepository');

  AuthRepository({
    required this.oidcUrl,
    required this.appClientId,
    required this.appProjectId,
    required this.endUserOrganizationId,
    required this.callbackUrlScheme,
  }) {
    redirectUri =
        kIsWeb ? webCallbackUrl : Uri(scheme: callbackUrlScheme, path: '/');
    userManager = OidcUserManager.lazy(
      discoveryDocumentUri: OidcUtils.getOpenIdConfigWellKnownUri(oidcUrl),
      clientCredentials: OidcClientAuthentication.none(clientId: appClientId),
      store: OidcDefaultStore(),
      settings: OidcUserManagerSettings(
        redirectUri: redirectUri,
        // the same redirectUri can be used as for post logout too.
        postLogoutRedirectUri: redirectUri,
        scope: [
          'openid',
          'profile',
          'email',
          'phone',
          'offline_access',
          // adds the following in to the claims
          // urn:zitadel:iam:user:metadata: {0000001: YXNzaXN0YW50}
          'urn:zitadel:iam:user:metadata',
          //
          'urn:zitadel:iam:org:projects:roles',
          // Unclear how this is used
          'urn:zitadel:iam:org:project:id:$appProjectId:aud',
          // We make calls on behalf of the user on the server size
          'urn:zitadel:iam:org:project:id:zitadel:aud'
          // this is where the non matched users land in
          // also possible to have a default instance organization
          // 'urn:zitadel:iam:org:id:${endUserOrganizationId}',
          // 'urn:zitadel:iam:action:make_api_call:log'
          // 'urn:zitadel:iam:org:project:id:268388710280641701' <- this needs to be the project id for the backend application
        ],
      ),
    );
  }
  void init() async {
    await userManager.init().whenComplete(() {
      _logger.fine('User manager initialized: ${userManager.currentUser}');
      processUserChanges();
    });
  }

  void dispose() {
    _subscription?.cancel();
  }

  Future<void> login({
    String? loginHint,
    bool createAccount = false,
  }) async {
    List<String>? prompt;
    if (createAccount) {
      prompt = ['create'];
    }

    await userManager.loginAuthorizationCodeFlow(
        loginHint: loginHint, promptOverride: prompt);
  }

  Future<void> logout() async {
    await userManager.logout();
  }

  bool get isAuthenticated => _authStatus.value is AuthStatusAuthenticated;
  ProjectRoles get roles => _roles;
  Stream<AuthStatus> get authStatusChanges => _authStatus.stream;

  final _authStatus =
      BehaviorSubject<AuthStatus>.seeded(const AuthStatus.unknown());

  StreamSubscription<dynamic>? _subscription;
  ProjectRoles _roles = {};
  void processUserChanges() {
    // _subscription = userManager.userChanges().

    // TODO: the skip(1) is a workaround for the initial value being null.
    // Unclear if this is the right approach

    _subscription = userManager.userChanges().listen((user) {
      _logger.fine('User changed: $user');
      if (user == null) {
        _authStatus.add(const AuthStatus.disconnected());
        _roles = {};
        return;
      }
      try {
        final newRoles = parseRoles(appProjectId, user.aggregatedClaims);
        _roles = newRoles;
        _authStatus.add(AuthStatus.authenticated(
            newRoles, user.uidRequired, user.token.accessToken!));
      } catch (e, st) {
        _authStatus.addError(e, st);
      }
    });
  }
}
