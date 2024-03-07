import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/utils/constants.dart';
import 'package:innerlibs/utils/format_time.dart';

extension DateTimeExtensions on DateTime {
  static DateTime get min => DateTime.utc(1970, 1, 1);
  static DateTime get max => DateTime.utc(9999, 12, 31, 23, 59, 59);

  DateTime findNextDate(int weekday) {
    int daysDifference = weekday - this.weekday;
    if (daysDifference <= 0) {
      daysDifference += 7;
    }
    return add(Duration(days: daysDifference));
  }

  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isYesterday {
    final nowDate = DateTime.now();
    const oneDay = Duration(days: 1);
    return nowDate.subtract(oneDay).isSameDate(this);
  }

  /// Readable Date
  ///
  /// Returns date string in the format Tuesday 1 January 2022
  String get readableDate => '$getDay $day $getMonth $year';

  /// Readable DateTime
  ///
  /// Returns date and time string in the format January 12, 2022 08:00:15
  String get readableDateTime => "$getMonth $day, $year ${hour >= 10 ? hour : "0$hour"}"
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
  String get getDay => weekday == 7 ? DateConstants.days[0].day : DateConstants.days[weekday].day;

  /// Get Short Day
  ///
  /// Returns short day string in the format Mon, Tue, Wed etc
  String get getShortDay => getDay.substring(0, 3);

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String get getMonth => DateConstants.months[month - 1].month;

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String get getShortMonth => getMonth.substring(0, 3);

  /// Time Ago
  ///
  /// Returns string of time difference between given DateTime and
  /// [DateTime.now()] in the format 1d, 2h, 4s or Just now
  String get timeAgo {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if (difference.inDays < 0) {
      return '${difference.inDays.abs()}d remaining';
    }

    if (difference.inDays >= 1) {
      return '${difference.inDays}d';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inSeconds >= 1) {
      return '${difference.inSeconds}s';
    } else {
      return 'Just now';
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
      return morning.blankCoalesce([afternoon, 'morning']);
    } else if (hour >= 12 && hour < 16) {
      return afternoon.blankCoalesce([morning, 'afternoon']);
    } else if (hour >= 16 && hour < 20) {
      return evening.blankCoalesce([night, 'evening']);
    } else {
      return night.blankCoalesce([evening, 'night']);
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
  String get describe {
    final DateTime now = DateTime.now();
    final difference = now.difference(this).inDays;
    if (difference == 0) {
      return timeFormat;
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference <= 7) {
      return getDay;
    } else {
      return '$day/$getMonth/$year';
    }
  }
}
