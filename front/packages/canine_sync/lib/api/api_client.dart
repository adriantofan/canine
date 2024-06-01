import 'dart:async';
import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../canine_sync.dart';
import '../constants/constants.dart';
import '../models/paginated.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';
import 'credential_set.dart';

// enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClientBase {
  static int kItemsPerPage = 5;
  final _apiBase;
  final _wsBase;
  final _logger = Logger('APIClient');
  APIClientBase(this._apiBase, this._wsBase);
  Future<void> loginFirebase(int workspaceId, String token) async {
    final response = await _postJSON(
      '$workspaceId/login',
      {
        'token': token,
      },
      headers: {},
    );

    try {
      return;
    } catch (e) {
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<dynamic> _multipart(
    String path,
    Map<String, String>? fields,
    List<XFile> attachments,
    String attachmentField, {
    required Map<String, String> headers,
  }) async {
    try {
      return _makeRequest(
        HttpMethod.multipart,
        path,
        null,
        fields,
        skipRefresh: false,
        attachments: attachments,
        attachmentField: attachmentField,
        headers: headers,
      );
    } catch (e) {
      _logger.finer("Failed POST request to $path", e);
      rethrow;
    }
  }

  Future<dynamic> _postJSON(
    String path,
    Object? body, {
    required Map<String, String> headers,
  }) async {
    try {
      return _makeRequest(
        HttpMethod.post,
        path,
        body,
        null,
        headers: headers,
      );
    } catch (e) {
      _logger.finer("Failed POST request to $path", e);
      rethrow;
    }
  }

  Future<dynamic> _getJSON(String path,
      {required Map<String, String> headers}) async {
    try {
      return _makeRequest(HttpMethod.get, path, null, null, headers: headers);
    } catch (e) {
      _logger.finer("Failed GET request to $path", e);
      rethrow;
    }
  }

  Future<dynamic> _makeRequest(
      HttpMethod method, String path, Object? body, Map<String, String>? fields,
      {bool skipRefresh = false,
      List<XFile>? attachments,
      String? attachmentField,
      Map<String, String>? headers}) async {
    assert(path.startsWith('/'));

    headers ??= {};
    headers['Content-Type'] = 'application/json';

    final http.Response response;
    final fileNames = attachments?.map((e) => e.name).join(', ');
    final fileNamesLog =
        fileNames != null ? '$attachmentField: $fileNames' : '';
    final bodyOrFieldsLog = body != null ? 'body: $body' : 'fields: $fields';

    try {
      final url = Uri.parse('$_apiBase$path');
      _logger.fine(
          '🌐🚀${methodLog(method)} $path $fileNamesLog $bodyOrFieldsLog');

      switch (method) {
        case HttpMethod.post:
          response = await http.post(
            url,
            headers: headers,
            body: jsonEncode(body),
          );
        case HttpMethod.get:
          response = await http.get(
            url,
            headers: headers,
          );
        case HttpMethod.multipart:
          final multipartFiles = <http.MultipartFile>[];
          for (var attachment in attachments!) {
            final file = await attachment.readAsBytes();
            final multipartFile = http.MultipartFile.fromBytes(
              attachmentField!,
              file,
              filename: attachment.name,
            );
            multipartFiles.add(multipartFile);
          }

          final request = http.MultipartRequest(
            'POST',
            url,
          )
            ..headers.addAll(headers)
            ..fields.addAll(fields ?? {})
            ..files.addAll(multipartFiles);

          final multipartResponse = await request.send();
          response = await http.Response.fromStream(multipartResponse);
      }
    } catch (e) {
      throw APIError.unableToMakeRequest(e);
    }

    final dynamic decoded;
    try {
      decoded = jsonDecode(response.body);
      _logger.fine(
          '🌐📩${methodLog(method)} $path $fileNamesLog $bodyOrFieldsLog: $decoded');
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

// TODO: this is more like a session than a client ... TDB
class APIClient extends APIClientBase {
  APIClient(String apiBase, String wsBase) : super(apiBase, wsBase);

  CredentialSet? _credential;

  final _controller = BehaviorSubject<AuthenticationStatus>.seeded(
      AuthenticationStatus.unknown());
  var _authStatus = AuthenticationStatus.unknown();

  void dispose() => _controller.close();

  Stream<AuthenticationStatus> get authStatus {
    return _controller.stream;
  }

  Future<Conversation> createConversation(
      {required String recipientMessagingAddress}) async {
    final authHeader = await this.authHeader(skipRefresh: false);

    final response = await _postJSON('/$_workspaceId/conversations',
        {'recipient_messaging_address': recipientMessagingAddress},
        headers: authHeader);
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
    final authHeader = await this.authHeader(skipRefresh: false);

    final response = await _postJSON(
        '/$_workspaceId/users',
        {
          'messaging_address': messagingAddress,
          'user_type': userType,
          'password': password,
        },
        headers: authHeader);

    try {
      return User.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse createUser response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<Message> createMessage(int conversationId, String text,
      String idempotencyId, List<XFile> attachments) async {
    final authHeader = await this.authHeader(skipRefresh: false);
    final response = await _multipart(
        '/$_workspaceId/conversations/$conversationId/messages',
        {'message': text, 'idempotency_id': idempotencyId},
        attachments,
        'attachments',
        headers: authHeader);
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
    final authHeader = await this.authHeader(skipRefresh: false);
    final response = await _getJSON(
        '/$_workspaceId/conversations/$conversationId/messages?lower_than=$lastId&limit=$APIClientBase.kItemsPerPage',
        headers: authHeader);
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
    final authHeader = await this.authHeader(skipRefresh: false);
    final response = await _postJSON(
        '/$_workspaceId/users/$_userId/rtc/session', state,
        headers: authHeader);
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
      headers: {},
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
        final authHeader = await this.authHeader(skipRefresh: true);
        final response = await _postJSON('/$_workspaceId/refresh_token', {},
            headers: authHeader);
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
    _authStatus = AuthenticationStatus.unauthenticated(null);
    _controller.add(_authStatus);
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

  Future<Map<String, String>> authHeader({bool skipRefresh = false}) async {
    // proactively refresh the token if it's about to expire except when
    // explicitly told to skip the refresh (e.g. during a refresh token request)
    if (_credential != null && !skipRefresh) {
      await _refreshTokenIfNeeded();
    }

    return {
      if (_credential?.token != null)
        'Authorization': 'Bearer ${_credential!.token}'
    };
  }
}

String methodLog(HttpMethod method) {
  switch (method) {
    case HttpMethod.get:
      return 'GET';
    case HttpMethod.post:
      return 'POST';
    case HttpMethod.multipart:
      return 'POST MULTIPART';
  }
}

enum HttpMethod { get, post, multipart }
