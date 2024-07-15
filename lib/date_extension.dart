import 'package:innerlibs/innerlibs.dart';
import 'package:intl/intl.dart';

export 'package:innerlibs/date_range.dart';

/// Extension methods for the `DateTime` class.
///
/// This extension provides various utility methods to manipulate and format `DateTime` objects.
/// It includes methods to find the next day of the week, get the first and last day of the week, month, and year,
/// calculate the first and last day of a fortnight, quarter, bimester, and semester,
/// check if a date is the same as today, yesterday, or tomorrow,
/// get the beginning and end of a day, format the date and time in a readable format,
/// calculate the time difference between two dates, determine the time of day, and more.
extension DateTimeExtensions on DateTime {
  /// Returns the next day of the week from the given date.
  date findNextDayOfWeek(int weekday) {
    int daysDifference = weekday - this.weekday;
    if (daysDifference <= 0) {
      daysDifference += 7;
    }
    return add(Duration(days: daysDifference));
  }

  /// Returns the last day of the week for the given date.
  date get lastDayOfWeek => add((DateTime.daysPerWeek - weekday).days);

  /// Returns the first day of the week for the given date.
  date get firstDayOfWeek => subtract((weekday - 1).days);

  /// Returns the first day of the month for the given date.
  date get firstDayOfMonth => DateTime(year, month, 1);

  /// Returns the last day of the month for the given date.
  date get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// Returns the first day of the year for the given date.
  date get firstDayOfYear => DateTime(year, 1, 1);

  /// Returns the last day of the year for the given date.
  date get lastDayOfYear => DateTime(year, 12, 31);

  /// Returns the next week.
  date get nextWeek => add(7.days);

  /// Returns the previous week.
  date get previousWeek => subtract(7.days);

  /// Returns the next month.
  date get nextMonth => DateTime(year, month + 1, day.lockMax(DateUtils.lastDayOfMonth(month + 1, year)));

  /// Returns the previous month.
  date get previousMonth => DateTime(year, month - 1, day.lockMax(DateUtils.lastDayOfMonth(month - 1, year)));

  /// Returns the next year.
  date get nextYear => DateTime(year + 1, month, day);

  /// Returns the previous year.
  date get previousYear => DateTime(year - 1, month, day);

  /// Returns the next semester.
  date get nextSemester => date(year, lastDayOfSemester.add(1.days).month, day.lockMax(lastDayOfSemester.add(1.days).lastDayOfMonth.day));

  /// Returns the previous semester
  date get previousSemester => date(year, firstDayOfSemester.add(-1.days).firstDayOfSemester.month, day.lockMax(firstDayOfSemester.add(-1.days).lastDayOfMonth.day));

  /// Returns the next bimester
  date get nextBimester => date(year, lastDayOfBimester.add(1.days).month, day.lockMax(lastDayOfBimester.add(1.days).lastDayOfMonth.day));

  /// Returns the previous bimester
  date get previousBimester => date(year, firstDayOfBimester.add(-1.days).firstDayOfBimester.month, day.lockMax(firstDayOfBimester.add(-1.days).lastDayOfMonth.day));

  /// Returns the next quarter.
  date get nextQuarter => date(year, lastDayOfQuarter.add(1.days).month, day.lockMax(lastDayOfQuarter.add(1.days).lastDayOfMonth.day));

  /// Returns the previous quarter.
  date get previousQuarter => date(year, firstDayOfQuarter.add(-1.days).firstDayOfQuarter.month, day.lockMax(firstDayOfQuarter.add(-1.days).lastDayOfMonth.day));

  /// Returns the first day of the fortnight.
  date get firstDayOfFortnight => day <= 15 ? firstDayOfMonth : date(year, month, 16);

  /// Returns the last day of the fortnight.
  date get lastDayOfFortnight => day <= 15 ? date(year, month, 15) : lastDayOfMonth;

  date get nextFortnight => add(15.days);

  date get previousFortnight => subtract(15.days);

  /// Returns the fortnight number.
  int get fortnightNumber => day <= 15 ? 1 : 2;

  /// Returns the first day of the quarter.
  DateTime get firstDayOfQuarter => firstDayOfMonthGroup(3);

  /// Returns the last day of the quarter.
  DateTime get lastDayOfQuarter => lastDayOfMonthGroup(3);

  /// Returns the quarter number.
  int get quarterNumber => monthGroupNumber(3);

  /// Returns the first day of the bimester.
  DateTime get firstDayOfBimester => firstDayOfMonthGroup(2);

  /// Returns the last day of the bimester.
  DateTime get lastDayOfBimester => lastDayOfMonthGroup(2);

  /// Returns the bimester number.
  int get bimesterNumber => monthGroupNumber(2);

  /// Returns the first day of the semester.
  DateTime get firstDayOfSemester => firstDayOfMonthGroup(6);

  /// Returns the last day of the semester.
  DateTime get lastDayOfSemester => lastDayOfMonthGroup(6);

  /// Returns the semester number.
  int get semesterNumber => monthGroupNumber(6);

  /// Returns the first month of the group.
  int firstMonthOfGroup(int group) => ((month - 1) ~/ group) * group + 1;

  /// Returns the last month of the group.
  int lastMonthOfGroup(int group) => (firstMonthOfGroup(group) + group) - 1;

  /// Returns the first day of the month group.
  date firstDayOfMonthGroup(int group) => DateTime(year, firstMonthOfGroup(group), 1);

  /// Returns the last day of the month group.
  date lastDayOfMonthGroup(int group) => DateTime(year, lastMonthOfGroup(group) + 1, 0);

  /// Returns the month group number.
  int monthGroupNumber(int group) => ((month - 1) ~/ group) + 1;

  /// Checks if the date is the same as the specified [other] date.
  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  /// Checks if the date is today.
  bool get isToday => isSameDate(now);

  /// Checks if the date is yesterday.
  bool get isYesterday => isSameDate(yesterday);

  /// Checks if the date is tomorrow.
  bool get isTomorrow => isSameDate(tomorrow);

  /// Returns the beginning of the day.
  date get beginOfDay => date(year, month, day);

  /// Returns the end of the day.
  date get endOfDay => date(year, month, day, 23, 59, 59, 999);

  /// Readable Date
  ///
  /// Returns date string in the format Tuesday 1 January 2022
  String get readableDate => '$longWeekDay $day $monthName $year';

  /// Readable DateTime
  ///
  /// Returns date and time string in the format January 12, 2022 08:00:15
  String get readableDateTime => "$monthName $day, $year ${hour >= 10 ? hour : "0$hour"}"
      ":${minute >= 10 ? minute : "0$minute"}:${second >= 10 ? second : "0"
          "$second"}";

  /// Readable Time
  ///
  /// Returns time string in the format 08:00:34
  String get readableTime => "${hour >= 10 ? hour : "0$hour"}:${minute >= 10 ? minute : "0$minute"}"
      ":${second >= 10 ? second : "0$second"}";

  /// Get Day
  ///
  /// Returns day string in the format Monday, Tuesday etc
  String longWeekDay(dynamic locale) => weekday == 7 ? DateUtils.days(locale)[0] : DateUtils.days(locale)[weekday];

  /// Get Short Day
  ///
  /// Returns short day string in the format Mon, Tue, Wed etc
  String shortWeekday(dynamic locale) => longWeekDay(locale).first(3);

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String monthName(dynamic locale) => DateUtils.months(locale)[month - 1];

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String shortMonthName(dynamic locale) => monthName(locale).first(3);

  /// Get current percentage of the day
  /// Returns the percentage of the day that has passed
  double get percentageOfDay => (hour * 60 * 60 + minute * 60 + second) / (24 * 60 * 60);

  /// Get current percentage of the year
  double get percentageOfYear => (dayOfYear - 1) / (isLeapYear ? 366 : 365);

  /// Get Day Of Year
  int get dayOfYear {
    var firstDayOfYear = DateTime(year, 1, 1);
    return difference(firstDayOfYear).inDays + 1;
  }

  /// Get Week Of Year
  int get weekOfYear {
    var firstDayOfYear = DateTime(year, 1, 1);
    var days = difference(firstDayOfYear).inDays;
    return ((days - (days % 7)) / 7).floor() + 1;
  }

  /// Check if this year is a Leap Year
  bool get isLeapYear => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

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

  /// Converts the current date to a [DateRange] object with the specified [endDate].
  DateRange toRange([DateTime? endDate]) => DateRange(this, endDate);

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
  String get readableDateTimeFormat => '$readableDate, $timeFormat';

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
      return longWeekDay(locale);
    } else {
      return '$day/${monthName(locale)}/$year';
    }
  }

  /// Extension method to calculate the duration from the current date and time to the given date and time.
  Duration get fromNow => now.difference(this);

  /// Subtracts the given duration from the current date and time.
  DateTime operator -(Duration other) => subtract(other);

  /// Adds the given duration to the current date and time.
  DateTime operator +(Duration other) => add(other);

  /// Checks if the current date and time is greater than the given date and time.
  bool operator >(DateTime other) => isAfter(other);

  /// Checks if the current date and time is less than the given date and time.
  bool operator <(DateTime other) => isBefore(other);

  /// Checks if the current date and time is greater than or equal to the given date and time.
  bool operator >=(DateTime other) => this > other || this == other;

  /// Checks if the current date and time is less than or equal to the given date and time.
  bool operator <=(DateTime other) => this < other || this == other;

  /// Formats the date according to the specified format and locale.
  ///
  /// If the [format] is blank, it returns the ISO 8601 string representation of the date.
  /// Otherwise, it uses the [format] and [locale] parameters to format the date.
  /// The [format] parameter specifies the desired format, and the [locale] parameter
  /// specifies the locale to use for formatting.
  ///
  /// Returns the formatted date as a string.
  String format([String format = "", String? locale]) {
    if (format.isBlank) return toIso8601String();
    return DateFormat(format, locale).format(this);
  }
}

mixin DateUtils {
  static List<string> months([dynamic locale]) => [
        for (var i = 1; i <= 12; i++) DateFormat.MMMM(locale).format(DateTime(DateTime.now().year, i, 1)),
      ];

  static List<string> days([dynamic locale]) => [
        for (var i = 1; i <= 7; i++) DateFormat.E().format(DateTime(now.year, 1, i)),
      ];

  static int lastDayOfMonth(int month, int year) => DateTime(year, month + 1, 0).day;
}
