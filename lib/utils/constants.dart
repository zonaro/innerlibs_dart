//
//  constants
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 26/6/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:intl/intl.dart';

import 'day.dart';
import 'month.dart';

class DateConstants {
  static final List<Month> months = [
    for (var i = 1; i <= 12; i++) Month(DateFormat.MMMM().format(DateTime(DateTime.now().year, i, 1))),
  ];

  static final List<Day> days = [
    for (var i = 1; i <= 7; i++) Day(DateFormat.E().format(DateTime(2022, 1, i))),
  ];
}
