import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class ScaffoldBuilder extends StatefulWidget {
  const ScaffoldBuilder({
    super.key,
    required this.items,
    this.indexController,
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
    this.bottomBarBackgroundColor,
  });
  final Color? titleColor;
  final bool? scrollableTabs;
  final Color? labelColor;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Color? bottomBarBackgroundColor;
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

  final PageEntries items;

  final void Function(ScaffoldBuilderController index)? onIndexChange;
  final ScaffoldBuilderController? indexController;

  @override
  State<ScaffoldBuilder> createState() => _ScaffoldBuilderState();
}

class ScaffoldBuilderController extends ValueNotifier<(int, int)> {
  ScaffoldBuilderController({int pageIndex = 0, int tabIndex = 0}) : super((pageIndex, tabIndex));

  int get pageIndex => value.$1;
  int get tabIndex => value.$2;

  int get oldPageIndex => oldIndex?.$1 ?? -1;
  int get oldTabIndex => oldIndex?.$2 ?? -1;

  (int, int)? get oldIndex => history.firstOrNull;

  List<(int, int)> history = [];

  void navigate({int? pageIndex, int? tabIndex}) {
    pageIndex ??= this.pageIndex;
    if (pageIndex != this.pageIndex && tabIndex == null) {
      tabIndex = 0;
    } else {
      tabIndex ??= this.tabIndex;
    }

    if (pageIndex != this.pageIndex || tabIndex != this.tabIndex) {
      history.insert(0, (this.pageIndex, this.tabIndex));
      value = (pageIndex, tabIndex);
      consoleLog("From $oldPageIndex:$oldTabIndex to $pageIndex:$tabIndex");
    }
  }

  void back() {
    if (canGoBack) {
      value = (oldPageIndex, oldTabIndex);
      history.removeAt(0);
    }
  }

  void reset() {
    value = (0, 0);
    history.clear();
  }

  bool get canGoBack => history.isNotEmpty;
}

class _ScaffoldBuilderState extends State<ScaffoldBuilder> with TickerProviderStateMixin {
  Widget? get mainDrawer {
    if (useDrawerInsteadOfBottomNavigationBar) {
      return Drawer(
        child: SizedBox(
          width: 100,
          child: ListView(
            shrinkWrap: true,
            children: drawerItems,
          ),
        ),
      );
    } else {
      return widget.drawer;
    }
  }

  late ScaffoldBuilderController indexController;
  @override
  initState() {
    indexController = widget.indexController ?? ScaffoldBuilderController();
    indexController.addListener(() {
      pageEntry.tabController?.animateTo(indexController.tabIndex);
    });
    super.initState();
  }

  bool get useDrawerInsteadOfBottomNavigationBar => widget.useDrawerInstedOfBottomNavigationBar && (widget.drawer == null || widget.drawer is! Drawer);

  PageEntry get pageEntry => widget.items[indexController.pageIndex];

  Widget get title => (pageEntry.titleWidget ?? forceWidget(widget.title) ?? forceWidget(indexController.pageIndex.toString()))!;

  void Function(int) get onNavigationTap {
    return (int value) {
      if (indexController.pageIndex == value) {
        var funcs = pageEntry.action;
        if (funcs != null) {
          (funcs)();
        }
      } else {
        indexController.navigate(pageIndex: value);
        setState(() {});
        if (widget.onIndexChange != null) {
          (widget.onIndexChange)!(indexController);
        }
      }
    };
  }

  Widget? get floatingActionButton => pageEntry.floatingActionButton ?? widget.floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => pageEntry.floatingActionButtonLocation ?? widget.floatingActionButtonLocation;

  Widget getDrawerItem(PageEntry entry, TabEntry page, [bool isSubmenu = false]) {
    var isThisPage = indexController.pageIndex == widget.items.indexOf(entry);
    var isThisTab = isThisPage && indexController.tabIndex == entry.pages.indexOf(page);

    IconData? icon = (isSubmenu ? page.icon : entry.icon);
    if (isThisTab && entry.action != null) {
      icon = entry.actionIcon ?? entry.activeIcon ?? icon;
    }

    Widget? title = (isSubmenu ? page.titleWidget : entry.titleWidget);
    if (isThisTab && entry.action != null && entry.actionTitle.isNotBlank) {
      title = forceWidget(entry.actionTitle) ?? title;
    }

    string? tooltip = (entry.tooltip.isNotBlank ? entry.tooltip : null);
    if (isThisTab && entry.action != null && entry.actionTooltip.isNotBlank) {
      tooltip = entry.actionTooltip;
    }

    return ListTile(
      leading: icon.asNullableIcon(),
      title: title,
      selectedColor: entry.backgroundColor,
      onTap: () {
        if (isThisTab) {
          var funcs = entry.action;
          if (funcs != null) {
            (funcs)();
          }
        } else {
          setState(() {
            indexController.navigate(pageIndex: widget.items.indexOf(entry), tabIndex: entry.pages.indexOf(page));
          });
          context.pop();
        }
      },
    ).wrapIf(tooltip.isNotBlank, (x) {
      return Tooltip(
        message: tooltip!,
        child: x,
      );
    });
  }

  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        if (!useDrawerInsteadOfBottomNavigationBar)
          for (var entry in widget.items)
            BottomNavigationBarItem(
              icon: Icon(entry.icon),
              activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon),
              label: indexController.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTitle : null) ?? entry.titleString : entry.titleString,
              tooltip: indexController.pageIndex == widget.items.indexOf(entry) ? (entry.action != null ? entry.actionTooltip : null) ?? entry.tooltip : entry.tooltip,
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
          if (widget.drawer != null && widget.drawer is! Drawer) widget.drawer!,
          for (var entry in widget.items)
            if (entry.pages.length > 1)
              ExpansionTile(
                initiallyExpanded: true,
                iconColor: widget.iconColor,
                childrenPadding: 10.fromLeft,
                title: entry.titleWidget!,
                leading: Icon(entry.icon),
                children: entry.pages.map((x) => getDrawerItem(entry, x, true)).toList(),
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
          i.tabController = TabController(vsync: this, length: i.pages.length, initialIndex: indexController.tabIndex.clamp(0, i.pages.length - 1));
          i.tabController!.addListener(() {
            indexController.navigate(tabIndex: i.tabController!.index);
            if (widget.onIndexChange != null) {
              widget.onIndexChange!(indexController);
            }
          });
        }
      }
    }
    List<Widget>? actionItems;
    if (pageEntry.showAllToolbarActions) {
      if (pageEntry.toolbarItems != null) {
        actionItems ??= [];
        actionItems.addAll(pageEntry.toolbarItems!);
      }
      if (pageEntry.toolbarItems != null && widget.actions != null && widget.actions!.isNotEmpty && pageEntry.toolbarItems!.isNotEmpty) {
        actionItems ??= [];
        actionItems.add(const SizedBox(width: 8));
      }
      if (widget.actions != null) {
        actionItems ??= [];
        actionItems.addAll(widget.actions!);
      }
    } else {
      actionItems = pageEntry.toolbarItems ?? widget.actions;
    }

    return Scaffold(
      key: widget.key,
      appBar: pageEntry.showAppBar || pageEntry.pages.length > 1 || useDrawerInsteadOfBottomNavigationBar
          ? AppBar(
              title: title,
              leading: widget.leading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: actionItems,
              bottom: pageEntry.pages.length > 1
                  ? TabBar(
                      controller: pageEntry.tabController!,
                      labelColor: widget.labelColor,
                      isScrollable: widget.scrollableTabs ?? false,
                      tabs: pageEntry.pages
                          .map((x) => Tab(
                                height: widget.tabHeight,
                                icon: Icon(x.icon),
                                child: forceWidget(x.title) ?? Text("#${pageEntry.pages.indexOf(x) + 1}"),
                              ))
                          .toList())
                  : null,
            )
          : null,
      body: (pageEntry.pages.length > 1
              ? TabBarView(
                  controller: pageEntry.tabController!,
                  children: pageEntry.pages.map((x) => x.child).toList(),
                )
              : pageEntry.pages.firstOrNull?.child ?? nil)
          .wrapIf(widget.wrapper != null, widget.wrapper ?? (x) => x),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: pageEntry.persistentFooterButtons,
      drawer: mainDrawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: bottomNavigationBarItems.length > 1
          ? BottomNavigationBar(
              unselectedItemColor: widget.iconColor,
              selectedItemColor: widget.activeIconColor,
              onTap: onNavigationTap,
              currentIndex: indexController.pageIndex,
              items: bottomNavigationBarItems,
              type: widget.bottomNavigationBarType,
              showUnselectedLabels: widget.showUnselectedLabels,
              backgroundColor: widget.bottomBarBackgroundColor,
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

typedef PageEntries = List<PageEntry>;
typedef TabEntries = List<TabEntry>;

class TabEntry {
  final dynamic title;
  final IconData? icon;
  final Widget child;

  string get titleString => (title is Text ? (title as Text).data : title.toString()) | "";

  Widget? get titleWidget => forceWidget(title);

  TabEntry({
    this.title,
    this.icon,
    required this.child,
  });
}

class PageEntry {
  final dynamic title;
  final IconData icon;

  final List<Widget>? toolbarItems;

  final IconData? activeIcon;
  final List<TabEntry> pages;
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

  PageEntry({
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
