//
//  constants
//  handy_extensions
//
//  Created by Ngonidzashe Mangudya on 26/6/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

mixin DateConstants {
  static List<string> months([dynamic locale]) => [
        for (var i = 1; i <= 12; i++) DateFormat.MMMM(locale).format(DateTime(DateTime.now().year, i, 1)),
      ];

  static List<string> days([dynamic locale]) => [
        for (var i = 1; i <= 7; i++) DateFormat.E().format(DateTime(now.year, 1, i)),
      ];
}
