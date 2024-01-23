import 'package:app/state/ws.dart';
import 'package:flutter/material.dart';

class ConversationRowWidget extends StatefulWidget {
  final Conversation conversation;

  ConversationRowWidget(
      {super.key, required this.onSelected, required this.conversation});
  final void Function() onSelected;
  @override
  State<ConversationRowWidget> createState() => _ConversationRowWidgetState();
}

class _ConversationRowWidgetState extends State<ConversationRowWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.08), _colorScheme.surface);
  Color get _surfaceColor => unselectedColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Card(
          elevation: 0,
          color: _surfaceColor,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text("Conversation ${widget.conversation.id}")],
          )),
    );
  }
}
