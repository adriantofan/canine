import 'package:flutter/material.dart';

class Destination {
  const Destination(this.label, this.icon);
  final String label;
  final IconData icon;
}

const List<Destination> destinations = [
  Destination('Conversations', Icons.chat),
  Destination('Settings', Icons.settings),
];
