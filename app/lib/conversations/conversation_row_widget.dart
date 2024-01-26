import 'package:app/conversations/model/conversation_info.dart';
import 'package:flutter/material.dart';

class ConversationRowWidget extends StatefulWidget {
  final int conversationID;
  final ConversationInfo conversationInfo;
  final bool isSelected;
  ConversationRowWidget({
    super.key,
    required this.onSelected,
    required this.conversationID,
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
                    widget.conversationInfo.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  widget.conversationInfo.lastMessageTimeFormatted,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            subtitle: Text(
              widget.conversationInfo.lastMessage,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }
}
