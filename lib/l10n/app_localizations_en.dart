import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class InnerLibsLocalizationsEn extends InnerLibsLocalizations {
  InnerLibsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get call => 'Call';

  @override
  String get send => 'Send';

  @override
  String calltoItem(String item) {
    return 'Call to $item';
  }

  @override
  String sendtoItem(String item) {
    return 'Send to $item';
  }

  @override
  String sendItemToItem(String item1, String item2) {
    return 'Send $item1 to $item2';
  }

  @override
  String get to => 'To';

  @override
  String get open => 'Open';

  @override
  String get view => 'View';

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
  String findItem(String item) {
    return 'Find $item';
  }

  @override
  String findIn(String item) {
    return 'Find in $item';
  }

  @override
  String get find => 'Find';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Close';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String newItem(String item) {
    return 'New $item';
  }

  @override
  String get add => 'Add';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get finish => 'Finish';

  @override
  String get loading => 'Loading';

  @override
  String get clear => 'Clear';

  @override
  String get error => 'Error';

  @override
  String get warning => 'Warning';

  @override
  String get info => 'Info';

  @override
  String get success => 'Success';

  @override
  String get confirm => 'Confirm';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get name => 'Name';

  @override
  String get number => 'Number';

  @override
  String get date => 'Data';

  @override
  String get value => 'Value';

  @override
  String get phone => 'Phone';

  @override
  String get city => 'City';

  @override
  String get country => 'Country';

  @override
  String get estate => 'Estate';

  @override
  String get dateOutOfRange => 'Date out of range';

  @override
  String invalidItem(String item) {
    return 'Invalid $item.';
  }

  @override
  String couldNotFindItem(String item) {
    return 'Could not find $item.';
  }

  @override
  String confirmDelete(String item) {
    return 'Are you sure you want to delete $item?';
  }

  @override
  String confirmDeleteMultiple(int count, String singular, String plural) {
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
}
