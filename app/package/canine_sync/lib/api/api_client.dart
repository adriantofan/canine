import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../canine_sync.dart';
import '../constants/constants.dart';
import '../models/paginated.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';
import '../secure_storage/secure_storage.dart';
import 'credential_set.dart';

// enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClient {
  static int kItemsPerPage = 25;
  final _apiBase = 'http://localhost:8080';
  final _wsBase = 'ws://localhost:8080';
  final _logger = Logger('APIClient');
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

  Future<Conversation> createConversation(
      {required String recipientMessagingAddress}) async {
    final response = await _postJSON('/$_workspaceId/conversations',
        {'recipient_messaging_address': recipientMessagingAddress});
    try {
      return Conversation.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse createConversation response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<User> createUser(
      {required String messagingAddress,
      required UserType userType,
      required String password}) async {
    final response = await _postJSON('/$_workspaceId/users', {
      'messaging_address': messagingAddress,
      'user_type': userType,
      'password': password,
    });

    try {
      return User.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse createUser response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<Message> createMessage(
      int conversationId, String text, String idempotencyId) async {
    final response = await _postJSON(
        '/$_workspaceId/conversations/$conversationId/messages',
        {'message': text});
    try {
      return Message.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse createMessage response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<Paginated<Message>> getConversationMessages(
      int conversationId, int? lastId) async {
    final response = await _getJSON(
        '/$_workspaceId/conversations/$conversationId/messages?lower_than=$lastId');
    try {
      final result = Paginated<Message>.fromJson(
          response, (json) => Message.fromJson(json as Map<String, dynamic>));
      return result;
    } catch (e) {
      _logger.severe('Failed to parse paginated response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<RTCRemoteUpdate> rtcSession(RtcRemote state) async {
    final response =
        await _postJSON('/$_workspaceId/users/$_userId/rtc/session', state);
    try {
      return RTCRemoteUpdate.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse rtc session response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Uri rtcConnectionUri(String syncToken) {
    return Uri.parse(
        '$_wsBase/$_workspaceId/users/$_userId/rtc/connect?sync_token=$syncToken&token=$_token');
  }

  Future<void> logout() async {
    _updateCredential(null);
    _authStatus = AuthenticationStatus.unauthenticated(null);
    _controller.add(_authStatus);
  }

  Future<void> login(int workspaceId, String username, String password) async {
    // TODO: handle login/logout/refresh race conditions
    final response = await _postJSON(
      '/login',
      {
        'workspace_id': workspaceId,
        'username': username,
        'password': password,
      },
    );

    try {
      _updateCredential(CredentialSet.fromJWT(response['token'], username));
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
        final response = await _postJSON('/$_workspaceId/refresh_token', {},
            skipRefresh: true);
        _updateCredential(CredentialSet.fromJWT(
            response['token'], _credential!.identity.username));
      } on APIError catch (e) {
        if (e.code == kServerUnauthorized || e.code == kServerInvalidRequest) {
          if (e.code == kServerInvalidRequest) {
            _logger.severe(
                'Invalid request during token refresh - this is a bug in the client',
                e);
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

  Future<void> init() async {
    final credential = await _secureStorage.getCredentials();
    if (credential == null) {
      _logger.config('No credential found in storage');
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
    _logger.config(
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
        _logger.fine('Periodic token refresh failed: $e');
        //
      }
    }
  }

  get _workspaceId => _credential?.identity.workspaceId;
  get _userId => _credential?.identity.userId;
  get _token => _credential?.token;

  Future<void> _updateCredential(CredentialSet? credential) async {
    _credential = credential;
    await _secureStorage.setCredentials(credential);
    _logger.fine(
        'Credential updated in storage: $_workspaceId/$_userId expiration ${credential?.tokenExpiration}');
  }

  Future<void> _refreshTokenIfNeeded() async {
    if (_credential != null &&
        _credential!.tokenExpiration != null &&
        _credential!.tokenExpiration!.isBefore(
            DateTime.now().subtract(Constants.api.tokenRefreshThreshold))) {
      await refreshToken();
    }
  }

  Future<dynamic> _postJSON(String path, Object? body,
      {bool skipRefresh = false}) async {
    try {
      return _makeRequest(HttpMethod.post, path, body,
          skipRefresh: skipRefresh);
    } catch (e) {
      _logger.finer("Failed POST request to $path", e);
      rethrow;
    }
  }

  Future<dynamic> _getJSON(String path) async {
    try {
      return _makeRequest(HttpMethod.get, path, null);
    } catch (e) {
      _logger.finer("Failed GET request to $path", e);
      rethrow;
    }
  }

  Future<dynamic> _makeRequest(HttpMethod method, String path, Object? body,
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
      final url = Uri.parse('$_apiBase$path');
      _logger.fine('🌐🚀${methodLog(method)} $path body $body');

      response = switch (method) {
        HttpMethod.post => await http.post(
            url,
            headers: headers,
            body: jsonEncode(body),
          ),
        HttpMethod.get => await http.get(
            url,
            headers: headers,
          )
      };
    } catch (e) {
      throw APIError.unableToMakeRequest(e);
    }

    final dynamic decoded;
    try {
      decoded = jsonDecode(response.body);
      _logger.fine('🌐📩${methodLog(method)} $path body $body: $decoded');
    } catch (e) {
      _logger.finer(
          '🌐💥Invalid response ${methodLog(method)} $path : ${response.body}',
          e);
      throw APIError.invalidResponse(e.toString());
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return decoded;
    } else {
      throw APIError.serverError(decoded);
    }
  }
}

String methodLog(HttpMethod method) {
  switch (method) {
    case HttpMethod.get:
      return 'GET';
    case HttpMethod.post:
      return 'POST';
  }
}

enum HttpMethod { get, post }
