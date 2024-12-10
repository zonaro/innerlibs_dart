// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// A list of page entries.
typedef PageEntries = List<PageEntry>;

/// A list of tab entries.
typedef TabEntries = List<TabEntry>;

/// Represents a page entry with various properties and methods.
class PageEntry {
  /// The title of the page.
  final dynamic title;

  /// The subtitle of the page.
  final dynamic subtitle;

  /// The icon of the page.
  final IconData icon;

  /// The toolbar items of the page.
  final List<Widget>? toolbarItems;

  /// The active icon of the page.
  final IconData? activeIcon;

  /// The tabs of the page.
  final List<TabEntry> tabs;

  /// The tooltip of the page.
  final String? tooltip;

  /// The action title of the page.
  final String? actionTitle;

  /// The action tooltip of the page.
  final String? actionTooltip;

  /// The action of the page.
  final void Function()? action;

  /// The action icon of the page.
  final IconData? actionIcon;

  /// The persistent footer buttons of the page.
  final List<Widget>? persistentFooterButtons;

  /// The floating action button location of the page.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// The floating action button of the page.
  final Widget? floatingActionButton;

  /// The background color of the page.
  final Color? backgroundColor;

  /// The route of the page.
  final String? route;

  /// Whether to show the app bar.
  final bool showAppBar;

  /// Whether to show all toolbar actions.
  final bool showAllToolbarActions;

  /// The search callback function.
  final void Function(String value)? onSearch;

  /// The tab controller of the page.
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

  /// Returns the current full route of the page.
  String get currentFullRoute => "$pageRoute/$currentTabRoute".trimAny(["/"]);

  /// Returns the current tab of the page.
  TabEntry get currentTab => hasTabs ? tabs[tabIndex] : tabs.first;

  /// Returns the current tab route of the page.
  String get currentTabRoute => tabRoute(tabIndex);

  @override
  int get hashCode => currentFullRoute.hashCode;

  /// Whether the page has multiple tabs.
  bool get hasTabs => tabs.length > 1;

  /// Whether the page has a single tab.
  bool get isSingleTab => tabs.length == 1;

  /// Returns the page route.
  String get pageRoute => route ?? "/${titleString.urlFriendly}";

  /// Returns the subtitle string.
  String get subtitleString => subtitleWidget?.text | "";

  // String get subtitleString => subtitle is Text ? (subtitle as Text).text : "$subtitle" | "";

  /// Returns the subtitle widget.
  Widget? get subtitleWidget => forceWidget(tabs.singleOrNull?.subtitle) ?? forceWidget(subtitle);

  /// Returns the current tab index.
  int get tabIndex => hasTabs ? tabController?.index ?? 0 : 0;

  /// Returns the title string.
  String get titleString => titleWidget?.text | "";

  // String get titleString => title is Text ? (title as Text).text : "$title" | "";

  /// Returns the title widget.
  Widget? get titleWidget => forceWidget(tabs.singleOrNull?.title) ?? forceWidget(title);

  @override
  bool operator ==(Object other) {
    if (other is PageEntry) {
      return currentFullRoute == other.currentFullRoute;
    }
    return false;
  }

  /// Returns the search callback function for the specified tab index.
  void Function(String value)? onSearchFunction(int? tabIndex) {
    return tabs[tabIndex ?? this.tabIndex].onSearch ?? onSearch;
  }

  /// Returns the route title for the specified tab index.
  String routeTitle([int tabIndex = 0]) => hasTabs ? "$titleString / ${tabs[tabIndex].titleString}" : titleString;

  /// Returns the full route for the specified tab index.
  String tabFullRoute([int tabIndex = 0]) => hasTabs ? "$pageRoute/${tabRoute(tabIndex)}" : pageRoute;

  /// Returns the route for the specified tab index.
  String tabRoute([int tabIndex = 0]) => hasTabs ? tabs[tabIndex].tabRoute : "";

  /// Returns the route title for the specified tab index.
  String tabRouteTitle(int tabIndex) => "$titleString / ${tabRoute(tabIndex)}".trimAny(["/"]);

  @override
  String toString() => titleString;
}

/// A controller class for managing the state of a scaffold builder.
///
/// This class extends [ValueNotifier] and provides methods for navigating
/// between different pages and tabs within the scaffold builder.
// ignore: must_be_immutable
class PageTabController extends GlobalKey<_PageTabScaffoldState> with ChangeNotifier {
  final TextEditingController _searchController = TextEditingController();

  int _pageIndex = 0;
  int _tabIndex = 0;

  /// A list of previous page and tab indices.
  List<(int, int, DateTime)> _history = [];

  bool _isSearching = false;

  /// Creates a new instance of [PageTabController].
  ///
  /// The [pageIndex] and [tabIndex] parameters specify the initial page and tab
  /// indices respectively. By default, both indices are set to 0.
  PageTabController({
    int defaultPageIndex = 0,
    int defaultTabIndex = 0,
  }) : super.constructor() {
    _history = [(defaultPageIndex, defaultTabIndex, now)];
    _pageIndex = defaultPageIndex;
    _tabIndex = defaultTabIndex;
  }

  /// Returns a boolean value indicating whether there is a previous index in the
  /// history list.
  bool get canGoBack => history.length > 1;

  /// Returns the current page.
  PageEntry get currentPage => pages[pageIndex];

  /// Returns the current route.
  String get currentRoute => currentPage.currentFullRoute;

  /// Returns the current tab.
  TabEntry get currentTab => currentPage.tabs[tabIndex];

  /// Returns the default index.
  (int, int, DateTime) get defaultIndex => history.last;

  /// Returns the default page index.
  int get defaultPageIndex => defaultIndex.$1;

  /// Returns the default tab index.
  int get defaultTabIndex => defaultIndex.$2;

  /// Returns the history list.
  List<(int, int, DateTime)> get history {
    _history = _history.orderByDescending((x) => x.$3).toList();
    return _history;
  }

  /// Returns the history pages.
  Iterable<PageEntry> get historyPages => history.map((x) => pages[x.$1]);

  /// Returns the history page tabs.
  Iterable<(PageEntry, TabEntry, DateTime)> get historyPageTabs => history.map((x) => (pages[x.$1], pages[x.$1].tabs[x.$2], x.$3));

  /// Whether the page count is zero.
  bool get isEmpty => pageCount == 0;

  /// Whether the page count is not zero.
  bool get isNotEmpty => !isEmpty;

  /// Whether the search is active.
  bool get isSearching => onSearch != null && (search.isNotBlank || _isSearching);

  set isSearching(bool value) {
    _isSearching = value;
    if (!value) search = "";
    if (onSearch != null) {
      onSearch!(search);
    }
  }

  /// Whether there is a single page.
  bool get isSinglePage => pageCount == 1;

  /// Returns the search callback function.
  void Function(String value)? get onSearch => stateLoaded ? currentPage.onSearchFunction(tabIndex) : null;

  /// Returns the page count.
  int get pageCount => pages.length;

  /// Returns the current page index.
  int get pageIndex => _pageIndex;

  set pageIndex(int i) => navigate(pageIndex: i);

  /// Returns the list of pages.
  List<PageEntry> get pages => currentState!.pages;

  /// Returns the previous page, tab, and date.
  (PageEntry, TabEntry, DateTime) get previous => (pages[previousIndex.$1], pages[previousIndex.$1].tabs[previousIndex.$2], previousIndex.$3);

  /// Returns the previous index.
  (int, int, DateTime) get previousIndex => history.length == 1 ? history.first : history.skip(1).first;

  /// Returns the previous page.
  PageEntry get previousPage => previous.$1;

  /// Returns the previous page index.
  int get previousPageIndex => previousIndex.$1;

  /// Returns the previous tab.
  TabEntry get previousTab => previous.$2;

  /// Returns the previous tab index.
  int get previousTabIndex => previousIndex.$2;

  /// Gets or sets the search text.
  String get search => _searchController.text;
  set search(String text) {
    if (onSearch != null) {
      if (text.isNotBlank) {
        isSearching = true;
      }
      _searchController.text = text;
    }
  }

  /// Whether the state is loaded.
  bool get stateLoaded => currentState != null && currentState!.mounted;

  /// Gets or sets the current tab index.
  int get tabIndex => _tabIndex;
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

  /// Navigates back to the specified page and tab indices.
  void backTo(int pageIndex, int tabIndex) {
    if (_history.any((x) => x.$1 == pageIndex && x.$2 == tabIndex)) {
      while (this.pageIndex != pageIndex || this.tabIndex != tabIndex) {
        back();
      }
    }
  }

  /// Inserts a history entry with the specified page and tab indices.
  (int, int, DateTime) insertHistory(int pageIndex, int tabIndex, [DateTime? timestamp]) {
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

    // if page index is higher than the page count, round navigate to index 0 + the difference
    if (pageIndex >= pageCount) {
      pageIndex = 0 + (pageIndex - pageCount);
    }

    if (pageIndex != this.pageIndex && tabIndex == null) {
      tabIndex = 0;
    } else {
      tabIndex ??= this.tabIndex;
    }

    if (pageIndex != this.pageIndex || tabIndex != this.tabIndex) {
      consoleLog("From $previousPageIndex:$previousTabIndex to $pageIndex:$tabIndex");
      _pageIndex = pageIndex;
      if (currentPage.hasTabs) {
        // if page index is higher than the tab count, round navigate to index 0 + the difference
        if (tabIndex >= currentPage.tabs.length) {
          tabIndex = 0 + (tabIndex - currentPage.tabs.length);
          currentPage.tabController?.animateTo(tabIndex);
        }
      } else {
        tabIndex = 0;
      }
      _tabIndex = tabIndex;
      insertHistory(pageIndex, tabIndex);
      notifyListeners();
    }
  }

  /// Navigates to the specified route.
  void navigateToRoute(String route) {
    var parts = route.split("/");
    var pageIndex = pages.indexWhere((x) => x.pageRoute == "/${parts[1]}");
    var tabIndex = pages[pageIndex].tabs.indexWhere((x) => x.tabRoute == "/${parts[2]}");
    navigate(pageIndex: pageIndex, tabIndex: tabIndex);
  }

  /// Resets the indexes and history list to their default values.
  void reset() {
    _pageIndex = defaultPageIndex;
    _tabIndex = defaultTabIndex;
    _history = [(defaultPageIndex, defaultTabIndex, now)];
  }

  /// Returns the route for the specified page and tab indices.
  String route(int pageIndex, [int tabIndex = 0]) {
    var page = pages[pageIndex];
    return page.tabFullRoute(tabIndex);
  }

  /// Returns the route title for the specified page and tab indices.
  String routeTitle(int pageIndex, [int tabIndex = 0]) {
    var page = pages[pageIndex];
    return page.routeTitle(tabIndex);
  }

  /// Shows the history menu at the specified position.
  void showHistoryMenu(BuildContext context, Offset position, [String? format, String? locale]) async {
    // show a context menu with the history.
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

/// A scaffold widget that supports pages and tabs.
class PageTabScaffold<T> extends StatefulWidget {
  /// The color of the title.
  final Color? titleColor;

  /// Whether the tabs are scrollable.
  final bool? scrollableTabs;

  /// The color of the tab labels.
  final Color? labelColor;

  /// The drawer widget.
  final Widget? drawer;

  /// The end drawer widget.
  final Widget? endDrawer;

  /// The bottom sheet widget.
  final Widget? bottomSheet;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// The background color of the bottom bar.
  final Color? bottomBarBackgroundColor;

  /// Whether to resize the scaffold to avoid the bottom inset.
  final bool? resizeToAvoidBottomInset;

  /// Whether the scaffold is the primary scaffold.
  final bool primary;

  /// The drag start behavior for the drawer.
  final DragStartBehavior drawerDragStartBehavior;

  /// Whether to extend the body of the scaffold.
  final bool extendBody;

  /// Whether to extend the body behind the app bar.
  final bool extendBodyBehindAppBar;

  /// The scrim color for the drawer.
  final Color? drawerScrimColor;

  /// The edge drag width for the drawer.
  final double? drawerEdgeDragWidth;

  /// Whether to enable open drag gesture for the drawer.
  final bool drawerEnableOpenDragGesture;

  /// Whether to enable open drag gesture for the end drawer.
  final bool endDrawerEnableOpenDragGesture;

  /// The restoration ID for the scaffold.
  final String? restorationId;

  /// The floating action button widget.
  final Widget? floatingActionButton;

  /// The title of the scaffold.
  final dynamic title;

  /// The subtitle of the scaffold.
  final dynamic subtitle;

  /// The background color of the app bar.
  final Color? appBarBackgroundColor;

  /// The color of the icons.
  final Color? iconColor;

  /// The color of the active icons.
  final Color? activeIconColor;

  /// The leading widget for the app bar.
  final Widget? leading;

  /// The actions for the app bar.
  final List<Widget>? actions;

  /// The type of the bottom navigation bar.
  final BottomNavigationBarType? bottomNavigationBarType;

  /// Whether to show unselected labels in the bottom navigation bar.
  final bool showUnselectedLabels;

  /// The height of the tabs.
  final double? tabHeight;

  /// The location of the floating action button.
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Whether to use the drawer instead of the bottom navigation bar.
  final bool useDrawerInstedOfBottomNavigationBar;

  /// The page entries for the scaffold.
  final PageEntries items;

  /// The wrapper function for the scaffold body.
  final Widget Function(Widget)? wrapper;

  /// The controller for managing the state of the scaffold.
  final PageTabController pageTabController;

  /// Whether to automatically imply the leading widget.
  final bool automaticallyImplyLeading;

  /// The global key for the scaffold state.
  final GlobalKey<ScaffoldState>? scaffoldKey;

  /// The callback function for navigation events.
  final void Function(int oldPageIndex, int oldTabIndex, int newPageIndex, int newTabIndex)? onNavigate;

  /// The builder function for tabs.
  final Widget Function(PageEntry page, TabEntry tab)? tabBuilder;

  final double? leadingWidth;

  const PageTabScaffold({
    required this.pageTabController,
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
    this.automaticallyImplyLeading = true,
    this.onNavigate,
    this.tabBuilder,
    this.leadingWidth,
  }) : super(key: pageTabController);

  @override
  State<PageTabScaffold> createState() => _PageTabScaffoldState();
}

/// Represents a tab entry with various properties and methods.
class TabEntry {
  /// The title of the tab.
  ///
  /// This can be a string, a text widget, or any other widget.
  final dynamic title;

  /// The subtitle of the tab.
  ///
  /// This can be a string, a text widget, or any other widget.
  final dynamic subtitle;

  /// The icon of the tab.
  final IconData? icon;

  /// The floating action button of the tab.
  final Widget? floatingActionButton;

  /// The route of the tab.
  final String? route;

  /// The child widget of the tab.
  final Widget child;

  /// Whether to inherit the icon from the [PageEntry].
  final bool inheritIcon;

  /// The search callback function for the tab.
  final void Function(String value)? onSearch;

  /// The floating action button location of the tab.
  FloatingActionButtonLocation? floatingActionButtonLocation;

  TabEntry({
    this.title,
    this.subtitle,
    this.icon,
    required this.child,
    this.onSearch,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.route,
    this.inheritIcon = true,
  });

  /// Returns the subtitle string of the tab.
  String get subtitleString => subtitleWidget?.text | "";

  /// Returns the subtitle widget of the tab.
  Widget? get subtitleWidget => forceWidget(subtitle);

  /// Returns the route of the tab.
  String get tabRoute => route ?? "/${titleString.urlFriendly}";

  /// Returns the title string of the tab.
  ///
  /// This will extract the text from widget tree if the title is a widget.
  String get titleString => titleWidget?.text | "";

  /// Returns the title widget of the tab.
  Widget? get titleWidget => forceWidget(title);

  @override
  String toString() => titleString;
}

class _PageTabScaffoldState extends State<PageTabScaffold> with TickerProviderStateMixin {
  /// The controller for managing the state of the scaffold.
  late PageTabController indexController;

  /// The global key for the scaffold state.
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
                children: entry.tabs.map((x) => getDrawerItem(entry, x, true)).toList(),
              )
            else
              getDrawerItem(entry, entry.tabs.singleOrNull!),
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

  bool get isSearching => isSearchEnabled && indexController.isSearching;

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

  void Function(String value)? get onSearch => indexController.onSearch;

  PageEntry get pageEntry => pages[indexController.pageIndex];
  PageEntries get pages => widget.items;

  (PageEntry, TabEntry, DateTime) get previous => indexController.previous;
  (int, int, DateTime) get previousIndex => indexController.previousIndex;

  ScaffoldState get scaffoldState => scaffoldKey.currentState ?? Scaffold.of(context);

  Widget? get subtitle => tabEntry.subtitleWidget ?? pageEntry.subtitleWidget ?? forceWidget(widget.subtitle);

  String get subtitleString => subtitle?.text | "";

  TabEntry get tabEntry => pageEntry.tabs[indexController.tabIndex];

  Widget get title => (pageEntry.titleWidget ?? forceWidget(widget.title) ?? forceWidget(indexController.pageIndex.toString()))!;

  Widget get titleAndSubtitle => ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        contentPadding: 0.allAround,
        visualDensity: VisualDensity.compact,
        dense: true,
        leading: Icon(pageEntry.icon),
        title: title,
        subtitle: subtitle,
        minVerticalPadding: 0,
      );

  String get titleString => title.text | "";

  bool get useDrawerInsteadOfBottomNavigationBar => widget.useDrawerInstedOfBottomNavigationBar && (widget.drawer == null || widget.drawer is! Drawer);

  Scaffold baseScaff(List<Widget>? actionItems) {
    return Scaffold(
      key: scaffoldKey,
      appBar: ((pageEntry.showAppBar || pageEntry.tabs.length > 1)) || useDrawerInsteadOfBottomNavigationBar
          ? AppBar(
              leadingWidth: widget.leadingWidth,
              title: isSearching
                  ? TextFormField(
                      autofocus: true,
                      controller: indexController._searchController,
                      onFieldSubmitted: (value) {
                        if (value.isBlank) {
                          isSearching = false;
                        }
                        onSearch!(value);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: titleString,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            if (indexController.search.isBlank) {
                              isSearching = false;
                            }
                            onSearch!(indexController.search);
                            setState(() {});
                          },
                        ),
                      ),
                      textInputAction: TextInputAction.search,
                    )
                  : titleAndSubtitle,
              leading: widget.leading,
              automaticallyImplyLeading: widget.automaticallyImplyLeading,
              backgroundColor: widget.appBarBackgroundColor,
              foregroundColor: widget.titleColor,
              actions: actionItems,
              bottom: pageEntry.isSingleTab == false ? TabBar(controller: pageEntry.tabController!, labelColor: widget.labelColor, isScrollable: widget.scrollableTabs ?? false, tabs: pageEntry.tabs.map((x) => tabBuilder(pageEntry, x)).toList()) : null,
            )
          : null,
      body: (pageEntry.hasTabs
              ? TabBarView(
                  controller: pageEntry.tabController!,
                  children: pageEntry.tabs.map((x) => x.child).toList(),
                )
              : pageEntry.tabs.firstOrNull?.child ?? Container())
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

  @override
  Widget build(BuildContext context) {
    for (var i in widget.items) {
      if (i.hasTabs) {
        if (i.tabController == null) {
          var initial = isThisPage(i) ? indexController.tabIndex : 0;
          i.tabController = TabController(vsync: this, length: i.tabs.length, initialIndex: initial);
          i.tabController!.addListener(() {
            indexController.insertHistory(indexController.pageIndex, i.tabController!.index);
            indexController._tabIndex = i.tabController!.index;
            _sameSearchCheck();
            if (mounted) {
              indexController.notifyListeners();
              setState(() {});
            }
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

    return baseScaff(actionItems);
  }

  Widget getDrawerItem(PageEntry page, TabEntry tab, [bool isSubmenu = false]) {
    IconData? icon = (isSubmenu ? tab.icon : page.icon);
    if (isThisTab(page, tab) && page.action != null) {
      icon = page.actionIcon ?? page.activeIcon ?? icon;
    }

    Widget? title = (isSubmenu ? tab.titleWidget : page.titleWidget);
    if (isThisTab(page, tab) && page.action != null && page.actionTitle.isNotBlank) {
      title = forceWidget(page.actionTitle) ?? title;
    }

    String? tooltip = (page.tooltip.isNotBlank ? page.tooltip : null);
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

  @override
  initState() {
    super.initState();
    scaffoldKey = widget.scaffoldKey ?? GlobalKey<ScaffoldState>();
    indexController = widget.pageTabController;
    indexController.addListener(() {
      _sameSearchCheck();
      _fireOnNavigate();
      if (mounted) setState(() {});
    });
  }

  bool isThisPage(PageEntry page) => indexController.pageIndex == widget.items.indexOf(page);

  bool isThisTab(PageEntry page, TabEntry tab) => isThisPage(page) && indexController.tabIndex == page.tabs.indexOf(tab);

  Widget tabBuilder(PageEntry pageEntry, TabEntry tabEntry) {
    if (widget.tabBuilder != null) {
      return widget.tabBuilder!(pageEntry, tabEntry);
    } else {
      return Tab(
        height: widget.tabHeight,
        icon: tabEntry.icon != null
            ? Icon(tabEntry.icon)
            : tabEntry.inheritIcon
                ? Icon(pageEntry.icon)
                : null,
        child: tabEntry.titleWidget ?? Text("${pageEntry.titleWidget?.text ?? ""} #${pageEntry.tabs.indexOf(tabEntry) + 1}".trim()),
      );
    }
  }

  bool toggleSearch() {
    if (isSearching && indexController._searchController.text.isNotBlank) {
      indexController._searchController.clear();
      onSearch!("");
    } else {
      isSearching = !isSearching;
    }
    return isSearching;
  }

  void _fireOnNavigate() {
    if (widget.onNavigate != null) {
      widget.onNavigate!(previousIndex.$1, previousIndex.$2, indexController.pageIndex, indexController.tabIndex);
    }
  }

  void _sameSearchCheck() {
    var pref = indexController.previousPage.onSearchFunction(indexController.previousTabIndex);
    if (onSearch != pref) {
      indexController.isSearching = false;
      indexController.search = "";
    }
    if (mounted) setState(() {});
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
