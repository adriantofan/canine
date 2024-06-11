import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../repository/repository.dart';
import '../../routes/routes.dart';

class SyncSessionContainer extends StatelessWidget {
  final Widget child;
  // if not supplied, the workspace from path is used
  final int? workspaceId;

  const SyncSessionContainer(
      {super.key, required this.child, this.workspaceId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SyncSession?>(
        stream: context.read<SyncSessionRepository>().syncSessionChanges,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              final syncSession = snapshot.data;
              if (syncSession == null) {
                break;
              }
              if (_onTheSameWorkspace(syncSession, context)) {
                return RepositoryProvider<SyncRepository>.value(
                    value: SyncRepository(syncSession.service), child: child);
              }
            default:
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  bool _onTheSameWorkspace(SyncSession syncSession, BuildContext context) {
    if (this.workspaceId != null) {
      return syncSession.workspaceId == this.workspaceId;
    }

    final workspaceId =
        WorkspacePath.workspaceIdFromState(GoRouterState.of(context));
    if (workspaceId == null) {
      throw Exception('workspaceId is not provided and not found in the path');
    }
    return syncSession.workspaceId == workspaceId;
  }
}
