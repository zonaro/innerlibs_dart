import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of InnerLibsLocalizations
/// returned by `InnerLibsLocalizations.of(context)`.
///
/// Applications need to include `InnerLibsLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: InnerLibsLocalizations.localizationsDelegates,
///   supportedLocales: InnerLibsLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the InnerLibsLocalizations.supportedLocales
/// property.
abstract class InnerLibsLocalizations {
  InnerLibsLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static InnerLibsLocalizations of(BuildContext context) {
    return Localizations.of<InnerLibsLocalizations>(context, InnerLibsLocalizations)!;
  }

  static const LocalizationsDelegate<InnerLibsLocalizations> delegate = _InnerLibsLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Add
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @addTo.
  ///
  /// In en, this message translates to:
  /// **'Add to {item}'**
  String addTo(String item);

  /// App
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// Apply
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @applyItem.
  ///
  /// In en, this message translates to:
  /// **'Apply {item}'**
  String applyItem(String item);

  /// No description provided for @applyItemIn.
  ///
  /// In en, this message translates to:
  /// **'Apply {item} in {location}'**
  String applyItemIn(String item, String location);

  /// No description provided for @applyItemToItem.
  ///
  /// In en, this message translates to:
  /// **'Apply {item1} to {item2}'**
  String applyItemToItem(String item1, String item2);

  /// App Name
  ///
  /// In en, this message translates to:
  /// **'App Name'**
  String get appName;

  /// Apps
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get apps;

  /// App Settings
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Calculate
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// Call
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @calltoItem.
  ///
  /// In en, this message translates to:
  /// **'Call {item}'**
  String calltoItem(String item);

  /// Cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelItem.
  ///
  /// In en, this message translates to:
  /// **'Cancel {item}'**
  String cancelItem(String item);

  /// Categories
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Category
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Century
  ///
  /// In en, this message translates to:
  /// **'Century'**
  String get century;

  /// City
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Clear
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// Close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @closeItem.
  ///
  /// In en, this message translates to:
  /// **'Close {item}'**
  String closeItem(String item);

  /// Collect
  ///
  /// In en, this message translates to:
  /// **'Collect'**
  String get collect;

  /// Collects
  ///
  /// In en, this message translates to:
  /// **'Collects'**
  String get collects;

  /// Color
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// Command
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get command;

  /// Commands
  ///
  /// In en, this message translates to:
  /// **'Commands'**
  String get commands;

  /// Completed
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Confirm
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {item}?'**
  String confirmDelete(String item);

  /// No description provided for @confirmDeleteMultiple.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {count, plural, =1{1 {singular}} other{{count} {plural}}}?'**
  String confirmDeleteMultiple(int count, String plural, String singular);

  /// Contact
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// Contacts
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @couldNotFindItem.
  ///
  /// In en, this message translates to:
  /// **'Could not find {item}.'**
  String couldNotFindItem(String item);

  /// Country
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Dark Mode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Date out of range
  ///
  /// In en, this message translates to:
  /// **'Date out of range'**
  String get dateOutOfRange;

  /// Date Time Format
  ///
  /// In en, this message translates to:
  /// **'Date Time Format'**
  String get dateTimeFormat;

  /// Day
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// Day Mode
  ///
  /// In en, this message translates to:
  /// **'Day Mode'**
  String get dayMode;

  /// Days
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// Decade
  ///
  /// In en, this message translates to:
  /// **'Decade'**
  String get decade;

  /// Decades
  ///
  /// In en, this message translates to:
  /// **'Decades'**
  String get decades;

  /// Default
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultWord;

  /// Delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Device
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// Directories
  ///
  /// In en, this message translates to:
  /// **'Directories'**
  String get directories;

  /// Directory
  ///
  /// In en, this message translates to:
  /// **'Directory'**
  String get directory;

  /// Disable
  ///
  /// In en, this message translates to:
  /// **'Disable'**
  String get disable;

  /// Disabled
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @disabledItem.
  ///
  /// In en, this message translates to:
  /// **'Disabled {item}'**
  String disabledItem(String item);

  /// No description provided for @disabledItemIn.
  ///
  /// In en, this message translates to:
  /// **'Disabled {item} in {location}'**
  String disabledItemIn(String item, String location);

  /// No description provided for @disableItem.
  ///
  /// In en, this message translates to:
  /// **'Disable {item}'**
  String disableItem(String item);

  /// Dock
  ///
  /// In en, this message translates to:
  /// **'Dock'**
  String get dock;

  /// No description provided for @dockItem.
  ///
  /// In en, this message translates to:
  /// **'Dock {item}'**
  String dockItem(String item);

  /// Download
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// Downloaded
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// Downloading
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// No description provided for @downloadItem.
  ///
  /// In en, this message translates to:
  /// **'Download {item}'**
  String downloadItem(String item);

  /// Edit
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Empty
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// Emulate
  ///
  /// In en, this message translates to:
  /// **'Emulate'**
  String get emulate;

  /// Emulator
  ///
  /// In en, this message translates to:
  /// **'Emulator'**
  String get emulator;

  /// Emulators
  ///
  /// In en, this message translates to:
  /// **'Emulators'**
  String get emulators;

  /// Enable
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// Enabled
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @enabledItem.
  ///
  /// In en, this message translates to:
  /// **'Enabled {item}'**
  String enabledItem(String item);

  /// No description provided for @enabledItemIn.
  ///
  /// In en, this message translates to:
  /// **'Enabled {item} in {location}'**
  String enabledItemIn(String item, String location);

  /// No description provided for @enableItem.
  ///
  /// In en, this message translates to:
  /// **'Enable {item}'**
  String enableItem(String item);

  /// Error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Estate
  ///
  /// In en, this message translates to:
  /// **'Estate'**
  String get estate;

  /// Failed
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// Favorite
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @favoriteItem.
  ///
  /// In en, this message translates to:
  /// **'Favorite {item}'**
  String favoriteItem(String item);

  /// Favorites
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// File
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// File Date
  ///
  /// In en, this message translates to:
  /// **'File Date'**
  String get fileDate;

  /// File Name
  ///
  /// In en, this message translates to:
  /// **'File Name'**
  String get fileName;

  /// File not found
  ///
  /// In en, this message translates to:
  /// **'File not found'**
  String get fileNotFound;

  /// File Owner
  ///
  /// In en, this message translates to:
  /// **'File Owner'**
  String get fileOwner;

  /// File Permissions
  ///
  /// In en, this message translates to:
  /// **'File Permissions'**
  String get filePermissions;

  /// Files
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  /// File Size
  ///
  /// In en, this message translates to:
  /// **'File Size'**
  String get fileSize;

  /// File Type
  ///
  /// In en, this message translates to:
  /// **'File Type'**
  String get fileType;

  /// Find
  ///
  /// In en, this message translates to:
  /// **'Find'**
  String get find;

  /// No description provided for @findIn.
  ///
  /// In en, this message translates to:
  /// **'Find in {item}'**
  String findIn(String item);

  /// No description provided for @findItem.
  ///
  /// In en, this message translates to:
  /// **'Find {item}'**
  String findItem(String item);

  /// Finish
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// Finished
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// Folder
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get folder;

  /// Folder Name
  ///
  /// In en, this message translates to:
  /// **'Folder Name'**
  String get folderName;

  /// Follow
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @followItem.
  ///
  /// In en, this message translates to:
  /// **'Follow {item}'**
  String followItem(String item);

  /// Game
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// Games
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get games;

  /// Grid
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get grid;

  /// Grid Size
  ///
  /// In en, this message translates to:
  /// **'Grid Size'**
  String get gridSize;

  /// Grid View
  ///
  /// In en, this message translates to:
  /// **'Grid View'**
  String get gridView;

  /// Height
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get height;

  /// Hide
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// History
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// Hour
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get hour;

  /// Hours
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// Info
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Install
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get install;

  /// No description provided for @installItem.
  ///
  /// In en, this message translates to:
  /// **'Install {item}'**
  String installItem(String item);

  /// No description provided for @invalidItem.
  ///
  /// In en, this message translates to:
  /// **'Invalid {item}.'**
  String invalidItem(String item);

  /// No description provided for @itemLibrary.
  ///
  /// In en, this message translates to:
  /// **'{item} Library'**
  String itemLibrary(String item);

  /// No description provided for @itemNotFound.
  ///
  /// In en, this message translates to:
  /// **'{item} not found'**
  String itemNotFound(String item);

  /// No description provided for @itemNotFoundIn.
  ///
  /// In en, this message translates to:
  /// **'{item} not found in {location}'**
  String itemNotFoundIn(String item, String location);

  /// Libraries
  ///
  /// In en, this message translates to:
  /// **'Libraries'**
  String get libraries;

  /// Library
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// Light Mode
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// List
  ///
  /// In en, this message translates to:
  /// **'List'**
  String get list;

  /// List View
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;

  /// Loading
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// Loading {item}...
  ///
  /// In en, this message translates to:
  /// **'Loading {item}...'**
  String loadingItem(String item);

  /// Login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Logout
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Main
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// Main Color
  ///
  /// In en, this message translates to:
  /// **'Main Color'**
  String get mainColor;

  /// Map
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// Map View
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get mapView;

  /// Millennium
  ///
  /// In en, this message translates to:
  /// **'Millennium'**
  String get millennium;

  /// Millenniuns
  ///
  /// In en, this message translates to:
  /// **'Millenniuns'**
  String get millenniums;

  /// Millisecond
  ///
  /// In en, this message translates to:
  /// **'Millisecond'**
  String get millisecond;

  /// Milliseconds
  ///
  /// In en, this message translates to:
  /// **'Milliseconds'**
  String get milliseconds;

  /// Minute
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get minute;

  /// Minutes
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// Month
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// Months
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// Name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @newItem.
  ///
  /// In en, this message translates to:
  /// **'New {item}'**
  String newItem(String item);

  /// No description provided for @newItemToItem.
  ///
  /// In en, this message translates to:
  /// **'New {item1} to {item2}'**
  String newItemToItem(String item1, String item2);

  /// Next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Night
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get night;

  /// Night Mode
  ///
  /// In en, this message translates to:
  /// **'Night Mode'**
  String get nightMode;

  /// No
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Not Found
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get notFound;

  /// Number
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get number;

  /// OK
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Open
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @openIn.
  ///
  /// In en, this message translates to:
  /// **'Open in {item}'**
  String openIn(String item);

  /// No description provided for @openItem.
  ///
  /// In en, this message translates to:
  /// **'Open {item}'**
  String openItem(String item);

  /// No description provided for @openItemIn.
  ///
  /// In en, this message translates to:
  /// **'Open {item} in {location}'**
  String openItemIn(String item, String location);

  /// Overlay
  ///
  /// In en, this message translates to:
  /// **'Overlay'**
  String get overlay;

  /// Overlay Color
  ///
  /// In en, this message translates to:
  /// **'Overlay Color'**
  String get overlayColor;

  /// Overlay Opacity
  ///
  /// In en, this message translates to:
  /// **'Overlay Opacity'**
  String get overlayOpacity;

  /// Overlays
  ///
  /// In en, this message translates to:
  /// **'Overlays'**
  String get overlays;

  /// Owner
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Pause
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// Paused
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @pauseItem.
  ///
  /// In en, this message translates to:
  /// **'Pause {item}'**
  String pauseItem(String item);

  /// Pending
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// Phone
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Play
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// Playing
  ///
  /// In en, this message translates to:
  /// **'Playing'**
  String get playing;

  /// No description provided for @playItem.
  ///
  /// In en, this message translates to:
  /// **'Play {item}'**
  String playItem(String item);

  /// Previous
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Register
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @removeFrom.
  ///
  /// In en, this message translates to:
  /// **'Remove from {item}'**
  String removeFrom(String item);

  /// Remove from favorites
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromfavorites;

  /// Results
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// Save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Search
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchFor.
  ///
  /// In en, this message translates to:
  /// **'Search for {item}...'**
  String searchFor(String item);

  /// No description provided for @searchForIn.
  ///
  /// In en, this message translates to:
  /// **'Search for {item} in {location}'**
  String searchForIn(String item, String location);

  /// Second
  ///
  /// In en, this message translates to:
  /// **'Second'**
  String get second;

  /// Seconds
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get seconds;

  /// Send
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @sendItemToItem.
  ///
  /// In en, this message translates to:
  /// **'Send {item1} to {item2}'**
  String sendItemToItem(String item1, String item2);

  /// No description provided for @sendtoItem.
  ///
  /// In en, this message translates to:
  /// **'Send to {item}'**
  String sendtoItem(String item);

  /// Settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Share
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @shareItem.
  ///
  /// In en, this message translates to:
  /// **'Share {item}'**
  String shareItem(String item);

  /// Show
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// Size
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// Success
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Table
  ///
  /// In en, this message translates to:
  /// **'Table'**
  String get table;

  /// Table View
  ///
  /// In en, this message translates to:
  /// **'Table View'**
  String get tableView;

  /// Theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Theme Color
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get themeColor;

  /// Theme Mode
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// To
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @toItem.
  ///
  /// In en, this message translates to:
  /// **'To {item}'**
  String toItem(String item);

  /// Undock
  ///
  /// In en, this message translates to:
  /// **'Undock'**
  String get undock;

  /// No description provided for @undockItem.
  ///
  /// In en, this message translates to:
  /// **'Undock {item}'**
  String undockItem(String item);

  /// Unfavorite
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavorite;

  /// No description provided for @unfavoriteItem.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite {item}'**
  String unfavoriteItem(String item);

  /// Unfollow
  ///
  /// In en, this message translates to:
  /// **'Unfollow'**
  String get unfollow;

  /// No description provided for @unfollowItem.
  ///
  /// In en, this message translates to:
  /// **'Unfollow {item}'**
  String unfollowItem(String item);

  /// Uninstall
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uninstall;

  /// No description provided for @uninstallItem.
  ///
  /// In en, this message translates to:
  /// **'Uninstall {item}'**
  String uninstallItem(String item);

  /// Unknown
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @unknownItem.
  ///
  /// In en, this message translates to:
  /// **'Unknown {item}'**
  String unknownItem(String item);

  /// No description provided for @updateItem.
  ///
  /// In en, this message translates to:
  /// **'Update {item}'**
  String updateItem(String item);

  /// Username
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Value
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// View
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// View Type
  ///
  /// In en, this message translates to:
  /// **'View Type'**
  String get viewType;

  /// Wallpaper
  ///
  /// In en, this message translates to:
  /// **'Wallpaper'**
  String get wallpaper;

  /// Wallpaper Fade Time
  ///
  /// In en, this message translates to:
  /// **'Wallpaper Fade Time'**
  String get wallpaperFadeTime;

  /// Wallpaper Interval
  ///
  /// In en, this message translates to:
  /// **'Wallpaper Interval'**
  String get wallpaperInterval;

  /// Warning
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// Week
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// Weeks
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// Width
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

  /// Year
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// Years
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// Yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// You
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// Your
  ///
  /// In en, this message translates to:
  /// **'Your'**
  String get your;

  /// No description provided for @yourItem.
  ///
  /// In en, this message translates to:
  /// **'Your {item}'**
  String yourItem(String item);
}

class _InnerLibsLocalizationsDelegate extends LocalizationsDelegate<InnerLibsLocalizations> {
  const _InnerLibsLocalizationsDelegate();

  @override
  Future<InnerLibsLocalizations> load(Locale locale) {
    return SynchronousFuture<InnerLibsLocalizations>(lookupInnerLibsLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_InnerLibsLocalizationsDelegate old) => false;
}

InnerLibsLocalizations lookupInnerLibsLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return InnerLibsLocalizationsEn();
    case 'pt': return InnerLibsLocalizationsPt();
  }

  throw FlutterError(
    'InnerLibsLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
