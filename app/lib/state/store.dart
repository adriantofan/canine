import 'dart:async';
import 'dart:convert';

import 'package:app/state/sync_state.dart';
import 'package:app/state/update.dart';
import 'package:app/state/ws.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Store {
  // Returns a broadcast stream of updates to the store, there is no initial
  // update sent at subscription. Outside of the package used mostly for debugging.
  late final Stream<Update> updateStream =
      _updateStreamController.stream.asBroadcastStream();
  // Returns a stream of sync state changes including the initial state.
  Stream<SyncState> get syncStream => _buildSyncStreamStream();
  // Returns a stream of conversations updates including the initial state.
  Stream<ConversationsUpdate> get conversationsStream =>
      _buildConversationsStream();

  Future<()> sendMessage(Message message) async {
    return Future(() async {
      if (_syncState is! ConnectedState) {
        throw Exception("Not connected");
      }
      var sink = (_syncState as ConnectedState).sink;
      sink.add(jsonEncode(message.toJson()));

      await for (var update in updateStream) {
        // TODO: should give a message id and wait for the response with the proper id
        if (update is ConversationsUpdate) {
          break;
        }
      }
      return ();
    });
  }

  SyncState _syncState = DisconnectedState();
  final StreamController<Update> _updateStreamController =
      StreamController<Update>();

  late final Stream<SyncState> _broadcastSyncStream =
      _syncStream().asBroadcastStream();

  Stream<SyncState> _buildSyncStreamStream() async* {
    yield _syncState;
    await for (var update in _broadcastSyncStream) {
      yield update;
    }
  }

  Stream<ConversationsUpdate> _buildConversationsStream() async* {
    yield ConversationsUpdate(_conversations.items);
    await for (var update in updateStream) {
      if (update is ConversationsUpdate) {
        yield update;
      }
    }
  }

  final Window<Conversation> _conversations = Window((a, b) => a.id - b.id);

  Stream<SyncState> _syncStream() async* {
    final messageSink = _updateStreamController.sink;
    _syncState = DisconnectedState();
    yield _syncState;

    while (true) {
      try {
        _syncState = ConnectingState();
        yield _syncState;

        var channel =
            WebSocketChannel.connect(Uri.parse('ws://localhost:8080/echo'));
        await channel.ready;

        _syncState = InitialSyncState();
        yield _syncState;

        var sink = channel.sink;
        sink.add(_syncMessage.toString());

        await for (var data in channel.stream) {
          var msg = ServerMessage.fromJson(jsonDecode(data));
          if (msg is ConnectedState && _syncState is InitialSyncState) {
            _syncState = ConnectedState(sink);
            yield _syncState;
          } else {
            var updates = _processServerMessage(msg);
            for (var update in updates) {
              messageSink.add(update);
            }
          }
        }
      } catch (e) {
        print("Error: $e");
        // TODO: add exponential backoff
        _syncState = DisconnectedState();
        yield _syncState;
      }
    }
  }

  List<Update> _processServerMessage(ServerMessage msg) {
    switch (msg) {
      case ServerMessageConversations():
        return _processConversations(msg);
      case ServerMessageMessages():
        return [];
      case ServerMessageInvalid():
        print("Invalid message");
        return [];
    }
  }

  List<Update> _processConversations(ServerMessageConversations msg) {
    final didChange = _conversations.union(msg.data);
    if (didChange) {
      return [ConversationsUpdate(_conversations.items)];
    }
    return [];
  }

  // This is the initial sync message containing the state of the store
  SyncMessage get _syncMessage {
    return SyncMessage();
  }
}

class Window<T> {
  List<T> _sortedItems = [];
  final Comparator<T> comparator;

  Window(this.comparator);

  List<T> get items => _sortedItems;
  // Updates _sorted_items to include new_items in sorted order.
  // if one of the _sorted_items is equal to one of the new_items, the item
  // from new_items is used.
  // It is assumed that new_items are sorted.
  // Returns true if changes were made to _sorted_items.
  bool union(List<T> newItems) {
    var i = 0;
    var j = 0;
    var newSortedItems = <T>[];
    if (_sortedItems.isEmpty) {
      _sortedItems = newItems;
      return true;
    }
    if (newItems.isEmpty) {
      return false;
    }
    // optimize for the case where the new items are all greater than the last
    // item in the sorted items
    if (comparator(_sortedItems.last, newItems.first) < 0) {
      _sortedItems.addAll(newItems);
      return true;
    }
    // optimize for the case where the new items are all less than the first
    // item in the sorted items
    if (comparator(_sortedItems.first, newItems.last) > 0) {
      newSortedItems.addAll(newItems);
      newSortedItems.addAll(_sortedItems);
      _sortedItems = newSortedItems;
      return true;
    }

    while (i < _sortedItems.length && j < newItems.length) {
      var cmp = comparator(_sortedItems[i], newItems[j]);
      if (cmp < 0) {
        newSortedItems.add(_sortedItems[i]);
        i++;
      } else if (cmp > 0) {
        newSortedItems.add(newItems[j]);
        j++;
      } else {
        newSortedItems.add(newItems[j]);
        i++;
        j++;
      }
    }
    while (i < _sortedItems.length) {
      newSortedItems.add(_sortedItems[i]);
      i++;
    }
    while (j < newItems.length) {
      newSortedItems.add(newItems[j]);
      j++;
    }
    _sortedItems = newSortedItems;
    return true;
  }
}

// void loadNextConversations() {
// could add a request in a list with an associated future
// then return the future
// the loop dequeues requests and sends them
// as responses come in, they are matched to the future and the future is completed
// }

// it might be possible to use a similar pattern to observe changes to the store
// for example to all conversations or to all messages in a conversation

// unclear how to deal with search results <- maybe they are just a request
// with a future, while the future returns a next page request or null

// in golang I could use a buffered channel to queue send requests,
// this way it would be similar to the send part
// when a send is done, the next page is enqueued to the change
