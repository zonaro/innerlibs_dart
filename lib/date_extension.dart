import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

export 'package:innerlibs/date_range.dart';

mixin DateUtils {
  /// Returns the name of the day corresponding to the given [day] index.
  ///
  /// The [day] index should be a value between 1 and 7, inclusive.
  /// If [locale] is provided, the name of the day will be returned in the specified locale.
  /// If [locale] is not provided, the default locale will be used.
  ///
  /// Example:
  /// ```dart
  /// String dayName = day(3);
  /// print(dayName); // Output: "Wednesday"
  /// ```
  static string day(int day, [dynamic locale]) => days(locale)[day.clampRotate(1, 7) - 1];

  /// Returns a list of strings representing the names of the days of the week.
  ///
  /// The optional parameter `locale` can be used to specify the locale for formatting the day names.
  /// If no `locale` is provided, the default locale will be used.
  ///
  /// Example:
  /// ```dart
  /// List<String> days = days();
  /// print(days); // [Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]
  /// ```

  static List<string> days([string? locale]) => [for (var i = 1; i <= 7; i++) DateFormat.E(locale).format(DateTime(now.year, 1, i))];

  /// Return a list of colors for the specified month based on health awareness campaigns
  static Iterable<Color> getHealthColorsForMonth(int month) {
    month = month.clampRotate(1, 12);
    switch (month) {
      case 1: // Janeiro
        return [Colors.white, Colors.purple]; // Saúde mental e hanseníase
      case 2: // Fevereiro
        return [Colors.purple, Colors.orange]; // Lúpus, Alzheimer, fibromialgia e leucemia
      case 3: // Março
        return [Colors.red, Colors.blue]; // Câncer renal e câncer colorretal
      case 4: // Abril
        return [Colors.blue, Colors.green]; // Autismo e segurança no trabalho
      case 5: // Maio
        return [Colors.red, Colors.yellow]; // Hepatite e câncer de bexiga
      case 6: // Junho
        return [Colors.red, Colors.orange]; // Anemia e câncer de pele
      case 7: // Julho
        return [Colors.yellow, Colors.green]; // Hepatite e câncer de bexiga
      case 8: // Agosto
        return [Colors.green, Colors.lime]; // Aleitamento materno e linfoma
      case 9: // Setembro
        return [Colors.yellow, Colors.green]; // Prevenção ao suicídio e câncer de intestino
      case 10: // Outubro
        return [Colors.pink]; // Câncer de mama
      case 11: // Novembro
        return [Colors.blue]; // Câncer de próstata
      case 12: // Dezembro
        return [Colors.red]; // Prevenção à AIDS
      default:
        return [];
    }
  }

  /// Returns a gradient for the specified month based on health awareness campaigns
  static Gradient getHealthGradientForMonth({
    required int month,
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    final colors = getHealthColorsForMonth(month).toList();
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    );
  }

  /// Return a list of colors for the specified month based on season
  static Iterable<NamedColor> getSeasonColors(int month) {
    month = month.clampRotate(1, 12);

    switch (month) {
      case 12: // Dezembro - Verão
      case 1: // Janeiro - Verão
      case 2: // Fevereiro - Verão
        return [NamedColors.yellow, NamedColors.orange, NamedColors.redColor];
      case 3: // Março - Outono
      case 4: // Abril - Outono
      case 5: // Maio - Outono
        return [NamedColors.brownSugar, NamedColors.deepOrange, NamedColors.gold];
      case 6: // Junho - Inverno
      case 7: // Julho - Inverno
      case 8: // Agosto - Inverno
        return [NamedColors.blueGreen, NamedColors.gray, NamedColors.black];
      case 9: // Setembro - Primavera
      case 10: // Outubro - Primavera
      case 11: // Novembro - Primavera
        return [NamedColors.greenColor, NamedColors.pink, NamedColors.blueCrayola];
      default:
        return [];
    }
  }

  /// Return a gradient for the specified month based on season
  static Gradient getSeasonGradient({
    required int month,
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) {
    final colors = getSeasonColors(month).toList();
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
      stops: stops,
      tileMode: tileMode,
      transform: transform,
    );
  }

  /// Returns the last day of the specified month.
  ///
  /// The [month] parameter represents the month number, where January is 1 and December is 12.
  /// The optional [year] parameter represents the year. If not provided, the current year is used.
  ///
  /// Returns an integer representing the last day of the specified month.
  static int lastDayOfMonth(int month, [int? year]) => DateTime(year ?? thisYear, month + 1, 0).day;

  /// Returns the name of the month corresponding to the given [month] number.
  ///
  /// The [month] parameter represents the month number, ranging from 1 to 12.
  /// If the [locale] parameter is provided, the month name will be returned
  /// based on the specified locale.
  ///
  /// Example:
  /// ```dart
  /// String monthName = month(3);
  /// print(monthName); // Output: "March"
  /// ```
  ///
  /// Note: The [locale] parameter is optional.
  /// If not provided, the default locale will be used.
  static string month(int month, [string? locale]) => months(locale)[month.clampRotate(1, 12) - 1];

  /// Returns a list of month names.
  ///
  /// The [locale] parameter is optional and can be used to specify the locale for formatting the month names.
  /// If no [locale] is provided, the default locale will be used.
  ///
  /// Example:
  /// ```dart
  /// List<String> months = months();
  /// print(months); // Output: [January, February, March, April, May, June, July, August, September, October, November, December]
  /// ```
  static List<string> months([string? locale]) => [for (var i = 1; i <= 12; i++) DateFormat.MMMM(locale).format(DateTime(thisYear, i, 1))];
}

/// Extension methods for the `DateTime` class.
///
/// This extension provides various utility methods to manipulate and format `DateTime` objects.
/// It includes methods to find the next day of the week, get the first and last day of the week, month, and year,
/// calculate the first and last day of a fortnight, quarter, bimester, and semester,
/// check if a date is the same as today, yesterday, or tomorrow,
/// get the beginning and end of a day, format the date and time in a readable format,
/// calculate the time difference between two dates, determine the time of day, and more.
extension DateTimeExtensions on DateTime {
  /// Returns the beginning of the day.
  date get beginOfDay => date(year, month, day);

  /// Returns the bimester number.
  int get bimesterNumber => monthGroupNumber(2);

  /// Get Day Of Year
  int get dayOfYear => difference(firstDayOfYear).inDays + 1;

  /// Returns the end of the day.
  date get endOfDay => date(year, month, day, 23, 59, 59, 999);

  /// Returns the first day of the bimester.
  DateTime get firstDayOfBimester => firstDayOfMonthGroup(2);

  /// Returns the first day of the fortnight.
  date get firstDayOfFortnight => day <= 15 ? firstDayOfMonth : date(year, month, 16);

  /// Returns the first day of the month for the given date.
  date get firstDayOfMonth => DateTime(year, month, 1);

  /// Returns the first day of the quarter.
  DateTime get firstDayOfQuarter => firstDayOfMonthGroup(3);

  /// Returns the first day of the semester.
  DateTime get firstDayOfSemester => firstDayOfMonthGroup(6);

  /// Returns the first day of the week for the given date.
  date get firstDayOfWeek => subtract((weekday - 1).days);

  /// Returns the first day of the year for the given date.
  date get firstDayOfYear => DateTime(year, 1, 1);

  /// Returns the fortnight number.
  int get fortnightNumber => day <= 15 ? 1 : 2;

  /// Extension method to calculate the duration from the current date and time to the given date and time.
  Duration get fromNow => now.difference(this);

  Iterable<Color> get healthMonthColors => DateUtils.getHealthColorsForMonth(month);

  /// Check if this year is a Leap Year
  bool get isLeapYear => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  /// Checks if the date is today.
  bool get isToday => isSameDate(now);

  /// Checks if the date is tomorrow.
  bool get isTomorrow => isSameDate(tomorrow);

  /// Checks if the date is yesterday.
  bool get isYesterday => isSameDate(yesterday);

  /// Returns the last day of the bimester.
  DateTime get lastDayOfBimester => lastDayOfMonthGroup(2);

  /// Returns the last day of the fortnight.
  date get lastDayOfFortnight => day <= 15 ? date(year, month, 15) : lastDayOfMonth;

  /// Returns the last day of the month for the given date.
  date get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// Returns the last day of the quarter.
  DateTime get lastDayOfQuarter => lastDayOfMonthGroup(3);

  /// Returns the last day of the semester.
  DateTime get lastDayOfSemester => lastDayOfMonthGroup(6);

  /// Returns the last day of the week for the given date.
  date get lastDayOfWeek => add((DateTime.daysPerWeek - weekday).days);

  /// Returns the last day of the year for the given date.
  date get lastDayOfYear => DateTime(year, 12, 31);

  /// Returns the next bimester
  date get nextBimester => date(year, lastDayOfBimester.add(1.days).month, day.clampMax(lastDayOfBimester.add(1.days).lastDayOfMonth.day));

  /// Return the next fortnight
  date get nextFortnight => add(15.days);

  /// Returns the next month.
  date get nextMonth => DateTime(year, month + 1, day.clampMax(DateUtils.lastDayOfMonth(month + 1, year)));

  /// Returns the next quarter.
  date get nextQuarter => date(year, lastDayOfQuarter.add(1.days).month, day.clampMax(lastDayOfQuarter.add(1.days).lastDayOfMonth.day));

  /// Returns the next semester.
  date get nextSemester => date(year, lastDayOfSemester.add(1.days).month, day.clampMax(lastDayOfSemester.add(1.days).lastDayOfMonth.day));

  /// Returns the next week.
  date get nextWeek => add(7.days);

  /// Returns the next year.
  date get nextYear => DateTime(year + 1, month, day);

  /// Get current percentage of the day
  /// Returns the percentage of the day that has passed
  double get percentageOfDay => (hour * 60 * 60 + minute * 60 + second) / (24 * 60 * 60);

  /// Get current percentage of the year
  double get percentageOfYear => (dayOfYear - 1) / (isLeapYear ? 366 : 365);

  /// Returns the previous bimester
  date get previousBimester => date(year, firstDayOfBimester.add(-1.days).firstDayOfBimester.month, day.clampMax(firstDayOfBimester.add(-1.days).lastDayOfMonth.day));

  date get previousFortnight => subtract(15.days);

  /// Returns the previous month.
  date get previousMonth => DateTime(year, month - 1, day.clampMax(DateUtils.lastDayOfMonth(month - 1, year)));

  /// Returns the previous quarter.
  date get previousQuarter => date(year, firstDayOfQuarter.add(-1.days).firstDayOfQuarter.month, day.clampMax(firstDayOfQuarter.add(-1.days).lastDayOfMonth.day));

  /// Returns the previous semester
  date get previousSemester => date(year, firstDayOfSemester.add(-1.days).firstDayOfSemester.month, day.clampMax(firstDayOfSemester.add(-1.days).lastDayOfMonth.day));

  /// Returns the previous week.
  date get previousWeek => subtract(7.days);

  /// Returns the previous year.
  date get previousYear => DateTime(year - 1, month, day);

  /// Returns the quarter number.
  int get quarterNumber => monthGroupNumber(3);

  /// Readable Time
  ///
  /// Returns time string in the format 08:00:34
  String get readableTime => "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}"
      ":${second >= 10 ? second : "0$second"}";

  Iterable<NamedColors> get seasonColors => DateUtils.getSeasonColors(month);

  /// Returns the semester number.
  int get semesterNumber => monthGroupNumber(6);

  /// Time Format
  ///
  /// Returns time string in the format 08:00pm
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeFormat
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 08:00pm
  /// ```
  ///
  String get timeFormat {
    final hour = this.hour;
    final minute = this.minute;

    final String period = hour >= 12 ? 'PM' : 'AM';
    int hourIn12HourFormat = hour > 12 ? hour - 12 : hour;
    hourIn12HourFormat = hourIn12HourFormat == 0 ? 12 : hourIn12HourFormat;
    final String hourStr = hourIn12HourFormat.toString().padLeft(2, '0');
    final String minuteStr = minute.toString().padLeft(2, '0');

    return '$hourStr:$minuteStr$period';
  }

  /// Time Of Day Emoji
  ///
  /// Returns emoji of time of day in the format ☀️, 🌤️, 🌙 or 🌙
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeOfDayEmoji
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 🌤️
  /// ```
  ///
  String get timeOfDayEmoji => timeOfDay(morning: '☀️', afternoon: '🌤️', night: '🌙');

  /// Get Week Of Year
  int get weekOfYear {
    var firstDayOfYear = DateTime(year, 1, 1);
    var days = difference(firstDayOfYear).inDays;
    return ((days - (days % 7)) / 7).floor() + 1;
  }

  /// Adds the given duration to the current date and time.
  DateTime operator +(Duration other) => add(other);

  /// Subtracts the given duration from the current date and time.
  DateTime operator -(Duration other) => subtract(other);

  /// Checks if the current date and time is less than the given date and time.
  bool operator <(DateTime other) => isBefore(other);

  /// Checks if the current date and time is less than or equal to the given date and time.
  bool operator <=(DateTime other) => this < other || this == other;

  /// Checks if the current date and time is greater than the given date and time.
  bool operator >(DateTime other) => isAfter(other);

  /// Checks if the current date and time is greater than or equal to the given date and time.
  bool operator >=(DateTime other) => this > other || this == other;

  /// Calculate Age
  int age([date? today]) {
    today ??= DateTime.now().beginOfDay;
    var birthDate = [this, today].min.beginOfDay;
    today = [this, today].max.beginOfDay;
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Returns a [DateTime] object representing the specified date and time.
  ///
  /// The optional parameters allow you to specify the year, month, day, hour, minute, second, millisecond, and microsecond.
  /// If any of the parameters are not provided, the current value of that component will be used.
  ///
  /// Example usage:
  /// ```dart
  /// var myDate = at(year: 2022, month: 10, day: 31, hour: 12, minute: 0, second: 0);
  /// print(myDate); // Output: 2022-10-31 12:00:00.000
  /// ```
  date at({int? year, int? month, int? day, int? hour, int? minute, int? second, int? millisecond, int? microsecond}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  /// Describe
  ///
  /// Returns date string in the format 08:00pm, Yesterday, Monday, 1/1/2022
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().describe
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// 08:00pm
  /// ```
  ///
  String describe({string yesterday = "Yesterday", dynamic locale}) {
    final difference = fromNow.inDays;
    if (difference == 0) {
      return timeFormat;
    } else if (difference == 1) {
      return yesterday;
    } else if (difference <= 7) {
      return weekDayName(locale);
    } else {
      return '$day/${monthName(locale)}/$year';
    }
  }

  /// Returns the next day of the week from the given date.
  date findNextDayOfWeek(int weekday) {
    int daysDifference = weekday - this.weekday;
    if (daysDifference <= 0) {
      daysDifference += 7;
    }
    return add(Duration(days: daysDifference));
  }

  /// Returns the first day of the month group.
  date firstDayOfMonthGroup(int group) => DateTime(year, firstMonthOfGroup(group), 1);

  /// Returns the first month of the group.
  int firstMonthOfGroup(int group) => ((month - 1) ~/ group) * group + 1;

  /// Format the date using the specified format and locale.
  /// - If the [format] and [locale] parameters are not provided, the date will be formatted using the ISO 8601 format.
  /// - If only the [format] parameter is provided, the date will be formatted using the specified format and the default locale.
  /// - If only the [locale] parameter is provided, the date will be formatted using the default format and the specified locale.
  /// - If both the [format] and [locale] parameters are provided, the date will be formatted using the specified format and locale.
  String format([String? format, String? locale]) {
    if (format.isBlank && locale.isBlank) return toIso8601String();
    if (locale.isBlank) locale = platformLocaleCode;
    format = format.nullIfBlank;
    return DateFormat(format, locale).format(this);
  }

  Gradient healthMonthGradient({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      DateUtils.getHealthGradientForMonth(month: month, begin: begin, end: end, stops: stops, tileMode: tileMode, transform: transform);

  /// Checks if the current date is between the specified start and end dates (exclusive).
  ///
  /// Returns `true` if the current date is after the start date and before the end date.
  /// Otherwise, returns `false`.
  bool isBetween(DateTime start, DateTime end) => isAfter(start) && isBefore(end);

  ///
  /// Checks if the current DateTime object is between or equal to the given start and end DateTime objects.
  ///
  /// Returns `true` if the current DateTime is between the start and end DateTime ,
  /// or if it is equal to the start or end DateTime. Otherwise, returns `false`.
  bool isBetweenOrEqual(DateTime start, DateTime end) => isBetween(start, end) || this == start || this == end;

  /// Checks if the date is the same as the specified [other] date, ignoring time.
  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  // Checks if the month and year is the same as the specified [other] date, ignoring time.
  bool isSameMonthYear(DateTime other) => year == other.year && month == other.month;

  /// Returns the last day of the month group.
  date lastDayOfMonthGroup(int group) => DateTime(year, lastMonthOfGroup(group) + 1, 0);

  /// Returns the last month of the group.
  int lastMonthOfGroup(int group) => (firstMonthOfGroup(group) + group) - 1;

  Gradient monthGradient({
    AlignmentGeometry begin = Alignment.topCenter,
    AlignmentGeometry end = Alignment.bottomCenter,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
  }) =>
      DateUtils.getSeasonGradient(month: month, begin: begin, end: end, stops: stops, tileMode: tileMode, transform: transform);

  /// Returns the month group number.
  int monthGroupNumber(int group) => ((month - 1) ~/ group) + 1;

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String monthName([string? locale]) => DateUtils.month(month, locale);

  /// Readable Date
  ///
  /// Returns date string in the format Tuesday 1 January 2022
  String readableDate([string? locale]) => '${weekDayName(locale)} $day ${monthName(locale)} $year';

  /// Readable DateTime
  ///
  /// Returns date and time string in the format January 12, 2022 08:00:15
  String readableDateTime([dynamic locale]) => "${monthName(locale)} $day, $year ${hour.fixedLength(2)}:${minute.fixedLength(2)}:${second.fixedLength(2)}";

  /// Readable Date Time Format
  ///
  /// Returns date and time string in the format Tuesday 1 January 2022, 08:00pm
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().readableDateTimeFormat
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// Tuesday 1 January 2022, 08:00pm
  /// ```
  String readableDateTimeFormat([dynamic locale]) => '${readableDate(locale)}, $timeFormat';

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String shortMonthName([dynamic locale]) => monthName(locale).first(3);

  /// Get Short Day
  ///
  /// Returns short day string in the format Mon, Tue, Wed etc
  String shortWeekday([dynamic locale]) => weekDayName(locale).first(3);

  /// Returns a new [DateTime] object by adding the specified amount of time to the current date and time.
  ///
  /// The [years], monthsh], [days], [hours], [minutes], [seconds], [milliseconds], and [microseconds] parameters
  /// represent the amount of time to add to the current date and time. If any of these parameters are not
  /// provided, their default value is 0.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime currentDate = DateTime.now();
  /// DateTime futureDate = currentDate.sum(year: 1, month: 3, day: 7);
  /// print(futureDate); // Output: 2023-04-07 12:34:56.789
  /// ```
  DateTime sum({int years = 0, int months = 0, int days = 0, int hours = 0, int minutes = 0, int seconds = 0, int milliseconds = 0, int microseconds = 0}) {
    return DateTime(
      year + (years),
      month + (months),
      day + (days),
      hour + (hours),
      minute + (minutes),
      second + (seconds),
      millisecond + (milliseconds),
      microsecond + (microseconds),
    );
  }

  /// Time Ago
  ///
  /// Returns string of time difference between given DateTime and
  /// [until] in the format 1d, 2h, 4s or Just now.
  /// Default values are in English but can be changed by passing the
  /// optional parameters.
  /// - [remaining] is the string to be displayed after the time difference.
  /// - [day] is the string to be displayed after the number of days.
  /// - [hour] is the string to be displayed after the number of hours.
  /// - [minute] is the string to be displayed after the number of minutes.
  /// - [seconds] is the string to be displayed after the number of seconds.
  /// - [justNow] is the string to be displayed if the time difference is less than a second.
  /// - [until] is the date to compare with, if not provided, it will use the current date and time.
  String timeAgo({
    string remaining = "remaining",
    string day = "d",
    string hour = "h",
    string minute = "m",
    string seconds = "s",
    string justNow = "Just now",
    date? until,
  }) {
    final difference = (until ?? now).difference(this);

    if (difference.inDays < 0) {
      return '${difference.inDays.abs()}$day $remaining';
    }

    if (difference.inDays >= 1) {
      return difference.inDays.quantityText(day);
    } else if (difference.inHours >= 1) {
      return difference.inHours.quantityText(hour);
    } else if (difference.inMinutes >= 1) {
      return difference.inMinutes.quantityText(minute);
    } else if (difference.inSeconds >= 1) {
      return difference.inSeconds.quantityText(seconds);
    } else {
      return justNow;
    }
  }

  /// Time Of Day
  ///
  /// Returns time of day in the format Morning, Afternoon, Evening or Night
  String timeOfDay({string? morning, string? afternoon, string? evening, string? night}) {
    if (hour >= 0 && hour < 12) {
      return morning.ifBlank(afternoon).blankIfNull;
    } else if (hour >= 12 && hour < 18) {
      return afternoon.ifBlank(morning).blankIfNull;
    } else if (hour >= 18 && hour < 21) {
      return evening.ifBlank(night).blankIfNull;
    } else {
      return night.ifBlank(evening).blankIfNull;
    }
  }

  /// Converts the current date to a [DateRange] object with the specified [endDate].
  DateRange toRange([DateTime? endDate]) => DateRange(this, endDate);

  /// Get Day
  ///
  /// Returns day string in the format Monday, Tuesday etc
  String weekDayName([dynamic locale]) => DateUtils.day(weekday, locale);
}
