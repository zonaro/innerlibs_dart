import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/utils/constants.dart';
import 'package:intl/intl.dart';

/// Represents a range of dates.
class DateRange {
  /// Creates a new instance of the [DateRange] class with the specified start and end dates.
  DateRange(date startDate, date endDate) {
    var r = startDate.compareAndSwap(endDate);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  /// Creates a new instance of the [DateRange] class representing today's date.
  factory DateRange.today() => DateRange(today, today.endOfDay);

  /// Gets the start date of the date range.
  date get startDate => _startDate;

  /// Sets the start date of the date range.
  set startDate(date value) {
    var r = value.compareAndSwap(endDate);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  /// Gets the end date of the date range.
  date get endDate => _endDate;

  /// Sets the end date of the date range.
  set endDate(date value) {
    var r = startDate.compareAndSwap(value);
    _startDate = r.$1;
    _endDate = r.$2;
  }

  late date _startDate;
  late date _endDate;
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
  DateTime findNextDayOfWeek(int weekday) {
    int daysDifference = weekday - this.weekday;
    if (daysDifference <= 0) {
      daysDifference += 7;
    }
    return add(Duration(days: daysDifference));
  }

  /// Returns the last day of the week for the given date.
  DateTime get lastDayOfWeek => add((DateTime.daysPerWeek - weekday).days);

  /// Returns the first day of the week for the given date.
  DateTime get firstDayOfWeek => subtract((weekday - 1).days);

  /// Returns the first day of the month for the given date.
  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  /// Returns the last day of the month for the given date.
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);

  /// Returns the first day of the year for the given date.
  DateTime get firstDayOfYear => DateTime(year, 1, 1);

  /// Returns the last day of the year for the given date.
  DateTime get lastDayOfYear => DateTime(year, 12, 31);

  /// Returns the first day of the fortnight.
  date get firstDayOfFortnight => day <= 15 ? firstDayOfMonth : date(year, month, 16);

  /// Returns the last day of the fortnight.
  date get lastDayOfFortnight => day <= 15 ? date(year, month, 15) : lastDayOfMonth;

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
  String get longWeekDay => weekday == 7 ? DateConstants.days[0].day : DateConstants.days[weekday].day;

  /// Get Short Day
  ///
  /// Returns short day string in the format Mon, Tue, Wed etc
  String get shortWeekday => longWeekDay.first(3);

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String get monthName => DateConstants.months[month - 1].month;

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String get shortMonthName => monthName.first(3);

  /// Time Ago
  ///
  /// Returns string of time difference between given DateTime and
  /// [DateTime.now()] in the format 1d, 2h, 4s or Just now
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
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().timeOfDay
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// Morning
  /// ```
  ///
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

  /// Is Between
  ///
  /// Returns true if the given [DateTime] is between the given start and end [DateTime]
  ///
  /// Usage:
  ///
  /// ```dart
  /// DateTime.now().isBetween(DateTime(2021, 1, 1), DateTime(2021, 12, 31))
  /// ```
  ///
  /// Result:
  ///
  /// ```dart
  /// true
  /// ```
  ///
  bool isBetween(DateTime start, DateTime end) => isAfter(start) && isBefore(end);

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
  String get timeFormat => formatTime(this);

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
  String describe({string yesterday = "Yesterday"}) {
    final difference = fromNow.inDays;
    if (difference == 0) {
      return timeFormat;
    } else if (difference == 1) {
      return yesterday;
    } else if (difference <= 7) {
      return longWeekDay;
    } else {
      return '$day/$monthName/$year';
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
