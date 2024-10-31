import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class InnerLibsLocalizationsEn extends InnerLibsLocalizations {
  InnerLibsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get add => 'Add';

  @override
  String get app => 'App';

  @override
  String get appName => 'App Name';

  @override
  String get apps => 'Apps';

  @override
  String get appSettings => 'App Settings';

  @override
  String get back => 'Back';

  @override
  String get calculate => 'Calculate';

  @override
  String get call => 'Call';

  @override
  String calltoItem(String item) {
    return 'Call $item';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get categories => 'Categories';

  @override
  String get category => 'Category';

  @override
  String get city => 'City';

  @override
  String get clear => 'Clear';

  @override
  String get close => 'Close';

  @override
  String closeItem(String item) {
    return 'Close $item';
  }

  @override
  String get collect => 'Collect';

  @override
  String get collects => 'Collects';

  @override
  String get color => 'Color';

  @override
  String get command => 'Command';

  @override
  String get commands => 'Commands';

  @override
  String get completed => 'Completed';

  @override
  String get confirm => 'Confirm';

  @override
  String confirmDelete(String item) {
    return 'Are you sure you want to delete $item?';
  }

  @override
  String confirmDeleteMultiple(int count, String plural, String singular) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString $plural',
      one: '1 $singular',
    );
    return 'Are you sure you want to delete $_temp0?';
  }

  @override
  String get contact => 'Contact';

  @override
  String get contacts => 'Contacts';

  @override
  String couldNotFindItem(String item) {
    return 'Could not find $item.';
  }

  @override
  String get country => 'Country';

  @override
  String get date => 'Date';

  @override
  String get dateOutOfRange => 'Date out of range';

  @override
  String get days => 'Days';

  @override
  String get decades => 'Decades';

  @override
  String get defaultWord => 'Default';

  @override
  String get delete => 'Delete';

  @override
  String get device => 'Device';

  @override
  String get dock => 'Dock';

  @override
  String dockItem(String item) {
    return 'Dock $item';
  }

  @override
  String get edit => 'Edit';

  @override
  String get empty => 'Empty';

  @override
  String get emulate => 'Emulate';

  @override
  String get emulator => 'Emulator';

  @override
  String get emulators => 'Emulators';

  @override
  String get error => 'Error';

  @override
  String get estate => 'Estate';

  @override
  String get failed => 'Failed';

  @override
  String get file => 'File';

  @override
  String get fileDate => 'File Date';

  @override
  String get fileName => 'File Name';

  @override
  String get fileNotFound => 'File not found';

  @override
  String get fileOwner => 'File Owner';

  @override
  String get filePermissions => 'File Permissions';

  @override
  String get files => 'Files';

  @override
  String get fileSize => 'File Size';

  @override
  String get fileType => 'File Type';

  @override
  String get find => 'Find';

  @override
  String findIn(String item) {
    return 'Find in $item';
  }

  @override
  String findItem(String item) {
    return 'Find $item';
  }

  @override
  String get finish => 'Finish';

  @override
  String get finished => 'Finished';

  @override
  String get folder => 'Folder';

  @override
  String get folderName => 'Folder Name';

  @override
  String get game => 'Game';

  @override
  String get games => 'Games';

  @override
  String get grid => 'Grid';

  @override
  String get gridSize => 'Grid Size';

  @override
  String get gridView => 'Grid View';

  @override
  String get height => 'Height';

  @override
  String get hide => 'Hide';

  @override
  String get hours => 'Hours';

  @override
  String get info => 'Info';

  @override
  String get install => 'Install';

  @override
  String installItem(String item) {
    return 'Install $item';
  }

  @override
  String invalidItem(String item) {
    return 'Invalid $item.';
  }

  @override
  String itemNotFound(String item) {
    return '$item not found';
  }

  @override
  String itemNotFoundIn(String item, String location) {
    return '$item not found in $location';
  }

  @override
  String get list => 'List';

  @override
  String get listView => 'List View';

  @override
  String get loading => 'Loading';

  @override
  String loadingItem(String item) {
    return 'Loading $item...';
  }

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get main => 'Main';

  @override
  String get mainColor => 'Main Color';

  @override
  String get map => 'Map';

  @override
  String get mapView => 'Map View';

  @override
  String get minutes => 'Minutes';

  @override
  String get months => 'Months';

  @override
  String get name => 'Name';

  @override
  String newItem(String item) {
    return 'New $item';
  }

  @override
  String get next => 'Next';

  @override
  String get no => 'No';

  @override
  String get notFound => 'Not Found';

  @override
  String get number => 'Number';

  @override
  String get ok => 'OK';

  @override
  String get open => 'Open';

  @override
  String openIn(String item) {
    return 'Open in $item';
  }

  @override
  String openItem(String item) {
    return 'Open $item';
  }

  @override
  String openItemIn(String item, String location) {
    return 'Open $item in $location';
  }

  @override
  String get owner => 'Owner';

  @override
  String get password => 'Password';

  @override
  String get pause => 'Pause';

  @override
  String get paused => 'Paused';

  @override
  String pauseItem(String item) {
    return 'Pause $item';
  }

  @override
  String get pending => 'Pending';

  @override
  String get phone => 'Phone';

  @override
  String get play => 'Play';

  @override
  String get playing => 'Playing';

  @override
  String playItem(String item) {
    return 'Play $item';
  }

  @override
  String get previous => 'Previous';

  @override
  String get register => 'Register';

  @override
  String get results => 'Results';

  @override
  String get save => 'Save';

  @override
  String get search => 'Search';

  @override
  String searchFor(String item) {
    return 'Search for $item...';
  }

  @override
  String searchForIn(String item, String location) {
    return 'Search for $item in $location';
  }

  @override
  String get seconds => 'Seconds';

  @override
  String get send => 'Send';

  @override
  String sendItemToItem(String item1, String item2) {
    return 'Send $item1 to $item2';
  }

  @override
  String sendtoItem(String item) {
    return 'Send to $item';
  }

  @override
  String get settings => 'Settings';

  @override
  String get share => 'Share';

  @override
  String shareItem(String item) {
    return 'Share $item';
  }

  @override
  String get show => 'Show';

  @override
  String get size => 'Size';

  @override
  String get success => 'Success';

  @override
  String get table => 'Table';

  @override
  String get tableView => 'Table View';

  @override
  String get to => 'To';

  @override
  String get undock => 'Undock';

  @override
  String undockItem(String item) {
    return 'Undock $item';
  }

  @override
  String get uninstall => 'Uninstall';

  @override
  String uninstallItem(String item) {
    return 'Uninstall $item';
  }

  @override
  String updateItem(String item) {
    return 'Update $item';
  }

  @override
  String get username => 'Username';

  @override
  String get value => 'Value';

  @override
  String get view => 'View';

  @override
  String get viewType => 'View Type';

  @override
  String get wallpaper => 'Wallpaper';

  @override
  String get warning => 'Warning';

  @override
  String get weeks => 'Weeks';

  @override
  String get width => 'Width';

  @override
  String get years => 'Years';

  @override
  String get yes => 'Yes';

  @override
  String get you => 'You';

  @override
  String get library => 'Library';

  @override
  String get libraries => 'Libraries';

  @override
  String itemLibrary(String item) {
    return '$item Library';
  }
}
