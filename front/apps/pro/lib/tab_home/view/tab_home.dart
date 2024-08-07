import 'package:app/conversation_create/conversation_create.dart';
import 'package:app/tab_home/view/disappearing_navigation_rail.dart';
import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../draft_conversation/draft_conversation.dart';
import '../../router.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);
  bool wideScreen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    wideScreen = width > 600;
  }

  @override
  Widget build(BuildContext context) {
    return SyncSessionContainer(
      child: Scaffold(
        body: Row(
          children: [
            // if (wideScreen)
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return DisappearingNavigationRail(
                  onAddCallback: () =>
                      _addConversation(context.read<AppBloc>().workspaceId!),
                  selectedIndex: widget.child.currentIndex,
                  backgroundColor: _backgroundColor,
                  onDestinationSelected: (index) {
                    widget.child.goBranch(
                      index,
                      initialLocation: index == widget.child.currentIndex,
                    );
                    setState(() {});
                  },
                  workspaceId: context.read<AppBloc>().workspaceId,
                  workspaces: context.read<AppBloc>().workspaces,
                );
              },
            ),
            Expanded(
              child: Container(
                color: _backgroundColor,
                child: SafeArea(child: widget.child),
              ),
            ),
          ],
        ),
        // floatingActionButton: wideScreen
        //     ? null
        //     : FloatingActionButton(
        //         backgroundColor: _colorScheme.tertiaryContainer,
        //         foregroundColor: _colorScheme.onTertiaryContainer,
        //         onPressed: () => _addConversation(context),
        //         child: const Icon(Icons.add),
        //       ),
        // bottomNavigationBar: wideScreen
        //     ? null
        //     : DisappearingBottomNavigationBar(
        //         selectedIndex: widget.child.currentIndex,
        //         onDestinationSelected: (index) {
        //           widget.child.goBranch(
        //             index,
        //             initialLocation: index == widget.child.currentIndex,
        //           );
        //           setState(() {});
        //         },
        //       ),
      ),
    );
  }

  void _addConversation(int workspaceId) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: SyncSessionContainer(
                workspaceId: workspaceId,
                child: Builder(builder: (inSessionContext) {
                  return ConversationCreatePage(
                      repository: inSessionContext.read<SyncRepository>(),
                      didCreate: (result) {
                        Navigator.of(context, rootNavigator: true).pop();
                        switch (result) {
                          case CreateFlowResultCancel():
                            return;
                          case CreateFlowResultDevis():
                            AppRouter.goConversationWithUser(DraftConversation(
                                user: result.user,
                                message:
                                    DraftMessage(attachments: [result.file])));
                          case CreateFlowResultUser():
                            AppRouter.goConversationWithUser(DraftConversation(
                                user: result.user,
                                message: const DraftMessage()));
                          case CreateFlowResultConversation():
                            AppRouter.replaceConversationWithInfo(
                                result.conversation, const DraftMessage());
                        }
                      });
                }),
              ),
            ));
  }
}
