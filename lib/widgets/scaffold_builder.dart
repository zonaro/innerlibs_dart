// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

typedef PageEntries<T> = List<PageEntry<T>>;

typedef TabEntries<T> = List<TabEntry<T>>;

class PageEntry<T> {
  final dynamic title;
  final dynamic subtitle;
  final IconData icon;

  final List<Widget>? toolbarItems;

  final IconData? activeIcon;
  final List<TabEntry<T>> tabs;
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

  PageEntry({
    this.route,
    this.showAllToolbarActions = true,
    required this.title,
    this.subtitle,
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
    this.onSearch,
  });

  string get currentFullRoute => "$pageRoute/$currentTabRoute".trimAny(["/"]);

  TabEntry<T> get currentTab => hasTabs ? tabs[tabIndex] : tabs.first;

  string get currentTabRoute => tabRoute(tabIndex);
  bool get hasTabs => tabs.length > 1;
  bool get isSingleTab => tabs.length == 1;

  string get pageRoute => route ?? "/${titleString.urlFriendly}";

  string get subtitleString => subtitleWidget?.text | "";

  // string get subtitleString => subtitle is Text ? (subtitle as Text).text : "$subtitle" | "";

  Widget? get subtitleWidget => forceWidget(tabs.singleOrNull?.subtitle) ?? forceWidget(subtitle);

  int get tabIndex => hasTabs ? tabController?.index ?? 0 : 0;

  string get titleString => titleWidget?.text | "";

  // string get titleString => title is Text ? (title as Text).text : "$title" | "";

  Widget? get titleWidget => forceWidget(tabs.singleOrNull?.title) ?? forceWidget(title);

  string routeTitle([int tabIndex = 0]) => hasTabs ? "$titleString / ${tabs[tabIndex].titleString}" : titleString;

  string tabFullRoute([int tabIndex = 0]) => hasTabs ? "$pageRoute/${tabRoute(tabIndex)}" : pageRoute;

  string tabRoute([int tabIndex = 0]) => hasTabs ? tabs[tabIndex].tabRoute : "";
  string tabRouteTitle(int tabIndex) => "$titleString / ${tabRoute(tabIndex)}".trimAny(["/"]);

  @override
  string toString() => titleString;
}

/// A controller class for managing the state of a scaffold builder.
///
/// This class extends [ValueNotifier] and provides methods for navigating
/// between different pages and tabs within the scaffold builder.
// ignore: must_be_immutable
class PageTabController<T> extends GlobalKey<_PageTabScaffoldState<T>> with ChangeNotifier {
  int value = 0;

  /// Data to store the data returned by future function. If not specified, a new instance of [AwaiterData] is created.
  AwaiterData<T>? data;
  final TextEditingController searchController = TextEditingController();

  /// A list of previous page and tab indices.
  List<(int, int, DateTime)> _history = [];

  bool isSearching = false;

  late Key key;

  /// Creates a new instance of [PageTabController].
  ///
  /// The [pageIndex] and [tabIndex] parameters specify the initial page and tab
  /// indices respectively. By default, both indices are set to 0.
  PageTabController({
    Key? key,
    int defaultPageIndex = 0,
    int defaultTabIndex = 0,
    this.data,
  }) : super.constructor() {
    _history = [(defaultPageIndex, defaultTabIndex, now)];
    value = defaultPageIndex;
    this.key = key ?? this;
  }

  /// Returns a boolean value indicating whether there is a previous index in the
  /// history list.
  bool get canGoBack => history.length > 1;

  PageEntry<T> get currentPage => pages[pageIndex];

  string get currentRoute => currentPage.currentFullRoute;

  TabEntry<T> get currentTab => currentPage.tabs[tabIndex];

  (int, int, date) get defaultIndex => history.last;

  int get defaultPageIndex => defaultIndex.$1;

  int get defaultTabIndex => defaultIndex.$2;

  List<(int, int, date)> get history {
    _history = _history.orderByDescending((x) => x.$3).toList();
    return _history;
  }

  Iterable<PageEntry<T>> get historyPages => history.map((x) => pages[x.$1]);

  bool get isEmpty => pageCount == 0;

  bool get isNotEmpty => !isEmpty;

  bool get isSinglePage => pageCount == 1;

  int get pageCount => pages.length;

  /// Returns the current page index.
  int get pageIndex => value;

  set pageIndex(int i) => navigate(pageIndex: i);

  List<PageEntry<T>> get pages => currentState!.pages;

  /// Returns the previous page and tab indices as a tuple.
  ///
  /// If there is no previous index, null is returned.
  (int, int, date) get previousIndex => history.first;

  /// Returns the previous page index.
  ///
  /// If there is no previous index, -1 is returned.
  int get previousPageIndex => previousIndex.$1;

  /// Returns the previous tab index.
  ///
  /// If there is no previous index, -1 is returned.
  int get previousTabIndex => previousIndex.$2;

  string get search => searchController.text;

  set search(string text) => searchController.text = text;

  /// Returns the current tab index.
  int get tabIndex => currentPage.tabIndex;

  set tabIndex(int i) => navigate(tabIndex: i);

  /// Navigates back to the previous page and tab indices.
  ///
  /// If there is a previous index in the history list, the current indices are
  /// updated to the previous indices, and the previous indices are removed from
  /// the history list.
  void back([int count = 1]) {
    for (var i = 0; i < count; i++) {
      if (canGoBack) {
        _history.removeAt(0);
      }
    }
    navigate(pageIndex: previousPageIndex, tabIndex: previousTabIndex);
  }

  void backTo(int pageIndex, int tabIndex) {
    if (_history.any((x) => x.$1 == pageIndex && x.$2 == tabIndex)) {
      while (this.pageIndex != pageIndex || this.tabIndex != tabIndex) {
        back();
      }
    }
  }

  (int, int, DateTime) insertHistory(int pageIndex, int tabIndex, [date? timestamp]) {
    timestamp ??= now;
    var historyEntry = (pageIndex, tabIndex, timestamp);
    _history = [historyEntry, ..._history].orderBy((x) => x.$3).toList();
    _history.removeEqualSiblings(compareFunction: (a, b) => a.$1 == b.$1 && a.$2 == b.$2);
    return historyEntry;
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
    pageIndex ??= this.pageIndex;
    if (pageIndex != this.pageIndex && tabIndex == null) {
      tabIndex = 0;
    } else {
      tabIndex ??= this.tabIndex;
    }

    if (pageIndex != this.pageIndex || tabIndex != this.tabIndex) {
      consoleLog("From $previousPageIndex:$previousTabIndex to $pageIndex:$tabIndex");
      insertHistory(pageIndex, tabIndex);
      value = pageIndex;
      if (currentPage.hasTabs) {
        tabIndex = tabIndex.clamp(0, (currentPage.tabs.length - 1).clampMin(0));
        currentPage.tabController?.animateTo(tabIndex);
      }
      notifyListeners();
    }
  }

  /// Resets the indexes and history list to their default values.
  void reset() {
    pageIndex = defaultPageIndex;
    tabIndex = defaultTabIndex;
    _history = [(defaultPageIndex, defaultTabIndex, now)];
  }

  string route(int pageIndex, [int tabIndex = 0]) {
    var page = pages[pageIndex];
    return page.tabFullRoute(tabIndex);
  }

  string routeTitle(int pageIndex, [int tabIndex = 0]) {
    var page = pages[pageIndex];
    return page.routeTitle(tabIndex);
  }

  void showHistoryMenu(BuildContext context, Offset position, [string? format, string? locale]) async {
    // show a contextmenu with the history.
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    await showMenu(
      context: context,
      position: RelativeRect.fromRect(
          position & const Size(40, 40), // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
          ),
      items: [
        for (var i in history)
          PopupMenuItem(
            enabled: history.indexOf(i) > 0,
            value: i,
            onTap: () {
              back(history.indexOf(i));
            },
            child: ListTile(
              leading: const Icon(Icons.history),
              title: Text(routeTitle(i.$1, i.$2)),
              subtitle: Text(i.$3.format(format, locale)),
            ),
          ),
      ],
      elevation: 8.0,
    );
  }
}

class PageTabScaffold<T> extends StatefulWidget {
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
  final dynamic subtitle;
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
  final PageEntries<T> items;
  final Widget Function(Widget)? wrapper;

  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> Function()? future;

  /// When true, return [emptyChild] instead of [ErrorWidget]. If [errorChild] is not null, this property do nothing.
  /// The default value is [kReleaseMode]
  final bool supressError;

  /// A [Widget] to return if [T] is null (or invalid if [data.validateData] is true). If not specified return a shrink [SizedBox]
  final Widget? emptyChild;

  /// [Widget] to show while waiting for [future] response. If not specified return a [CircularProgressIndicator]
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Function to be called after the data is loaded. Receive the data returned by [future] function.
  final void Function(T?)? afterLoad;

  /// Function to be called before the data is loaded.
  final void Function()? beforeLoad;

  final PageTabController<T> indexController;

  final bool automaticallyImplyLeading;

  final GlobalKey<ScaffoldState>? scaffoldKey;

  const PageTabScaffold({
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
    this.subtitle,
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
    this.future,
    this.supressError = kReleaseMode,
    this.emptyChild,
    this.loading,
    this.errorChild,
    this.afterLoad,
    this.beforeLoad,
    this.automaticallyImplyLeading = true,
  }) : super(key: indexController);

  @override
  State<PageTabScaffold<T>> createState() => _PageTabScaffoldState<T>();
}

class TabEntry<T> {
  final dynamic title;
  final dynamic subtitle;
  final IconData? icon;
  final Widget? floatingActionButton;
  final string? route;
  final Widget Function(T) builder;

  final void Function(string value)? onSearch;

  FloatingActionButtonLocation? floatingActionButtonLocation;

  TabEntry({
    this.title,
    this.subtitle,
    this.icon,
    required this.builder,
    this.onSearch,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.route,
  });

  string get subtitleString => subtitleWidget?.text | "";

  Widget? get subtitleWidget => forceWidget(subtitle);

  string get tabRoute => route ?? "/${titleString.urlFriendly}";

  string get titleString => titleWidget?.text | "";

  Widget? get titleWidget => forceWidget(title);

  @override
  string toString() => titleString;
}

class _PageTabScaffoldState<T> extends State<PageTabScaffold<T>> with TickerProviderStateMixin {
  late PageTabController<T> indexController;

  late GlobalKey<ScaffoldState> scaffoldKey;
  List<BottomNavigationBarItem> get bottomNavigationBarItems => [
        if (!useDrawerInsteadOfBottomNavigationBar)
          for (var entry in widget.items)
            BottomNavigationBarItem(
              icon: Icon(entry.icon, color: widget.iconColor),
              activeIcon: Icon((entry.action == null ? null : entry.actionIcon) ?? entry.activeIcon ?? entry.icon, color: widget.activeIconColor),
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
            title: Text(context.translations.close),
            onTap: () {
              context.pop(); // pop drawer
            },
          ),
        ]
      ];

  Widget? get floatingActionButton => tabEntry.floatingActionButton ?? pageEntry.floatingActionButton ?? widget.floatingActionButton;

  FloatingActionButtonLocation? get floatingActionButtonLocation => tabEntry.floatingActionButtonLocation ?? pageEntry.floatingActionButtonLocation ?? widget.floatingActionButtonLocation;

  bool get isSearchEnabled => onSearch != null;

  bool get isSearching => indexController.isSearching;

  set isSearching(bool value) => indexController.isSearching = value;

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

  void Function(string value)? get onSearch => tabEntry.onSearch ?? pageEntry.onSearch;

  PageEntry<T> get pageEntry => pages[indexController.pageIndex];
  PageEntries<T> get pages => widget.items;

  ScaffoldState get scaffoldState => scaffoldKey.currentState ?? Scaffold.of(context);

  Widget? get subtitle => tabEntry.subtitleWidget ?? pageEntry.subtitleWidget ?? forceWidget(widget.subtitle);

  TabEntry<T> get tabEntry => pageEntry.tabs[indexController.tabIndex];

  Widget get title => (pageEntry.titleWidget ?? forceWidget(widget.title) ?? forceWidget(indexController.pageIndex.toString()))!;

  Widget get titleAndSubtitle => ListTile(
        dense: true,
        leading: Icon(pageEntry.icon),
        title: title,
        subtitle: subtitle,
        minVerticalPadding: 0,
      );

  string get titleString => (title is Text ? (title as Text).data : title.toString()) | "";

  bool get useDrawerInsteadOfBottomNavigationBar => widget.useDrawerInstedOfBottomNavigationBar && (widget.drawer == null || widget.drawer is! Drawer);

  @override
  Widget build(BuildContext context) {
    for (var i in widget.items) {
      if (i.hasTabs) {
        var initial = isThisPage(i) ? indexController.tabIndex : 0;
        if (i.tabController == null) {
          i.tabController = TabController(vsync: this, length: i.tabs.length, initialIndex: initial);
          i.tabController!.addListener(() {
            indexController.insertHistory(indexController.pageIndex, i.tabController!.index);
            if (mounted) indexController.notifyListeners();
          });
        }
      }
    }

    List<Widget>? actionItems;
    if (pageEntry.showAllToolbarActions) {
      if (pageEntry.toolbarItems != null) {
        actionItems ??= [];
        actionItems.addAll(pageEntry.toolbarItems ?? []);
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

    if (isSearchEnabled) {
      actionItems ??= [];
      actionItems.insert(0, _searchButton());
    }
    if (widget.future != null) {
      return FutureAwaiter(
        future: widget.future!,
        data: indexController.data,
        emptyChild: emptyWidget(),
        loading: loadingWidget(),
        errorChild: errorWidget,
        supressError: widget.supressError,
        afterLoad: widget.afterLoad,
        beforeLoad: widget.beforeLoad,
        builder: (x) => _baseScaff(actionItems),
      );
    } else {
      return _baseScaff(actionItems);
    }
  }

  Widget emptyWidget() => Scaffold(
      key: scaffoldKey,
      appBar: pageEntry.showAppBar
          ? AppBar(
              title: const TitleLoading(),
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: widget.actions,
            )
          : null,
      body: widget.emptyChild ?? const SizedBox.shrink());

  Widget errorWidget(Object error) => Scaffold(
      key: scaffoldKey,
      appBar: pageEntry.showAppBar
          ? AppBar(
              title: titleAndSubtitle,
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: widget.actions,
            )
          : null,
      body: widget.errorChild != null ? widget.errorChild!(error) : ErrorWidget(error));

  @override
  initState() {
    super.initState();
    scaffoldKey = widget.scaffoldKey ?? GlobalKey<ScaffoldState>();
    indexController = widget.indexController;
    indexController.data ??= AwaiterData<T>(validateData: false);
    indexController.addListener(() {
      isSearching = false;
      if (mounted) setState(() {});
    });
  }

  bool isThisPage(PageEntry<T> page) => indexController.pageIndex == widget.items.indexOf(page);

  bool isThisTab(PageEntry<T> page, TabEntry<T> tab) => isThisPage(page) && indexController.tabIndex == page.tabs.indexOf(tab);

  Widget loadingWidget() => Scaffold(
      key: scaffoldKey,
      appBar: pageEntry.showAppBar
          ? AppBar(
              title: const TitleLoading(),
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: widget.actions,
            )
          : null,
      body: widget.loading ?? const Center(child: CircularProgressIndicator()));

  bool toggleSearch() {
    if (isSearching && indexController.searchController.text.isNotBlank) {
      indexController.searchController.clear();
      if (onSearch != null) {
        onSearch!("");
      }
    } else {
      isSearching = !isSearching;
    }
    return isSearching;
  }

  Scaffold _baseScaff(List<Widget>? actionItems) {
    return Scaffold(
      key: scaffoldKey,
      appBar: ((pageEntry.showAppBar || pageEntry.tabs.length > 1)) || useDrawerInsteadOfBottomNavigationBar
          ? AppBar(
              title: isSearching && onSearch != null
                  ? TextField(
                      autofocus: true,
                      controller: indexController.searchController,
                      decoration: InputDecoration(
                        labelText: titleString,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            if (onSearch != null) onSearch!(indexController.searchController.text);
                            setState(() {});
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.search,
                      onSubmitted: (value) {
                        if (onSearch != null) onSearch!(value);
                        setState(() {});
                      },
                    )
                  : GestureDetector(
                      child: titleAndSubtitle,
                      onDoubleTapDown: (d) {
                        indexController.showHistoryMenu(context, d.globalPosition);
                      },
                    ),
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: actionItems,
              bottom: pageEntry.isSingleTab == false
                  ? TabBar(
                      controller: pageEntry.tabController!,
                      labelColor: widget.labelColor,
                      isScrollable: widget.scrollableTabs ?? false,
                      tabs: pageEntry.tabs
                          .map(
                            (x) => Tab(
                              height: widget.tabHeight,
                              icon: Icon(x.icon),
                              child: forceWidget(x.title) ?? Text("#${pageEntry.tabs.indexOf(x) + 1}"),
                            ),
                          )
                          .toList())
                  : null,
            )
          : null,
      body: (pageEntry.hasTabs
              ? TabBarView(
                  controller: pageEntry.tabController!,
                  children: pageEntry.tabs.map((x) => x.builder(indexController.data!.value as T)).toList(),
                )
              : pageEntry.tabs.firstOrNull?.builder(indexController.data!.value as T) ?? Container())
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
              onTap: (index) {
                if (indexController.pageIndex == index) {
                  var funcs = pageEntry.action;
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

  Widget _getDrawerItem(PageEntry<T> page, TabEntry<T> tab, [bool isSubmenu = false]) {
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
          var funcs = pageEntry.action;
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
          toggleSearch();
          setState(() {});
        });
  }
}
