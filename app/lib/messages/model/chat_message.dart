import 'package:intl/intl.dart';

import '../../util/avatar.dart';

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.name,
    required this.type,
    required this.message,
    required this.time,
    required this.userId,
  }) : avatarInitials = getAvatarInitials(name);
  int id;
  String name;
  String type;
  String message;
  DateTime time;
  int userId;
  final String avatarInitials;
  late final String timeFormatted = DateFormat.Hms().format(time);

  static int compareByTimeThenId(ChatMessage a, ChatMessage b) {
    final byTime = a.time.compareTo(b.time);
    if (byTime != 0) {
      return byTime;
    }
    return a.id.compareTo(b.id);
  }
}
