import 'package:app/conversation_create/conversation_create.dart';
import 'package:app/repository/repository.dart';
import 'package:app/tab_home/view/disappearing_bottom_navigation_bar.dart';
import 'package:app/tab_home/view/disappearing_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: Row(
        children: [
          if (wideScreen)
            DisappearingNavigationRail(
              onAddCallback: _addConversation,
              selectedIndex: widget.child.currentIndex,
              backgroundColor: _backgroundColor,
              onDestinationSelected: (index) {
                widget.child.goBranch(
                  index,
                  initialLocation: index == widget.child.currentIndex,
                );
                setState(() {});
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
      floatingActionButton: wideScreen
          ? null
          : FloatingActionButton(
              backgroundColor: _colorScheme.tertiaryContainer,
              foregroundColor: _colorScheme.onTertiaryContainer,
              onPressed: () => _addConversation(context),
              child: const Icon(Icons.add),
            ),
      bottomNavigationBar: wideScreen
          ? null
          : DisappearingBottomNavigationBar(
              selectedIndex: widget.child.currentIndex,
              onDestinationSelected: (index) {
                widget.child.goBranch(
                  index,
                  initialLocation: index == widget.child.currentIndex,
                );
                setState(() {});
              },
            ),
    );
  }

  void _addConversation(BuildContext rootContext) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: ConversationCreatePage(
                  repository: context.read<SyncRepository>(),
                  endWithCreate: (result) {
                    final (user, file) = result;
                    print('TABHOME user: $user, file: $file');

                    Navigator.of(rootContext, rootNavigator: true).pop();
                    // Select conversation screen
                    // give user to MessagesPage who would decide to open the new conversation
                  }),
            ));
  }
}
