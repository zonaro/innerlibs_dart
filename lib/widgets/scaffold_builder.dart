// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

typedef PageEntries = List<PageEntry>;

typedef TabEntries = List<TabEntry>;

class PageEntry {
  final dynamic title;
  final IconData icon;

  final List<Widget>? toolbarItems;

  final IconData? activeIcon;
  final List<TabEntry> tabs;
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
  final void Function(string value)? onSearch;

  TabController? tabController;

  PageEntry(
      {this.route,
      this.showAllToolbarActions = true,
      required this.title,
      required this.icon,
      required this.tabs,
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
      this.onSearch});

  string get titleString => (title is Text ? (title as Text).data : title.toString()) | "";

  Widget? get titleWidget => forceWidget(tabs.singleOrNull?.title) ?? forceWidget(title);
}

/// A controller class for managing the state of a scaffold builder.
///
/// This class extends [ValueNotifier] and provides methods for navigating
/// between different pages and tabs within the scaffold builder.
class PageTabController with ChangeNotifier {
  final int defaultPageIndex;

  final int defaultTabIndex;
  int value = 0;

  final TextEditingController searchController = TextEditingController();

  /// A list of previous page and tab indices.
  List<(int, int)> history = [];

  PageEntry? _pageEntry;

  int _pageCount = 0;

  /// Creates a new instance of [PageTabController].
  ///
  /// The [pageIndex] and [tabIndex] parameters specify the initial page and tab
  /// indices respectively. By default, both indices are set to 0.
  PageTabController({this.defaultPageIndex = 0, this.defaultTabIndex = 0});

  /// Returns a boolean value indicating whether there is a previous index in the
  /// history list.
  bool get canGoBack => history.isNotEmpty;

  bool get isEmpty => pageCount == 0;

  bool get isMultiTab => tabCount > 1;

  bool get isNotEmpty => !isEmpty;

  bool get isSinglePage => pageCount == 1;
  bool get isSingleTab => tabCount == 1;
  bool get isTabEmpty => tabCount == 0;

  bool get isTabNotEmpty => !isTabEmpty;

  /// Returns the previous page and tab indices as a tuple.
  ///
  /// If there is no previous index, null is returned.
  (int, int)? get oldIndex => history.firstOrNull;

  /// Returns the previous page index.
  ///
  /// If there is no previous index, -1 is returned.
  int get oldPageIndex => oldIndex?.$1 ?? -1;

  /// Returns the previous tab index.
  ///
  /// If there is no previous index, -1 is returned.
  int get oldTabIndex => oldIndex?.$2 ?? -1;
  int get pageCount => _pageCount;

  PageEntry? get pageEntry => _pageEntry;

  /// Returns the current page index.
  int get pageIndex => value;

  set pageIndex(int i) => navigate(pageIndex: i);

  int get tabCount => pageEntry?.tabs.length ?? 0;

  TabEntry? get tabEntry => pageEntry?.tabs[tabIndex];

  /// Returns the current tab index.
  int get tabIndex => pageEntry?.tabController?.index ?? defaultTabIndex.clamp(0, (tabCount - 1).clampMin(0));

  set tabIndex(int i) => navigate(tabIndex: i);

  /// Navigates back to the previous page and tab indices.
  ///
  /// If there is a previous index in the history list, the current indices are
  /// updated to the previous indices, and the previous indices are removed from
  /// the history list.
  void back([int count = 1]) => navigate(pageIndex: count.forceNegative);

  void insertHistory(int pageIndex, int tabIndex) {
    if (history.isEmpty && pageIndex == defaultPageIndex && tabIndex == defaultTabIndex) return;
    if (history.firstOrNull == (pageIndex, tabIndex)) return;
    history.insert(0, (pageIndex, tabIndex));
  }

  /// Navigates to the specified page and tab indices.
  ///
  /// If [pageIndex] is not provided, the current page index is used.
  /// If [tabIndex] is not provided and [pageIndex] is different from the
  /// current page index, the tab index is set to 0. Otherwise, the current
  /// tab index is used.
  ///
  /// If either [pageIndex] or [tabIndex] is different from the current indices,
  /// the previous indices are stored in the history list, and the current
  /// indices are updated. Additionally, a log message is printed to the console
  /// indicating the navigation change.
  void navigate({int? pageIndex, int? tabIndex}) {
    if (pageCount == 0) return;
    int back = 0;

    pageIndex ??= this.pageIndex;

    if (pageIndex < 0) {
      back = pageIndex.forcePositive;
    } else if (tabIndex != null && tabIndex < 0) {
      back = tabIndex.forcePositive;
    }

    if (back > 0) {
      if (back > history.length) {
        Get.back();
        return;
      }

      if (history.isNotEmpty) {
        for (var i = 0; i < back; i++) {
          pageIndex = oldPageIndex;
          tabIndex = oldTabIndex;
          history.removeAt(0);
        }
      }
    }

    if (pageIndex != this.pageIndex && tabIndex == null) {
      tabIndex = 0;
    } else {
      tabIndex ??= this.tabIndex;
    }

    if (pageIndex != this.pageIndex || tabIndex != this.tabIndex) {
      if (back <= 0) {
        insertHistory(pageIndex!, tabIndex);
      }

      value = pageIndex!;
      tabIndex = tabIndex.clamp(0, ((pageEntry?.tabs.length ?? 0) - 1).clampMin(0));
      pageEntry?.tabController?.animateTo(tabIndex);
      consoleLog("From $oldPageIndex:$oldTabIndex to $pageIndex:$tabIndex");
      notifyListeners();
    }
  }

  /// Resets the controller to its initial state.
  ///
  /// The current indices are set to 0, and the history list is cleared.
  void reset() {
    pageIndex = defaultPageIndex;
    tabIndex = defaultTabIndex;
    history.clear();
  }
}

class PageTabScaffold extends StatefulWidget {
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
  final PageEntries items;
  final Widget Function(Widget)? wrapper;

  final PageTabController indexController;

  final bool automaticallyImplyLeading = true;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  const PageTabScaffold({
    super.key,
    required this.indexController,
    required this.items,
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
    this.scaffoldKey,
  });

  @override
  State<PageTabScaffold> createState() => _PageTabScaffoldState();
}

class TabEntry {
  final dynamic title;
  final IconData? icon;
  final Widget child;

  final void Function(string value)? onSearch;

  TabEntry({
    this.title,
    this.icon,
    required this.child,
    this.onSearch,
  });

  string get titleString => (title is Text ? (title as Text).data : title.toString()) | "";

  Widget? get titleWidget => forceWidget(title);
}

class _PageTabScaffoldState extends State<PageTabScaffold> with TickerProviderStateMixin {
  late PageTabController indexController;

  bool isSearching = false;

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
          if (widget.drawer != null && widget.drawer is! Drawer) widget.drawer!,
          for (var entry in widget.items)
            if (entry.tabs.length > 1)
              ExpansionTile(
                initiallyExpanded: widget.items.indexOf(entry) == indexController.pageIndex,
                iconColor: widget.iconColor,
                childrenPadding: 10.fromLeft,
                title: entry.titleWidget!,
                leading: Icon(entry.icon),
                children: entry.tabs.map((x) => _getDrawerItem(entry, x, true)).toList(),
              )
            else
              _getDrawerItem(entry, entry.tabs.singleOrNull!),
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

  Widget? get floatingActionButton => indexController.pageEntry?.floatingActionButton ?? widget.floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => indexController.pageEntry?.floatingActionButtonLocation ?? widget.floatingActionButtonLocation;

  bool get isSearchEnabled => onSearch != null;

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

  void Function(string value)? get onSearch => tabEntry?.onSearch ?? pageEntry?.onSearch;

  PageEntry? get pageEntry => indexController.pageEntry;

  PageEntries get pages => widget.items;

  GlobalKey<ScaffoldState> get scaffoldKey => widget.scaffoldKey ?? GlobalKey<ScaffoldState>();
  ScaffoldState get scaffoldState => scaffoldKey.currentState ?? Scaffold.of(context);

  TabEntry? get tabEntry => indexController.tabEntry;

  Widget get title => (indexController.pageEntry?.titleWidget ?? forceWidget(widget.title) ?? forceWidget(indexController.pageIndex.toString()))!;

  bool get useDrawerInsteadOfBottomNavigationBar => widget.useDrawerInstedOfBottomNavigationBar && (widget.drawer == null || widget.drawer is! Drawer);

  @override
  Widget build(BuildContext context) {
    for (var i in widget.items) {
      if (i.tabs.length > 1) {
        var initial = isThisPage(i) ? indexController.tabIndex.clamp(0, i.tabs.length - 1) : 0;
        if (i.tabController == null) {
          i.tabController = TabController(vsync: this, length: i.tabs.length, initialIndex: initial);
          i.tabController!.addListener(() {
            indexController.insertHistory(indexController.pageIndex, i.tabController!.index);
            indexController.notifyListeners();
          });
        }
      }
    }
    indexController._pageCount = widget.items.length;
    indexController._pageEntry = widget.items[indexController.pageIndex];

    List<Widget>? actionItems;
    if (pageEntry?.showAllToolbarActions ?? false) {
      if (pageEntry?.toolbarItems != null) {
        actionItems ??= [];
        actionItems.addAll(pageEntry!.toolbarItems ?? []);
      }
      if (pageEntry != null && pageEntry?.toolbarItems != null && widget.actions != null && widget.actions!.isNotEmpty && pageEntry!.toolbarItems!.isNotEmpty) {
        actionItems ??= [];
        actionItems.add(const SizedBox(width: 8));
      }
      if (widget.actions != null) {
        actionItems ??= [];
        actionItems.addAll(widget.actions!);
      }
    } else {
      actionItems = pageEntry?.toolbarItems ?? widget.actions;
    }

    if (isSearchEnabled) {
      actionItems ??= [];
      actionItems.insert(0, _searchButton());
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: (pageEntry != null && (pageEntry!.showAppBar || pageEntry!.tabs.length > 1)) || useDrawerInsteadOfBottomNavigationBar
          ? AppBar(
              title: isSearching
                  ? TextField(
                      autofocus: true,
                      controller: indexController.searchController,
                      decoration: const InputDecoration(),
                      onSubmitted: (value) {
                        if (onSearch != null) onSearch!(value);
                        setState(() {});
                      },
                    )
                  : title,
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: actionItems,
              bottom: indexController.isSingleTab == false
                  ? TabBar(
                      controller: pageEntry!.tabController!,
                      labelColor: widget.labelColor,
                      isScrollable: widget.scrollableTabs ?? false,
                      tabs: pageEntry!.tabs
                          .map(
                            (x) => Tab(
                              height: widget.tabHeight,
                              icon: Icon(x.icon),
                              child: forceWidget(x.title) ?? Text("#${pageEntry!.tabs.indexOf(x) + 1}"),
                            ),
                          )
                          .toList())
                  : null,
            )
          : null,
      body: (indexController.isSingleTab == false && indexController.isTabNotEmpty
              ? TabBarView(
                  controller: pageEntry!.tabController!,
                  children: pageEntry!.tabs.map((x) => x.child).toList(),
                )
              : pageEntry?.tabs.firstOrNull?.child ?? Container())
          .wrapIf(widget.wrapper != null, widget.wrapper ?? (x) => x),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      persistentFooterButtons: pageEntry?.persistentFooterButtons,
      drawer: mainDrawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: bottomNavigationBarItems.length > 1
          ? BottomNavigationBar(
              unselectedItemColor: widget.iconColor,
              selectedItemColor: widget.activeIconColor,
              onTap: (index) {
                if (indexController.pageIndex == index) {
                  var funcs = pageEntry?.action;
                  if (funcs != null) {
                    (funcs)();
                  }
                } else {
                  indexController.pageIndex = index;
                }
              },
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

  @override
  initState() {
    super.initState();
    indexController = widget.indexController;
    indexController.addListener(() {
      isSearching = false;
      setState(() {});
    });
  }

  bool isThisPage(PageEntry page) => indexController.pageIndex == widget.items.indexOf(page);

  bool isThisTab(PageEntry page, TabEntry tab) => isThisPage(page) && indexController.tabIndex == page.tabs.indexOf(tab);

  bool startSearch() {
    if (isSearching) {
      indexController.searchController.clear();
    }
    isSearching = !isSearching;
    return isSearching;
  }

  Widget _getDrawerItem(PageEntry page, TabEntry tab, [bool isSubmenu = false]) {
    IconData? icon = (isSubmenu ? tab.icon : page.icon);
    if (isThisTab(page, tab) && page.action != null) {
      icon = page.actionIcon ?? page.activeIcon ?? icon;
    }

    Widget? title = (isSubmenu ? tab.titleWidget : page.titleWidget);
    if (isThisTab(page, tab) && page.action != null && page.actionTitle.isNotBlank) {
      title = forceWidget(page.actionTitle) ?? title;
    }

    string? tooltip = (page.tooltip.isNotBlank ? page.tooltip : null);
    if (isThisTab(page, tab) && page.action != null && page.actionTooltip.isNotBlank) {
      tooltip = page.actionTooltip;
    }

    return ListTile(
      leading: icon.asNullableIcon(),
      title: title,
      selectedColor: page.backgroundColor,
      onTap: () {
        if (isThisTab(page, tab)) {
          var funcs = pageEntry?.action;
          if (funcs != null) {
            (funcs)();
          }
        } else {
          indexController.navigate(pageIndex: widget.items.indexOf(page), tabIndex: page.tabs.indexOf(tab));
        }
      },
    ).wrapIf(tooltip.isNotBlank, (x) {
      return Tooltip(
        message: tooltip!,
        child: x,
      );
    });
  }

  IconButton _searchButton() {
    return IconButton(
        icon: Icon(isSearching ? Icons.close : Icons.search),
        onPressed: () {
          startSearch();
          setState(() {});
        });
  }
}
