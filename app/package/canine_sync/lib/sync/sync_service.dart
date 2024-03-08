import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../canine_sync.dart';
import '../models/rtc_remote.dart';
import '../models/rtc_remote_update.dart';

class SyncService implements Sync {
  final Cache _cache;
  final Logger _logger = Logger('SyncService');
  final APIClient _apiClient;

  final StreamController<void> _stopController =
      StreamController<void>.broadcast();

  SyncService(this._cache, this._apiClient);
  websocketListen() async {
    for (;;) {
      try {
        await for (var authStatus in _apiClient.authStatus) {
          if (authStatus is AuthenticationStatusAuthenticated) {
            break;
          }
        }

        var update = await _apiClient.rtcSession(const RtcRemote());
        _logger.fine('Got rtc session ${update.syncToken}');

        initCache(update);

        var channel = WebSocketChannel.connect(
            _apiClient.rtcConnectionUri(update.syncToken));

        await channel.ready;
        _logger.fine('Connected to websocket');

        await for (var data
            in channel.stream.takeUntil(_stopController.stream)) {
          var msg = APIServerMessage.fromJson(jsonDecode(data));
          onUpdate(msg);
        }

        resetCache(); // clear cache on logout
      } on APIError catch (e) {
        _logger.severe('API error', e);
      } on Object catch (e) {
        _logger.fine('Retrying websocket connection in 3s', e);
        await Future.delayed(Duration(seconds: 3));

        // Todo: add exponential backoff
        // TODO: what is going to happen with ongoing procs ?
      }
    }
  }

  @override
  Stream<AuthenticationStatus> get authStatus => _apiClient.authStatus;

  final _conversationHistoryLoadPastFutures =
      <int, (Completer<void>, Future<RemoteDataStatus>)>{};
  @override
  Future<RemoteDataStatus> conversationHistoryLoadPast(int conversationId) {
    final crtHistory = _conversationHistorySubject(conversationId).valueOrNull!;
    final status = crtHistory.startStatus;
    final RemoteDataStatusLoading loadingStatus;

    switch (status) {
      case RemoteDataStatusUndetermined():
        loadingStatus = status.load;
      case RemoteDataStatusComplete():
        return Future.value(status);
      case RemoteDataStatusLoading():
        return _conversationHistoryLoadPastFutures[conversationId]!.$2;
      case RemoteDataStatusFailed():
        loadingStatus = status.retry;
    }
    _updateConversationHistoryStartStatus(conversationId, loadingStatus);

    final completer = Completer<void>();

    final future =
        _apiClient.getConversationMessages(conversationId).then((result) {
      if (completer.isCompleted) {
        return loadingStatus.failed;
      }

      if (result.data.isEmpty) {
        _updateConversationHistoryStartStatus(
            conversationId, loadingStatus.complete);
        return loadingStatus.complete as RemoteDataStatus;
      }

      final update =
          _cache.conversationMessagesLoaded(conversationId, result.data);
      if (update != null) {
        // normally it should be always true
        _forEachProc((p) => p.update(update, _cache));
      }

      final crtHistory = _conversationHistorySubject(conversationId);
      crtHistory.value = crtHistory.value.copyWith(
          startId: result.meta.prevId, startStatus: loadingStatus.loaded);

      return loadingStatus.loaded;
    }).catchError((e) {
      if (!completer.isCompleted) {
        _updateConversationHistoryStartStatus(
            conversationId, loadingStatus.failed);
      }
      return loadingStatus.failed;
    }).then((value) {
      if (!completer.isCompleted) {
        _conversationHistoryLoadPastFutures.remove(conversationId);
      }
      return value;
    });
    _conversationHistoryLoadPastFutures[conversationId] = (completer, future);
    return future;
  }

  @override
  Stream<HistoryState> conversationHistoryStream<HistoryState>(
      int conversationId) {
    return _conversationHistorySubject(conversationId).stream
        as Stream<HistoryState>;
  }

  @override
  Future<void> login(int workspaceId, String username, String password) {
    return _apiClient.login(workspaceId, username, password);
  }

  @override
  Future<void> logout() {
    // (eventually) stops the websocket
    _stopController.add(null);
    // Make sure ongoing history loads won't change the state after completing
    _conversationHistoryLoadPastFutures.forEach((_, value) {
      var (completer, _) = value;
      completer.complete();
    });
    // Forget about them, so they won't remain in memory potentially with new ones
    _conversationHistoryLoadPastFutures.clear();
    return _apiClient.logout();
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
    var initialValue = proc.init(_cache);
    controller.onListen = () {
      if (initialValue != null) {
        controller.add(initialValue);
      }
    };
    return controller.stream;
  }

  onUpdate(APIServerMessage message) {
    final update = _cache.serverDidUpdate(message);
    if (update == null) {
      return;
    }
    _forEachProc((p) => p.update(update, _cache));
  }

  initCache(RTCRemoteUpdate message) {
    _cache.init(message);
    _forEachProc((p) => p.init(_cache));
  }

  resetCache() {
    _cache.reset();
    _forEachProc((p) => p.init(_cache));
  }

  void _forEachProc(dynamic Function(Proc p) f) {
    _procs.forEach((proc, controller) {
      final result = f(proc);
      if (result != null) {
        controller.add(result);
      }
    });
  }

  final _conversationHistory = <int, BehaviorSubject<HistoryState>>{};

  void _updateConversationHistoryStartStatus(
      int conversationId, RemoteDataStatus startStatus) {
    final crtHistory = _conversationHistorySubject(conversationId);
    crtHistory.value = crtHistory.value.copyWith(startStatus: startStatus);
  }

  BehaviorSubject<HistoryState> _conversationHistorySubject(
      int conversationId) {
    if (_conversationHistory.containsKey(conversationId)) {
      return _conversationHistory[conversationId]!;
    }
    final messages = _cache.getConversationMessages(conversationId);
    final initialState = messages.isEmpty
        ? const HistoryState(0, RemoteDataStatus.undetermined())
        : HistoryState(messages[0].id, const RemoteDataStatus.undetermined());

    final controller = BehaviorSubject<HistoryState>.seeded(initialState);
    _conversationHistory[conversationId] = controller;
    return controller;
  }
}
