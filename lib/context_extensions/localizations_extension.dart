import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension LocalizationsExt on BuildContext {
  MaterialLocalizations get materialLocalizations => MaterialLocalizations.of(this);
  CupertinoLocalizations get cupertinoLocalizations => CupertinoLocalizations.of(this);

 
}
