import 'package:intl/intl.dart';

class ConversationInfo {
  final int conversationId;
  final String name;
  final DateTime lastMessageTime;
  final String lastMessage;
  final String avatarInitials;
  late final String lastMessageTimeFormatted =
      DateFormat.yMd().add_Hm().format(lastMessageTime);

  ConversationInfo({
    required this.conversationId,
    required this.name,
    required this.lastMessageTime,
    required this.lastMessage,
  }) : avatarInitials = _getAvatarInitials(name);
}

String _getAvatarInitials(String name) {
  if (name.isEmpty) {
    return "";
  }
  List<String> names = name.split(" ");
  String initials = "";
  int numWords = 2;
  if (names.length < 2) {
    numWords = names.length;
  }
  for (int i = 0; i < numWords; i++) {
    initials += names[i][0];
  }
  return initials;
}
