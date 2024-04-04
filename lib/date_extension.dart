import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/utils/constants.dart';

extension DateTimeExtensions on DateTime {
  static DateTime get min => DateTime.utc(1970, 1, 1);
  static DateTime get max => DateTime.utc(9999, 12, 31, 23, 59, 59);
  static DateTime get now => DateTime.now();

  DateTime findNextDate(int weekday) {
    int daysDifference = weekday - this.weekday;
    if (daysDifference <= 0) {
      daysDifference += 7;
    }
    return add(Duration(days: daysDifference));
  }

  bool isSameDate(DateTime other) => year == other.year && month == other.month && day == other.day;

  bool get isToday => year == now.year && month == now.month && day == now.day;

  bool get isYesterday => now.subtract(const Duration(days: 1)).isSameDate(this);
  bool get isTomorrow => now.add(const Duration(days: 1)).isSameDate(this);

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
  String get getShortDay => getDay.first(3);

  /// Get Month
  ///
  /// Returns month string in the format January, February etc
  String get getMonth => DateConstants.months[month - 1].month;

  /// Get Short Month
  ///
  /// Returns short month string in the format Jan, Feb etc
  String get getShortMonth => getMonth.first(3);

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
    string now = "Just now",
  }) {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(this);

    if (difference.inDays < 0) {
      return '${difference.inDays.abs()}$day $remaining';
    }

    if (difference.inDays >= 1) {
      return '${difference.inDays}$day';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}$hour';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}$minute';
    } else if (difference.inSeconds >= 1) {
      return '${difference.inSeconds}$second';
    } else {
      return now;
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
      return getDay;
    } else {
      return '$day/$getMonth/$year';
    }
  }

  Duration get fromNow => now.difference(this);

  Duration operator -(DateTime other) => difference(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <(DateTime other) => isBefore(other);
  bool operator >=(DateTime other) => this > other || this == other;
  bool operator <=(DateTime other) => this < other || this == other;
}
