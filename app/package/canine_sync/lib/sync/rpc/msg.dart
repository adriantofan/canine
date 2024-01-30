import '../proc.dart';

class Msg {}

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
