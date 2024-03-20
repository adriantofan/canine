import 'package:flutter/material.dart';

import '../../destinations.dart';

class DisappearingNavigationRail extends StatelessWidget {
  final void Function(BuildContext) onAddCallback;
  const DisappearingNavigationRail({
    super.key,
    required this.onAddCallback,
    required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NavigationRail(
      selectedIndex: selectedIndex,
      selectedIconTheme: IconThemeData(color: colorScheme.primary),
      backgroundColor: backgroundColor,
      onDestinationSelected: onDestinationSelected,
      leading: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: "disappearing_fab",
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            backgroundColor: colorScheme.tertiaryContainer,
            foregroundColor: colorScheme.onTertiaryContainer,
            onPressed: () => onAddCallback(context),
            child: const Icon(Icons.add),
          ),
        ],
      ),
      groupAlignment: -0.85,
      destinations: destinations.map((d) {
        return NavigationRailDestination(
          icon: Icon(d.icon),
          label: Text(d.label),
        );
      }).toList(),
    );
  }
}
