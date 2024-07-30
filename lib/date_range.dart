import 'package:innerlibs/innerlibs.dart';
import 'package:innerlibs/string_extensions.dart';

/// Represents a range of dates.
class DateRange {
  /// Creates a new instance of the [DateRange] class with the specified start and end dates.
  DateRange(date startDate, [date? endDate]) {
    _dates = [startDate, endDate ?? startDate];
  }

  /// Creates a [DateRange] representing today.
  factory DateRange.today() => DateRange(today, today.endOfDay);

  /// Creates a [DateRange] representing yesterday.
  factory DateRange.yesterday() => DateRange(yesterday, yesterday.endOfDay);

  /// Creates a [DateRange] representing tomorrow.
  factory DateRange.tomorrow() => DateRange(tomorrow, tomorrow.endOfDay);

  /// Creates a [DateRange] representing yesterday and today.
  DateRange.yesterdayToToday() : this(yesterday, today.endOfDay);

  /// Creates a [DateRange] representing testerday, today and tomorrow.
  DateRange.yesterdayToTomorrow() : this(yesterday, today.endOfDay);

  /// Creates a [DateRange] representing the current week.
  factory DateRange.thisWeek() => DateRange(today.firstDayOfWeek, today.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the previous week.
  factory DateRange.lastWeek() => DateRange(today.previousWeek.firstDayOfWeek, today.previousWeek.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the next week.
  factory DateRange.nextWeek() => DateRange(today.nextWeek.firstDayOfWeek, today.nextWeek.lastDayOfWeek.endOfDay);

  /// Creates a [DateRange] representing the current month.
  factory DateRange.thisMonth() => DateRange(today.firstDayOfMonth, today.lastDayOfMonth.endOfDay);

  /// Creates a [DateRange] representing the previous month.
  factory DateRange.lastMonth() => DateRange(today.previousMonth.firstDayOfMonth, today.previousMonth.lastDayOfMonth.endOfDay);

  /// Creates a [DateRange] representing the next month.
  factory DateRange.nextMonth() => DateRange(today.nextMonth.firstDayOfMonth, today.nextMonth.lastDayOfMonth.endOfDay);

  /// Creates a [DateRange] representing the current quarter.
  factory DateRange.thisQuarter() => DateRange(today.firstDayOfQuarter, today.lastDayOfQuarter.endOfDay);

  /// Creates a [DateRange] representing the previous quarter.
  factory DateRange.lastQuarter() => DateRange(today.previousQuarter.firstDayOfQuarter, today.previousQuarter.lastDayOfQuarter.endOfDay);

  /// Creates a [DateRange] representing the next quarter.
  factory DateRange.nextQuarter() => DateRange(today.nextQuarter.firstDayOfQuarter, today.nextQuarter.lastDayOfQuarter.endOfDay);

  /// Creates a [DateRange] representing the current year.
  factory DateRange.thisYear() => DateRange(today.firstDayOfYear, today.lastDayOfYear.endOfDay);

  /// Creates a [DateRange] representing the previous year.
  factory DateRange.lastYear() => DateRange(today.previousYear.firstDayOfYear, today.previousYear.lastDayOfYear.endOfDay);

  /// Creates a [DateRange] representing the next year.
  factory DateRange.nextYear() => DateRange(today.nextYear.firstDayOfYear, today.nextYear.lastDayOfYear.endOfDay);

  /// Creates a [DateRange] representing the current bimester.
  factory DateRange.thisBimester() => DateRange(today.firstDayOfBimester, today.lastDayOfBimester.endOfDay);

  /// Creates a [DateRange] representing the previous bimester.
  factory DateRange.lastBimester() => DateRange(today.previousBimester.firstDayOfBimester, today.previousBimester.lastDayOfBimester.endOfDay);

  /// Creates a [DateRange] representing the next bimester.
  factory DateRange.nextBimester() => DateRange(today.nextBimester.firstDayOfBimester, today.nextBimester.lastDayOfBimester.endOfDay);

  /// Creates a [DateRange] representing the current trimester.
  factory DateRange.thisSemester() => DateRange(today.firstDayOfSemester, today.lastDayOfSemester.endOfDay);

  /// Creates a [DateRange] representing the previous semester.
  factory DateRange.lastSemester() => DateRange(today.previousSemester.firstDayOfSemester, today.previousSemester.lastDayOfSemester.endOfDay);

  /// Creates a [DateRange] representing the next semester.
  factory DateRange.nextSemester() => DateRange(today.nextSemester.firstDayOfSemester, today.nextSemester.lastDayOfSemester.endOfDay);

  /// Creates a [DateRange] representing the specified number of days before today.
  /// - [days] The number of days before today.
  factory DateRange.daysAgo(int days) => DateRange(today.subtract(days.days), today.endOfDay);

  /// Creates a [DateRange] representing the specified number of days after today.
  /// - [days] The number of days after today.
  factory DateRange.daysFromNow(int days) => DateRange(today, today.add(days.days).endOfDay);

  /// Creates a [DateRange] representing the specified number of days before the specified date.
  /// - [date] The date to calculate the range from.
  /// - [days] The number of days before the specified date.
  factory DateRange.daysBefore(date date, int days) => DateRange(date.subtract(days.days), date.endOfDay);

  /// Creates a [DateRange] representing the specified number of days after the specified date.
  /// - [date] The date to calculate the range from.
  /// - [days] The number of days after the specified date.
  factory DateRange.daysAfter(date date, int days) => DateRange(date, date.add(days.days).endOfDay);

  /// Gets the start date of the date range.
  date get startDate => _dates.min;

  /// Sets the start date of the date range.
  set startDate(date value) {
    _dates = [..._dates, value];
    _dates = [_dates.min, _dates.max];
  }

  /// Gets the end date of the date range.
  date get endDate => _dates.max;

  /// Sets the end date of the date range.
  set endDate(date value) {
    _dates = [..._dates, value];
    _dates = [_dates.min, _dates.max];
  }

  List<date> _dates = [];

  /// Gets the duration of the date range.
  Duration get duration => endDate.difference(startDate);

  /// Returns true if today is in the date range.
  bool get isNow => now.isBetweenOrEqual(startDate, endDate);

  /// Returns true if yesterday is in the date range.
  bool contains(date date) => date.isBetweenOrEqual(startDate, endDate);

  /// Checks if the date range contains the specified date range.
  bool containsRange(DateRange range) => range.startDate.isBetweenOrEqual(startDate, endDate) && range.endDate.isBetweenOrEqual(startDate, endDate);

  /// Checks if the date range intersects the specified date range.
  bool intersects(DateRange range) => range.startDate.isBetweenOrEqual(startDate, endDate) || range.endDate.isBetweenOrEqual(startDate, endDate);

  /// Returns true if the date range is in the past.
  bool get isPast => endDate.isBefore(now);

  /// Returns true if the date range is in the future.
  bool get isFuture => startDate.isAfter(now);

  /// Overrides the equality operator to compare the current [DateRange] object with another object.
  /// Returns `true` if the objects are equal, `false` otherwise.
  /// Checks if the current [DateRange] object is equal to the [other] object.
  ///
  /// The equality comparison is performed based on the type of the [other] object.
  /// If [other] is of type [DateRange], the comparison is based on the hash codes of the two objects.
  /// If [other] is of type [int], the comparison is based on the milliseconds of the [duration] property.
  /// If [other] is of type [Duration], the comparison is based on the equality of the [duration] property.
  /// If [other] is of type [date], the comparison is based on whether the [other] date is contained within the [DateRange].
  /// If [other] is of type [List<date>], the comparison is based on whether the minimum date of the [other] list is equal to the [startDate]
  /// and the maximum date of the [other] list is equal to the [endDate].
  /// If [other] is of type [(date, date)], the comparison is based on whether the minimum date of the tuple is equal to the [startDate]
  /// and the maximum date of the tuple is equal to the [endDate].
  /// If [other] is of type [string], the comparison is based on the type of the [other] string.
  /// If the [other] string is a valid date, the comparison is based on whether the date is contained within the [DateRange].
  /// If the [other] string is a valid number, the comparison is based on whether the milliseconds of the [duration] property is equal to the number.
  /// Other types return `false`.
  /// Returns `true` if the objects are equal, `false` otherwise.
  @override
  bool operator ==(Object other) {
    if (other is DateRange) {
      return hashCode == other.hashCode;
    }
    if (other is int) {
      return duration.inMilliseconds == other;
    }
    if (other is Duration) {
      return duration == other;
    }
    if (other is date) {
      return contains(other);
    }

    if (other is List<date>) {
      return other.min == startDate && other.max == endDate;
    }

    if (other is (date, date)) {
      var t = other.$1.compareAndSwap(other.$2);
      return t.min == startDate && t.max == endDate;
    }

    if (other is string) {
      if (other.isDate) {
        return contains(other.toDate());
      }
      if (other.isNumber) {
        return duration.inMilliseconds == other.toInt!;
      }
    }
    return false;
  }

  /// Returns the hash code for this [DateRange] object.
  @override
  int get hashCode => Object.hash(startDate, endDate);

  /// Returns a string representation of this [DateRange] object.
  @override
  String toString() => '$startDate ~ $endDate - ${duration.formatted}';

  /// Returns a JSON-encodable representation of this [DateRange] object.
  Map<String, dynamic> toJson() => {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      };

  /// Generates an iterable of [DateTime] objects representing each minute within the date range.
  Iterable<DateTime> minutes() sync* {
    var i = startDate;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      i = i.add(const Duration(minutes: 1));
    }
  }

  /// Generates an iterable of [DateTime] objects representing each hour within the date range.
  Iterable<DateTime> hours() sync* {
    var i = startDate;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      i = i.add(const Duration(hours: 1));
    }
  }

  /// Generates an iterable of [DateTime] objects representing each day within the date range.
  Iterable<DateTime> days() sync* {
    var i = startDate;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      i = i.add(const Duration(days: 1));
    }
  }

  /// Generates an iterable of [DateTime] objects representing each week within the date range.
  Iterable<DateTime> weeks() sync* {
    var i = startDate.firstDayOfWeek;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      i = i.add(const Duration(days: 7));
    }
  }

  /// Generates an iterable of [DateTime] objects representing each month within the date range.
  Iterable<DateTime> months() sync* {
    var i = startDate;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      if (i.month == 12) {
        i = DateTime(i.year + 1, 1, i.day);
      } else {
        i = DateTime(i.year, i.month + 1, i.day);
      }
    }
  }

  /// Generates an iterable of [DateTime] objects representing each year within the date range.
  Iterable<DateTime> years() sync* {
    var i = startDate;
    while (i.isAfter(startDate) && i.isBefore(endDate)) {
      yield i;
      i = DateTime(i.year + 1, i.month, i.day);
    }
  }
}
