import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldParts {
  final List<MenuEntry> items;

  final ValueNotifier<int> currentIndex;

  ScaffoldParts({required this.items, required this.currentIndex});

  Widget get page => items[currentIndex.value].page;
  string get title => items[currentIndex.value].title;
  IconData get icon => items[currentIndex.value].icon;
  IconData get actionIcon => items[currentIndex.value].actionIcon ?? activeIcon;
  IconData get activeIcon => items[currentIndex.value].activeIcon ?? icon;
  string get actionTitle => items[currentIndex.value].actionTitle | title;

  void Function(int) get onNavigationTap {
    return (int value) {
      if (currentIndex.value == value) {
        var funcs = items[currentIndex.value].action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        currentIndex.value = value;
      }
    };
  }

  Widget? get floatingActionButton => items[currentIndex.value].floatingActionButton;
  FloatingActionButtonLocation? get floatingActionButtonLocation => items[currentIndex.value].floatingActionButtonLocation;

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        for (var entry in items)
          BottomNavigationBarItem(
            icon: Icon(entry.icon),
            activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
            label: currentIndex.value == items.indexOf(entry) ? (entry.action == null ? null : entry.actionTitle) | entry.title : entry.title,
            tooltip: currentIndex.value == items.indexOf(entry) ? (entry.action == null ? null : entry.actionTooltip) | entry.tooltip : entry.tooltip,
            backgroundColor: entry.backgroundColor,
          ),
      ];
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
