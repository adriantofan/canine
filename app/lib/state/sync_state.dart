import 'package:web_socket_channel/web_socket_channel.dart';

sealed class SyncState {
  SyncState();
}

class DisconnectedState extends SyncState {
  DisconnectedState() : super();
}

class ConnectingState extends SyncState {
  ConnectingState() : super();
}

class InitialSyncState extends SyncState {
  InitialSyncState() : super();
}

class ConnectedState extends SyncState {
  WebSocketSink sink;
  ConnectedState(this.sink) : super();
}
