import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

import '../canine_sync.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClient {
  var _token = '';
  var _userId = 0;
  var _workspaceId = 0;

  final _controller = StreamController<AuthenticationStatus>.broadcast();
  var _authStatus = AuthenticationStatus.unknown;
  void dispose() => _controller.close();

  Stream<AuthenticationStatus> get authStatus async* {
    yield _authStatus;
    yield* _controller.stream;
  }

  Future<void> logout() async {
    _userId = 0;
    _workspaceId = 0;
    _token = '';
    _authStatus = AuthenticationStatus.unauthenticated;
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<RTCRemoteUpdate> rtcSession(RtcRemote state) async {
    final response =
        await postJSON('$_workspaceId/users/$_userId/rtc/session', state);
    return RTCRemoteUpdate.fromJson(response);
  }

  Future<User> login(
      Int64 workspaceID, String username, String password) async {
    final response = await postJSON(
      '/login',
      {
        'workspace_id': workspaceID,
        'username': username,
        'password': password,
      },
    );

    try {
      final user = User.fromJson(response['user']);
      _token = response['token'];
      _authStatus = AuthenticationStatus.authenticated;
      _userId = user.id;
      _workspaceId = user.workspaceId;
      _controller.add(AuthenticationStatus.authenticated);
      return user;
    } catch (e) {
      // TODO: handle error - Invalid content in response
      throw Exception('Failed to login');
    }
  }

  Future<void> refreshToken() async {
    final response = await postJSON('/refreshToken', {});
    // TODO: if response is not authorized, then logout
    _token = response['token'];
  }

  Future<dynamic> postJSON(String path, Object? body) async {
    final headers = {
      'Content-Type': 'application/json',
      if (_token.isNotEmpty) 'Authorization': 'Bearer $_token'
    };

    final response = await http.post(
      Uri.parse('https://api.example.com/$path'),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post JSON');
    }
    // TODO: handle errors and refresh token
    // Need to define a common error format , and decode it here
  }
}
