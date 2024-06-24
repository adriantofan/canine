import 'package:applib/applib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

class SkaffoldView extends StatefulWidget {
  final Widget child;

  SkaffoldView({super.key, required this.child});

  @override
  State<SkaffoldView> createState() => _SkaffoldViewState();
}

class _SkaffoldViewState extends State<SkaffoldView> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state is AppStateReady) {
          final idx = _getSelectedWorkspaceIndex(state);
          if (idx != null) {
            if (_controller.selectedIndex != idx) {
              _controller.selectIndex(idx);
            }
          } else {
            _controller.selectIndex(0);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: widget.child,
          appBar: AppBar(
            foregroundColor: white,
            backgroundColor: canvasColor,
            title: const Text('Clemia'),
            leading: const MenuWidget(),
          ),
          drawer: (state is AppStateReady)
              ? SidebarX(
                  controller: _controller,
                  theme: SidebarXTheme(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: canvasColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(color: Colors.white),
                    selectedTextStyle: const TextStyle(color: Colors.white),
                    itemTextPadding: const EdgeInsets.only(left: 30),
                    selectedItemTextPadding: const EdgeInsets.only(left: 30),
                    itemDecoration: BoxDecoration(
                      border: Border.all(color: canvasColor),
                    ),
                    selectedItemDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: actionColor.withOpacity(0.37),
                      ),
                      gradient: const LinearGradient(
                        colors: [accentCanvasColor, canvasColor],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.28),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  extendedTheme: const SidebarXTheme(
                    width: 200,
                    decoration: BoxDecoration(
                      color: canvasColor,
                    ),
                    margin: EdgeInsets.only(right: 10),
                  ),
                  // footerDivider: divider,
                  headerBuilder: (context, extended) {
                    return const SafeArea(
                      child: SizedBox(
                        height: 20,
                        child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child:
                                SizedBox() //Image.asset('assets/images/avatar.png'),
                            ),
                      ),
                    );
                  },
                  items: buildItems(state),
                  footerItems: [
                    SidebarXItem(
                      selectable: false,
                      icon: Icons.logout,
                      label: 'Logout',
                      onTap: () {
                        if (context.mounted) {
                          GoRouter.of(context).go(AppRoutes.logout.path);
                        }
                      },
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }

  List<SidebarXItem> buildItems(AppStateReady state) {
    return state.workspaces
        .map((key, value) => MapEntry(
            key,
            SidebarXItem(
              label: value.workspace.name,
              onTap: () {
                debugPrint('${value.workspace.name} tapped');
              },
              iconBuilder: (selected, hovered) => CircleAvatar(
                child: Text(getAvatarInitials(value.workspace.name)),
              ),
            )))
        .values
        .toList();
  }

  int? _getSelectedWorkspaceIndex(AppStateReady state) {
    final workspaceId = state.workspaceId;
    if (workspaceId == null) {
      return null;
    }

    return state.workspaces.keys.toList().indexOf(workspaceId);
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(Icons.menu_rounded),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
const actionColor = Color(0xFF5F5FA7);

final divider = Divider(color: white.withOpacity(0.3), height: 1);
