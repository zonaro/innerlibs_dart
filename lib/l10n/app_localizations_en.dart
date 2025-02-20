import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class InnerLibsLocalizationsEn extends InnerLibsLocalizations {
  InnerLibsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get add => 'Add';

  @override
  String addTo(String item) {
    return 'Add to $item';
  }

  @override
  String get app => 'App';

  @override
  String get apply => 'Apply';

  @override
  String applyItem(String item) {
    return 'Apply $item';
  }

  @override
  String applyItemIn(String item, String location) {
    return 'Apply $item in $location';
  }

  @override
  String applyItemToItem(String item1, String item2) {
    return 'Apply $item1 to $item2';
  }

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
  String cancelItem(String item) {
    return 'Cancel $item';
  }

  @override
  String get categories => 'Categories';

  @override
  String get category => 'Category';

  @override
  String get century => 'Century';

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
  String couldNotFindItemWith(String item, String property) {
    return 'Could not find $item with $property.';
  }

  @override
  String get country => 'Country';

  @override
  String get create => 'Create';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get date => 'Date';

  @override
  String get dateOutOfRange => 'Date out of range';

  @override
  String get dateTimeFormat => 'Date Time Format';

  @override
  String get day => 'Day';

  @override
  String get dayMode => 'Day Mode';

  @override
  String get days => 'Days';

  @override
  String get decade => 'Decade';

  @override
  String get decades => 'Decades';

  @override
  String get defaultWord => 'Default';

  @override
  String get delete => 'Delete';

  @override
  String deletedItem(String item) {
    return 'Deleted $item';
  }

  @override
  String deletedItemFrom(String item, String location) {
    return 'Deleted $item from $location';
  }

  @override
  String get device => 'Device';

  @override
  String get directories => 'Directories';

  @override
  String get directory => 'Directory';

  @override
  String get disable => 'Disable';

  @override
  String get disabled => 'Disabled';

  @override
  String disabledItem(String item) {
    return 'Disabled $item';
  }

  @override
  String disabledItemIn(String item, String location) {
    return 'Disabled $item in $location';
  }

  @override
  String disableItem(String item) {
    return 'Disable $item';
  }

  @override
  String get dock => 'Dock';

  @override
  String dockItem(String item) {
    return 'Dock $item';
  }

  @override
  String get download => 'Download';

  @override
  String get downloaded => 'Downloaded';

  @override
  String get downloading => 'Downloading';

  @override
  String downloadItem(String item) {
    return 'Download $item';
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
  String get enable => 'Enable';

  @override
  String get enabled => 'Enabled';

  @override
  String enabledItem(String item) {
    return 'Enabled $item';
  }

  @override
  String enabledItemIn(String item, String location) {
    return 'Enabled $item in $location';
  }

  @override
  String enableItem(String item) {
    return 'Enable $item';
  }

  @override
  String get error => 'Error';

  @override
  String get estate => 'Estate';

  @override
  String get failed => 'Failed';

  @override
  String get favorite => 'Favorite';

  @override
  String favoriteItem(String item) {
    return 'Favorite $item';
  }

  @override
  String get favorites => 'Favorites';

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
  String get follow => 'Follow';

  @override
  String followItem(String item) {
    return 'Follow $item';
  }

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
  String get history => 'History';

  @override
  String get hour => 'Hour';

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
  String itemDeletedSuccessfully(String item) {
    return '$item deleted successfully';
  }

  @override
  String itemLibrary(String item) {
    return '$item Library';
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
  String itemSavedSuccessfully(String item) {
    return '$item saved successfully';
  }

  @override
  String itemUpdatedSuccessfully(String item) {
    return '$item updated successfully';
  }

  @override
  String get libraries => 'Libraries';

  @override
  String get library => 'Library';

  @override
  String get lightMode => 'Light Mode';

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
  String get millennium => 'Millennium';

  @override
  String get millenniums => 'Millenniuns';

  @override
  String get millisecond => 'Millisecond';

  @override
  String get milliseconds => 'Milliseconds';

  @override
  String get minute => 'Minute';

  @override
  String get minutes => 'Minutes';

  @override
  String get month => 'Month';

  @override
  String get months => 'Months';

  @override
  String get name => 'Name';

  @override
  String newItem(String item) {
    return 'New $item';
  }

  @override
  String newItemToItem(String item1, String item2) {
    return 'New $item1 to $item2';
  }

  @override
  String get next => 'Next';

  @override
  String get night => 'Night';

  @override
  String get nightMode => 'Night Mode';

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
  String get overlay => 'Overlay';

  @override
  String get overlayColor => 'Overlay Color';

  @override
  String get overlayOpacity => 'Overlay Opacity';

  @override
  String get overlays => 'Overlays';

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
  String recentItem(String item) {
    return 'Recent $item';
  }

  @override
  String recentItems(String items) {
    return 'Recent $items';
  }

  @override
  String get register => 'Register';

  @override
  String removeFrom(String item) {
    return 'Remove from $item';
  }

  @override
  String get removeFromfavorites => 'Remove from favorites';

  @override
  String get results => 'Results';

  @override
  String get save => 'Save';

  @override
  String get saved => 'Saved';

  @override
  String get sdCard => 'SD Card';

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
  String get second => 'Second';

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
  String get storage => 'Storage';

  @override
  String get storageAvailable => 'Storage Available';

  @override
  String get storageDevices => 'Storage Devices';

  @override
  String get storageFree => 'Storage Free';

  @override
  String get storageSize => 'Storage Size';

  @override
  String get storageUsed => 'Storage Used';

  @override
  String get success => 'Success';

  @override
  String get table => 'Table';

  @override
  String get tableView => 'Table View';

  @override
  String get theme => 'Theme';

  @override
  String get themeColor => 'Theme Color';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get to => 'To';

  @override
  String toItem(String item) {
    return 'To $item';
  }

  @override
  String get undock => 'Undock';

  @override
  String undockItem(String item) {
    return 'Undock $item';
  }

  @override
  String get unfavorite => 'Unfavorite';

  @override
  String unfavoriteItem(String item) {
    return 'Unfavorite $item';
  }

  @override
  String get unfollow => 'Unfollow';

  @override
  String unfollowItem(String item) {
    return 'Unfollow $item';
  }

  @override
  String get uninstall => 'Uninstall';

  @override
  String uninstallItem(String item) {
    return 'Uninstall $item';
  }

  @override
  String get unknown => 'Unknown';

  @override
  String unknownItem(String item) {
    return 'Unknown $item';
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
  String get wallpaperFadeTime => 'Wallpaper Fade Time';

  @override
  String get wallpaperInterval => 'Wallpaper Interval';

  @override
  String get warning => 'Warning';

  @override
  String get week => 'Week';

  @override
  String get weeks => 'Weeks';

  @override
  String get width => 'Width';

  @override
  String get year => 'Year';

  @override
  String get years => 'Years';

  @override
  String get yes => 'Yes';

  @override
  String get you => 'You';

  @override
  String get your => 'Your';

  @override
  String yourItem(String item) {
    return 'Your $item';
  }

  @override
  String addNewItem(String item) {
    return 'Add New $item';
  }

  @override
  String addItem(String item) {
    return 'Add $item';
  }
}
