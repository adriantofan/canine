import 'package:app/state/ws.dart';
import 'package:flutter/material.dart';

class ConversationRowWidget extends StatefulWidget {
  final Conversation conversation;
  final ConversationInfo conversationInfo;
  final bool isSelected;
  ConversationRowWidget({
    super.key,
    required this.onSelected,
    required this.conversation,
    required this.conversationInfo,
    this.isSelected = false,
  });
  final void Function() onSelected;
  @override
  State<ConversationRowWidget> createState() => _ConversationRowWidgetState();
}

class _ConversationRowWidgetState extends State<ConversationRowWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.08), _colorScheme.surface);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onSelected,
        child: Container(
          color: widget.isSelected
              ? _colorScheme.primaryContainer
              : unselectedColor,
          child: ListTile(
            leading: CircleAvatar(
              // Placeholder for an avatar image. You might want to use a network image or similar.
              child: Text(widget.conversationInfo.avatarInitials),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "John Doe",
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "12:01:22",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            subtitle: const Text(
              "Hello, how are you? Hello, how are you? Hello, how are you? Hello, how are you? Hello, how are you?",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }
}

class ConversationInfo {
  final String name;
  final DateTime lastMessageTime;
  final String lastMessage;
  final String avatarInitials;

  ConversationInfo({
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
