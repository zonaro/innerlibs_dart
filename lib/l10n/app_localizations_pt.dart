import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class InnerLibsLocalizationsPt extends InnerLibsLocalizations {
  InnerLibsLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get search => 'Pesquisar';

  @override
  String get find => 'Procurar';

  @override
  String get invalidValue => 'Invalid value';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get cancel => 'Cancelar';

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
  String get city => 'City';

  @override
  String get country => 'Country';

  @override
  String get estate => 'Estate';

  @override
  String get dateOutOfRange => 'Date out of range';

  @override
  String get invalidDate => 'Invalid date';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get invalidNumber => 'Invalid number';

  @override
  String get invalidPhone => 'Invalid phone number';

  @override
  String get invalidUrl => 'Invalid URL';

  @override
  String get invalidCreditCard => 'Invalid credit card number';

  @override
  String get invalidCurrency => 'Invalid currency';

  @override
  String get invalidPassword => 'Invalid password';

  @override
  String get weakPassword => 'Weak password';

  @override
  String get strongPassword => 'Strong password';

  @override
  String couldNotFindItem(String item) {
    return 'Could not find $item.';
  }

  @override
  String confirmDelete(String item) {
    return 'Are you sure you want to delete $item?';
  }

  @override
  String confirmDeleteMultiple(int count, String item, String items) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString $items',
      one: '1 $item',
    );
    return 'Are you sure you want to delete $_temp0?';
  }
}
