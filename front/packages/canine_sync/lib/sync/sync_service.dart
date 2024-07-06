import 'dart:async';
import 'dart:convert';

import 'package:file_selector/file_selector.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../api/api_client.dart';
import '../api/session.dart';
import '../cache/cache.dart';
import '../models/model.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';
import '../ws/model/models.dart';
import 'proc.dart';
import 'sync.dart';

class SyncService implements Sync {
  final Cache _cache;
  final Logger _logger = Logger('SyncService');
  final String _apiBase;
  final String _wsBase;
  final Session _session;

  late APIWorkspaceClient _apiClient;

  final BehaviorSubject<bool> _stopController = BehaviorSubject<bool>();

  SyncService(this._cache, this._apiBase, this._wsBase, this._session) {
    _apiClient = APIWorkspaceClient(_apiBase, _wsBase, _session);
  }

  websocketListen() async {
    _logger.fine(
        'SyncService start workspaceId:${_apiClient.session.workspaceId} userId:${_apiClient.session.userId} authId:${_apiClient.session.authId}');
    for (;;) {
      try {
        var update = await _apiClient.rtcSession(const RtcRemote());
        _logger.fine('Got rtc session ${update.syncToken}');
        //TODO:  set me in the update cache
        initCache(update, _apiClient.session.userId);
        WebSocketChannel channel;
        channel = WebSocketChannel.connect(
            _apiClient.rtcConnectionUri(update.syncToken));

        try {
          await channel.ready;
        } on WebSocketChannelException catch (e) {
          _logger.fine('Failed to connect to websocket', e);
          rethrow;
        }

        _logger.fine('Connected to websocket');

        await for (var data
            in channel.stream.takeUntil(_stopController.stream)) {
          final msg = _decodeApiServerMessage(data);
          _logger.fine('🪽Server change:', msg);
          onUpdate(msg);
        }

        resetCache(); // clear cache on logout
        if (_stopController.valueOrNull == true) {
          _logger.fine(
              'SyncService stopped workspaceId:${_apiClient.session.workspaceId} userId:${_apiClient.session.userId} authId:${_apiClient.session.authId}');
          return;
        } else {
          _logger.fine(
              'SyncService disconnected workspaceId:${_apiClient.session.workspaceId} userId:${_apiClient.session.userId} authId:${_apiClient.session.authId}');
        }
      } on APIError catch (e) {
        _logger.severe(
            'API error, retry in 3 s ❗️(should do something smarter)', e);
        await Future.delayed(const Duration(seconds: 3));
      } on Object catch (e) {
        _logger.fine('Retrying websocket connection in 3s', e);
        await Future.delayed(const Duration(seconds: 3));
      }
    }
  }

  APIServerUpdate _decodeApiServerMessage(data) {
    final decoded = jsonDecode(data);
    _logger.fine('🪽Server change:', decoded);
    try {
      return APIServerUpdate.fromJson(decoded);
    } catch (_) {
      _logger.fine('🪽Failed to decode message', decoded);
      rethrow;
    }
  }

  final _conversationMessagesLoadPastFutures =
      <int, (Completer<void>, Future<RemoteDataStatus>)>{};

  @override
  Future<RemoteDataStatus> conversationMessagesLoadPast(int conversationId) {
    final crtSyncState =
        _conversationSyncStateSubject(conversationId).valueOrNull!;
    final status = crtSyncState.startStatus;
    final RemoteDataStatusLoading loadingStatus;

    switch (status) {
      case RemoteDataStatusUndetermined():
        loadingStatus = status.load;
      case RemoteDataStatusComplete():
        return Future.value(status);
      case RemoteDataStatusLoading():
        return _conversationMessagesLoadPastFutures[conversationId]!.$2;
      case RemoteDataStatusFailed():
        loadingStatus = status.retry;
    }
    _updateConversationSyncStateStartStatus(conversationId, loadingStatus);

    final completer = Completer<void>();

    final conversationMessageState =
        _cache.getConversationMessagesState(conversationId);
    final lastId = switch (conversationMessageState) {
      ListStateCached() => conversationMessageState.startId,
      _ => null,
    };
    final future = _apiClient
        .getConversationMessages(conversationId, lastId)
        .then((result) {
      if (completer.isCompleted) {
        return loadingStatus.failed;
      }

      final update = _cache.conversationMessagesLoaded(
          conversationId, result.data, result.meta.hasMore);

      if (update != null) {
        // normally it should be always true
        _forEachProc((p) => p.update(update, _cache));
      }

      final finalLoadingStatus =
          result.meta.hasMore ? loadingStatus.loaded : loadingStatus.complete;

      final crtSyncState = _conversationSyncStateSubject(conversationId);
      crtSyncState.value =
          crtSyncState.value.copyWith(startStatus: finalLoadingStatus);

      return finalLoadingStatus;
    }).catchError((e) {
      if (!completer.isCompleted) {
        _updateConversationSyncStateStartStatus(
            conversationId, loadingStatus.failed);
      }
      return loadingStatus.failed;
    }).then((value) {
      if (!completer.isCompleted) {
        _conversationMessagesLoadPastFutures.remove(conversationId);
      }
      return value;
    });
    _conversationMessagesLoadPastFutures[conversationId] = (completer, future);
    return future;
  }

  @override
  Future<Message> createMessage(int conversationId, String text,
      String idempotencyId, List<XFile> attachments) {
    return _apiClient.createMessage(
        conversationId, text, idempotencyId, attachments);
  }

  @override
  Future<Conversation> createConversation({required int userId}) {
    return _apiClient.createConversation(userId: userId);
  }

  @override
  Future<User> createUser({
    required String email,
    required String firstName,
    required String lastName,
    String phone = '',
    UserType userType = UserType.external,
  }) {
    return _apiClient.createUser(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        userType: userType);
  }

  @override
  Stream<ListSyncState> conversationMessagesSyncStateStream<ListSyncState>(
      int conversationId) {
    return _conversationSyncStateSubject(conversationId).stream
        as Stream<ListSyncState>;
  }

  @override
  Future<void> updateToken(String token) async {
    _apiClient.tokenDidRefresh(token);
  }

  @override
  Future<void> disconnect() async {
    // (eventually) stops the websocket
    _stopController.add(true);
    // this will stop the run loop in websocketListen
    // Make sure ongoing message loads won't change the state after completing
    _conversationMessagesLoadPastFutures.forEach((_, value) {
      var (completer, _) = value;
      completer.complete();
    });
    // Forget about them, so they won't remain in memory potentially with new ones
    _conversationMessagesLoadPastFutures.clear();
  }

  final Map<Proc, StreamController> _procs = {};

  @override
  Stream<R> subscribeProcRef<R>(ProcBuilder<R> builder) {
    final proc = builder.build();
    StreamController<R> controller = StreamController<R>(sync: true);
    _procs[proc] = controller;
    controller.onCancel = () {
      _procs.remove(proc);
    };
    controller.onListen = () {
      var initialValue = proc.init(_cache);
      if (initialValue != null) {
        controller.add(initialValue);
      }
    };
    return controller.stream;
  }

  onUpdate(APIServerUpdate message) {
    final update = _cache.serverDidUpdate(message);
    if (update == null) {
      return;
    }
    _forEachProc((p) => p.update(update, _cache));
  }

  initCache(RTCRemoteUpdate message, int userId) {
    _cache.init(message, userId);
    // stop any ongoing message load, so they won't change the _cache after completing
    _conversationMessagesReset();
    // There are other side effects such as updating the conversation sync state
    _forEachProc((p) => p.init(_cache));
  }

  resetCache() {
    _cache.reset();
    _conversationMessagesReset();
    _forEachProc((p) => p.init(_cache));
  }

  void _forEachProc(dynamic Function(Proc p) f) {
    final allKeys = _procs.keys;
    for (var proc in allKeys.toList()) {
      final result = f(proc);
      if (result != null) {
        _procs[proc]?.add(result);
      }
    }
  }

  final _conversationSyncState = <int, BehaviorSubject<ListSyncState>>{};

  void _updateConversationSyncStateStartStatus(
      int conversationId, RemoteDataStatus startStatus) {
    final crtSyncState = _conversationSyncStateSubject(conversationId);
    crtSyncState.value = crtSyncState.value.copyWith(startStatus: startStatus);
  }

  BehaviorSubject<ListSyncState> _conversationSyncStateSubject(
      int conversationId) {
    if (_conversationSyncState.containsKey(conversationId)) {
      return _conversationSyncState[conversationId]!;
    }
    final initialState = ListSyncState.fromCacheListState(
        _cache.getConversationMessagesState(conversationId));

    final controller = BehaviorSubject<ListSyncState>.seeded(initialState);
    _conversationSyncState[conversationId] = controller;
    return controller;
  }

  void _conversationMessagesReset() {
    _conversationMessagesLoadPastFutures
        .forEach((conversationId, completerFuturePair) {
      var (completer, _) = completerFuturePair;
      completer.complete();
    });
    _conversationMessagesLoadPastFutures.clear();

    _conversationSyncState.forEach((conversationId, s) {
      s.value = ListSyncState.fromCacheListState(
          _cache.getConversationMessagesState(conversationId));
    });
  }
}
