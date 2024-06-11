import 'package:intl/intl.dart';

import '../../util/avatar.dart';

class ConversationInfo {
  final int conversationId;
  final String name;
  final int userId;
  final DateTime lastMessageTime;
  final String lastMessage;
  final String avatarInitials;
  late final String lastMessageTimeFormatted =
      DateFormat.yMd().add_Hm().format(lastMessageTime);

  ConversationInfo({
    required this.conversationId,
    required this.name,
    required this.userId,
    required this.lastMessageTime,
    required this.lastMessage,
  }) : avatarInitials = getAvatarInitials(name);

  static int compareById(ConversationInfo a, ConversationInfo b) {
    final byID = a.conversationId.compareTo(b.conversationId);
    if (byID == 0) {
      return a.lastMessageTime.compareTo(b.lastMessageTime);
    }
    return byID;
  }

  static int compareByLastMessageTime(ConversationInfo a, ConversationInfo b) {
    final byTime = a.lastMessageTime.compareTo(b.lastMessageTime);
    if (byTime == 0) {
      return a.conversationId.compareTo(b.conversationId);
    }
    return byTime;
  }
}
