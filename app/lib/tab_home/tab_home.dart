import 'package:app/conversation_create/conversation_create.dart';
import 'package:app/conversations/screen.dart';
import 'package:app/repository/repository.dart';
import 'package:app/settings/screen.dart';
import 'package:app/tab_home/view/disappearing_bottom_navigation_bar.dart';
import 'package:app/tab_home/view/disappearing_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});

  static Page<void> page() => const MaterialPage<void>(
        child: TabHome(),
      );

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  late final _colorScheme = Theme.of(context).colorScheme;
  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);
  int selectedIndex = 0;
  // Add from here...
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
              selectedIndex: selectedIndex,
              backgroundColor: _backgroundColor,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              child: buildBody(context),
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
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
    );
  }

  Widget buildBody(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: const [
        ConversationsScreen(),
        SettingsScreen(),
      ],
    );
  }

  void _addConversation(BuildContext rootContext) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: ConversationCreatePage(
                  repository: context.read<SyncRepository>(),
                  didSelectConversation: (conversation) {
                    Navigator.of(rootContext, rootNavigator: true).pop();
                  }),
            ));
  }
}
