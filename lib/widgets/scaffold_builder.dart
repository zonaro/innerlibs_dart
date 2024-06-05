import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldParts extends StatefulWidget {
  final List<MenuEntry> items;

  final void Function(int oldIndex, int newIndex)? onIndexChange;
  final ValueNotifier<int> currentIndex;

  final Widget Function(BuildContext context, int currentIndex, MenuEntry entry, void Function(int value) onNavigationTap, List<BottomNavigationBarItem> bottomNavigationItems) builder;

  const ScaffoldParts({
    super.key,
    required this.items,
    this.onIndexChange,
    required this.builder,
    required this.currentIndex,
  });

  @override
  State<ScaffoldParts> createState() => _ScaffoldPartsState();
}

class _ScaffoldPartsState extends State<ScaffoldParts> {
  

  Widget get page => widget.items[widget.currentIndex.value].page;

  int get currentIndex => widget.currentIndex.value;

  string get title => widget.items[widget.currentIndex.value].title;

  IconData get icon => widget.items[widget.currentIndex.value].icon;

  IconData get actionIcon => widget.items[widget.currentIndex.value].actionIcon ?? activeIcon;

  IconData get activeIcon => widget.items[widget.currentIndex.value].activeIcon ?? icon;

  string get actionTitle => widget.items[widget.currentIndex.value].actionTitle | title;

  void Function(int) get onNavigationTap {
    return (int value) {
      if (widget.currentIndex.value == value) {
        var funcs = widget.items[widget.currentIndex.value].action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        int old = widget.currentIndex.value;
        widget.currentIndex.value = value;
        if (widget.onIndexChange != null) {
          (widget.onIndexChange)!(old, value);
        }
      }
    };
  }

  Widget? get floatingActionButton => widget.items[widget.currentIndex.value].floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => widget.items[widget.currentIndex.value].floatingActionButtonLocation;

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        for (var entry in widget.items)
          BottomNavigationBarItem(
            icon: Icon(entry.icon),
            activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
            label: widget.currentIndex.value == widget.items.indexOf(entry) ? (entry.action == null ? null : entry.actionTitle) | entry.title : entry.title,
            tooltip: widget.currentIndex.value == widget.items.indexOf(entry) ? (entry.action == null ? null : entry.actionTooltip) | entry.tooltip : entry.tooltip,
            backgroundColor: entry.backgroundColor,
          ),
      ];

  @override
  Widget build(BuildContext context) => Builder(builder: (context) => widget.builder(context, currentIndex, widget.items[currentIndex], onNavigationTap, bottomNavigationBarItems));
}

typedef MenuEntries = List<MenuEntry>;

class MenuEntry {
  final string title;
  final IconData icon;
  final IconData? activeIcon;
  final Widget page;
  final string? tooltip;
  final string? actionTitle;
  final string? actionTooltip;
  final void Function()? action;
  final IconData? actionIcon;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;

  MenuEntry({
    required this.title,
    required this.icon,
    required this.page,
    this.activeIcon,
    this.tooltip,
    this.actionTooltip,
    this.backgroundColor,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.actionTitle,
    this.action,
    this.actionIcon,
  });
}
