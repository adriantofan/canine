import 'package:flutter/material.dart';

class EmptyMessagesList extends StatelessWidget {
  const EmptyMessagesList({super.key, required this.sendBar});
  final Widget sendBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: Container()), sendBar],
    );
  }
}
