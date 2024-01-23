import 'package:app/state/ws.dart';

sealed class Update {}

class ConversationsUpdate extends Update {
  final List<Conversation> conversations;
  ConversationsUpdate(this.conversations) : super();
}

class MessageSentConfirmation extends Update {
  final int messageId;
  MessageSentConfirmation(this.messageId) : super();
}
