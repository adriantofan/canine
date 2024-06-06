import 'dart:isolate';

import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../api/session.dart';
import '../../models/model.dart';
import '../proc.dart';

part 'msg.freezed.dart';

@freezed
sealed class Msg with _$Msg {
  const factory Msg.connect(SendPort sendPort, Session session) = MsgConnect;
  const factory Msg.disconnect(SendPort sendPort) = MsgDisconnect;
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
  const factory Msg.createMessage(
      SendPort sendPort,
      int conversationId,
      String text,
      String idempotencyId,
      List<XFile> attachments) = MsgCreateMessage;
  const factory Msg.createConversation(SendPort sendPort,
      {required String recipientMessagingAddress}) = MsgCreateConversation;
  const factory Msg.createUser(SendPort sendPort,
      {required String messagingAddress,
      required UserType userType,
      required String password}) = MsgCreateUser;
}

class MsgOutUnsubscribeAck {
  MsgOutUnsubscribeAck();
}
