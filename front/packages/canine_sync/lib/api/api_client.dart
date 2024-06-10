import 'dart:async';
import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../canine_sync.dart';
import '../models/paginated.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';

// enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class APIClientBase {
  static int kItemsPerPage = 5;
  final String _apiBase;
  final String _wsBase;
  final _logger = Logger('APIClient');
  APIClientBase(this._apiBase, this._wsBase);

  Future<List<AuthInfo>> userInfo(String token) async {
    // TODO: remove this delay
    // await Future.delayed(const Duration(seconds: 2));
    final response = await _getJSON(
      '/auth/info',
      headers: {'Authorization': 'Bearer $token'},
    );

    try {
      return (response as List).map((e) => AuthInfo.fromJson(e)).toList();
    } catch (e) {
      _logger.severe('Failed to parse auth_info response', e);
      _logger.finest('Response: ${jsonEncode(response)}');
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
class APIWorkspaceClient extends APIClientBase {
  Session _session;
  Session get session => _session;

  APIWorkspaceClient(super.apiBase, super.wsBase, this._session);

  void tokenDidRefresh(String newToken) {
    _session = _session.copyWith(token: newToken);
  }

  Future<User> getMe({String? token}) async {
    final authHeader = await this.authHeader(token: token);
    final response = await _getJSON('/me', headers: authHeader);
    try {
      return User.fromJson(response);
    } catch (e) {
      _logger.severe('Failed to parse me response', e);
      _logger.finest('Response: $response');
      throw APIError.invalidResponse(e.toString());
    }
  }

  Future<Conversation> createConversation(
      {required String recipientEmail}) async {
    final authHeader = await this.authHeader();

    final response = await _postJSON('/${_session.workspaceId}/conversations',
        {'recipient_email': recipientEmail},
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
    final authHeader = await this.authHeader();

    final response = await _postJSON(
        '/${_session.workspaceId}/users',
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
    final authHeader = await this.authHeader();
    final response = await _multipart(
        '/${_session.workspaceId}/conversations/$conversationId/messages',
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
    final authHeader = await this.authHeader();
    final response = await _getJSON(
        '/${_session.workspaceId}/conversations/$conversationId/messages?lower_than=$lastId&limit=$APIClientBase.kItemsPerPage',
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
    final authHeader = await this.authHeader();
    final response = await _postJSON(
        '/${_session.workspaceId}/users/${_session.userId}/rtc/session', state,
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
    if (_session == null) {
      throw Exception(
          'Session is not initialized while calling rtcConnectionUri');
    }

    return Uri.parse(
        '$_wsBase/${_session.workspaceId}/users/${_session.userId}/rtc/connect?sync_token=$syncToken&token=${_session.token}');
  }

  Future<Map<String, String>> authHeader({String? token}) async {
    return {'Authorization': 'Bearer ${token ?? _session.token}'};
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
