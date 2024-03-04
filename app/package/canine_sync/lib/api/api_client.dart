import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/api_error.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';
import '../secure_storage/secure_storage.dart';
import 'authentication_status.dart';
import 'credential_set.dart';

// enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClient {
  final _apiBase = 'http://localhost:8080';
  final _wsBase = 'ws://localhost:8080';
  CredentialSet? _credential;
  final SecureStorage _secureStorage;
  APIClient(this._secureStorage);

  final _controller = StreamController<AuthenticationStatus>.broadcast();
  var _authStatus = AuthenticationStatus.unknown();

  void dispose() => _controller.close();

  Stream<AuthenticationStatus> get authStatus async* {
    yield _authStatus;
    await for (var status in _controller.stream) {
      yield status;
    }
  }

  Future<void> init() async {
    final credential = await _secureStorage.getCredentials();
    if (credential == null) {
      print('No credential found in storage');
      _authStatus = AuthenticationStatus.unauthenticated(null);
      _controller.add(_authStatus);
      return;
    }

    _credential = credential;

    if (credential.isAuthenticated) {
      if (!credential.authExpired) {
        _refreshTokenAsync();
        _authStatus = AuthenticationStatus.authenticated(credential.identity);
      } else {
        // How could this happen?
        _authStatus = AuthenticationStatus.unauthenticated(credential.identity);
      }
    } else {
      _authStatus = AuthenticationStatus.unauthenticated(credential.identity);
    }
    _controller.add(_authStatus);
    print(
        'Credential loaded from storage: $_workspaceId/$_userId expiration ${credential.tokenExpiration}');
  }

  // Caller can fire and forget. This function must not throw an exception
  // because the caller does not handle it.
  Future<void> _refreshTokenAsync() async {
    final credential = _credential;
    if (credential != null) {
      try {
        await refreshToken();
      } catch (e) {
        print('Periodic token refresh failed: $e');
        //
      }
    }
  }

  get _workspaceId => _credential?.identity.workspaceId;
  get _userId => _credential?.identity.userId;
  get _token => _credential?.token;

  Future<void> logout() async {
    updateCredential(null);
    _authStatus = AuthenticationStatus.unauthenticated(null);
    _controller.add(_authStatus);
  }

  Future<void> updateCredential(CredentialSet? credential) async {
    _credential = credential;
    await _secureStorage.setCredentials(credential);
    print(
        'Credential updated in storage: $_workspaceId/$_userId expiration ${credential?.tokenExpiration}');
  }

  Future<RTCRemoteUpdate> rtcSession(RtcRemote state) async {
    final response =
        await postJSON('/$_workspaceId/users/$_userId/rtc/session', state);
    return RTCRemoteUpdate.fromJson(response);
  }

  Uri rtcConnectionUri(String syncToken) {
    return Uri.parse(
        '$_wsBase/$_workspaceId/users/$_userId/rtc/connect?syncToken=$syncToken&token=$_token');
  }

  Future<void> login(int workspaceId, String username, String password) async {
    // TODO: handle login/logout/refresh race conditions
    final response = await postJSON(
      '/login',
      {
        'workspace_id': workspaceId,
        'username': username,
        'password': password,
      },
    );

    try {
      updateCredential(CredentialSet.fromJWT(response['token'], username));
      _authStatus = AuthenticationStatus.authenticated(_credential!.identity);
      _controller.add(_authStatus);
      return;
    } catch (e) {
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<void>? _refreshTokenFuture;

  Future<void> refreshToken() async {
    if (_refreshTokenFuture != null) {
      return _refreshTokenFuture;
    }
    _refreshTokenFuture = () async {
      try {
        final response = await postJSON('/$_workspaceId/refresh_token', {},
            skipRefresh: true);
        updateCredential(CredentialSet.fromJWT(
            response['token'], _credential!.identity.username));
      } on APIError catch (e) {
        if (e.code == kServerUnauthorized || e.code == kServerInvalidRequest) {
          if (e.code == kServerInvalidRequest) {
            print(
                'Invalid request during token refresh - this is a bug in the client');
          }
          _authStatus =
              AuthenticationStatus.unauthenticated(_credential?.identity);
          _controller.add(_authStatus);
          return;
        }
        rethrow;
      } finally {
        _refreshTokenFuture = null;
      }
    }();
    return _refreshTokenFuture;
  }

  Future<dynamic> postJSON(String path, Object? body,
      {bool skipRefresh = false}) async {
    try {
      return await _postJSON(path, body, skipRefresh: skipRefresh);
    } catch (e) {
      print('Error POST $path: $e');
      rethrow;
    }
  }

  Future<void> _refreshTokenIfNeeded() async {
    if (_credential != null &&
        _credential!.tokenExpiration != null &&
        _credential!.tokenExpiration!.isAfter(
            DateTime.now().subtract(Constants.api.tokenRefreshThreshold))) {
      await refreshToken();
    }
  }

  Future<dynamic> _postJSON(String path, Object? body,
      {bool skipRefresh = false}) async {
    assert(path.startsWith('/'));

    // proactively refresh the token if it's about to expire except when
    // explicitly told to skip the refresh (e.g. during a refresh token request)
    if (_credential != null && !skipRefresh) {
      await _refreshTokenIfNeeded();
    }

    final headers = {
      'Content-Type': 'application/json',
      if (_credential?.token != null)
        'Authorization': 'Bearer ${_credential!.token}'
    };
    final http.Response response;
    try {
      response = await http.post(
        Uri.parse('$_apiBase$path'),
        headers: headers,
        body: jsonEncode(body),
      );
    } catch (e) {
      throw APIError.unableToMakeRequest(e);
    }

    final dynamic decoded;
    try {
      decoded = jsonDecode(response.body);
    } catch (e) {
      print(response.body);
      throw APIError.invalidResponse(e.toString());
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      throw APIError.serverError(decoded);
    }
  }
}
