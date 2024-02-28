import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_error.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';
import '../secure_storage/secure_storage.dart';
import 'credential.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClient {
  var _apiBase = 'http://localhost:8080';
  var _wsBase = 'ws://localhost:8080';
  Credential? _credential = null;
  SecureStorage _secureStorage;
  APIClient(this._secureStorage);

  final _controller = StreamController<AuthenticationStatus>.broadcast();
  var _authStatus = AuthenticationStatus.unknown;
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
      return;
    }
    _credential = credential;
    _authStatus = AuthenticationStatus.authenticated;
    _controller.add(AuthenticationStatus.authenticated);
    print(
        'Credential loaded from storage: ${_credential?.workspaceId}/${_credential?.userId}');
  }

  Future<void> logout() async {
    updateCredential(null);
    _authStatus = AuthenticationStatus.unauthenticated;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> updateCredential(Credential? credential) async {
    _credential = credential;
    await _secureStorage.setCredentials(credential);
    print(
        'Credential updated in storage: ${_credential?.workspaceId}/${_credential?.userId}');
  }

  Future<RTCRemoteUpdate> rtcSession(RtcRemote state) async {
    final response = await postJSON(
        '${_credential!.workspaceId}/users/${_credential!.userId}/rtc/session',
        state);
    return RTCRemoteUpdate.fromJson(response);
  }

  Uri rtcConnectionUri(String syncToken) {
    return Uri.parse(
        '$_wsBase/${_credential!.workspaceId}/users/${_credential!.userId}/rtc/connect?syncToken=$syncToken&token=${_credential!.token}');
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
      updateCredential(Credential.fromJWT(response['token']));
      _authStatus = AuthenticationStatus.authenticated;
      _controller.add(AuthenticationStatus.authenticated);
      return;
    } catch (e) {
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<void> refreshToken() async {
    final response = await postJSON('/refreshToken', {});
    // TODO: if response is not authorized, then logout
    updateCredential(Credential.fromJWT(response['token']));
  }

  Future<dynamic> postJSON(String path, Object? body) async {
    try {
      return await _postJSON(path, body);
    } catch (e) {
      print('Error POST $path: $e');
      rethrow;
    }
  }

  Future<dynamic> _postJSON(String path, Object? body) async {
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

    final decoded;
    try {
      decoded = jsonDecode(response.body);
      // TODO: handle token expiration
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
