import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class AttachmentWidget extends StatelessWidget {
  final String filePath;
  final IconData
      iconData; // For simplicity, using an icon. Replace or extend with Image for specific previews.

  const AttachmentWidget({
    Key? key,
    required this.filePath,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // Width of the attachment widget
      height: 100, // Height of the attachment widget
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Background color of the attachment widget
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData, // Icon for the file type
              size: 50, // Icon size
              color: Colors.grey[700], // Icon color
            ),
            const SizedBox(height: 8), // Space between icon and text
            Flexible(
              child: Text(
                path.basename(filePath),
                style: Theme.of(context).textTheme.labelSmall,
                overflow:
                    TextOverflow.ellipsis, // Show ellipsis if text overflows
                maxLines: 1, // Ensure text does not wrap to more than one line
                softWrap: false, // Prevent wrapping onto the next line
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
