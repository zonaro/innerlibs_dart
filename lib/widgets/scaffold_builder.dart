import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldParts {
  final List<MenuEntry> items;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final void Function(int oldIndex, int newIndex)? onIndexChange;

  ScaffoldParts({
    required this.items,
    int currentIndex = 0,
    this.onIndexChange,
  }) {
    _currentIndex.value = currentIndex;
  }

  Widget get page => items[_currentIndex.value].page;
  int get currentIndex => _currentIndex.value;
  string get title => items[_currentIndex.value].title;
  IconData get icon => items[_currentIndex.value].icon;
  IconData get actionIcon => items[_currentIndex.value].actionIcon ?? activeIcon;
  IconData get activeIcon => items[_currentIndex.value].activeIcon ?? icon;
  string get actionTitle => items[_currentIndex.value].actionTitle | title;

  void Function(int) get onNavigationTap {
    return (int value) {
      if (_currentIndex.value == value) {
        var funcs = items[_currentIndex.value].action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        int old = _currentIndex.value;
        _currentIndex.value = value;
        if (onIndexChange != null) {
          (onIndexChange)!(old, value);
        }
      }
    };
  }

  Widget? get floatingActionButton => items[_currentIndex.value].floatingActionButton;
  FloatingActionButtonLocation? get floatingActionButtonLocation => items[_currentIndex.value].floatingActionButtonLocation;

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        for (var entry in items)
          BottomNavigationBarItem(
            icon: Icon(entry.icon),
            activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
            label: _currentIndex.value == items.indexOf(entry) ? (entry.action == null ? null : entry.actionTitle) | entry.title : entry.title,
            tooltip: _currentIndex.value == items.indexOf(entry) ? (entry.action == null ? null : entry.actionTooltip) | entry.tooltip : entry.tooltip,
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
