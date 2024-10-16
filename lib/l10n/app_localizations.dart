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
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// Add
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// App
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// App Name
  ///
  /// In en, this message translates to:
  /// **'App Name'**
  String get appName;

  /// App Settings
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Apps
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get apps;

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

  /// Color
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

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
  String confirmDeleteMultiple(int count, String singular, String plural);

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

  /// Country
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @couldNotFindItem.
  ///
  /// In en, this message translates to:
  /// **'Could not find {item}.'**
  String couldNotFindItem(String item);

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

  /// Files
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

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

  /// Next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

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

  /// Phone
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

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

  /// To
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

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

  /// Warning
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// Width
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

  /// Yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;
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

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt': {
  switch (locale.countryCode) {
    case 'BR': return InnerLibsLocalizationsPtBr();
   }
  break;
   }
  }

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
