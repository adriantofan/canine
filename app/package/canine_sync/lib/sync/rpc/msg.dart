import '../../api/main.dart';
import '../proc.dart';

class Msg {}

class MsgLogin extends Msg {
  final int workspaceId;
  final String username;
  final String password;
  MsgLogin(this.workspaceId, this.username, this.password);
}

class MsgAuthStatusSubscribe extends Msg {
  String key;
  MsgAuthStatusSubscribe(this.key);
  MsgAuthStatusUnsubscribe unsubscribe() {
    return MsgAuthStatusUnsubscribe(key);
  }
}

class MsgAuthStatusUnsubscribe extends Msg {
  String key;
  MsgAuthStatusUnsubscribe(this.key);
}

class MsgAuthStatusUnsubscribeAck extends Msg {
  MsgAuthStatusUnsubscribeAck();
}

class MsgAuthStatusUpdate extends Msg {
  final AuthenticationStatus status;
  MsgAuthStatusUpdate(this.status);
}

class MsgSubscribeProc<R> extends Msg {
  ProcBuilder<R> procBuilder;
  String key;
  MsgSubscribeProc(this.procBuilder, this.key);
  MsgUnsubscribeProc unsubscribe() {
    return MsgUnsubscribeProc(key);
  }
}

class MsgUnsubscribeProc extends Msg {
  String key;
  MsgUnsubscribeProc(this.key);
}

class MsgUnsubscribeProcAck extends MsgUnsubscribeProc {
  MsgUnsubscribeProcAck(super.key);
}
