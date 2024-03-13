import 'dart:isolate';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../proc.dart';

part 'msg.freezed.dart';

@freezed
sealed class Msg {
  const factory Msg.login(SendPort sendPort, int workspaceId, String username,
      String password) = MsgLogin;
  const factory Msg.logout(SendPort sendPort) = MsgLogout;
  const factory Msg.authStatusSubscribe(SendPort sendPort, String key) =
      MsgAuthStatusSubscribe;
  const factory Msg.authStatusUnsubscribe(String key) =
      MsgAuthStatusUnsubscribe;
  const factory Msg.subscribeProc(
          SendPort sendPort, ProcBuilder procBuilder, String key) =
      MsgSubscribeProc;
  const factory Msg.unsubscribeProc(String key) = MsgUnsubscribeProc;
  const factory Msg.conversationMessagesSyncStateSubscribe(
          SendPort sendPort, int conversationId, String key) =
      MsgConversationMessagesSyncStateSubscribe;
  const factory Msg.conversationMessagesSyncStateUnsubscribe(String key) =
      MsgConversationMessagesSyncStateUnsubscribe;
  const factory Msg.conversationMessagesLoadPast(
      SendPort sendPort, int conversationId) = MsgConversationMessagesLoadPast;
  const factory Msg.createMessage(SendPort sendPort, int conversationId,
      String text, String idempotencyId) = MsgCreateMessage;
}

class MsgOutUnsubscribeAck {
  MsgOutUnsubscribeAck();
}
