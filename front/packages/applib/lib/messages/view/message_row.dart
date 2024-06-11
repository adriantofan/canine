import 'package:flutter/material.dart';

import '../model/chat_message.dart';
import 'attachment_widget.dart';

class MessageRow extends StatelessWidget {
  final ChatMessage chatMessage;

  const MessageRow({
    super.key,
    required this.chatMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            // Placeholder for an avatar image. You might want to use a network image or similar.
            child: Text(chatMessage.avatarInitials),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: chatMessage.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(text: '  '),
                      TextSpan(
                        text: chatMessage.timeFormatted,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  chatMessage.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (chatMessage.attachments.isNotEmpty)
                  Wrap(
                      spacing: 16,
                      children: chatMessage.attachments
                          .map((path) => AttachmentWidget(
                                filePath: path,
                                iconData: Icons.attach_file,
                              ))
                          .toList())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Configuration {
  final Color textColor;
  final Color bgColor;

  const Configuration({required this.textColor, required this.bgColor});
}
