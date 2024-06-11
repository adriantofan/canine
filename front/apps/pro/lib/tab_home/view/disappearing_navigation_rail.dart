import 'package:applib/applib.dart';
import 'package:flutter/material.dart';

import '../../destinations.dart';

class DisappearingNavigationRail extends StatelessWidget {
  final void Function(BuildContext) onAddCallback;
  const DisappearingNavigationRail({
    super.key,
    required this.onAddCallback,
    required this.backgroundColor,
    required this.selectedIndex,
    this.workspaces = const {},
    this.workspaceId,
    this.onDestinationSelected,
  });

  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final Map<int, AuthInfo> workspaces;
  final int? workspaceId;

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
        groupAlignment: -0.8,
        destinations: destinations.map((d) {
          return NavigationRailDestination(
            icon: Icon(d.icon),
            label: Text(d.label),
          );
        }).toList(),
        trailing: Column(
          children: workspaces.values
              .map((authInfo) => _buildWorkspaceButton(workspaceId, authInfo))
              .toList(),
        ));
  }

  Widget _buildWorkspaceButton(int? selectedWorkspaceId, AuthInfo authInfo) {
    final isSelected = selectedWorkspaceId == authInfo.workspace.id;
    return Column(
      children: [
        IconButton.filledTonal(
          onPressed: isSelected
              ? null
              : () {
                  // GoRouter.of(context).go('/workspace/$key');
                },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              getAvatarInitials(authInfo.workspace.name),
              style: TextStyle(
                // color: Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
        Text(
          authInfo.workspace.name,
          style: TextStyle(
            // color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
