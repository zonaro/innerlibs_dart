import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldBuilder extends StatefulWidget {
  const ScaffoldBuilder({
    super.key,
    required this.items,
    this.onIndexChange,
    required this.currentIndex,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  final List<MenuEntry> items;

  final void Function(int oldIndex, int newIndex)? onIndexChange;
  final ValueNotifier<int> currentIndex;

  @override
  State<ScaffoldBuilder> createState() => _ScaffoldBuilderState();
}

class _ScaffoldBuilderState extends State<ScaffoldBuilder> {
  MenuEntry get entry => widget.items[widget.currentIndex.value];

  int get currentIndex => widget.currentIndex.value;

  string get title => entry.title;

  IconData get icon => entry.icon;

  IconData get actionIcon => entry.actionIcon ?? activeIcon;

  IconData get activeIcon => entry.activeIcon ?? icon;

  string get actionTitle => entry.actionTitle | title;

  void Function(int) get onNavigationTap {
    return (int value) {
      if (widget.currentIndex.value == value) {
        var funcs = entry.action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        int old = widget.currentIndex.value;
        widget.currentIndex.value = value;
        setState(() {});
        if (widget.onIndexChange != null) {
          (widget.onIndexChange)!(old, value);
        }
      }
    };
  }

  Widget? get floatingActionButton => entry.floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => entry.floatingActionButtonLocation;

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        for (var entry in widget.items)
          BottomNavigationBarItem(
            icon: Icon(entry.icon),
            activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
            label: widget.currentIndex.value == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTitle : null) ?? entry.title : entry.title,
            tooltip: widget.currentIndex.value == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTooltip : null) ?? entry.tooltip : entry.tooltip,
            backgroundColor: entry.backgroundColor,
          ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: AppBar(
        title: (entry.title as Object?).forceWidget,
        actions: entry.toolbarItems,
        bottom: entry.pages.length > 1
            ? TabBar(
                tabs: entry.pages
                    .map((x) => Tab(
                          icon: Icon(x.icon),
                          text: x.title,
                        ))
                    .toList())
            : null,
      ),
      body: entry.pages.length == 1
          ? entry.pages.first.page
          : TabBarView(
              children: entry.pages.map((x) => x.page).toList(),
            ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: entry.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: bottomNavigationBarItems.length > 1
          ? BottomNavigationBar(
              onTap: onNavigationTap,
              currentIndex: currentIndex,
              items: bottomNavigationBarItems,
            )
          : null,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      restorationId: widget.restorationId,
    ).wrapIf(entry.pages.length > 1, (x) {
      return DefaultTabController(length: entry.pages.length, child: x);
    });
  }
}

typedef MenuEntries = List<MenuEntry>;

class PageEntry {
  final dynamic title;
  final IconData? icon;
  final Widget page;

  PageEntry({
    required this.title,
    this.icon,
    required this.page,
  });
}

class MenuEntry {
  final dynamic title;
  final IconData icon;

  final List<Widget>? toolbarItems;

  final IconData? activeIcon;
  final List<PageEntry> pages;
  final string? tooltip;
  final string? actionTitle;
  final string? actionTooltip;
  final void Function()? action;
  final IconData? actionIcon;
  final List<Widget>? persistentFooterButtons;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;

  MenuEntry({
    required this.title,
    required this.icon,
    required this.pages,
    this.activeIcon,
    this.toolbarItems,
    this.tooltip,
    this.actionTooltip,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.actionTitle,
    this.action,
    this.actionIcon,
    this.persistentFooterButtons,
  });
}
