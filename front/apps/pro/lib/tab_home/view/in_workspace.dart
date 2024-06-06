import 'package:app/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tab_home.dart';

class InWorkspace extends StatelessWidget {
  final StatefulNavigationShell child;
  final int workspaceId;
  const InWorkspace(
      {super.key, required this.child, required this.workspaceId});

  @override
  Widget build(BuildContext context) {
    globalLogger
        .fine("InWorkspace key : ${super.key} workspaceId : $workspaceId");
    return TabHome(child: child);
  }
}
