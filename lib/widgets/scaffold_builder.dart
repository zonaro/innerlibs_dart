import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldBuilder extends StatefulWidget {
  const ScaffoldBuilder({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onIndexChange,
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
    this.floatingActionButton,
    this.title,
    this.appBarBackgroundColor,
    this.leading,
    this.actions,
    this.wrapper,
    this.iconColor,
    this.activeIconColor,
    this.bottomNavigationBarType,
    this.scrollableTabs,
    this.labelColor,
    this.titleColor,
    this.showUnselectedLabels = true,
    this.tabHeight,
    this.floatingActionButtonLocation,
    this.useDrawerInstedOfBottomNavigationBar = false,
  });
  final Color? titleColor;
  final bool? scrollableTabs;
  final Color? labelColor;
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
  final Widget? floatingActionButton;
  final dynamic title;
  final Color? appBarBackgroundColor;
  final Color? iconColor;
  final Color? activeIconColor;
  final Widget? leading;
  final List<Widget>? actions;
  final BottomNavigationBarType? bottomNavigationBarType;
  final bool showUnselectedLabels;
  final double? tabHeight;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool useDrawerInstedOfBottomNavigationBar;

  final Widget Function(Widget)? wrapper;

  final MenuEntries items;

  final void Function(int oldIndex, int newIndex)? onIndexChange;
  final ScaffoldBuilderIndex currentIndex;

  @override
  State<ScaffoldBuilder> createState() => _ScaffoldBuilderState();
}

class ScaffoldBuilderIndex extends ValueNotifier<(int, int)> {
  ScaffoldBuilderIndex({int pageIndex = 0, int tabIndex = 0}) : super((pageIndex, tabIndex));

  int get pageIndex => value.$1;
  set pageIndex(int v) => value = (v, 0);

  int get tabIndex => value.$2;
  set tabIndex(int v) => value = (value.$1, v);
}

class _ScaffoldBuilderState extends State<ScaffoldBuilder> with TickerProviderStateMixin {
  @override
  initState() {
    widget.currentIndex.addListener(() {
      consoleLog("${widget.currentIndex.pageIndex} - ${widget.currentIndex.tabIndex}");
      entry.tabController?.animateTo(widget.currentIndex.tabIndex);
    });
    super.initState();
  }

  bool get useDrawerInsteadOfBottomNavigationBar => widget.useDrawerInstedOfBottomNavigationBar && (widget.drawer == null || widget.drawer is DrawerHeader);

  MenuEntry get entry => widget.items[currentPageIndex];

  int get currentPageIndex => widget.currentIndex.pageIndex;
  set currentPageIndex(int value) => widget.currentIndex.pageIndex = value;

  int get currentTabIndex => entry.tabController?.index ?? 0;
  set currentTabIndex(int value) {
    if (entry.tabController != null) {
      value = value.clamp(0, entry.tabController!.length - 1);
      widget.currentIndex.tabIndex = value;
    }
  }

  Widget get title => (entry.titleWidget ?? forceWidget(widget.title) ?? forceWidget(currentPageIndex.toString()))!;

  IconData get icon => entry.icon;

  IconData get actionIcon => entry.actionIcon ?? activeIcon;

  IconData get activeIcon => entry.activeIcon ?? icon;

  string get actionTitle => entry.actionTitle | (title is Text ? (title as Text).data : title.toString()) | "";

  string get actionTooltip => entry.actionTooltip | entry.tooltip | "";

  void Function(int) get onNavigationTap {
    return (int value) {
      if (widget.currentIndex.pageIndex == value) {
        var funcs = entry.action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        int old = widget.currentIndex.pageIndex;
        widget.currentIndex.pageIndex = value;
        setState(() {});
        if (widget.onIndexChange != null) {
          (widget.onIndexChange)!(old, value);
        }
      }
    };
  }

  Widget? get floatingActionButton => entry.floatingActionButton ?? widget.floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => entry.floatingActionButtonLocation ?? widget.floatingActionButtonLocation;

  ListTile getDrawerItem(MenuEntry entry, PageEntry page, [bool isSubmenu = false]) {
    return ListTile(
      leading: forceWidget(isSubmenu ? page.icon : null) ?? (widget.currentIndex.pageIndex == widget.items.indexOf(entry) ? Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon) : Icon(entry.icon)),
      title: forceWidget(isSubmenu ? page.title : null) ?? forceWidget(widget.currentIndex.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTitle : null) ?? entry.titleString : entry.titleString),
      subtitle: forceWidget((widget.currentIndex.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTooltip : null) ?? entry.tooltip : entry.tooltip) ?? ""),
      selectedColor: entry.backgroundColor,
      onTap: () {
        if (widget.currentIndex.pageIndex == widget.items.indexOf(entry) && widget.currentIndex.tabIndex == entry.pages.indexOf(page)) {
          var funcs = entry.action;
          if (funcs != null) {
            (funcs)();
          }
        } else {
          setState(() {
            widget.currentIndex.pageIndex = widget.items.indexOf(entry);
          });
          setState(() {
            widget.currentIndex.tabIndex = entry.pages.indexOf(page);
          });
          context.pop();
        }
      },
    );
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        if (!useDrawerInsteadOfBottomNavigationBar)
          for (var entry in widget.items)
            BottomNavigationBarItem(
              icon: Icon(entry.icon),
              activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
              label: widget.currentIndex.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTitle : null) ?? entry.titleString : entry.titleString,
              tooltip: widget.currentIndex.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTooltip : null) ?? entry.tooltip : entry.tooltip,
              backgroundColor: entry.backgroundColor,
            ),
      ];

  List<Widget> get drawerItems => [
        if (useDrawerInsteadOfBottomNavigationBar) ...[
          if (context.canPop()) ...[
            ListTile(
              leading: const Icon(Icons.arrow_back),
              title: Text(context.localizations.backButtonTooltip),
              onTap: () {
                context.pop(); // pop drawer
                context.pop(); // pop page
              },
            ),
            const Divider(),
          ],
          if (widget.drawer is DrawerHeader) widget.drawer!,
          for (var entry in widget.items)
            if (entry.pages.length > 1)
              ExpansionTile(
                title: entry.titleWidget!,
                leading: Icon(entry.icon),
                children: entry.pages
                    .map(
                      (x) => getDrawerItem(
                        entry,
                        x,
                        true,
                      ),
                    )
                    .toList(),
              )
            else
              getDrawerItem(entry, entry.pages.singleOrNull!),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.close),
            title: Text(context.localizations.closeButtonTooltip),
            onTap: () {
              context.pop(); // pop drawer
            },
          ),
        ]
      ];

  @override
  Widget build(BuildContext context) {
    for (var i in widget.items) {
      if (i.pages.length > 1) {
        if (i.tabController == null) {
          i.tabController = TabController(vsync: this, length: i.pages.length, initialIndex: widget.currentIndex.tabIndex.clamp(0, i.pages.length - 1));
          i.tabController!.addListener(() {
            widget.currentIndex.tabIndex = i.tabController!.index;
          });
        }
      }
    }
    List<Widget>? actionItems;
    if (entry.showAllToolbarActions) {
      if (entry.toolbarItems != null) {
        actionItems ??= [];
        actionItems.addAll(entry.toolbarItems!);
      }
      if (entry.toolbarItems != null && widget.actions != null && widget.actions!.isNotEmpty && entry.toolbarItems!.isNotEmpty) {
        actionItems ??= [];
        actionItems.add(const SizedBox(width: 8));
      }
      if (widget.actions != null) {
        actionItems ??= [];
        actionItems.addAll(widget.actions!);
      }
    } else {
      actionItems = entry.toolbarItems ?? widget.actions;
    }

    return Scaffold(
      key: widget.key,
      appBar: entry.showAppBar || entry.pages.length > 1 || useDrawerInsteadOfBottomNavigationBar
          ? AppBar(
              title: title,
              leading: widget.leading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: actionItems,
              bottom: entry.pages.length > 1
                  ? TabBar(
                      controller: entry.tabController!,
                      labelColor: widget.labelColor,
                      isScrollable: widget.scrollableTabs ?? false,
                      tabs: entry.pages
                          .map((x) => Tab(
                                height: widget.tabHeight,
                                icon: Icon(x.icon),
                                child: forceWidget(x.title) ?? Text("#${entry.pages.indexOf(x) + 1}"),
                              ))
                          .toList())
                  : null,
            )
          : null,
      body: (entry.pages.length > 1
              ? TabBarView(
                  controller: entry.tabController!,
                  children: entry.pages.map((x) => x.child).toList(),
                )
              : entry.pages.firstOrNull?.child ?? nil)
          .wrapIf(widget.wrapper != null, widget.wrapper ?? (x) => x),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: entry.persistentFooterButtons,
      drawer: (useDrawerInsteadOfBottomNavigationBar ? Drawer(child: ListView(children: drawerItems)) : widget.drawer),
      endDrawer: widget.endDrawer,
      bottomNavigationBar: bottomNavigationBarItems.length > 1
          ? BottomNavigationBar(
              unselectedItemColor: widget.iconColor,
              selectedItemColor: widget.activeIconColor,
              onTap: onNavigationTap,
              currentIndex: currentPageIndex,
              items: bottomNavigationBarItems,
              type: widget.bottomNavigationBarType,
              showUnselectedLabels: widget.showUnselectedLabels,
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
    );
  }
}

typedef MenuEntries = List<MenuEntry>;

class PageEntry {
  final dynamic title;
  final IconData? icon;
  final Widget child;

  PageEntry({
    this.title,
    this.icon,
    required this.child,
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
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final string? route;

  final bool showAppBar;
  final bool showAllToolbarActions;

  TabController? tabController;

  Widget? get titleWidget => forceWidget(pages.singleOrNull?.title) ?? forceWidget(title);

  string get titleString => (title is Text ? (title as Text).data : title.toString()) | "";

  MenuEntry({
    this.route,
    this.showAllToolbarActions = true,
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
    this.showAppBar = true,
  });
}
