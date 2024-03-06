import 'package:flutter/material.dart';

import '../model/chat_message.dart';

class MessageRow extends StatelessWidget {
  final ChatMessage chatMessage;

  const MessageRow({
    super.key,
    required this.chatMessage,
  });

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            // Placeholder for an avatar image. You might want to use a network image or similar.
            child: Text(chatMessage.avatarInitials),
          ),
          SizedBox(width: 10),
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
                      TextSpan(text: '  '),
                      TextSpan(
                        text: chatMessage.timeFormatted,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  chatMessage.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
